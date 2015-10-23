package com.ito.edito.util;

import java.util.Timer;

import javax.servlet.http.HttpServlet;

import com.ito.fai.init.InitializeConfig;

public class InitServlet extends HttpServlet {

	private static final long serialVersionUID = -3552135294509086039L;

	private static final String PARAM_NAME_INIT_CONF_FILE = "init-conf-file";
	private static final String INIT_CONF_FILE_DEFAULT_VALUE = "init-conf.xml";

	protected CustomizedUserTransaction ut = null;

	/**
	 * 调用InitConfigger类读取配置文件。
	 */
	public void init() {

		String file = null;
		try {
			file = getInitParamName(PARAM_NAME_INIT_CONF_FILE, INIT_CONF_FILE_DEFAULT_VALUE);
			String path = this.getServletContext().getRealPath("/");
			path += "/WEB-INF/";
			InitializeConfig initializeConfig = new InitializeConfig(path);
			initializeConfig.loadConfiguration(file);
			initializeConfig.start();

			// WechatUtil.deleteWeChatMenu();
			new Thread(new AccessTokenThread()).start();
			String wechatMenuFile = getServletContext().getRealPath("/") + "WEB-INF\\wechat-menu.xml";
			WechatUtil.createWeChatMenu(wechatMenuFile);
			Timer timer = new Timer();
			timer.schedule(new WechatSendRemindMessage(), 0, 10000);
			Timer timer2 = new Timer();
			timer2.schedule(new WechatRealTime(), 0, 10000);
		}
		catch (Exception e) {
			System.out.println("failure in loading init-conf-file:" + file);
			e.printStackTrace();
		}
	}

	/**
	 * 获取param
	 * 
	 * @param name param's name
	 * @param defaultValue default value
	 * @return name param's value
	 * @throws Exception
	 */
	private String getInitParamName(String name, String defaultValue) throws Exception {
		String value = getInitParameter(name);

		if (value != null && value.trim().length() > 0) {
			return value.trim();
		}
		else {
			return defaultValue;
		}
	}
}
