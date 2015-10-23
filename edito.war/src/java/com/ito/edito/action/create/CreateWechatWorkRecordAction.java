package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.User;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateWechatWorkRecordAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		WorkRecord workRecord = (WorkRecord) carrier.fetchInstance("WorkRecord");
		WorkRecord workRecordDB = null;
		String workRecordUuid = workRecord.getUuid();
		if (workRecordUuid != null) {
			workRecordDB = campusService.selectWorkRecordByUuid(workRecordUuid);
		}

		Employee employee = userService.selectEmployeeByUuid(workRecord.getRecordUuid());
		Constraint c = new Constraint("User");
		c.addCondition("personUuid", employee.getPersonUuid());
		c.addCondition("ifUsing", true);
		User user = userService.selectUser(c);

		ut.begin();
		try {
			if (workRecordUuid == null) {
				workRecord.setIfUsing(true);
				workRecord.setRecordTime(new Date());
				workRecord.setReviewFlagUuid(Constants.NOT_REVIEW_FLAG, false);
				workRecordUuid = campusService.insertWorkRecord(workRecord, Constants.WECHAT_USER + user.getAccount());
			}
			else {
				workRecordDB.setSummary(workRecord.getSummary());
				workRecordDB.setSchedule(workRecord.getSchedule());
				workRecordDB.setShare(workRecord.getShare());
				campusService.updateWorkRecord(workRecordDB, Constants.WECHAT_USER + user.getAccount());
			}

			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}

		setResponseText(workRecordUuid);
	}
}
