package com.ito.edito.action.query;

import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.RegularApplication;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryApplyInfoAction extends AjaxAction {

	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Constraint approvalAuthorityC = new Constraint("ApprovalAuthority");
		approvalAuthorityC.addCondition("userUuid", USER.getUuid());
		List<ApprovalAuthority> approvalAuthorityList = userService.selectApprovalAuthoritys(approvalAuthorityC);

		String authoritys = "";
		for (int i = 0; i < approvalAuthorityList.size(); i++) {
			ApprovalAuthority approvalAuthority = approvalAuthorityList.get(i);
			authoritys += approvalAuthority.getAuthorityUuid() + ",";
		}
		map.put("authoritys", authoritys);

		Apply apply = applyService.selectApplyByUuid(uuid);
		if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RECRUITMENT)) {
			Constraint c = new Constraint("Recruitment");
			c.addCondition("applyUuid", uuid);
			Recruitment recruitment = applyService.selectRecruitment(c);
			if (recruitment != null) {
				map.put("type", "recruitment");
				map.put("applyInfo", recruitment);
			}
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
			Constraint c = new Constraint("Relationship");
			c.addCondition("applyUuid", uuid);
			Relationship relationship = applyService.selectRelationship(c);
			if (relationship != null) {
				map.put("type", "relationship");
				map.put("applyInfo", relationship);
			}
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_QUIT)) {
			Constraint c = new Constraint("Quit");
			c.addCondition("applyUuid", uuid);
			Quit quit = applyService.selectQuit(c);
			if (quit != null) {
				map.put("type", "quit");
				map.put("applyInfo", quit);
			}
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_LEAVE)) {
			Constraint c = new Constraint("LeaveApplication");
			c.addCondition("applyUuid", uuid);
			LeaveApplication leaveApplication = applyService.selectLeaveApplication(c);
			if (leaveApplication != null) {
				map.put("type", "leave");
				map.put("applyInfo", leaveApplication);
			}
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_PUBLICITY)) {
			Constraint c = new Constraint("PublicityApplication");
			c.addCondition("applyUuid", uuid);
			PublicityApplication publicityApplication = applyService.selectPublicityApplication(c);
			if (publicityApplication != null) {
				map.put("type", "publicity");
				map.put("applyInfo", publicityApplication);
			}
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_MATERIAL)) {
			Constraint c = new Constraint("OfficeApplication");
			c.addCondition("applyUuid", uuid);
			OfficeApplication officeApplication = materialService.selectOfficeApplication(c);
			if (officeApplication != null) {
				map.put("type", "material");
				map.put("applyInfo", officeApplication);
			}
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_REGULAR)) {
			Constraint c = new Constraint("RegularApplication");
			c.addCondition("applyUuid", uuid);
			RegularApplication regularApplication = applyService.selectRegularApplication(c);
			if (regularApplication != null) {
				map.put("type", "regular");
				map.put("applyInfo", regularApplication);
			}
		}

		if (map.get("type") == null) {
			map.put("type", "none");
		}

		setResponseText(map);
	}
}
