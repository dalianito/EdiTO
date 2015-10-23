package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryApprovalAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String typeUuid = request.getParameter("typeUuid");
		String authorityTemp = "";

		Constraint approvalAuthorityC = new Constraint("ApprovalAuthority");
		approvalAuthorityC.addCondition("userUuid", USER.getUuid());
		List<ApprovalAuthority> approvalAuthorityList = userService.selectApprovalAuthoritys(approvalAuthorityC);

		int authorityNum = approvalAuthorityList.size();

		List<Object> resultList = new ArrayList<Object>();
		List<String[]> tempList = new ArrayList<String[]>();
		resultList.add(tempList);

		if (authorityNum > 0) {
			String authorityStrings = "";
			for (int i = 0; i < approvalAuthorityList.size(); i++) {
				authorityStrings += approvalAuthorityList.get(i).getAuthorityUuid();
			}

			String sql = "";
			if (typeUuid.equals(Constants.APPLY_TYPE_UUID_RECRUITMENT)) {
				sql = "select * from Apply where ifUsing = 1 and typeUuid = '" + typeUuid + "' ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_1_1) != -1) {
					sql += " and checkStateOneUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_1_2) != -1) {
					sql += " and checkStateOneUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateTwoUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_1_3) != -1) {
					sql += " and checkStateTwoUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateThreeUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			else if (typeUuid.equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
				sql = "select * from Apply where ifUsing = 1 and typeUuid = '" + typeUuid + "' ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_2_1) != -1) {
					sql += " and checkStateOneUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_2_2) != -1) {
					sql += " and checkStateOneUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateTwoUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_2_3) != -1) {
					sql += " and checkStateTwoUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateThreeUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			else if (typeUuid.equals(Constants.APPLY_TYPE_UUID_QUIT)) {
				sql = "select * from Apply where ifUsing = 1 and typeUuid = '" + typeUuid + "' ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_3_1) != -1) {
					sql += " and checkStateOneUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_3_2) != -1) {
					sql += " and checkStateOneUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateTwoUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_3_3) != -1) {
					sql += " and checkStateTwoUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateThreeUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_3_4) != -1) {
					sql += " and checkStateThreeUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateFourUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			else if (typeUuid.equals(Constants.APPLY_TYPE_UUID_LEAVE)) {
				sql = "select A.* from Apply A, LeaveApplication L where A.uuid = L.applyUuid and typeUuid = '" + typeUuid + "' and A.ifUsing = 1 and L.ifUsing = 1 ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_4_1) != -1) {
					sql += " and L.campusUuid = '" + EMPLOYEE.getCampusUuid() + "' and A.checkStateOneUuid is null and ( ( L.days > 2 and A.checkStateThreeUuid is null ) or ( L.days < 3 and A.checkStateTwoUuid is null ) ) ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_4_2) != -1) {
					sql += " and L.campusUuid = '" + EMPLOYEE.getCampusUuid() + "' and A.checkStateTwoUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_4_3) != -1) {
					sql += " and L.days > 2 and A.checkStateTwoUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and A.checkStateThreeUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			else if (typeUuid.equals(Constants.APPLY_TYPE_UUID_PUBLICITY)) {
				sql = "select * from Apply where ifUsing = 1 and typeUuid = '" + typeUuid + "' ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_5_1) != -1) {
					sql += " and checkStateOneUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_5_2) != -1) {
					sql += " and checkStateOneUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateTwoUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			else if (typeUuid.equals(Constants.APPLY_TYPE_UUID_MATERIAL)) {
				sql = "select * from Apply where ifUsing = 1 and typeUuid = '" + typeUuid + "' ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_6_1) != -1) {
					sql += " and checkStateOneUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_6_2) != -1) {
					sql += " and checkStateOneUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateTwoUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_6_3) != -1) {
					sql += " and checkStateTwoUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' and checkStateThreeUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			else if (typeUuid.equals(Constants.APPLY_TYPE_UUID_REGULAR)) {
				sql = "select * from Apply where ifUsing = 1 and typeUuid = '" + typeUuid + "' ";
				if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_5) != -1) {
					sql += " and checkStateFourUuid is not null and checkStateFiveUuid is null ";
					authorityTemp = Constants.APPROVAL_AUTHORITY_7_5;
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_1) != -1) {
					authorityTemp = Constants.APPROVAL_AUTHORITY_7_1;
					sql += " and checkStateFiveUuid is null and checkStateOneUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_2) != -1) {
					authorityTemp = Constants.APPROVAL_AUTHORITY_7_2;
					sql += " and checkStateFiveUuid is null and checkStateTwoUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_3) != -1) {
					authorityTemp = Constants.APPROVAL_AUTHORITY_7_3;
					sql += " and checkStateFiveUuid is null and checkStateThreeUuid is null ";
				}
				else if (authorityStrings.indexOf(Constants.APPROVAL_AUTHORITY_7_4) != -1) {
					authorityTemp = Constants.APPROVAL_AUTHORITY_7_4;
					sql += " and checkStateFourUuid is null ";
				}
				else {
					sql += " and false ";
					resultList.add("noAuthority");
				}
			}
			sql += " order by applicationTime asc ";

			Constraint c = new Constraint("Apply");
			c.addSQLCondition(sql, null);
			List<Apply> applysTemp = applyService.selectApplys(c);
			for (int i = 0; i < applysTemp.size(); i++) {
				Apply apply = applysTemp.get(i);
				String[] str = new String[12];
				str[0] = String.valueOf(i + 1);
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
				str[11] = apply.getUuid();
				tempList.add(str);
			}
		}
		else {
			resultList.add("noAuthority");
		}

		resultList.add(authorityTemp);
		setResponseText(resultList);
	}
}
