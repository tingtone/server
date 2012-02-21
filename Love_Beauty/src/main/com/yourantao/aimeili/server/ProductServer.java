package main.com.yourantao.aimeili.server;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.conf.Constant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProductServer implements Constant {

	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(ProductServer.class);
	private HttpServletRequest request;

	public ProductServer(HttpServletRequest req) {
		this.request = req;
	}

}
