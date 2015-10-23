package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Job;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryJobAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String desciption = request.getParameter("description");

		Constraint c = new Constraint("Job");
		c.addCondition("ifUsing", true);
		if (desciption != null && desciption.length() > 0) {
			c.addCondition("description", "%" + desciption + "%", Constraint.LIKE);
		}
		List<Job> jobList = userService.selectJobs(c);

		if (USER.getUuid().equals(Constants.ADMIN_USER_UUID)) {
			Job adminJob = userService.selectJobByUuid(Constants.ADMIN_JOB_UUID);
			jobList.add(0, adminJob);
		}

		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < jobList.size(); i++) {
			Job job = jobList.get(i);
			String[] str = new String[3];
			str[0] = String.valueOf(i + 1);
			str[1] = job.getDescription();
			str[2] = job.getUuid();

			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
