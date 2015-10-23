package com.ito.edito.action.get;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.schema.Department;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.ReceiverInfo;
import com.ito.edito.schema.TrainingPlan;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetTrainingPlanAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			TrainingPlan trainingPlan = trainingService.selectTrainingPlanByUuid(uuid);
			request.setAttribute("trainingPlan", trainingPlan);

			Constraint c = new Constraint("ApplyInfo");
			c.addCondition("bizDataUuid", trainingPlan.getUuid());
			c.addCondition("applicantUuid", EMPLOYEE.getUuid());
			ApplyInfo applyInfo = trainingService.selectApplyInfo(c);
			request.setAttribute("applyInfo", applyInfo);

			if (trainingPlan.getReceiverInfosAsReference().size() > 0) {
				if (trainingPlan.getTypeUuid().equals(Constants.TRAINING_PLAN_DEPARTMENT)) {
					List<Department> departments = new ArrayList<Department>();
					for (int i = 0; i < trainingPlan.getReceiverInfosAsReference().size(); i++) {
						ReceiverInfo receiverInfo = trainingPlan.getReceiverInfosAsReference().get(i);
						Department department = userService.selectDepartmentByUuid(receiverInfo.getReceiverUuid());
						departments.add(department);

						request.setAttribute("departments", departments);
					}
				}
				else if (trainingPlan.getTypeUuid().equals(Constants.TRAINING_PLAN_PERSON)) {
					List<Employee> employees = new ArrayList<Employee>();
					for (int i = 0; i < trainingPlan.getReceiverInfosAsReference().size(); i++) {
						ReceiverInfo receiverInfo = trainingPlan.getReceiverInfosAsReference().get(i);
						Employee employee = userService.selectEmployeeByUuid(receiverInfo.getReceiverUuid());
						employees.add(employee);

						request.setAttribute("employees", employees);
					}
				}
			}
		}
	}
}
