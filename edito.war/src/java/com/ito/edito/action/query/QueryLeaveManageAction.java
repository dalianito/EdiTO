package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryLeaveManageAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String name = request.getParameter("name");
		String departmentUuid = request.getParameter("departmentUuid");
		String leaveUuid = request.getParameter("leaveUuid");
		String stateUuid = request.getParameter("stateUuid");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");
		String myself = request.getParameter("myself");

		String sql = "select distinct L.* from LeaveApplication L, Apply A, Person P, Employee E where A.ifUsing = true and L.applyUuid = A.Uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and A.typeUuid = '" + Constants.APPLY_TYPE_UUID_LEAVE + "'";

		Constraint c1 = new Constraint("LeaveApplication");

		if (myself != null && myself.length() > 0) {
			sql += " and E.uuid = '" + EMPLOYEE.getUuid() + "' ";
		}
		if (name != null && name.length() > 0) {
			sql += " and P.name like '%" + name + "%' ";
		}
		if (departmentUuid != null && departmentUuid.length() > 0) {
			sql += " and E.departmentUuid = '" + departmentUuid + "' ";
		}
		if (stateUuid != null && stateUuid.length() > 0) {
			sql += " and A.stateUuid = '" + stateUuid + "' ";
		}
		if (leaveUuid != null && leaveUuid.length() > 0) {
			sql += " and L.leaveTypeUuid = '" + leaveUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sql += " and applicationTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and applicationTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct L.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}
		sql += " order by A.applicationTime desc limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;
		c1.addSQLCondition(sql, null);

		List<LeaveApplication> leaveApplicationList = applyService.selectLeaveApplications(c1);
		List<String[]> tempList = new ArrayList<String[]>();

		for (int i = 0; i < leaveApplicationList.size(); i++) {
			LeaveApplication leaveApplication = leaveApplicationList.get(i);

			String[] str = new String[15];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = leaveApplication.getApply().getApplicant().getPerson().getName();
			str[2] = leaveApplication.getDepartmentUuid() == null ? "" : leaveApplication.getDepartment().getDescription();
			str[3] = leaveApplication.getPosition() != null ? leaveApplication.getPosition() : "";
			str[4] = leaveApplication.getLeaveTypeUuid() != null ? leaveApplication.getLeaveType().getDescription() : "";
			str[5] = leaveApplication.getApplyUuid();
			str[6] = leaveApplication.getApply().getStateUuid();
			str[7] = leaveApplication.getApply().getCheckerOneUuid() != null ? leaveApplication.getApply().getCheckerOne().getPerson().getName() : "";
			str[8] = leaveApplication.getApply().getCheckStateOneUuid() != null ? leaveApplication.getApply().getCheckStateOne().getDescription() : "";
			str[9] = leaveApplication.getApply().getCheckerTwoUuid() != null ? leaveApplication.getApply().getCheckerTwo().getPerson().getName() : "";
			str[10] = leaveApplication.getApply().getCheckStateTwoUuid() != null ? leaveApplication.getApply().getCheckStateTwo().getDescription() : "";
			str[11] = leaveApplication.getApply().getCheckerThreeUuid() != null ? leaveApplication.getApply().getCheckerThree().getPerson().getName() : "";
			str[12] = leaveApplication.getApply().getCheckStateThreeUuid() != null ? leaveApplication.getApply().getCheckStateThree().getDescription() : "";
			str[13] = "";
			if (leaveApplication.getApply().getApplicantUuid() != null) {
				str[13] = leaveApplication.getApply().getApplicant().getJobUuid() != null ? leaveApplication.getApply().getApplicant().getJob().getDescription() : "";
			}
			str[14] = leaveApplication.getApply() != null ? Constants.DATE_FORMAT_YMDHM.format(leaveApplication.getApply().getApplicationTime()) : "";
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
