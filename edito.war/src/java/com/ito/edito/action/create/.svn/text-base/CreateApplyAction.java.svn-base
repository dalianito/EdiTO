package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.RegularApplication;
import com.ito.edito.schema.RegularApproval;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateApplyAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		Apply apply = (Apply) carrier.fetchInstance("Apply");
		apply.setApplicationTime(new Date());
		apply.setIfUsing(true);

		Constraint c = new Constraint("Employee");
		c.addCondition("personUuid", USER.getPersonUuid());
		c.addCondition("ifUsing", "1");
		Employee employee = userService.selectEmployee(c);
		apply.setApplicantUuid(employee.getUuid(), false);

		Recruitment recruitment = null;
		Relationship relationship = null;
		Quit quit = null;
		LeaveApplication leaveApplication = null;
		RegularApplication regularApplication = null;
		RegularApproval regularApproval = null;
		RegularApplication regularApplicationT = null;
		if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RECRUITMENT)) {
			recruitment = (Recruitment) carrier.fetchInstance("Recruitment");
			recruitment.setIfUsing(true);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
			relationship = (Relationship) carrier.fetchInstance("Relationship");
			relationship.setIfDeal(false);
			relationship.setIfUsing(true);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_QUIT)) {
			quit = (Quit) carrier.fetchInstance("Quit");
			quit.setIfDeal(false);
			quit.setIfUsing(true);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_REGULAR)) {
			regularApplication = (RegularApplication) carrier.fetchInstance("RegularApplication");
			regularApplication.setIfUsing(true);
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

			if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RECRUITMENT)) {
				recruitment.setApplyUuid(applyUuid, false);
				if (recruitment.getUuid() != null) {
					applyService.updateRecruitment(recruitment, USER.getAccount());
				}
				else {
					applyService.insertRecruitment(recruitment, USER.getAccount());
				}
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
				relationship.setApplyUuid(applyUuid, false);
				if (relationship.getUuid() != null) {
					applyService.updateRelationship(relationship, USER.getAccount());
				}
				else {
					applyService.insertRelationship(relationship, USER.getAccount());
				}
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_QUIT)) {
				quit.setApplyUuid(applyUuid, false);
				if (quit.getUuid() != null) {
					applyService.updateQuit(quit, USER.getAccount());
				}
				else {
					applyService.insertQuit(quit, USER.getAccount());
				}
			}
			else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_REGULAR)) {
				regularApplication.setApplyUuid(applyUuid, false);
				if (regularApplication.getApprovalUuid() == null) {
					regularApproval = new RegularApproval();
					regularApproval.setApprovalStateUuid(Constants.APPROVAL_EXAMINATION_STATE_NOTDO, false);
					String approvalUuid = applyService.insertRegularApproval(regularApproval, USER.getAccount());
					regularApplication.setApprovalUuid(approvalUuid, false);
				}
				if (regularApplication.getUuid() != null) {
					regularApplicationT = applyService.selectRegularApplicationByUuid(regularApplication.getUuid());
					regularApplicationT.setDebrief(regularApplication.getDebrief());
					regularApplicationT.setWorkPlan(regularApplication.getWorkPlan());
					regularApplicationT.setSuggestion(regularApplication.getSuggestion());
					applyService.updateRegularApplication(regularApplicationT, USER.getAccount());
				}
				else {
					applyService.insertRegularApplication(regularApplication, USER.getAccount());
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
