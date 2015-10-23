package com.ito.edito.action.create;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.RegularApproval;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateApprovalAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		Apply apply = (Apply) carrier.fetchInstance("Apply");
		RegularApproval regularApproval = null;
		RegularApproval regularApprovalF = null;

		boolean flag = true;
		String uuid = apply.getUuid();
		String checkStateOneUuid = apply.getCheckStateOneUuid();
		String notesOne = apply.getNotesOne();
		String checkStateTwoUuid = apply.getCheckStateTwoUuid();
		String notesTwo = apply.getNotesTwo();
		String checkStateThreeUuid = apply.getCheckStateThreeUuid();
		String notesThree = apply.getNotesThree();
		String checkStateFourUuid = apply.getCheckStateFourUuid();
		String notesFour = apply.getNotesFour();
		String checkStateFiveUuid = apply.getCheckStateFiveUuid();
		String notesFive = apply.getNotesFive();

		Apply applyDB = applyService.selectApplyByUuid(uuid);
		if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RECRUITMENT) || applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
			if (checkStateOneUuid != null) {
				applyDB.setCheckTimeOne(new Date());
				applyDB.setCheckerOneUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesOne(notesOne);
				applyDB.setCheckStateOneUuid(checkStateOneUuid, false);
			}
			if (checkStateTwoUuid != null) {
				applyDB.setCheckTimeTwo(new Date());
				applyDB.setCheckerTwoUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesTwo(notesTwo);
				applyDB.setCheckStateTwoUuid(checkStateTwoUuid, false);
			}
			if (checkStateThreeUuid != null) {
				applyDB.setCheckTimeThree(new Date());
				applyDB.setCheckerThreeUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesThree(notesThree);
				applyDB.setCheckStateThreeUuid(checkStateThreeUuid, false);
			}

			boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateOneUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateTwoUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateThreeUuid());
			if (mark) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
			}
			else if (applyDB.getCheckStateThreeUuid() == null) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
			}
			else if (applyDB.getCheckStateThreeUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
			}
		}
		else if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_LEAVE)) {
			Constraint c = new Constraint("LeaveApplication");
			c.addCondition("applyUuid", uuid);
			LeaveApplication leaveapplication = applyService.selectLeaveApplication(c);
			if (checkStateOneUuid != null) {
				applyDB.setCheckTimeOne(new Date());
				applyDB.setCheckerOneUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesOne(notesOne);
				applyDB.setCheckStateOneUuid(checkStateOneUuid, false);
			}
			if (checkStateTwoUuid != null) {
				applyDB.setCheckTimeTwo(new Date());
				applyDB.setCheckerTwoUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesTwo(notesTwo);
				applyDB.setCheckStateTwoUuid(checkStateTwoUuid, false);
			}
			if (checkStateThreeUuid != null) {
				applyDB.setCheckTimeThree(new Date());
				applyDB.setCheckerThreeUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesThree(notesThree);
				applyDB.setCheckStateThreeUuid(checkStateThreeUuid, false);
			}
			if (apply.getTimeStamp() > 2) {
				boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateTwoUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateThreeUuid());
				if (mark) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
				}
				else if ((applyDB.getCheckStateThreeUuid() == null) && (leaveapplication.getDays() > 2)) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
				}
				else if ((applyDB.getCheckStateTwoUuid() == null) && (leaveapplication.getDays() < 3)) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
				}
				else if (applyDB.getCheckStateThreeUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
				}
				else if (applyDB.getCheckStateTwoUuid().equals(Constants.EXAMINATION_STATE_PASSED) && (leaveapplication.getDays() < 3)) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
				}
			}
			else {
				boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateOneUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateTwoUuid());
				if (mark) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
				}
				else if (applyDB.getCheckStateTwoUuid() == null) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
				}
				else if (applyDB.getCheckStateTwoUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
				}
			}
		}
		else if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_QUIT)) {
			if (checkStateOneUuid != null) {
				applyDB.setCheckTimeOne(new Date());
				applyDB.setCheckerOneUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesOne(notesOne);
				applyDB.setCheckStateOneUuid(checkStateOneUuid, false);
			}
			if (checkStateTwoUuid != null) {
				applyDB.setCheckTimeTwo(new Date());
				applyDB.setCheckerTwoUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesTwo(notesTwo);
				applyDB.setCheckStateTwoUuid(checkStateTwoUuid, false);
			}
			if (checkStateThreeUuid != null) {
				applyDB.setCheckTimeThree(new Date());
				applyDB.setCheckerThreeUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesThree(notesThree);
				applyDB.setCheckStateThreeUuid(checkStateThreeUuid, false);
			}
			if (checkStateFourUuid != null) {
				applyDB.setCheckTimeFour(new Date());
				applyDB.setCheckerFourUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesFour(notesFour);
				applyDB.setCheckStateFourUuid(checkStateFourUuid, false);
			}

			boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateOneUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateTwoUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateThreeUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateFourUuid());
			if (mark) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
			}
			else if (applyDB.getCheckStateFourUuid() == null) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
			}
			else if (applyDB.getCheckStateFourUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
			}
		}
		else if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_PUBLICITY)) {
			if (checkStateOneUuid != null) {
				applyDB.setCheckTimeOne(new Date());
				applyDB.setCheckerOneUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesOne(notesOne);
				applyDB.setCheckStateOneUuid(checkStateOneUuid, false);
			}
			if (checkStateTwoUuid != null) {
				applyDB.setCheckTimeTwo(new Date());
				applyDB.setCheckerTwoUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesTwo(notesTwo);
				applyDB.setCheckStateTwoUuid(checkStateTwoUuid, false);
			}

			boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateOneUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateTwoUuid());
			if (mark) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
			}
			else if (applyDB.getCheckStateTwoUuid() == null) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
			}
			else if (applyDB.getCheckStateTwoUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
			}
		}
		else if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_MATERIAL)) {
			if (checkStateOneUuid != null) {
				applyDB.setCheckTimeOne(new Date());
				applyDB.setCheckerOneUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesOne(notesOne);
				applyDB.setCheckStateOneUuid(checkStateOneUuid, false);
			}
			if (checkStateTwoUuid != null) {
				applyDB.setCheckTimeTwo(new Date());
				applyDB.setCheckerTwoUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesTwo(notesTwo);
				applyDB.setCheckStateTwoUuid(checkStateTwoUuid, false);
			}
			if (checkStateThreeUuid != null) {
				applyDB.setCheckTimeThree(new Date());
				applyDB.setCheckerThreeUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesThree(notesThree);
				applyDB.setCheckStateThreeUuid(checkStateThreeUuid, false);
			}

			boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateOneUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateTwoUuid()) || Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateThreeUuid());
			if (mark) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
			}
			else if (applyDB.getCheckStateThreeUuid() == null) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
			}
			else if (applyDB.getCheckStateThreeUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
			}
		}
		else if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_REGULAR)) {
			regularApproval = (RegularApproval) carrier.fetchInstance("RegularApproval");
			regularApprovalF = applyService.selectRegularApprovalByUuid(regularApproval.getUuid());
			if (checkStateOneUuid != null) {
				applyDB.setCheckTimeOne(new Date());
				applyDB.setCheckerOneUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesOne(notesOne);
				applyDB.setCheckStateOneUuid(checkStateOneUuid, false);
				int totalScore = regularApproval.getAttendanceMark() + regularApproval.getBehaviorMark() + regularApproval.getResponsibilityMark() + regularApproval.getDiligenceMark() + regularApproval.getSkillMark() + regularApproval.getCoordinationMark() + regularApproval.getPlanMark() + regularApproval.getExecuteMark() + regularApproval.getQualityMark() + regularApproval.getEfficiencyMark();
				regularApproval.setTotalScore(totalScore);
				regularApproval.setApprovalStateUuid(Constants.APPROVAL_EXAMINATION_STATE_DOING, false);
				flag = false;
			}
			if (checkStateTwoUuid != null) {
				applyDB.setCheckTimeTwo(new Date());
				applyDB.setCheckerTwoUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesTwo(notesTwo);
				applyDB.setCheckStateTwoUuid(checkStateTwoUuid, false);
				regularApprovalF.setTeachPerformance(regularApproval.getTeachPerformance());
				regularApprovalF.setApprovalStateUuid(Constants.APPROVAL_EXAMINATION_STATE_DOING, false);
			}
			if (checkStateThreeUuid != null) {
				applyDB.setCheckTimeThree(new Date());
				applyDB.setCheckerThreeUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesThree(notesThree);
				applyDB.setCheckStateThreeUuid(checkStateThreeUuid, false);
				regularApprovalF.setTeachEXInfo(regularApproval.getTeachEXInfo());
				regularApprovalF.setApprovalStateUuid(Constants.APPROVAL_EXAMINATION_STATE_DOING, false);
			}
			if (checkStateFourUuid != null) {
				applyDB.setCheckTimeFour(new Date());
				applyDB.setCheckerFourUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesFour(notesFour);
				applyDB.setCheckStateFourUuid(checkStateFourUuid, false);
				regularApprovalF.setApprovalStateUuid(Constants.APPROVAL_EXAMINATION_STATE_DOING, false);
			}
			if (checkStateFiveUuid != null) {
				applyDB.setCheckTimeFive(new Date());
				applyDB.setCheckerFiveUuid(EMPLOYEE.getUuid(), false);
				applyDB.setNotesFive(notesFive);
				applyDB.setCheckStateFiveUuid(checkStateFiveUuid, false);
				regularApprovalF.setApprovalStateUuid(Constants.APPROVAL_EXAMINATION_STATE_DONE, false);
			}

			boolean mark = Constants.EXAMINATION_STATE_UNPASSED.equals(applyDB.getCheckStateFiveUuid());
			if (mark) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
			}
			else if (applyDB.getCheckStateFiveUuid() == null) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);
			}
			else if (applyDB.getCheckStateFiveUuid().equals(Constants.EXAMINATION_STATE_PASSED)) {
				applyDB.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
			}
		}

		ut.begin();
		try {
			if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_MATERIAL)) {
				List<OfficeApplicationInfo> officeApplicationInfoList = (ArrayList<OfficeApplicationInfo>) carrier.fetchInstances("OfficeApplicationInfo");
				boolean mark = true;
				for (int i = 0; i < officeApplicationInfoList.size(); i++) {
					OfficeApplicationInfo officeApplicationInfo = officeApplicationInfoList.get(i);
					if (applyDB.getStateUuid().equals(Constants.EXAMINATION_STATE_PASSED) && officeApplicationInfo.getApprovalAmount() > 0) {
						officeApplicationInfo.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
						mark = mark && false;
					}
					else {
						officeApplicationInfo.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
					}
					materialService.updateOfficeApplicationInfo(officeApplicationInfo, USER.getAccount());
				}

				if (mark) {
					applyDB.setStateUuid(Constants.EXAMINATION_STATE_UNPASSED, false);
				}
			}
			else if (applyDB.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_REGULAR)) {
				regularApproval.setIfUsing(true);
				if (regularApproval.getUuid() != null) {
					if (flag) {
						applyService.updateRegularApproval(regularApprovalF, USER.getAccount());
					}
					else {
						applyService.updateRegularApproval(regularApproval, USER.getAccount());
					}
				}
				else {
					applyService.insertRegularApproval(regularApproval, USER.getAccount());
				}
			}
			applyService.updateApply(applyDB, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
