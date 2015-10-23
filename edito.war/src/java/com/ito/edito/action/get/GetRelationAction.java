package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetRelationAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Apply apply = applyService.selectApplyByUuid(uuid);
			if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
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
		}
	}
}
