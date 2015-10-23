package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Job;
import com.ito.fai.util.JndiFactory;

public class UpdateJobAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		String uuid = request.getParameter("uuid");

		Job job = userService.selectJobByUuid(uuid);
		job.setIfUsing(false);

		ut.begin();
		try {
			userService.updateJob(job, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
