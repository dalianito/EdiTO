package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.InterviewRecord;
import com.ito.fai.util.JndiFactory;

public class GetInterviewRecordAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			InterviewRecord interviewRecord = campusService.selectInterviewRecordByUuid(uuid);
			request.setAttribute("interviewRecord", interviewRecord);
		}
	}
}
