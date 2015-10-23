package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.schema.TrainingPlan;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeSummaryAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			TrainingPlan trainingPlan = trainingService.selectTrainingPlanByUuid(uuid);

			Constraint c = new Constraint("ApplyInfo");
			c.addCondition("bizDataUuid", trainingPlan.getUuid());
			ApplyInfo applyInfo = trainingService.selectApplyInfo(c);
			request.setAttribute("applyInfo", applyInfo);

		}
	}
}
