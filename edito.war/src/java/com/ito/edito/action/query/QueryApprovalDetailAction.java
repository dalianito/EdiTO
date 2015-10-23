package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.RegularApplication;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryApprovalDetailAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String type = request.getParameter("type");
		String name = request.getParameter("name");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String stateUuid = request.getParameter("stateUuid");
		String sortField = request.getParameter("sortField");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String authorityStrings = "";
		Constraint approvalAuthorityC = new Constraint("ApprovalAuthority");
		approvalAuthorityC.addCondition("userUuid", USER.getUuid());
		List<ApprovalAuthority> approvalAuthorityList = userService.selectApprovalAuthoritys(approvalAuthorityC);
		if (approvalAuthorityList.size() > 0) {
			for (int i = 0; i < approvalAuthorityList.size(); i++) {
				authorityStrings += approvalAuthorityList.get(i).getAuthorityUuid();
			}
		}

		int count = 0;
		List<Object> tempList = new ArrayList<Object>();

		String sqlSelect = "";
		if (type.equals("recruitment")) {
			String departmentUuid = request.getParameter("departmentUuid");

			sqlSelect = "select R.* from Recruitment R, Apply A, Employee E, Person P ";
			sqlSelect += " where R.applyUuid = A.uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and R.ifUsing = 1 and A.ifUsing = 1 ";
			if (name != null && name.length() > 0) {
				sqlSelect += " and P.name like '%" + name + "%' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (departmentUuid != null && departmentUuid.length() > 0) {
				sqlSelect += " and R.departmentUuid = '" + departmentUuid + "' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("R.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("Recruitment");
			c.addSQLCondition(sqlSelect, null);
			List<Recruitment> recruitmentsTemp = applyService.selectRecruitments(c);
			for (int i = 0; i < recruitmentsTemp.size(); i++) {
				Recruitment recruitment = recruitmentsTemp.get(i);
				Apply apply = recruitment.getApply();
				String[] str = new String[16];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				str[3] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[4] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[5] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[6] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[7] = apply.getCheckerThreeUuid() != null ? apply.getCheckerThree().getPerson().getName() : "";
				str[8] = apply.getCheckTimeThree() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) : "";
				str[9] = recruitment.getDepartmentUuid() != null ? recruitment.getDepartment().getDescription() : "";
				str[10] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[11] = apply.getUuid();
				str[12] = apply.getCheckStateOneUuid() != null ? apply.getCheckStateOne().getDescription() : "";
				str[13] = apply.getCheckStateTwoUuid() != null ? apply.getCheckStateTwo().getDescription() : "";
				str[14] = apply.getCheckStateThreeUuid() != null ? apply.getCheckStateThree().getDescription() : "";
				str[15] = apply.getStateUuid() == null ? "" : apply.getStateUuid();
				tempList.add(str);
			}
		}
		else if (type.equals("relationship")) {
			String transName = request.getParameter("transName");
			String originalUuid = request.getParameter("originalUuid");
			String transferUuid = request.getParameter("transferUuid");

			sqlSelect = "select R.* from Relationship R, Apply A, Employee E1, Person P1, Employee E2, Person P2 ";
			sqlSelect += " where R.applyUuid = A.uuid and A.applicantUuid = E1.uuid and E1.personUuid = P1.uuid and R.teacherUuid = E2.uuid and E2.personUuid = P2.uuid and R.ifUsing = 1 and A.ifUsing = 1 ";
			if (name != null && name.length() > 0) {
				sqlSelect += " and P1.name like '%" + name + "%' ";
			}
			if (originalUuid != null && originalUuid.length() > 0) {
				sqlSelect += " and R.originalUuid = '" + originalUuid + "' ";
			}
			if (transferUuid != null && transferUuid.length() > 0) {
				sqlSelect += " and R.transferUuid = '" + transferUuid + "' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (transName != null && transName.length() > 0) {
				sqlSelect += " and P2.name like '%" + transName + "%' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("R.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("Relationship");
			c.addSQLCondition(sqlSelect, null);
			List<Relationship> relationshipsTemp = applyService.selectRelationships(c);
			for (int i = 0; i < relationshipsTemp.size(); i++) {
				Relationship relationship = relationshipsTemp.get(i);
				Apply apply = relationship.getApply();
				String[] str = new String[18];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				str[3] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[4] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[5] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[6] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[7] = apply.getCheckerThreeUuid() != null ? apply.getCheckerThree().getPerson().getName() : "";
				str[8] = apply.getCheckTimeThree() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) : "";
				str[9] = relationship.getTeacherUuid() != null ? relationship.getTeacher().getPerson().getName() : "";
				str[10] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[11] = apply.getUuid();
				str[12] = apply.getCheckStateOneUuid() != null ? apply.getCheckStateOne().getDescription() : "";
				str[13] = apply.getCheckStateTwoUuid() != null ? apply.getCheckStateTwo().getDescription() : "";
				str[14] = apply.getCheckStateThreeUuid() != null ? apply.getCheckStateThree().getDescription() : "";
				str[15] = relationship.getOriginalUuid() != null ? relationship.getOriginal().getDescription() : "";
				str[16] = relationship.getTransferUuid() != null ? relationship.getTransfer().getDescription() : "";
				str[17] = apply.getStateUuid() == null ? "" : apply.getStateUuid();
				tempList.add(str);
			}
		}
		else if (type.equals("quit")) {
			String quitName = request.getParameter("quitName");
			String departmentUuid = request.getParameter("departmentUuid");
			String departureTypeUuid = request.getParameter("departureTypeUuid");

			sqlSelect = "select Q.* from Quit Q, Apply A, Employee E1, Person P1, Employee E2, Person P2 ";
			sqlSelect += " where Q.applyUuid = A.uuid and A.applicantUuid = E1.uuid and E1.personUuid = P1.uuid and Q.employeeUuid = E2.uuid and E2.personUuid = P2.uuid and Q.ifUsing = 1 and A.ifUsing = 1 ";
			if (name != null && name.length() > 0) {
				sqlSelect += " and P1.name like '%" + name + "%' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (quitName != null && quitName.length() > 0) {
				sqlSelect += " and P2.name like '%" + quitName + "%' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}
			if (departmentUuid != null && departmentUuid.length() > 0) {
				sqlSelect += " and E2.departmentUuid = '" + departmentUuid + "' ";
			}
			if (departureTypeUuid != null && departureTypeUuid.length() > 0) {
				sqlSelect += " and Q.departureTypeUuid = '" + departureTypeUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("Q.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("Quit");
			c.addSQLCondition(sqlSelect, null);
			List<Quit> QuitsTemp = applyService.selectQuits(c);
			for (int i = 0; i < QuitsTemp.size(); i++) {
				Quit quit = QuitsTemp.get(i);
				Apply apply = quit.getApply();
				String[] str = new String[21];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				str[3] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[4] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[5] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[6] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[7] = apply.getCheckerThreeUuid() != null ? apply.getCheckerThree().getPerson().getName() : "";
				str[8] = apply.getCheckTimeThree() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) : "";
				str[9] = apply.getCheckerFourUuid() != null ? apply.getCheckerFour().getPerson().getName() : "";
				str[10] = apply.getCheckTimeFour() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeFour()) : "";
				str[11] = quit.getEmployeeUuid() != null ? quit.getEmployee().getPerson().getName() : "";
				str[12] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[13] = apply.getUuid();
				str[14] = quit.getEmployeeUuid() != null ? quit.getEmployee().getDepartment().getDescription() : "";
				str[15] = quit.getDepartureTypeUuid() != null ? quit.getDepartureType().getDescription() : "";
				str[16] = apply.getCheckStateOneUuid() != null ? apply.getCheckStateOne().getDescription() : "";
				str[17] = apply.getCheckStateTwoUuid() != null ? apply.getCheckStateTwo().getDescription() : "";
				str[18] = apply.getCheckStateThreeUuid() != null ? apply.getCheckStateThree().getDescription() : "";
				str[19] = apply.getCheckStateFourUuid() != null ? apply.getCheckStateFour().getDescription() : "";
				str[20] = apply.getStateUuid() == null ? "" : apply.getStateUuid();
				tempList.add(str);
			}
		}
		else if (type.equals("leave")) {
			String departmentUuid = request.getParameter("departmentUuid");
			sqlSelect = "select L.* from LeaveApplication L, Apply A, Employee E, Person P ";
			sqlSelect += " where L.applyUuid = A.uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and L.ifUsing = 1 and A.ifUsing = 1 ";
			if ((authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_4_1) != -1) || (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_4_2) != -1)) {
				sqlSelect += " and L.campusUuid = '"+ EMPLOYEE.getCampusUuid() +"' ";
			}
			if (name != null && name.length() > 0) {
				sqlSelect += " and P.name like '%" + name + "%' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (departmentUuid != null && departmentUuid.length() > 0) {
				sqlSelect += " and L.departmentUuid = '" + departmentUuid + "' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("L.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("LeaveApplication");
			c.addSQLCondition(sqlSelect, null);
			List<LeaveApplication> leaveApplicationsTemp = applyService.selectLeaveApplications(c);
			for (int i = 0; i < leaveApplicationsTemp.size(); i++) {
				LeaveApplication leaveApplication = leaveApplicationsTemp.get(i);
				Apply apply = leaveApplication.getApply();
				String[] str = new String[12];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				str[3] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[4] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[5] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[6] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[7] = apply.getCheckerThreeUuid() != null ? apply.getCheckerThree().getPerson().getName() : "";
				str[8] = apply.getCheckTimeThree() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) : "";
				str[9] = leaveApplication.getDepartmentUuid() != null ? leaveApplication.getDepartment().getDescription() : "";
				str[10] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[11] = apply.getUuid();
				tempList.add(str);
			}
		}
		else if (type.equals("publicity")) {
			String departmentUuid = request.getParameter("departmentUuid");

			sqlSelect = "select PA.* from PublicityApplication PA, Apply A, Employee E, Person P ";
			sqlSelect += " where PA.applyUuid = A.uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and PA.ifUsing = 1 and A.ifUsing = 1 ";
			if (name != null && name.length() > 0) {
				sqlSelect += " and P.name like '%" + name + "%' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (departmentUuid != null && departmentUuid.length() > 0) {
				sqlSelect += " and PA.departmentUuid = '" + departmentUuid + "' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("PA.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("PublicityApplication");
			c.addSQLCondition(sqlSelect, null);
			List<PublicityApplication> publicityApplicationsTemp = applyService.selectPublicityApplications(c);
			for (int i = 0; i < publicityApplicationsTemp.size(); i++) {
				PublicityApplication publicityApplication = publicityApplicationsTemp.get(i);
				Apply apply = publicityApplication.getApply();
				String[] str = new String[11];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				str[3] = publicityApplication.getDepartmentUuid() != null ? publicityApplication.getDepartment().getDescription() : "";
				str[4] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[5] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[6] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[7] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[8] = publicityApplication.getDescription() != null ? publicityApplication.getDescription() : "";
				str[9] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[10] = publicityApplication.getUuid();
				tempList.add(str);
			}
		}
		else if (type.equals("material")) {
			String departmentUuid = request.getParameter("departmentUuid");

			sqlSelect = "select O.* from OfficeApplication O, Apply A, Employee E, Person P ";
			sqlSelect += " where O.applyUuid = A.uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and O.ifUsing = 1 and A.ifUsing = 1 ";
			if (name != null && name.length() > 0) {
				sqlSelect += " and P.name like '%" + name + "%' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (departmentUuid != null && departmentUuid.length() > 0) {
				sqlSelect += " and O.departmentUuid = '" + departmentUuid + "' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("O.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("OfficeApplication");
			c.addSQLCondition(sqlSelect, null);
			List<OfficeApplication> officeApplicationsTemp = materialService.selectOfficeApplications(c);
			for (int i = 0; i < officeApplicationsTemp.size(); i++) {
				OfficeApplication officeApplication = officeApplicationsTemp.get(i);
				Apply apply = officeApplication.getApply();
				String[] str = new String[14];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				str[3] = officeApplication.getDepartmentUuid() != null ? officeApplication.getDepartment().getDescription() : "";
				str[4] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[5] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[6] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[7] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[8] = apply.getCheckerThreeUuid() != null ? apply.getCheckerThree().getPerson().getName() : "";
				str[9] = apply.getCheckTimeThree() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) : "";
				str[10] = String.valueOf(officeApplication.getOfficeMaterialsCount());
				int passedNum = 0;
				for (int j = 0; j < officeApplication.getOfficeMaterialsAsReference().size(); j++) {
					OfficeApplicationInfo officeApplicationInfo = officeApplication.getOfficeMaterialsAsReference().get(j);
					if (Constants.EXAMINATION_STATE_PASSED.equals(officeApplicationInfo.getStateUuid())) {
						passedNum++;
					}
				}
				str[11] = String.valueOf(passedNum);
				str[12] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[13] = officeApplication.getUuid();
				tempList.add(str);
			}
		}
		else if (type.equals("regular")) {

			String personNo = request.getParameter("personNo");
			String departmentUuid = request.getParameter("departmentUuid");
			String jobUuid = request.getParameter("jobUuid");
			String approvalStateUuid = request.getParameter("approvalStateUuid");

			int tempAuthorityFlag = 0;
			sqlSelect = "select R.* from RegularApplication R, Apply A, RegularApproval RA,Employee E, Person P ";
			sqlSelect += " where R.applyUuid = A.uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and R.approvalUuid = RA.uuid and R.ifUsing = 1 and A.ifUsing = 1 and E.ifUsing = 1 ";
			if (name != null && name.length() > 0) {
				sqlSelect += " and P.name like '%" + name + "%' ";
			}
			if (startTime != null && startTime.length() > 0) {
				sqlSelect += " and A.applicationTime >= '" + startTime + " 00:00:00' ";
			}
			if (endTime != null && endTime.length() > 0) {
				sqlSelect += " and A.applicationTime <= '" + endTime + " 23:59:59' ";
			}
			if (stateUuid != null && stateUuid.length() > 0) {
				sqlSelect += " and A.stateUuid = '" + stateUuid + "' ";
			}
			if (personNo != null && personNo.length() > 0) {
				sqlSelect += " and P.personNo = '" + personNo + "' ";
			}
			if (departmentUuid != null && departmentUuid.length() > 0) {
				sqlSelect += " and R.departmentUuid = '" + departmentUuid + "' ";
			}
			if (jobUuid != null && jobUuid.length() > 0) {
				sqlSelect += " and R.jobUuid = '" + jobUuid + "' ";
			}
			if (approvalStateUuid != null && approvalStateUuid.length() > 0) {
				sqlSelect += " and RA.approvalStateUuid = '" + approvalStateUuid + "' ";
			}

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sqlSelect.replace("R.*", "count(*) as count") + ") as JdoVirtual";
			Constraint jdoVirtualC = new Constraint("JdoVirtual");
			jdoVirtualC.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			sqlSelect += " order by " + sortField + " asc";
			sqlSelect += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

			Constraint c = new Constraint("RegularApplication");
			c.addSQLCondition(sqlSelect, null);
			List<RegularApplication> regularApplicationsTemp = applyService.selectRegularApplications(c);
			if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_1) != -1) {
				tempAuthorityFlag = 1;
			}
			else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_2) != -1) {
				tempAuthorityFlag = 2;
			}
			else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_3) != -1) {
				tempAuthorityFlag = 3;
			}
			else {
				tempAuthorityFlag = 4;
			}
			tempList.add(tempAuthorityFlag);
			for (int i = 0; i < regularApplicationsTemp.size(); i++) {
				RegularApplication regularApplication = regularApplicationsTemp.get(i);
				Apply apply = regularApplication.getApply();
				String[] str = new String[23];
				str[0] = Integer.toString(Integer.parseInt(offset) + i);
				str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
				str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMD.format(apply.getApplicationTime()) : "";
				str[3] = apply.getCheckerOneUuid() != null ? apply.getCheckerOne().getPerson().getName() : "";
				str[4] = apply.getCheckTimeOne() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne()) : "";
				str[5] = apply.getCheckerTwoUuid() != null ? apply.getCheckerTwo().getPerson().getName() : "";
				str[6] = apply.getCheckTimeTwo() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo()) : "";
				str[7] = apply.getCheckerThreeUuid() != null ? apply.getCheckerThree().getPerson().getName() : "";
				str[8] = apply.getCheckTimeThree() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree()) : "";
				str[9] = apply.getCheckerFourUuid() != null ? apply.getCheckerFour().getPerson().getName() : "";
				str[10] = apply.getCheckTimeFour() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeFour()) : "";
				str[11] = apply.getCheckerFiveUuid() != null ? apply.getCheckerFive().getPerson().getName() : "";
				str[12] = apply.getCheckTimeFive() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeFive()) : "";
				str[13] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
				str[14] = apply.getUuid();
				str[15] = apply.getApplicant().getPerson().getPersonNo() != null ? apply.getApplicant().getPerson().getPersonNo() : "";
				str[16] = regularApplication.getDepartment().getDescription() != null ? regularApplication.getDepartment().getDescription() : "";
				str[17] = regularApplication.getJob().getDescription() != null ? regularApplication.getJob().getDescription() : "";
				str[18] = regularApplication.getCampus().getDescription() != null ? regularApplication.getCampus().getDescription() : "";
				str[19] = regularApplication.getApply().getApplicantUuid() != null ? regularApplication.getApply().getApplicantUuid() : "";
				str[20] = regularApplication.getApprovalUuid() != null ? regularApplication.getApproval().getApprovalState().getDescription() : "";
				str[21] = regularApplication.getApply().getApplicant().getWorkingStateUuid() != null ? regularApplication.getApply().getApplicant().getWorkingState().getDescription() : "";
				str[22] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
				tempList.add(str);
			}
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
