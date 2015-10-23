package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateWorkRecordAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		WorkRecord workRecord = (WorkRecord) carrier.fetchInstance("WorkRecord");
		workRecord.setRecordTime(new Date());
		workRecord.setReviewFlagUuid(Constants.NOT_REVIEW_FLAG, false);

		ut.begin();
		try {
			String workRecordUuid = workRecord.getUuid();
			if (workRecordUuid == null) {
				workRecordUuid = campusService.insertWorkRecord(workRecord, USER.getAccount());
			}
			else {
				workRecordUuid = workRecord.getUuid();
				campusService.updateWorkRecord(workRecord, USER.getAccount());
			}
			ut.commit();

			setResponseText(workRecordUuid);
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
