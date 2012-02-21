package test.com.yourantao.aimeili.action;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.conf.Config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class spring_dbtest {

	private static final Logger log = LoggerFactory.getLogger(spring_dbtest.class); //spring的日志格式
	public static void main(String [] args){
		/* hibernate使用方式
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

		java.util.Properties p = System.getProperties();
		java.util.Enumeration keys = p.keys();
		while( keys.hasMoreElements() )
		{
		     System.out.println( keys.nextElement());
		 }
		String pathString=System.getProperty("testpath");
		System.out.println(pathString);
		String pathString2=System.getProperty("config.location");
		System.out.println(pathString2);
		 System.out.println(Runtime.getRuntime().maxMemory()); 
		
		//spring 使用方式(成功事例)
		String pathString1=System.getProperty("user.dir");
		System.out.println(pathString1);
		
		ApplicationContext ac=Config.getACInstant();
		  BrandDAO td = BrandDAO.getFromApplicationContext(ac);
		  
		  Brand brand=td.findById(1);//查询
		  System.out.print(brand.getBrandName());
		  System.out.println(brand.getBrandName());
		  log.debug(brand.getBrandName());
		
		  Brand brand1=new Brand();
		  brand1.setBrandId(2);
		  brand1.setBrandName("test2");
		  brand1.setBrandAlias("aaa");
		  brand1.setBrandDescription("测试描述");
		  brand1.setBrandOtherNames("othername test");
		  brand1.setBrandRank(1);
		  td.save(brand1);//增加
		  log.debug(brand1.getBrandName());
		  System.out.println(brand1.getBrandName());
		  
		  Brand brand2=td.findById(1);
		  td.delete(brand2);//删除
		  log.debug(brand2.getBrandName());
		  System.out.println(brand2.getBrandName());
		  
		  Brand brand3=td.findById(2);
		  brand3.setBrandName("5");
		  td.merge(brand3);//更改
		  log.debug(brand3.getBrandName());
		  System.out.println(brand3.getBrandName());
	}
}
