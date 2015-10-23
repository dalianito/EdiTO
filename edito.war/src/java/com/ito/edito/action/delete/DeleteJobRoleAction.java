package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.JobAuthority;
import com.ito.fai.util.JndiFactory;

public class DeleteJobRoleAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String jobUuid = request.getParameter("jobUuid");

		List<JobAuthority> jobAuthorityList = userService.selectJobAuthorityDeleted(uuid, jobUuid, USER.getAccount());

		ut.begin();
		try {
			for (int i = 0; i < jobAuthorityList.size(); i++) {
				JobAuthority jobAuthority = jobAuthorityList.get(i);
				userService.deleteJobAuthority(jobAuthority, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
