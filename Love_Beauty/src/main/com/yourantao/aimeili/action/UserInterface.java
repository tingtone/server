package main.com.yourantao.aimeili.action;

public interface UserInterface {

	/**
	 *  for client
	 * 用户登录注册
	 * uuid
	 */
	public String userLoginRegister();

	/**
	 * for client
	 * 用户收藏
	 * 
	 * @return
	 */
	public String userInsertFav();

	/**
	 *  for client
	 * 用户更新用户信息（第一版只有肤质）
	 * 通过uuid获得
	 * @return
	 */
	public String userUpdateUserInfo();
	
	/**
	 * 获得用户送货信息
	 * @return
	 */
	public String getUserAddress();
	
	/**
	 * 用户更新送货信息
	 * @return
	 */
	public String userUpdateAddress();
	
	/**
	 * 用户插入送货信息
	 * @return
	 */
	public String userInsertAddress();
}