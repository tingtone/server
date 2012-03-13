package main.com.yourantao.aimeili.action;


import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.bean.GoodsReal;
import main.com.yourantao.aimeili.bean.GoodsRealDAO;
import main.com.yourantao.aimeili.bean.ShoppingCart;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.ShoppingCartView;


public class ShoppingCartAction extends BaseAction implements Constant, ShoppingCartInterface{
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
			//这里可以提供额外的获取功能，比如说提供了商城的ID
			int userId = getIntegerParameter(USER_ID);
			ShoppingCart shoppingCartExample = new ShoppingCart();
			shoppingCartExample.setUserId(userId);
			List results = shoppingCartDAO.findByExample(shoppingCartExample);
			//对结果进行进一步处理
			List<ShoppingCartView> shoppingCartViewList = new ArrayList<ShoppingCartView>();
			for(int index=0; index < results.size(); index++)
			{
				ShoppingCart shoppingCart= (ShoppingCart) results.get(0);
				//去goods表中查询
				GoodsReal goodsReal = goodsRealDAO.findById(shoppingCart.getGoodsRealId());
				
				ShoppingCartView shoppingCartView = new ShoppingCartView();
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
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			int count = getIntegerParameter(GOODS_COUNT);
			//设置对象状态
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(userId);
			shoppingCart.setGoodsRealId(goodsRealId);
			shoppingCart.setCartStatus((short) 3);
			//保存
			shoppingCartDAO.save(shoppingCart);
			return null;
			
		}
		
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#modifyQuantity()
		 */
		public String modifyQuantity()
		{
			int cartId = getIntegerParameter(SHOPPINGCART_ID); //undefined constant
			int count = getIntegerParameter(GOODS_COUNT);//undefined constant
			
			ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
			//
			shoppingCart.setCount(count);
			//这里可能会出错
			shoppingCartDAO.merge(shoppingCart);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#changeStatus()
		 */
		public String changeStatus()
		{
			int cartId = getIntegerParameter(""); //undefined constant
			short status = ((short)(int)getIntegerParameter("")); //undefined constant
			ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
			//
			shoppingCart.setCartStatus(status);
			//这里可能会出错
			shoppingCartDAO.merge(shoppingCart);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteGoods()
		 */
		public String deleteGoods()
		{
			int cartId = getIntegerParameter(SHOPPINGCART_ID);
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter(GOODS_REAL_ID);
			
			ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
			//判断要删除的记录是否相匹配
			if(shoppingCart.getUserId().equals(userId))
			{
				shoppingCartDAO.delete(shoppingCart);
				return null;//返回成功
			}
			//
			return null;//返回失败
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#deleteAllGoods()
		 */
		public String deleteAllGoods()
		{
			//int cartId = getIntegerParameter(""); //undefined constant
			int userId = getIntegerParameter(USER_ID);
			//通过userId就要删除所有的商品,这是不安全的
			List results = shoppingCartDAO.findByUserId(userId);
			for(int index =0; index < results.size(); index++ )
			{
				shoppingCartDAO.delete((ShoppingCart)results.get(index));
			}
			return null;
		}
}
