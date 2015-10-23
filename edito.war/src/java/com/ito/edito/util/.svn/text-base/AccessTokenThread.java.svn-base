package com.ito.edito.util;

import java.util.Date;

import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.ServiceConfiguration;
import com.ito.fai.util.JndiFactory;

public class AccessTokenThread implements Runnable {
	private String accessTokenStr;

	public void saveServiceConfiguration() throws Exception {
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		CustomizedUserTransaction ut_2 = new CustomizedUserTransaction();
		ut_2.initUT();
		ServiceConfiguration serviceConfigurationDB = wechatService.selectServiceConfigurationByUuid(Constants.WECHAT_ACCESS_TOKEN_UUID);
		serviceConfigurationDB.setContent(accessTokenStr);
		serviceConfigurationDB.setUpdate_at(new Date());

		ut_2.begin();
		try {
			wechatService.updateServiceConfiguration(serviceConfigurationDB, "Wechat");
			ut_2.commit();
		}
		catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
			ut_2.rollback();
		}

	}

	public void run() {
		while (true) {
			accessTokenStr = WechatUtil.getNewAccessToken();

			try {
				if (accessTokenStr != null && accessTokenStr.length() > 0) {
					try {
						saveServiceConfiguration();
					}
					catch (Exception e) {
						System.out.println("update access_token failed------------------------------");
					}
					Thread.sleep((7200 - 200) * 1000);
				}
				else {
					System.out.println("get access_token failed------------------------------");
					Thread.sleep(60 * 1000);
				}
			}
			catch (InterruptedException e) {
				try {
					Thread.sleep(60* 1000);
				}
				catch (InterruptedException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
}
