package main.com.yourantao.aimeili.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import main.com.yourantao.aimeili.conf.Config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SystemInit implements ServletContextListener {

	private static Logger log = LoggerFactory.getLogger(SystemInit.class);

	// tomcat
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("   end......................");
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {

		try {
			ServletContext application = event.getServletContext();
			WebApplicationContext wac = WebApplicationContextUtils
					.getRequiredWebApplicationContext(application);
			log.debug("   begin.....................debug.");
			log.warn("   begin......................warn");
			log.error("   begin.....................error.");
			String path = System.getProperty("testpath");
			log.info("path={}", path);
			Config.DbInit("applicationContext.xml");
			Log log1 = LogFactory.getLog("myTest1");
			log1.debug(" 测试");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
