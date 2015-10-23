package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeAccountIfExistAction extends AjaxAction {
	private String responseText = null;
	private String ACCOUNT_EXIST = "1";
	private String ACCOUNT_NONEXIST = "2";

	public void executeManualUT() throws Exception {
		UserService uService = (UserService) JndiFactory.lookup("userService");

		String account = (String) request.getParameter("account");

		Constraint c = new Constraint("User");
		c.addCondition("ifUsing", true);
		c.addCondition("account", account);
		User user = uService.selectUser(c);
		if (user != null) {
			responseText = ACCOUNT_EXIST;
		}
		else {
			responseText = ACCOUNT_NONEXIST;
		}
		setResponseText(responseText);
	}
}
