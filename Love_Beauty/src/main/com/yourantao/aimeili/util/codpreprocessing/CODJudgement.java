package main.com.yourantao.aimeili.util.codpreprocessing;

import main.com.yourantao.aimeili.bean.UserAddress;

interface CODJudgement {
	/**
	 * 该地址支持货到付款
	 */
	public static final int SUPPORT = 2;
	/**
	 * 该地址范围内的部分地区支持货到付款
	 */
	public static final int PARTIALLY_SUPPORT = 1;
	/**
	 * 不支持货到付款
	 */
	public static final int NONSUPPORT = 0;

	/**
	 * 是否支持货到付款
	 * <p />
	 * <strong>注意：所有的子类都应该重载该方法，以实现正确的判断</strong>
	 * 
	 * @param address
	 *            用户地址持久化类
	 * @return 2表示支持，1表示部分地区支持，0表示不支持，
	 */
	public abstract int supportCOD(UserAddress address);

	/**
	 * 返回该地址支持货到付款的区域，该函数只有当supportCOD返回NONSUPPORT时有效。
	 * 
	 * @param address
	 *            用户地址持久化类
	 * @return 返回该地址支持货到付款的区域
	 */
	public abstract String supportArea(UserAddress address);

}