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

public class CreateWechatApprovalLeaveAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		WechatNotificiationMessage wechatNotificiationMessage = new WechatNotificiationMessage();

		String employeeUuid = request.getParameter("employeeUuid");
		String authorityLevel = request.getParameter("authorityLevel");
		String uuid = request.getParameter("uuid");
		String notesOne = request.getParameter("notesOne");
		String checkStateOneUuid = request.getParameter("checkStateOneUuid");
		String notesTwo = request.getParameter("notesTwo");
		String checkStateTwoUuid = request.getParameter("checkStateTwoUuid");
		String notesThree = request.getParameter("notesThree");
		String checkStateThreeUuid = request.getParameter("checkStateThreeUuid");

		Employee employee = userService.selectEmployeeByUuid(employeeUuid);
		Constraint userC = new Constraint("User");
		userC.addCondition("personUuid", employee.getPersonUuid());
		userC.addCondition("ifUsing", true);
		User user = userService.selectUser(userC);

		LeaveApplication leaveApplication = applyService.selectLeaveApplicationByUuid(uuid);
		Apply apply = leaveApplication.getApply();

		if (authorityLevel.equals(Constants.WECHAT_LEAVE_APPROVAL_LEVEL1) && checkStateOneUuid != null && checkStateOneUuid.length() > 0) {
			apply.setCheckTimeOne(new Date());
			apply.setCheckerOneUuid(employeeUuid, false);
			if (notesOne != null && notesOne.length() > 0) {
				apply.setNotesOne(notesOne);
			}
			apply.setCheckStateOneUuid(checkStateOneUuid, false);
		}
		else if (authorityLevel.equals(Constants.WECHAT_LEAVE_APPROVAL_LEVEL2) && checkStateTwoUuid != null && checkStateTwoUuid.length() > 0) {
			apply.setCheckTimeTwo(new Date());
			apply.setCheckerTwoUuid(employeeUuid, false);
			if (notesTwo != null && notesTwo.length() > 0) {
				apply.setNotesTwo(notesTwo);
			}
			apply.setCheckStateTwoUuid(checkStateTwoUuid, false);
			if (leaveApplication.getDays() <= 2) {
				apply.setStateUuid(checkStateTwoUuid, false);

			}
			else if (checkStateTwoUuid.equals(Constants.EXAMINATION_STATE_UNPASSED)) {
				apply.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
			}
			else {
				Constraint constraint = new Constraint("ApprovalAuthority");
				String sql = "SELECT * FROM ApprovalAuthority A where authorityUuid = '" + Constants.APPROVAL_AUTHORITY_4_3 + "';";
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
					Employee recordE = userService.selectEmployeeByUuid(apply.getApplicantUuid());
					if (e.getOpenId() != null) {
						wechatNotificiationMessage.setSubject("leaveApply");
						wechatNotificiationMessage.setReceiverOpenId(e.getOpenId());
						wechatNotificiationMessage.setCreate_at(new Date());
						wechatNotificiationMessage.setIfUsing(true);
						wechatNotificiationMessage.setIfShow(true);
						String data = "\"first\": {\"value\":\"您有一条请假申请！\",\"color\":\"#173177\"},";
						data += "\"keynote1\": {\"value\":\"" + recordE.getPerson().getName() + " \",\"color\":\"#173177\"},";
						data += "\"keynote2\": {\"value\":\"" + Constants.DATE_FORMAT_YMD.format(leaveApplication.getFromDt()) + "\",\"color\":\"#173177\"},";
						data += "\"keynote3\": {\"value\":\"" + leaveApplication.getLeaveReason().replaceAll("[\\n]", "") + "\",\"color\":\"#173177\"},";
						data += "\"remark\": {\"value\":\"请审阅 \",\"color\":\"#173177\"}";
						String ip = ConstantFactory.getConstant("path.domain.url");
						String http = ip + "/whttps/wechat/approval/work/wechat_leave_approval.whtml_" + employeeUuid;
						String content = "\"template_id\":\"r5Y_xruto6Kd_8Yje_xgNIAmFXrw_weAP5-b-R-v7Pc\",\"url\":\"" + http + "\",\"topclolr\":\"#FF0000\",\"data\":{" + data + "}";
						wechatNotificiationMessage.setContent(content);
						wechatNotificiationMessage.setStatus("waiting");
						wechatService.insertWechatNotificiationMessage(wechatNotificiationMessage, "");
					}
				}
			}
		}
		else if (authorityLevel.equals(Constants.WECHAT_LEAVE_APPROVAL_LEVEL3) && checkStateThreeUuid != null && checkStateThreeUuid.length() > 0) {
			apply.setCheckTimeThree(new Date());
			apply.setCheckerThreeUuid(employeeUuid, false);
			if (notesThree != null && notesThree.length() > 0) {
				apply.setNotesThree(notesThree);
			}
			apply.setCheckStateThreeUuid(checkStateThreeUuid, false);
			apply.setStateUuid(checkStateThreeUuid, false);
		}

		ut.begin();
		try {
			if (apply.getStateUuid().equals(Constants.EXAMINATION_STATE_PASSED) || apply.getStateUuid().equals(Constants.EXAMINATION_STATE_UNPASSED)) {
				WechatNotificiationMessage message = new WechatNotificiationMessage();
				Employee e = userService.selectEmployeeByUuid(apply.getApplicantUuid());
				message.setSubject("SenderleaveApply");
				message.setReceiverOpenId(e.getOpenId());
				message.setCreate_at(new Date());
				message.setIfUsing(true);
				message.setIfShow(true);
				String senderdata = "\"first\": {\"value\":\"您提交的请假申请已经被审阅！\",\"color\":\"#173177\"},";

				if (apply.getStateUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
					senderdata += "\"keynote1\": {\"value\":\"" + "已通过" + "\",\"color\":\"#173177\"},";
				}
				else {
					senderdata += "\"keynote1\": {\"value\":\"" + "未通过" + "\",\"color\":\"#173177\"},";
				}

				if (apply.getCheckerThreeUuid() != null) {
					senderdata += "\"keynote2\": {\"value\":\"" + e.getPerson().getName() + " \",\"color\":\"#173177\"},";
					senderdata += "\"keynote3\": {\"value\":\"" + Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) + " \",\"color\":\"#173177\"},";
				}
				else {
					senderdata += "\"keynote2\": {\"value\":\"" + e.getPerson().getName() + " \",\"color\":\"#173177\"},";
					senderdata += "\"keynote3\": {\"value\":\"" + Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) + " \",\"color\":\"#173177\"},";
				
				}
				senderdata += "\"remark\": {\"value\":\"点击查看 \",\"color\":\"#173177\"}";
				String senderip = ConstantFactory.getConstant("path.domain.url");
				String senderhttp = senderip + "/whttps/wechat/common/work/wechat_query_leave_apply.whtml_" + apply.getApplicantUuid();
				String sendercontent = "\"template_id\":\"OG4WQr9EA1Ot-1sK8dfm0ayphPku8-NG-YKf2gdo3co\",\"url\":\"" + senderhttp + "\",\"topclolr\":\"#FF0000\",\"data\":{" + senderdata + "}";
				message.setContent(sendercontent);
				message.setStatus("waiting");
				wechatService.insertWechatNotificiationMessage(message, user.getAccount());
			}
			applyService.updateApply(apply, user.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
			e.printStackTrace();
		}
	}
}
