package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWechatLeaveApprovalAction extends AjaxAction {

	@SuppressWarnings("deprecation")
	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String campusUuid = request.getParameter("campusUuid");
		String authorityLevel = request.getParameter("authorityLevel");
		String pageMark = request.getParameter("pageMark");

		if (authorityLevel != null && pageMark == null) {
			String sql = "select distinct L.* from LeaveApplication L, Apply A where L.ifUsing = true and A.ifUsing = true and L.applyUuid = A.uuid ";
			if (authorityLevel.equals(Constants.WECHAT_LEAVE_APPROVAL_LEVEL1)) {
				sql += " and A.checkStateOneUuid is null and A.stateUuid = '" + Constants.EXAMINATION_STATE_DOING + "' ";
			}
			else if (authorityLevel.equals(Constants.WECHAT_LEAVE_APPROVAL_LEVEL2)) {
				sql += " and A.checkStateTwoUuid is null and A.stateUuid = '" + Constants.EXAMINATION_STATE_DOING + "' ";
			}
			else if (authorityLevel.equals(Constants.WECHAT_LEAVE_APPROVAL_LEVEL3)) {
				sql += " and A.checkStateTwoUuid is not null and A.checkStateThreeUuid is null and A.stateUuid = '" + Constants.EXAMINATION_STATE_DOING + "' ";
			}
			sql += " and A.stateUuid = '" + Constants.EXAMINATION_STATE_DOING + "' ";
			sql += " and L.campusUuid = '" + campusUuid + "' ";
			sql += " order by applicationTime asc ";

			Constraint c = new Constraint("LeaveApplication");
			c.addSQLCondition(sql, null);
			List<LeaveApplication> leaveApplicationList = applyService.selectLeaveApplications(c);
			List<String[]> resultList = new ArrayList<String[]>();
			for (int i = 0; i < leaveApplicationList.size(); i++) {
				LeaveApplication leaveApplication = leaveApplicationList.get(i);

				String[] str = new String[15];
				str[0] = leaveApplication.getApply().getApplicant().getPerson().getName();
				str[1] = leaveApplication.getLeaveTypeUuid() != null ? leaveApplication.getLeaveType().getDescription() : "";
				str[2] = leaveApplication.getUuid();

				resultList.add(str);
			}

			setResponseText(resultList);
		}
		else if (authorityLevel != null && pageMark.equals("query")) {
			String begingTime = request.getParameter("nowTime");
			Date time = Constants.DATE_FORMAT_YMD.parse(begingTime + "-01");
			time.setMonth(time.getMonth() + 1);
			String endTime = Constants.DATE_FORMAT_YMD.format(time);

			String sql = "select distinct L.* from LeaveApplication L, Apply A where L.ifUsing = true and A.ifUsing = true and L.applyUuid = A.uuid ";
			sql += " and A.stateUuid <> '" + Constants.EXAMINATION_STATE_DOING + "' ";
			sql += " and L.campusUuid = '" + campusUuid + "' ";
			sql += " and A.applicationTime >= '" + begingTime + "-01 00:00:00' ";
			sql += " and A.applicationTime < '" + endTime + " 00:00:00' ";
			sql += " order by applicationTime asc ";

			Constraint c = new Constraint("LeaveApplication");
			c.addSQLCondition(sql, null);
			List<LeaveApplication> leaveApplicationList = applyService.selectLeaveApplications(c);
			List<String[]> resultList = new ArrayList<String[]>();
			for (int i = 0; i < leaveApplicationList.size(); i++) {
				LeaveApplication leaveApplication = leaveApplicationList.get(i);

				String[] str = new String[15];
				str[0] = leaveApplication.getApply().getApplicant().getPerson().getName();
				str[1] = leaveApplication.getLeaveTypeUuid() != null ? leaveApplication.getLeaveType().getDescription() : "";
				str[2] = leaveApplication.getUuid();

				resultList.add(str);
			}

			setResponseText(resultList);
		}
		else {
			String begingTime = request.getParameter("nowTime");
			String employeeUuid = request.getParameter("Uuid");
			Date time = Constants.DATE_FORMAT_YMD.parse(begingTime + "-01");
			time.setMonth(time.getMonth() + 1);
			String endTime = Constants.DATE_FORMAT_YMD.format(time);

			String sql = "select distinct L.* from LeaveApplication L, Apply A where L.ifUsing = true and A.ifUsing = true and L.applyUuid = A.uuid ";
			if (pageMark.equals("record")) {
				sql += " and A.applicantUuid =  '" + employeeUuid + "' ";
				sql += " and A.applicationTime >= '" + begingTime + "-01 00:00:00' ";
				sql += " and A.applicationTime < '" + endTime + " 00:00:00' ";
				sql += " order by applicationTime desc ";
			}
			Constraint c = new Constraint("LeaveApplication");
			c.addSQLCondition(sql, null);
			List<LeaveApplication> leaveApplicationList = applyService.selectLeaveApplications(c);
			List<String[]> resultList = new ArrayList<String[]>();
			for (int i = 0; i < leaveApplicationList.size(); i++) {
				LeaveApplication leaveApplication = leaveApplicationList.get(i);
				String[] str = new String[15];
				str[0] = leaveApplication.getApply().getApplicationTime() != null ? Constants.DATE_FORMAT_YMD.format(leaveApplication.getApply().getApplicationTime()).substring(5) : "";
				str[1] = leaveApplication.getLeaveTypeUuid() != null ? leaveApplication.getLeaveType().getDescription() : "";
				str[2] = leaveApplication.getApply().getState() != null ? leaveApplication.getApply().getState().getDescription() : "";
				str[3] = leaveApplication.getUuid();

				resultList.add(str);
			}
			setResponseText(resultList);
		}
	}
}
