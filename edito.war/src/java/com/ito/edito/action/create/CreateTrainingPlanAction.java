package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ReceiverInfo;
import com.ito.edito.schema.TrainingPlan;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateTrainingPlanAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		TrainingPlan trainingPlan = (TrainingPlan) carrier.fetchInstance("TrainingPlan");
		List<ReceiverInfo> receiverInfoList = (List<ReceiverInfo>) carrier.fetchInstances("ReceiverInfo");

		trainingPlan.setReceiverInfos(receiverInfoList);
		// 暂且默认通过
		trainingPlan.setStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
		trainingPlan.setPublisherUuid(EMPLOYEE.getUuid(), false);
		trainingPlan.setIfUsing(true);

		ut.begin();
		try {
			String trainingPlanUuid = trainingPlan.getUuid();
			if (trainingPlanUuid == null) {
				trainingPlanUuid = trainingService.insertTrainingPlan(trainingPlan, USER.getAccount());
			}
			else {
				trainingService.updateTrainingPlan(trainingPlan, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
