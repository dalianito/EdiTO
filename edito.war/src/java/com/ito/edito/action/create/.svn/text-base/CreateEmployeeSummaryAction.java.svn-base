package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.fai.util.JndiFactory;

public class CreateEmployeeSummaryAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		ApplyInfo applyInfo = (ApplyInfo) carrier.fetchInstance("ApplyInfo");

		ut.begin();
		try {
			trainingService.updateApplyInfo(applyInfo, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
