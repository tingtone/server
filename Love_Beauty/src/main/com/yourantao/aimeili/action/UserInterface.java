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
}
