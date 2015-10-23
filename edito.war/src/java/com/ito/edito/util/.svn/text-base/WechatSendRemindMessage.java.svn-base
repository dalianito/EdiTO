package com.ito.edito.util;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.edito.schema.WorkRecord;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class WechatSendRemindMessage extends TimerTask {

	public void sendRemindMessage(Date date) throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService service = (CampusService) JndiFactory.lookup("campusService");
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		CustomizedUserTransaction ut_2 = new CustomizedUserTransaction();
		ut_2.initUT();

		String sqlSelect = "select E.* from Employee E ";
		String sqlCondition = " where E.openId <> 'null' and E.ifUsing = true  ";
		sqlSelect += sqlCondition;

		Constraint employeeC = new Constraint("Employee");
		employeeC.addSQLCondition(sqlSelect, null);

		List<Employee> list = userService.selectEmployees(employeeC);

		for (int i = 0; i < list.size(); i++) {
			Employee employee = list.get(i);

			String sqlSelectWR = "select W.* from WorkRecord W ";
			String sqlConditionWR = " where W.recordUuid = '" + employee.getUuid() + "' and W.ifUsing = true  ";
			String beginTime = Constants.DATE_FORMAT_YMD_0.format(date);
			sqlConditionWR += " and W.recordTime >='" + beginTime + "' ";
			sqlSelectWR += sqlConditionWR;
			Constraint workRecordC = new Constraint("WorkRecord");
			workRecordC.addSQLCondition(sqlSelectWR, null);
			WorkRecord record = service.selectWorkRecord(workRecordC);

			String sqlSelectIP = "select I.* from InternetPublicity I ";
			String sqlConditionIP = " where I.recordUuid = '" + employee.getUuid() + "' and I.ifUsing = true  ";
			sqlConditionIP += " and I.recordTime >='" + beginTime + "' ";
			sqlSelectIP += sqlConditionIP;
			Constraint internetPublicityC = new Constraint("InternetPublicity");
			internetPublicityC.addSQLCondition(sqlSelectIP, null);
			InternetPublicity publicity = service.selectInternetPublicity(internetPublicityC);

			if (record == null) {
				String data = "\"first\": {\"value\":\"您的工作日志今日未完成！\",\"color\":\"#173177\"},";
				data += "\"keynote1\": {\"value\":\"系统消息\",\"color\":\"#173177\"},";
				data += "\"keynote2\": {\"value\":\"" + Constants.DATE_FORMAT_YMD.format(date) + "\",\"color\":\"#173177\"},";
				data += "\"keynote3\": {\"value\":\" 当天 \",\"color\":\"#173177\"},";
				data += "\"remark\": {\"value\":\"  \",\"color\":\"#173177\"}";
				String ip = ConstantFactory.getConstant("path.domain.url");
				String http = ip + "/whttps/wechat/common/work/wechat_work_record.whtml_" + employee.getUuid();
				String content = "\"template_id\":\"-oNQHCQWhWyippn4ws2VAzTYkpCKP1YH3aoYE8dw4mM\",\"url\":\"" + http + "\",\"topclolr\":\"#FF0000\",\"data\":{" + data + "}";

				WechatNotificiationMessage message = new WechatNotificiationMessage();
				message.setContent(content);
				message.setReceiverOpenId(employee.getOpenId());
				message.setSubject("workRecordMessage");
				message.setCreate_at(date);
				message.setIfShow(true);
				message.setIfUsing(true);
				message.setStatus("waiting");
				ut_2.begin();
				try {
					wechatService.insertWechatNotificiationMessage(message, "Wechat");
					ut_2.commit();
				}
				catch (Exception e2) {
					e2.printStackTrace();
					ut_2.rollback();
				}

			}
			if (publicity == null) {
				String data = "\"first\": {\"value\":\"您的网络宣传今日未完成！\",\"color\":\"#173177\"},";
				data += "\"keynote1\": {\"value\":\"系统消息\",\"color\":\"#173177\"},";
				data += "\"keynote2\": {\"value\":\"" + Constants.DATE_FORMAT_YMD.format(date) + "\",\"color\":\"#173177\"},";
				data += "\"keynote3\": {\"value\":\" 当天 \",\"color\":\"#173177\"},";
				data += "\"remark\": {\"value\":\"  \",\"color\":\"#173177\"}";
				String ip = ConstantFactory.getConstant("path.domain.url");
				String http = ip + "/whttps/wechat/common/work/wechat_network_propaganda.whtml_" + employee.getUuid();
				String content = "\"template_id\":\"-oNQHCQWhWyippn4ws2VAzTYkpCKP1YH3aoYE8dw4mM\",\"url\":\"" + http + "\",\"topclolr\":\"#FF0000\",\"data\":{" + data + "}";

				WechatNotificiationMessage message = new WechatNotificiationMessage();
				message.setContent(content);
				message.setReceiverOpenId(employee.getOpenId());
				message.setSubject("internetPublicityMessage");
				message.setCreate_at(date);
				message.setIfShow(true);
				message.setIfUsing(true);
				message.setStatus("waiting");
				ut_2.begin();
				try {
					wechatService.insertWechatNotificiationMessage(message, "Wechat");
					ut_2.commit();
				}
				catch (Exception e2) {
					e2.printStackTrace();
					ut_2.rollback();
				}
			}
		}
	}

	public void run() {
		try {
			Date nowtime = new Date();
			String time = Constants.DATE_FORMAT_YMD.format(nowtime);
			Date settime = Constants.DATE_FORMAT.parse(time + " 16:45:00");

			if (settime.before(nowtime)) {
				try {
					sendRemindMessage(nowtime);
					Thread.sleep(20 * 60 * 60 * 1000);
				}
				catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				try {
					Thread.sleep(5 * 60 * 1000);
				}
				catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
