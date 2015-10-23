package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.fai.util.JndiFactory;

public class CreateJobTypeAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");

		String uuid = request.getParameter("uuid");
		String jobUuid = request.getParameter("jobUuid");

		performanceService.insertJobPerfType(uuid, jobUuid, USER.getAccount());
	}
}
