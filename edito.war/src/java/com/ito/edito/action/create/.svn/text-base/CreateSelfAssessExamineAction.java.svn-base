package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.SelfAssess;
import com.ito.edito.schema.SelfAssessExamine;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateSelfAssessExamineAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		SelfAssessExamine selfAssessExamine = (SelfAssessExamine) carrier.fetchInstance("SelfAssessExamine");
		SelfAssess selfAssess = (SelfAssess) carrier.fetchInstance("SelfAssess");

		SelfAssess selfAssessT = null;
		SelfAssessExamine selfAssessExamineT = null;
		String selfAssessExamineAssessResUuid = null;
		int totalScore = selfAssessExamine.getAttendanceMark() + selfAssessExamine.getBehaviorMark() + selfAssessExamine.getResponsibilityMark() + selfAssessExamine.getDiligenceMark() + selfAssessExamine.getSkillMark() + selfAssessExamine.getCoordinationMark() + selfAssessExamine.getPlanMark() + selfAssessExamine.getExecuteMark() + selfAssessExamine.getQualityMark() + selfAssessExamine.getEfficiencyMark();
		if(selfAssess.getUuid() != null) {
			selfAssessT = campusService.selectSelfAssessByUuid(selfAssess.getUuid());
		}
		if(selfAssessExamine.getUuid() != null) {
			selfAssessExamineT = campusService.selectSelfAssessExamineByUuid(selfAssessExamine.getUuid());
			selfAssessExamineAssessResUuid = selfAssessExamine.getAssessResUuid();
		}

		ut.begin();
		try {
			selfAssessT.setAssessStateUuid(Constants.ASSESS_STATE_YES, false);

			selfAssessExamineT.setAttendanceMark(selfAssessExamine.getAttendanceMark());
			selfAssessExamineT.setLeaveCount(selfAssessExamine.getLeaveCount());
			selfAssessExamineT.setLateCount(selfAssessExamine.getLateCount());
			selfAssessExamineT.setAbsenceCount(selfAssessExamine.getAbsenceCount());
			selfAssessExamineT.setBehaviorMark(selfAssessExamine.getBehaviorMark());
			selfAssessExamineT.setResponsibilityMark(selfAssessExamine.getResponsibilityMark());
			selfAssessExamineT.setDiligenceMark(selfAssessExamine.getDiligenceMark());
			selfAssessExamineT.setSkillMark(selfAssessExamine.getSkillMark());
			selfAssessExamineT.setCoordinationMark(selfAssessExamine.getCoordinationMark());
			selfAssessExamineT.setPlanMark(selfAssessExamine.getPlanMark());
			selfAssessExamineT.setExecuteMark(selfAssessExamine.getExecuteMark());
			selfAssessExamineT.setEfficiencyMark(selfAssessExamine.getEfficiencyMark());
			selfAssessExamineT.setQualityMark(selfAssessExamine.getQualityMark());
			selfAssessExamineT.setTotalScore(totalScore);
			selfAssessExamineT.setComprehensiveEvaluation(selfAssessExamine.getComprehensiveEvaluation());
			selfAssessExamineT.setAssessResUuid(selfAssessExamineAssessResUuid, false);
			selfAssessExamineT.setAssessmentPersonUuid(EMPLOYEE.getUuid(), false);
			selfAssessExamineT.setAssessmentTime(new Date());
			selfAssessExamineT.setIfUsing(true);

			campusService.updateSelfAssess(selfAssessT, USER.getAccount());
			campusService.updateSelfAssessExamine(selfAssessExamineT, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
