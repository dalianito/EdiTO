package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class DeleteEmployeeApprovalRoleAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String personUuid = request.getParameter("personUuid");

		Constraint c = new Constraint("User");
		c.addCondition("personUuid", personUuid);
		User user = userService.selectUser(c);

		Constraint ca = new Constraint("ApprovalAuthority");
		ca.addCondition("authorityUuid", uuid);
		ca.addCondition("userUuid", user.getUuid());
		ApprovalAuthority approvalAuthority = userService.selectApprovalAuthority(ca);

		ut.begin();
		try {
			userService.deleteApprovalAuthority(approvalAuthority, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
