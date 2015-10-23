package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ApprovalAuthorityType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetApprovalRoleAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		Constraint c = new Constraint("ApprovalAuthorityType");
		List<ApprovalAuthorityType> ApprovalAuthorityTypeList = userService.selectApprovalAuthorityTypes(c);

		setResponseText(ApprovalAuthorityTypeList);
	}
}
