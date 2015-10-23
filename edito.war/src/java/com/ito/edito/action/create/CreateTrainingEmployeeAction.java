package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.fai.util.JndiFactory;

public class CreateTrainingEmployeeAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		List<ApplyInfo> applyInfoList = (List<ApplyInfo>) carrier.fetchInstances("ApplyInfo");

		ut.begin();
		for (int i = 0; i < applyInfoList.size(); i++) {
			ApplyInfo applyInfo = applyInfoList.get(i);
			trainingService.updateApplyInfo(applyInfo, USER.getAccount());

		}
		ut.commit();

	}
}
