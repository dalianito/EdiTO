package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateEmployeeRoleAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String personUuid = request.getParameter("personUuid");

		Constraint c = new Constraint("User");
		c.addCondition("personUuid", personUuid);
		User user = userService.selectUser(c);
		String userUuid = user.getUuid();
		userService.insertAuthority(uuid, userUuid, USER.getAccount());
	}
}
