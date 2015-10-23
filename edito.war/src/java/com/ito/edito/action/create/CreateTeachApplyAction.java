package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateTeachApplyAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		Apply apply = (Apply) carrier.fetchInstance("Apply");
		apply.setApplicationTime(new Date());
		apply.setIfUsing(true);

		apply.setApplicantUuid(EMPLOYEE.getUuid(), false);

		Recruitment recruitment = null;
		LeaveApplication leaveApplication = null;
		if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_TEACHER_RECRUITMENT)) {
			recruitment = (Recruitment) carrier.fetchInstance("Recruitment");
			recruitment.setIfUsing(true);
		}
		else {
			leaveApplication = (LeaveApplication) carrier.fetchInstance("LeaveApplication");
			leaveApplication.setIfUsing(true);
		}

		ut.begin();
		try {
			String applyUuid = apply.getUuid();
			if (applyUuid != null) {
				applyService.updateApply(apply, USER.getAccount());
			}
			else {
				applyUuid = applyService.insertApply(apply, USER.getAccount());
			}
			if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_TEACHER_RECRUITMENT)) {
				recruitment.setApplyUuid(applyUuid, false);
				if (recruitment.getUuid() != null) {
					applyService.updateRecruitment(recruitment, USER.getAccount());
				}
				else {
					applyService.insertRecruitment(recruitment, USER.getAccount());
				}
			}
			else {
				leaveApplication.setApplyUuid(applyUuid, false);
				leaveApplication.setCampusUuid(EMPLOYEE.getCampusUuid(), false);
				if (leaveApplication.getUuid() != null) {
					applyService.updateLeaveApplication(leaveApplication, USER.getAccount());
				}
				else {
					applyService.insertLeaveApplication(leaveApplication, USER.getAccount());
				}
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
