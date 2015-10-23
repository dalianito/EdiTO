package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateWorkRecordReviewAction extends AjaxAction {
	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		List<WorkRecord> workRecord = (List<WorkRecord>) carrier.fetchInstances("WorkRecord");
		for (int i = 0; i < workRecord.size(); i++) {
			ut.begin();
			try {
				workRecord.get(i).setIfUsing(true);
				workRecord.get(i).setReviewEmployeeUuid(EMPLOYEE.getUuid());
				if(workRecord.get(i).getReviewFlagUuid().equals(Constants.REVIEWD_FLAG)){
					workRecord.get(i).setReviewTime(new Date());
				}
				campusService.updateWorkRecord(workRecord.get(i), USER.getAccount());

				ut.commit();
			}
			catch (Exception e) {
				ut.rollback();
			}
		}
	}
}
