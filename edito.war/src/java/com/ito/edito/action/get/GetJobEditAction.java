package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Job;
import com.ito.fai.util.JndiFactory;

public class GetJobEditAction extends AjaxAction {
	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Job job = userService.selectJobByUuid(uuid);
		setResponseText(job);
	}
}
