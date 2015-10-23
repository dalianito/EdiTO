package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.User;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class CreateWechatLeaveApplyAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");

		Apply apply = (Apply) carrier.fetchInstance("Apply");
		LeaveApplication leaveApplication = (LeaveApplication) carrier.fetchInstance("LeaveApplication");
		WechatNotificiationMessage wechatNotificiationMessage = new WechatNotificiationMessage();

		apply.setApplicationTime(new Date());
		apply.setIfUsing(true);
		leaveApplication.setIfUsing(true);

		Employee employee = userService.selectEmployeeByUuid(apply.getApplicantUuid());
		Constraint c = new Constraint("User");
		c.addCondition("personUuid", employee.getPersonUuid());
		c.addCondition("ifUsing", true);
		User user = userService.selectUser(c);

		ut.begin();
		try {
			String applyUuid = applyService.insertApply(apply, Constants.WECHAT_USER + user.getAccount());
			leaveApplication.setApplyUuid(applyUuid, false);
			leaveApplication.setCampusUuid(employee.getCampusUuid(), false);
			applyService.insertLeaveApplication(leaveApplication, Constants.WECHAT_USER + user.getAccount());

			Constraint constraint = new Constraint("ApprovalAuthority");
			String sql = "SELECT * FROM ApprovalAuthority A where authorityUuid = '" + Constants.APPROVAL_AUTHORITY_4_1 + "' or authorityUuid = '" + Constants.APPROVAL_AUTHORITY_4_2 + "'; ";
			constraint.addSQLCondition(sql, null);
			List<ApprovalAuthority> list = userService.selectApprovalAuthoritys(constraint);

			for (int i = 0; i < list.size(); i++) {
				ApprovalAuthority authority = list.get(i);
				authority.getUserUuid();
				User u = userService.selectUserByUuid(authority.getUserUuid());
				Constraint constraintE = new Constraint("Employee");
				constraintE.addCondition("ifUsing", true);
				constraintE.addCondition("personUuid", u.getPersonUuid());
				Employee e = userService.selectEmployee(constraintE);
				if (e.getOpenId() != null && e.getCampusUuid() == employee.getCampusUuid()) {
					wechatNotificiationMessage.setSubject("leaveApply");
					wechatNotificiationMessage.setReceiverOpenId(e.getOpenId());
					wechatNotificiationMessage.setCreate_at(new Date());
					wechatNotificiationMessage.setIfUsing(true);
					wechatNotificiationMessage.setIfShow(true);
					String data = "\"first\": {\"value\":\"您有一条请假申请！\",\"color\":\"#173177\"},";
					data += "\"keynote1\": {\"value\":\"" + employee.getPerson().getName() + " \",\"color\":\"#173177\"},";
					data += "\"keynote2\": {\"value\":\"" + Constants.DATE_FORMAT_YMD.format(leaveApplication.getFromDt()) + "\",\"color\":\"#173177\"},";
					data += "\"keynote3\": {\"value\":\"" + leaveApplication.getLeaveReason().replaceAll("[\\n]", "") + "\",\"color\":\"#173177\"},";
					data += "\"remark\": {\"value\":\"请审阅 \",\"color\":\"#173177\"}";
					String ip = ConstantFactory.getConstant("path.domain.url");
					String http = ip + "/whttps/wechat/approval/work/wechat_leave_approval.whtml_" + e.getUuid();
					String content = "\"template_id\":\"r5Y_xruto6Kd_8Yje_xgNIAmFXrw_weAP5-b-R-v7Pc\",\"url\":\"" + http + "\",\"topclolr\":\"#FF0000\",\"data\":{" + data + "}";					
					wechatNotificiationMessage.setContent(content);
					wechatNotificiationMessage.setStatus("waiting");
					wechatService.insertWechatNotificiationMessage(wechatNotificiationMessage, "");
				}
			}

			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
			e.printStackTrace();
		}
	}
}
