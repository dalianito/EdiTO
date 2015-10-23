package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Job;
import com.ito.fai.util.JndiFactory;

public class CreateJobAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		Job job = (Job) carrier.fetchInstance("Job");
		job.setIfHasChild(false);
		job.setIfUsing(true);

		ut.begin();
		try {
			if (job.getUuid() != null) {
				userService.updateJob(job, USER.getAccount());
			}
			else {
				userService.insertJob(job, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			ut.rollback();
		}
	}
}
