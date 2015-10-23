package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.RegularApplication;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetApplyAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Apply apply = applyService.selectApplyByUuid(uuid);
			if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RECRUITMENT)) {
				Constraint c = new Constraint("Recruitment");
				c.addCondition("applyUuid", apply.getUuid());
				Recruitment recruitment = applyService.selectRecruitment(c);
				if (recruitment != null) {
					request.setAttribute("recruitment", recruitment);
				}
				resultCode = "recruitment";
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_TEACHER_RECRUITMENT)) {
				Constraint c = new Constraint("Recruitment");
				c.addCondition("applyUuid", apply.getUuid());
				Recruitment recruitment = applyService.selectRecruitment(c);
				if (recruitment != null) {
					request.setAttribute("recruitment", recruitment);
				}
				resultCode = "recruitment";
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
				Constraint c = new Constraint("Relationship");
				c.addCondition("applyUuid", apply.getUuid());
				Relationship relationship = applyService.selectRelationship(c);
				if (relationship != null) {
					request.setAttribute("relationship", relationship);
				}
				resultCode = "relationship";
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_QUIT)) {
				Constraint c = new Constraint("Quit");
				c.addCondition("applyUuid", apply.getUuid());
				Quit quit = applyService.selectQuit(c);
				if (quit != null) {
					request.setAttribute("quit", quit);
				}
				resultCode = "quit";
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_LEAVE)) {
				Constraint c = new Constraint("LeaveApplication");
				c.addCondition("applyUuid", apply.getUuid());
				LeaveApplication leaveApplication = applyService.selectLeaveApplication(c);
				if (leaveApplication != null) {
					request.setAttribute("leaveApplication", leaveApplication);
				}
				resultCode = "leaveApplication";
			}
			else {
				Constraint c = new Constraint("RegularApplication");
				c.addCondition("applyUuid", apply.getUuid());
				RegularApplication regularApplication = applyService.selectRegularApplication(c);
				if (regularApplication != null) {
					request.setAttribute("regularApplication", regularApplication);
				}

				Constraint ca = new Constraint("ApprovalAuthority");
				ca.addCondition("userUuid", USER.getUuid());
				List<ApprovalAuthority> approvalAuthority = userService.selectApprovalAuthoritys(ca);
				if (approvalAuthority != null) {
					for (int i = 0; i < approvalAuthority.size(); i++) {
						ApprovalAuthority approvalAuthoritytemp = approvalAuthority.get(i);
						if (approvalAuthoritytemp.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_7_1) || approvalAuthoritytemp.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_7_2) || approvalAuthoritytemp.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_7_3) || approvalAuthoritytemp.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_7_4) || approvalAuthoritytemp.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_7_5)) {
							request.setAttribute("approvalAuthority", approvalAuthoritytemp.getAuthorityUuid());
						}
					}
				}

				resultCode = "regularApplication";
			}
		}
	}
}
