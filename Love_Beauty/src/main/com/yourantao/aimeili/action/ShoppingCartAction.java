package main.com.yourantao.aimeili.action;


import java.util.List;

import main.com.yourantao.aimeili.bean.ShoppingCart;
import main.com.yourantao.aimeili.bean.ShoppingCartDAO;
import main.com.yourantao.aimeili.conf.Constant;


public class ShoppingCartAction extends BaseAction implements Constant, ShoppingCartInterface{
		private ShoppingCartDAO shoppingCartDAO;
		
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
		public String getShoppingCart()
		{
			int userId = getIntegerParameter(USER_ID);
			ShoppingCart shoppingCartExample = new ShoppingCart();
			shoppingCartExample.setUserId(userId);
			List results = shoppingCartDAO.findByExample(shoppingCartExample);
			//对结果进行检查
			printArray(results);
			return null;
		}
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#addGoods()
		 */
		public String addGoods()
		{
			//获取参数
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter("");//undefined constant
			int count = getIntegerParameter("");//undefined constant
			//
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(userId);
			shoppingCart.setGoodsRealId(goodsRealId);
			shoppingCart.setCartStatus((short) 3);
			//
			shoppingCartDAO.save(shoppingCart);
			return null;
			
		}
		
		/* (non-Javadoc)
		 * @see main.com.yourantao.aimeili.action.ShoppingCartInterface#modifyQuantity()
		 */
		public String modifyQuantity()
		{
			int cartId = getIntegerParameter(""); //undefined constant
			int count = getIntegerParameter("");//undefined constant
			
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
			int cartId = getIntegerParameter(""); //undefined constant
			int userId = getIntegerParameter(USER_ID);
			int goodsRealId = getIntegerParameter("");//undefined constant
			
			ShoppingCart shoppingCart = shoppingCartDAO.findById(cartId);
			//判断要删除的记录是否相匹配
			
			//
			shoppingCartDAO.delete(shoppingCart);
			return null;
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
