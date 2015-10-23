package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.schema.JobPerfType;
import com.ito.fai.util.JndiFactory;

public class DeleteJobTypeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");

		String uuid = request.getParameter("uuid");
		String jobUuid = request.getParameter("jobUuid");

		List<JobPerfType> jobPerfTypeList = performanceService.selectJobPerfTypeDeleted(uuid, jobUuid);

		ut.begin();
		try {
			for (int i = 0; i < jobPerfTypeList.size(); i++) {
				JobPerfType jobPerfType = jobPerfTypeList.get(i);
				performanceService.deleteJobPerfType(jobPerfType, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
