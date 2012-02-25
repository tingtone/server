package main.com.yourantao.aimeili.conf;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author whp
 * @创建时间： 2012-2-20 下午06:32:36
 * @修改时间：2012-2-20 下午06:32:36
 * @具体描述： 基本配置类
 */
public class Config {

	public static ApplicationContext ac;

	/*
	 * 数据库初始化
	 */
	public static void DbInit(String springPath) {

		/*
		 * 需要用到hibernate.cfg.xml 配置文件 //hibernate核心接口 Configuration
		 * configuration = new Configuration().configure(); //配置 SessionFactory
		 * sessionFactory=configuration.buildSessionFactory();
		 * //SessionFactory对象中保存了当前的数据库配置及映射信息，还负责二级缓存
		 * //SessionFactory开销大，一个数据库公用一个就行 Session session =
		 * sessionFactory.openSession(); //不是线程安全的 Transaction
		 * txTransaction=session.beginTransaction(); //开启事务 Brand brand= new
		 * Brand(); brand.setBrandName("test1"); session.save(brand);
		 * session.flush(); txTransaction.commit();
		 */
		ac = new ClassPathXmlApplicationContext(springPath);
		if (ac == null)
			ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	public static ApplicationContext getACInstant() {
		return ac;
	}
}