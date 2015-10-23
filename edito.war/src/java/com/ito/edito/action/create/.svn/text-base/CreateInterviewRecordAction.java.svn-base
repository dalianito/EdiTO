package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.InterviewRecord;
import com.ito.fai.util.JndiFactory;

public class CreateInterviewRecordAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		InterviewRecord interviewRecord = (InterviewRecord) carrier.fetchInstance("InterviewRecord");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		interviewRecord.setIfUsing(true);
		interviewRecord.setCreateTime(new Date());

		ut.begin();
		try {
			String InterviewRecordUuid = interviewRecord.getUuid();
			if (InterviewRecordUuid != null) {
				campusService.updateInterviewRecord(interviewRecord, USER.getAccount());
			}
			else {
				interviewRecord.setInterviewerUuid(EMPLOYEE.getUuid(), false);
				interviewRecord.setInterviewerCampusUuid(EMPLOYEE.getCampusUuid(), false);
				interviewRecord.setInterviewerDepartmentUuid(EMPLOYEE.getDepartmentUuid(), false);
				interviewRecord.setInterviewerJobUuid(EMPLOYEE.getJobUuid(), false);
				campusService.insertInterviewRecord(interviewRecord, USER.getAccount());
			}

			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
