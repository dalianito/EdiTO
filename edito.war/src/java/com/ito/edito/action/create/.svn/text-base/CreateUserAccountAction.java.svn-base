package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.User;
import com.ito.fai.util.JndiFactory;

public class CreateUserAccountAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		User user = (User) carrier.fetchInstance("User");
		user.setIfUsing(true);
		userService.insertUser(user, USER.getAccount());
	}
}
