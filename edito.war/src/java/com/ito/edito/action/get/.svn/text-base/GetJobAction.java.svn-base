package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Job;
import com.ito.fai.util.JndiFactory;

public class GetJobAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Job job = userService.selectJobByUuid(uuid);
			request.setAttribute("job", job);
		}
	}
}
