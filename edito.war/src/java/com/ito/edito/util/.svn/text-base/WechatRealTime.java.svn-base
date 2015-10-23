package com.ito.edito.util;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;

import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class WechatRealTime extends TimerTask {

	public void saveWechatNotificiationMessage(WechatNotificiationMessage message, String msgId) throws Exception {
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		CustomizedUserTransaction ut_2 = new CustomizedUserTransaction();
		ut_2.initUT();
		message.setWechatMsgId(msgId);
		message.setStatus("signing");
		message.setUpdate_at(new Date());
		message.setIfUsing(true);

		ut_2.begin();
		try {
			wechatService.updateWechatNotificiationMessage(message, "Wechat");
			ut_2.commit();
		}
		catch (Exception e2) {
			e2.printStackTrace();
			ut_2.rollback();
		}
	}

	public void deleteWechatNotificiationMessage(WechatNotificiationMessage message, String msgId) throws Exception {
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		CustomizedUserTransaction ut_2 = new CustomizedUserTransaction();
		ut_2.initUT();
		message.setWechatMsgId(msgId);
		message.setStatus("failed");
		message.setUpdate_at(new Date());
		message.setIfUsing(false);
		message.setIfShow(false);

		ut_2.begin();
		try {
			wechatService.updateWechatNotificiationMessage(message, "Wechat");
			ut_2.commit();
		}
		catch (Exception e2) {
			e2.printStackTrace();
			ut_2.rollback();
		}
	}

	@Override
	public void run() {

		WechatService wechatService = null;
		try {
			wechatService = (WechatService) JndiFactory.lookup("wechatService");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		Constraint c = new Constraint("WechatNotificiationMessage");
		String sqlSelect = "select distinct W.* from WechatNotificiationMessage W ";
		String sqlCondition = " where W.ifUsing = true and W.ifShow = true and W.status = 'waiting' limit 5";
		sqlSelect += sqlCondition;
		c.addSQLCondition(sqlSelect, null);
		List<WechatNotificiationMessage> list = null;

		try {
			list = wechatService.selectWechatNotificiationMessages(c);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				WechatNotificiationMessage message = list.get(i);
				String data = message.getContent();
				String openId = message.getReceiverOpenId();
				try {
					HashMap<String, String> hashMap = WechatUtil.sendModelMessage(openId, data);
					if (hashMap != null) {
						if (hashMap.get("errmsg").equals("ok")) {
							saveWechatNotificiationMessage(message, hashMap.get("msgid"));
						}
						else if (hashMap.get("errmsg").substring(0, 19).equals("invalid template_id")) {
							message.setContent("invalid template_id");
							deleteWechatNotificiationMessage(message, null);
							System.out.println("invalid template_id");
						}
						else if (hashMap.get("errmsg").substring(0, 14).equals("invalid openid")) {
							message.setContent("invalid openid");
							deleteWechatNotificiationMessage(message, null);
							System.out.println("invalid openid");
						}
						else if (hashMap.get("errmsg").substring(0, 17).equals("data format error")) {
							message.setContent("data format error");
							deleteWechatNotificiationMessage(message, null);
							System.out.println("data format error");
						}
						else {
							message.setContent("ModelMessage find Unknown error......");
							deleteWechatNotificiationMessage(message, null);
							System.out.println("ModelMessage find Unknown error......");
							Thread.sleep(300 * 1000);
						}
					}
					else {
						Thread.sleep(600 * 1000);

					}
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		else {
			try {
				Thread.sleep(300 * 1000);
			}
			catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}
