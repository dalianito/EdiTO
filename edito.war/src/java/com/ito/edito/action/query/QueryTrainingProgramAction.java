package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
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

public class QueryTrainingProgramAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct T.* from TrainingPlan T";

		sql += " left join ReceiverInfo R on T.uuid = R.bizDataUuid ";
		sql += " left join ApplyInfo A on T.uuid = A.bizDataUuid ";
		sql += " where T.ifUsing = true ";

		sql += " and ((T.typeUuid = '" + Constants.TRAINING_PLAN_ALL + "') ";
		sql += " or (T.typeUuid = '" + Constants.TRAINING_PLAN_DEPARTMENT + "' and R.receiverUuid = '" + EMPLOYEE.getDepartmentUuid() + "') ";
		sql += " or (T.typeUuid = '" + Constants.TRAINING_PLAN_PERSON + "' and R.receiverUuid = '" + EMPLOYEE.getUuid() + "')) ";

		sql += " order by T.trainingTime desc ";
		sql += " limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;

		Constraint c = new Constraint("TrainingPlan");
		c.addSQLCondition(sql, null);

		List<TrainingPlan> list = trainingService.selectTrainingPlans(c);
		List<Object> tempList = new ArrayList<Object>();

		for (int i = 0; i < list.size(); i++) {
			TrainingPlan trainingPlan = list.get(i);

			List<Object> strList = new ArrayList<Object>();
			for (int j = 0; j < 9; j++) {
				strList.add("");
			}
			strList.set(0, trainingPlan.getTitle() == null ? "" : trainingPlan.getTitle());
			strList.set(1, trainingPlan.getTrainingTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(trainingPlan.getTrainingTime()));
			strList.set(2, trainingPlan.getLecturerUuid() == null ? "" : trainingPlan.getLecturer().getPerson().getName());
			strList.set(3, trainingPlan.getTypeUuid() == null ? "" : trainingPlan.getType().getDescription());
			String receivers = "";
			if (trainingPlan.getTypeUuid() != null) {
				if (trainingPlan.getTypeUuid().equals(Constants.TRAINING_PLAN_DEPARTMENT)) {
					Constraint receiverInfoC = new Constraint("ReceiverInfo");
					receiverInfoC.addCondition("bizDataUuid", trainingPlan.getUuid());
					List<ReceiverInfo> receiverInfoList = trainingService.selectReceiverInfos(receiverInfoC);
					for (int j = 0; j < receiverInfoList.size(); j++) {
						Department department = userService.selectDepartmentByUuid(receiverInfoList.get(j).getReceiverUuid());
						receivers += department.getDescription();
						if (j != receiverInfoList.size() - 1) {
							receivers += ",";
						}
					}
				}
				else if (trainingPlan.getTypeUuid().equals(Constants.TRAINING_PLAN_PERSON)) {
					Constraint receiverInfoC = new Constraint("ReceiverInfo");
					receiverInfoC.addCondition("bizDataUuid", trainingPlan.getUuid());
					List<ReceiverInfo> receiverInfoList = trainingService.selectReceiverInfos(receiverInfoC);
					for (int j = 0; j < receiverInfoList.size(); j++) {
						Employee employee = userService.selectEmployeeByUuid(receiverInfoList.get(j).getReceiverUuid());
						receivers += employee.getPerson().getName();
						if (j != receiverInfoList.size() - 1) {
							receivers += ",";
						}
					}
				}
			}
			strList.set(4, receivers);
			strList.set(5, trainingPlan.getUuid());
			
			Constraint c1 = new Constraint("ApplyInfo");
			c1.addCondition("bizDataUuid", trainingPlan.getUuid());
			c1.addCondition("applicantUuid", EMPLOYEE.getUuid());
			ApplyInfo applyInfo = trainingService.selectApplyInfo(c1);
			if(applyInfo!= null){
				strList.set(6, "已申请");
			}
			else{
				strList.set(6, "未申请");
			}
			
			strList.set(7, trainingPlan.getDepartmentUuid() == null ? "" : trainingPlan.getDepartment().getDescription());
			strList.set(8, trainingPlan.getStateUuid() == null ? "" : trainingPlan.getState().getDescription());

			tempList.add(strList);
		}

		setResponseText(tempList);
	}
}
