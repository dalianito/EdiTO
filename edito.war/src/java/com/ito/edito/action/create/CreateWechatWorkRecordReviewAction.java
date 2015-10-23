package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.User;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class CreateWechatWorkRecordReviewAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		
		String workRecordUuid = request.getParameter("workRecordUuid");
		String employeeUuid = request.getParameter("employeeUuid");
		String reviewComment = request.getParameter("reviewComment");

		WorkRecord workRecordDB = campusService.selectWorkRecordByUuid(workRecordUuid);
		Employee employeeDB = userService.selectEmployeeByUuid(employeeUuid);

		Constraint c = new Constraint("User");
		c.addCondition("personUuid", employeeDB.getPersonUuid());
		c.addCondition("ifUsing", true);
		User user = userService.selectUser(c);

		ut.begin();
		try {
			workRecordDB.setReviewEmployeeUuid(employeeUuid);
			workRecordDB.setReviewFlagUuid(Constants.REVIEWD_FLAG, false);
			workRecordDB.setReviewComment(reviewComment);
			workRecordDB.setReviewTime(new Date());
			
			WechatNotificiationMessage message = new WechatNotificiationMessage();
			Employee e = userService.selectEmployeeByUuid(workRecordDB.getRecordUuid());
			message.setSubject("SenderWorkRecord");
			message.setReceiverOpenId(e.getOpenId());
			message.setCreate_at(new Date());
			message.setIfUsing(true);
			message.setIfShow(true);
			String senderdata = "\"first\": {\"value\":\"您提交的工作日志已经被审阅！\",\"color\":\"#173177\"},";
			String reviewC = reviewComment != null ? reviewComment.replaceAll("[\\n]", "") : "";
			senderdata += "\"keynote1\": {\"value\":\"" + employeeDB.getPerson().getName() + "\",\"color\":\"#173177\"},";
			senderdata += "\"keynote2\": {\"value\":\"" + reviewC + "\",\"color\":\"#173177\"},";
			senderdata += "\"keynote3\": {\"value\":\"" + Constants.DATE_FORMAT_YMDHM.format(workRecordDB.getReviewTime()) + "\",\"color\":\"#173177\"},";
			senderdata += "\"remark\": {\"value\":\"请查看 \",\"color\":\"#173177\"}";
			String senderip = ConstantFactory.getConstant("path.domain.url");
			String senderhttp = senderip + "/whttps/wechat/common/work/wechat_work_record.whtml_" + e.getUuid();
			String sendercontent = "\"template_id\":\"yFfyiJmq6HcrZUUAyFQeI37_PPLn44EaqtHBA9sY-ng\",\"url\":\"" + senderhttp + "\",\"topclolr\":\"#FF0000\",\"data\":{" + senderdata + "}";
			message.setContent(sendercontent);
			message.setStatus("waiting");
			
			wechatService.insertWechatNotificiationMessage(message, user.getAccount());
			campusService.updateWorkRecord(workRecordDB, Constants.WECHAT_USER + user.getAccount());

			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
