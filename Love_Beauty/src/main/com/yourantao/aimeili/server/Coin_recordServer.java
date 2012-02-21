package main.com.yourantao.aimeili.server;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Coin_recordServer {
	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(Coin_recordServer.class);
	private HttpServletRequest request;

	public Coin_recordServer(HttpServletRequest req) {
		this.request = req;
	}
}
