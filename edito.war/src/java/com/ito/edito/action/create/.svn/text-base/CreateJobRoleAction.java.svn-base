package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.fai.util.JndiFactory;

public class CreateJobRoleAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String jobUuid = request.getParameter("jobUuid");

		userService.insertJobAuthority(uuid, jobUuid, USER.getAccount());
	}
}
