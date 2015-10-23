package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.schema.TrainingPlan;
import com.ito.fai.util.JndiFactory;

public class CreateTrainingSummaryAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		TrainingPlan trainingPlan = (TrainingPlan) carrier.fetchInstance("TrainingPlan");
		List<ApplyInfo> applyInfoList = (List<ApplyInfo>) carrier.fetchInstances("ApplyInfo");
		trainingPlan.setApplyInfos(applyInfoList);

		ut.begin();
		try {
			trainingService.updateTrainingPlan(trainingPlan, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}

	}
}
