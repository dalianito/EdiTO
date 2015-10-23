package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateTrainingProgramAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		String uuid = request.getParameter("uuid");

		ApplyInfo applyInfo = new ApplyInfo();
		applyInfo.setBizDataUuid(uuid, false);
		applyInfo.setApplicantUuid(EMPLOYEE.getUuid(), false);
		applyInfo.setStateUuid(Constants.EXAMINATION_STATE_DOING, false);

		ut.begin();
		try {
			trainingService.insertApplyInfo(applyInfo, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
