package main.com.yourantao.aimeili.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.ShoppingCart;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.log.GetGoodsListLog;
import main.com.yourantao.aimeili.log.ShoppingCartLog;
import main.com.yourantao.aimeili.vo.GoodsRealSimpleView;
import main.com.yourantao.aimeili.vo.ShoppingCartView;

public class ShoppingCartAction extends BaseAction implements Constant,
		ShoppingCartInterface {
	private static final Logger LOG = LoggerFactory
			.getLogger(ShoppingCartAction.class);
	private static Log shoppingLogger = LogFactory.getLog("shopping"); /*购物车日志记录*/
	
	
	private ShoppingCartDAO shoppingCartDAO;
	private GoodsRealDAO goodsRealDAO;

	// spring 机制要用到getter/setter
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.ShoppingCartInterface#getShoppingCartDAO
	 * ()
	 */
	public ShoppingCartDAO getShoppingCartDAO() {
		return shoppingCartDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.ShoppingCartInterface#setShoppingCartDAO
	 * (main.com.yourantao.aimeili.bean.ShoppingCartDAO)
	 */
	public void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO) {
		this.shoppingCartDAO = shoppingCartDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.ShoppingCartInterface#getShoppingCart()
	 */
	public GoodsRealDAO getGoodsRealDAO() {
		return goodsRealDAO;
	}

	public void setGoodsRealDAO(GoodsRealDAO goodsRealDAO) {
		this.goodsRealDAO = goodsRealDAO;
	}

	public String fetchShoppingCart() {
		// 获取参数
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();

//		List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByUserId(userId);
		List<ShoppingCart> shoppingCartList = shoppingCartDAO.getUserShoppingCart(userId);
		// 对结果进行进一步处理
		List<ShoppingCartView> shoppingCartViewList = new ArrayList<ShoppingCartView>();
		
		for (ShoppingCart shoppingCart : shoppingCartList) {
			ShoppingCartView shoppingCartView;
			boolean existFlag = false;
			if(!shoppingCartViewList.isEmpty()
					&& shoppingCartViewList.get(shoppingCartViewList.size()-1).getProviderId() == shoppingCart.getProviderId()){
				shoppingCartView = shoppingCartViewList.get(shoppingCartViewList.size()-1);
				existFlag = true;
			}
			else{
				shoppingCartView = new ShoppingCartView();
				existFlag = false;
			}
			shoppingCartView.setProviderId(shoppingCart.getProviderId());
			
			// 去goods表中查询
			GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart
					.getGoodsRealId());
			//判断商品是否存在,是否已经下架
			if(goodsReal == null || goodsReal.getGoodsStatus() == 0){
				//TODO 修改status的判断条件
				//删除购物车记录
				shoppingCartDAO.delete(shoppingCart);
				//System.out.println("in delete");
			}
			else{
				GoodsRealSimpleView goodsRealSimpleView = new GoodsRealSimpleView();
				goodsRealSimpleView.setGoodsRealId(shoppingCart.getGoodsRealId());
				goodsRealSimpleView.setGoodsCount(shoppingCart.getCount());
				
				goodsRealSimpleView.setGoodsName(goodsReal.getGoodsName());
				goodsRealSimpleView.setGoodsContent(goodsReal.getGoodsContent());
				goodsRealSimpleView.setGoodsThumb(goodsReal.getGoodsThumb());
				
				if(Math.abs(goodsReal.getGoodsPrice()-shoppingCart.getPrice()) > 0.00001){
					//更新新价格并封装
					shoppingCart.setPrice(goodsReal.getGoodsPrice());
					shoppingCartDAO.merge(shoppingCart);
					
					goodsRealSimpleView.setGoodsPrice(goodsReal.getGoodsPrice());
				}
				else{
					//正常封装
					goodsRealSimpleView.setGoodsPrice(shoppingCart.getPrice());
				}
				shoppingCartView.addGoods(goodsRealSimpleView);
				//
				if(!existFlag){
					shoppingCartViewList.add(shoppingCartView);
				}
			}
		}
		//
		printArray(shoppingCartViewList);
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#addGoods()
	 */
	public String addGoods() {
		String msg = "";
		// 获取参数
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		// 验证参数
		if (goodsRealId == null){
			printObject("{'msg':'参数个数不足'}");
			return null;
		}
		// 设置对象状态
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUserId(userId);
		shoppingCart.setGoodsRealId(goodsRealId);
		// 先查找是否已经存在对应的购物车记录
		List<ShoppingCart> shoppingCartList = shoppingCartDAO
				.findByExample(shoppingCart);
		if (shoppingCartList.size() != 0) {
			msg = "{'msg':'购物车中已经存在商品'}";
		} else {
			// 保存
			GoodsReal goodsReal = goodsRealDAO.findById(goodsRealId);
			if(goodsReal == null){
				msg = "{'msg':'商品不存在'}";
			}
			else if (goodsReal.getGoodsStatus() == 0) {
				//TODO
				msg = "{'msg':'商品已经下架或待审核'}";
			} else {
				shoppingCart.setPrice(goodsReal.getGoodsPrice());
				shoppingCart.setCount(1);
				shoppingCart.setProviderId(goodsReal.getProviderId());
				shoppingCartDAO.save(shoppingCart);
			}
		}
		printString(MSG_SUCCESS);
		
		/*日志记录*/
		ShoppingCartLog shoppingCartLog = new ShoppingCartLog(uuid, getRequest());
		shoppingCartLog.setgoodsRealId(goodsRealId);
		shoppingCartLog.setCount(1);
		shoppingCartLog.setType(ShoppingCartLog.INSERT);
		shoppingLogger.debug(shoppingCartLog.toString());
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.ShoppingCartInterface#modifyQuantity()
	 */
	public String modifyQuantity() {
		// 获取参数
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		Integer count = getIntegerParameter(GOODS_COUNT);
		// 验证参数
		if (goodsRealId == null || count == null) {
			printObject("{'msg':'参数个数不足'}");
			return null;
		} else if (count <= 0) {
			printObject("{'msg':'参数值出错'}");
			return null;
		}		
		ShoppingCart shoppingCart = shoppingCartDAO.getCartByUserAndGoods(userId, goodsRealId);
		if(shoppingCart == null){
			printObject("{'msg':'购物车中不存在这样的商品'}");
			return null;
		}
		else{
			shoppingCart.setCount(count);
			shoppingCartDAO.merge(shoppingCart);
		}
		printString(MSG_SUCCESS);
		
		/*日志记录*/
		ShoppingCartLog shoppingCartLog = new ShoppingCartLog(uuid, getRequest());
		shoppingCartLog.setgoodsRealId(goodsRealId);
		shoppingCartLog.setCount(count);
		shoppingCartLog.setType(ShoppingCartLog.UPDATE);
		shoppingLogger.debug(shoppingCartLog.toString());
		
		return null;
	}

	/**
	 * 接受购物车中商品的新的价格
	 * 
	 * @return
	 */
	public String acceptGoods() {
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		// Integer providerId = getIntegerParameter(PROVIDER_ID);
		// 验证参数
		if (goodsRealId == null) {
			printObject("{'msg':'没有提供商品'}");
			return null;
		}
		ShoppingCart shoppingCart = shoppingCartDAO.getCartByUserAndGoods(userId, goodsRealId);
		if(shoppingCart == null){
			printObject("{'msg':'购物车中不存在这样的商品'}");
			return null;
		}
		else{
			GoodsReal goodsReal = goodsRealDAO.findById(goodsRealId);
			if (goodsReal == null) {
				printObject("{'msg':'该商品不存在'}");
			} else if(goodsReal.getGoodsStatus() == 0){
				//TODO 测试的时候进行了修改,正常使用要修改回去
				printObject("{'msg':'该商品已下架或者待审核'}");
			}
			else {
				shoppingCart.setPrice(goodsReal.getGoodsPrice());
				shoppingCartDAO.merge(shoppingCart);
			}
		}
		printString(MSG_SUCCESS);
		return null;
	}
	/**
	 * 接受购物车中商品的所有变动
	 * 价格变动就接受新的价格
	 * 商品不存在或者下架/待审核就从购物车中删除此商品
	 * 此操作不可撤销
	 */
	public String acceptAllGoods(){
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByUserId(userId);
		for(ShoppingCart shoppingCart: shoppingCartList){
			GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart.getGoodsRealId());
			if(goodsReal != null && goodsReal.getGoodsStatus() == 6){
				if(Math.abs(goodsReal.getGoodsPrice()-shoppingCart.getPrice()) > 0.00001){
					//接受新价格
					shoppingCart.setPrice(goodsReal.getGoodsPrice());
					shoppingCartDAO.merge(shoppingCart);
				}
				//什么也不做
			}
			else{
				//商品不存在或者下架/待审核,删除此商品
				shoppingCartDAO.delete(shoppingCart);
			}
		}
		printString(MSG_SUCCESS);
		return null;
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteGoods()
	 */
	public String deleteGoods() {
		// 获取参数
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();
		Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
		//Integer providerId = getIntegerParameter(PROVIDER_ID);
		// 验证参数
		if (goodsRealId == null) {
			printObject("{'msg':'没有提供商品'}");
			return null;
		}
		ShoppingCart shoppingCartExample = new ShoppingCart();
		shoppingCartExample.setUserId(userId);
		shoppingCartExample.setGoodsRealId(goodsRealId);
		//shoppingCartExample.setProviderId(providerId);
		List<ShoppingCart> shoppingCartList = shoppingCartDAO
				.findByExample(shoppingCartExample);
		if (shoppingCartList.size() == 0) {
			printObject("{'msg':'购物车不存在这样的商品'}");
			return null;
		} else if (shoppingCartList.size() == 1) {
			shoppingCartDAO.delete(shoppingCartList.get(0));
		} else {
			printObject("{'msg':'购物车中存在多件商品'}");
			return null;
		}
		printString(MSG_SUCCESS);
		
		/*日志记录*/
		ShoppingCartLog shoppingCartLog = new ShoppingCartLog(uuid, getRequest());
		shoppingCartLog.setgoodsRealId(goodsRealId);
		shoppingCartLog.setCount(0);
		shoppingCartLog.setType(ShoppingCartLog.DELETE);
		shoppingLogger.debug(shoppingCartLog.toString());
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteAllGoods()
	 */
	public String deleteAllGoods() {
		// 获取参数
		String uuid = getStringParameter("uuid");
		if (uuid == null) {
			printObject("{'msg':'没有设备号'}");
			return null;
		}
		List<UserLogin> userLogin = userLoginDAO.findByUuid(uuid);
		if (userLogin.size() == 0) {
			printObject("{'msg':'没有该用户'}");
			return null;
		}
		int userId = userLogin.get(0).getUserId();

		ShoppingCart shoppingCartExample = new ShoppingCart();
		shoppingCartExample.setUserId(userId);
		// shoppingCartExample.setProviderId(providerId);
		List<ShoppingCart> shoppingCartList = shoppingCartDAO
				.findByExample(shoppingCartExample);
		
		
		/*日志记录*/
		ShoppingCartLog shoppingCartLog = new ShoppingCartLog(uuid, getRequest());
		
		for (ShoppingCart shoppingCart : shoppingCartList) {
			Integer goodsRealId=shoppingCart.getGoodsRealId();
			shoppingCartDAO.delete(shoppingCart);
			shoppingCartLog.setgoodsRealId(goodsRealId);
			shoppingCartLog.setCount(0);  
			shoppingCartLog.setType(ShoppingCartLog.DELETE);
			shoppingLogger.debug(shoppingCartLog.toString());
		}
		printString(MSG_SUCCESS);
		return null;
	}
}
