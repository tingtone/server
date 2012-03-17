package main.com.yourantao.aimeili.action;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.ShoppingCart;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.bean.UserLogin;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.ShoppingCartView;


public class ShoppingCartAction extends BaseAction implements Constant, ShoppingCartInterface{
		private static final Logger LOG = LoggerFactory.getLogger(ShoppingCartAction.class);
		private ShoppingCartDAO shoppingCartDAO;
		private GoodsRealDAO goodsRealDAO;
		//spring 机制要用到getter/setter
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#getShoppingCartDAO()
		 */
		public ShoppingCartDAO getShoppingCartDAO() {
			return shoppingCartDAO;
		}

		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#setShoppingCartDAO(main.com.yourantao.aimeili.bean.ShoppingCartDAO)
		 */
		public void setShoppingCartDAO(ShoppingCartDAO shoppingCartDAO) {
			this.shoppingCartDAO = shoppingCartDAO;
		}
		
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#getShoppingCart()
		 */
		public GoodsRealDAO getGoodsRealDAO() {
			return goodsRealDAO;
		}

		public void setGoodsRealDAO(GoodsRealDAO goodsRealDAO) {
			this.goodsRealDAO = goodsRealDAO;
		}
		
		public String getShoppingCart()
		{
			//获取参数
			String uuid=getRequest().getParameter("uuid");
			if(uuid==null){
				printString("{'msg':'没有设备号'}");
				return null;
			}
			List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
			if(userLogin.size()==0){
				printString("{'msg':'没有该用户'}");
				return null;
			}
			int userId=userLogin.get(0).getUserId();
			Integer providerId = getIntegerParameter(PROVIDER_ID);
			List<ShoppingCart> shoppingCartList;
			if(providerId != null)
			{
				//获取购物车中指定商城的商品
				ShoppingCart shoppingCartExample = new ShoppingCart();
				shoppingCartExample.setUserId(userId);
				shoppingCartExample.setProviderId(providerId);
				shoppingCartList = shoppingCartDAO.findByExample(shoppingCartExample);
			}
			else
			{
				shoppingCartList = shoppingCartDAO.findByUserId(userId);
			}
			//对结果进行进一步处理
			List<ShoppingCartView> shoppingCartViewList = new ArrayList<ShoppingCartView>();
			for(ShoppingCart shoppingCart: shoppingCartList)
			{
				//去goods表中查询
				GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart.getGoodsRealId());
				
				ShoppingCartView shoppingCartView = new ShoppingCartView();
				
				shoppingCartView.setGoodsRealId(shoppingCart.getGoodsRealId());
				shoppingCartView.setGoodsPrice(shoppingCart.getPrice());
				shoppingCartView.setProviderId(shoppingCart.getProviderId());
				
				shoppingCartView.setCount(shoppingCart.getCount());
				shoppingCartView.setGoodsName(goodsReal.getGoodsName());
				shoppingCartView.setGoodsThumb(goodsReal.getGoodsThumb());
				shoppingCartView.setGoodsContent(goodsReal.getGoodsContent());
				
				//加入数组中
				shoppingCartViewList.add(shoppingCartView);
			}
			//
			printArray(shoppingCartViewList);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#addGoods()
		 */
		public String addGoods()
		{
			String msg = "";
			//获取参数
			String uuid=getRequest().getParameter("uuid");
			if(uuid==null){
				printString("{'msg':'没有设备号'}");
				return null;
			}
			List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
			if(userLogin.size()==0){
				printString("{'msg':'没有该用户'}");
				return null;
			}
			int userId=userLogin.get(0).getUserId();
			Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			Integer count = getIntegerParameter(GOODS_COUNT);
			Float price = Float.valueOf(getRequest().getParameter("price"));
			Integer providerId = getIntegerParameter(PROVIDER_ID);
			//验证参数
			if( goodsRealId == null || count == null || price == null || providerId == null)
			{
				printString("{'msg':'参数个数不足'}");
				return null;
			}
			else if(count < 0 || price < 0)
			{
				printString("{'msg':'参数值出错'}");
				return null;
			}
			//设置对象状态
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(userId);
			shoppingCart.setGoodsRealId(goodsRealId);
			shoppingCart.setProviderId(providerId);
			//先查找是否已经存在对应的购物车记录
			List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByExample(shoppingCart);
			if(shoppingCartList.size() != 0)
			{
				msg = "{'msg':'购物车中已经存在商品'}";
			}
			else
			{
				//保存
				shoppingCart.setPrice(price);
				shoppingCart.setCount(count);
				shoppingCartDAO.save(shoppingCart);
				msg = "'cart_id':'" + shoppingCart.getCartId()+ "'";
			}
			printString(msg);
			return null;
			
		}
		
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#modifyQuantity()
		 */
		public String modifyQuantity()
		{
			String msg = "";
			
			//获取参数
			String uuid=getRequest().getParameter("uuid");
			if(uuid==null){
				printString("{'msg':'没有设备号'}");
				return null;
			}
			List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
			if(userLogin.size()==0){
				printString("{'msg':'没有该用户'}");
				return null;
			}
			int userId=userLogin.get(0).getUserId();
			Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			Integer providerId = getIntegerParameter(PROVIDER_ID);
			Integer count = getIntegerParameter(GOODS_COUNT);
			//验证参数
			if(goodsRealId == null || count == null || providerId == null)
			{
				printString("{'msg':'参数个数不足'}");
				return null;
			}
			else if(count < 0)
			{
				printString("{'msg':'参数值出错'}");
				return null;
			}
			ShoppingCart shoppingCartExample = new ShoppingCart();
			shoppingCartExample.setGoodsRealId(goodsRealId);
			shoppingCartExample.setUserId(userId);
			shoppingCartExample.setProviderId(providerId);
			List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByExample(shoppingCartExample);
			if(shoppingCartList.size()== 0)
			{
				msg = "{'msg':'购物车中不存在这样的商品'}";
			}
			else if(shoppingCartList.size() == 1)
			{
				ShoppingCart shoppingCart = shoppingCartList.get(0);
				shoppingCart.setCount(count);
				shoppingCartDAO.merge(shoppingCart);
			}
			else
			{
				msg = "{'msg':'存在多个相同商品'}";//这种情况是不应该出现的，这里先写出来，防止出现问题
			}
			printString(msg);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteGoods()
		 */
		public String deleteGoods()
		{
			String msg ="";
			//获取参数
			String uuid=getRequest().getParameter("uuid");
			if(uuid==null){
				printString("{'msg':'没有设备号'}");
				return null;
			}
			List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
			if(userLogin.size()==0){
				printString("{'msg':'没有该用户'}");
				return null;
			}
			int userId=userLogin.get(0).getUserId();
			Integer goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			Integer providerId = getIntegerParameter(PROVIDER_ID);
			//验证参数
			if(goodsRealId == null || providerId == null)
			{
				printString("{'msg':'参数个数不足'}");
				return null;
			}
			ShoppingCart shoppingCartExample = new ShoppingCart();
			shoppingCartExample.setUserId(userId);
			shoppingCartExample.setGoodsRealId(goodsRealId);
			shoppingCartExample.setProviderId(providerId);
			List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByExample(shoppingCartExample);
			if(shoppingCartList.size() == 0)
			{
				msg = "{'msg':'购物车不存在这样的商品'}";
			}
			else if(shoppingCartList.size() > 1)
			{
				shoppingCartDAO.delete(shoppingCartList.get(0));
			}
			else
			{
				msg = "{'msg':'购物车中存在多件商品'}";//这样的情况不应该出现的
			}
			printString(msg);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteAllGoods()
		 */
		public String deleteAllGoods()
		{
			String msg = "";
			//获取参数
			String uuid=getRequest().getParameter("uuid");
			if(uuid==null){
				printString("{'msg':'没有设备号'}");
				return null;
			}
			List<UserLogin> userLogin=userLoginDAO.findByUuid(uuid);
			if(userLogin.size()==0){
				printString("{'msg':'没有该用户'}");
				return null;
			}
			int userId=userLogin.get(0).getUserId();
			Integer providerId = getIntegerParameter(PROVIDER_ID);
			//验证参数
			if(providerId == null)
			{
				printString("{'msg':'没有供应商'}");
			}
			ShoppingCart shoppingCartExample = new ShoppingCart();
			shoppingCartExample.setUserId(userId);
			shoppingCartExample.setProviderId(providerId);
			List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByExample(shoppingCartExample);
			for(ShoppingCart shoppingCart: shoppingCartList)
			{
				shoppingCartDAO.delete(shoppingCart);
			}
			printString(msg);
			return null;
		}
}
