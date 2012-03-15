package main.com.yourantao.aimeili.action;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.ShoppingCart;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
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
			Integer userId = getIntegerParameter(USER_ID);
			Integer providerId = getIntegerParameter(PROVIDER_ID);
			if(userId  == null)
			{
				outputString("{'msg':'用户不存在'}");
				return null;
			}
			if(providerId != null)
			{
				//获取购物车中指定商城的商品
				ShoppingCart shoppingCartExample = new ShoppingCart();
				shoppingCartExample.setUserId(userId);
				//shoppingCartExample.set
			}
			List<ShoppingCart> shoppingCartList = shoppingCartDAO.findByUserId(userId);
			//对结果进行进一步处理
			List<ShoppingCartView> shoppingCartViewList = new ArrayList<ShoppingCartView>();
			for(ShoppingCart shoppingCart: shoppingCartList)
			{
				//去goods表中查询
				GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart.getGoodsRealId());
				
				ShoppingCartView shoppingCartView = new ShoppingCartView();
				//shoppingCartView.set
				shoppingCartView.setCartId(shoppingCart.getCartId());
				shoppingCartView.setCount(shoppingCart.getCount());
				shoppingCartView.setGoodsName(goodsReal.getGoodsName());
				shoppingCartView.setGoodsThumb(goodsReal.getGoodsThumb());
				shoppingCartView.setGoodsContent(goodsReal.getGoodsContent());
				shoppingCartView.setGoodsPrice(goodsReal.getGoodsPrice());
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
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			int count = getIntegerParameter(GOODS_COUNT);
			//设置对象状态
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(userId);
			shoppingCart.setGoodsRealId(goodsRealId);
			//保存
			shoppingCartDAO.save(shoppingCart);
			//根据新的约定修改成下面一种方式
			//outputString("{'cartId':'"+shoppingCart.getCartId() +"'}");
			outputString(msg);
			return null;
			
		}
		
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#modifyQuantity()
		 */
		public String modifyQuantity()
		{
			String msg = "";
			//获取参数
			//int cartId = getIntegerParameter(SHOPPINGCART_ID);
			
			int count = getIntegerParameter(GOODS_COUNT);
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			ShoppingCart shoppingCartExample = new ShoppingCart();
			shoppingCartExample.setGoodsRealId(goodsRealId);
			shoppingCartExample.setUserId(userId);
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
				msg = "{'msg':'存在多个相同商品'}";
			}
			outputString(msg);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteGoods()
		 */
		public String deleteGoods()
		{
			String msg ="";
			int cartId = getIntegerParameter(SHOPPINGCART_ID);
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			
			ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
			//判断要删除的记录是否相匹配
			if(shoppingCart.getUserId() != userId )
			{
				msg = "{'msg':'购物车与用户不匹配'}";
			}
			else if(shoppingCart.getGoodsRealId() == goodsRealId)
			{
				msg = "{'msg':'购物车与商品不匹配'}";
			}
			else
			{
				shoppingCartDAO.delete(shoppingCart);
			}
			outputString(msg);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteAllGoods()
		 */
		public String deleteAllGoods()
		{
			String msg = "";
			int userId = getIntegerParameter(USER_ID);
			//通过userId就要删除所有的商品,这是不安全的
			List results = shoppingCartDAO.findByUserId(userId);
			for(int index =0; index < results.size(); index++ )
			{
				shoppingCartDAO.delete((ShoppingCart)results.get(index));
			}
			outputString(msg);
			return null;
		}
}
