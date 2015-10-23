package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Assessment.AssessmentService;
import com.ito.edito.schema.Assessment;
import com.ito.fai.util.JndiFactory;

public class CreateEmployeeAssessAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		AssessmentService assessmentService = (AssessmentService) JndiFactory.lookup("assessmentService");

		Assessment assessment = (Assessment) carrier.fetchInstance("Assessment");

		ut.begin();
		try {
			String assessmentUuid = assessment.getUuid();
			if (assessmentUuid == null) {
				assessmentUuid = assessmentService.insertAssessment(assessment, USER.getAccount());
			}
			else {
				assessmentService.updateAssessment(assessment, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}

	}
}
