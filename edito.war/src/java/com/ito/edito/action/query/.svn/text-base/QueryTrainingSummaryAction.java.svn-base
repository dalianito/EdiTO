package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.Training.TrainingService;
import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.TrainingPlan;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryTrainingSummaryAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		TrainingService trainingService = (TrainingService) JndiFactory.lookup("trainingService");

		String title = request.getParameter("title");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct T.* from TrainingPlan T";
		sql += " left join ReceiverInfo R on T.uuid = R.bizDataUuid ";
		sql += " left join ApplyInfo A on T.uuid = A.bizDataUuid ";
		sql += " where T.ifUsing = true ";

		sql += " and A.applicantUuid = '" + EMPLOYEE.getUuid() + "'";
		sql += " and A.joinStateUuid = '" + Constants.JOIN_STATE_DONE + "' ";

		if (title != null && title.length() > 0) {
			sql += " and title like '%" + title + "%' ";
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and trainingTime >= '" + beginDate + " 00:00:00'";
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and trainingTime <= '" + endDate + " 23:59:59' ";
		}

		sql += " order by T.trainingTime desc ";
		sql += " limit " + String.valueOf(Integer.valueOf(offset) - 1) + ", " + recnum;

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct T.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		Constraint c = new Constraint("TrainingPlan");
		c.addSQLCondition(sql, null);

		List<TrainingPlan> list = trainingService.selectTrainingPlans(c);

		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			TrainingPlan trainingPlan = list.get(i);

			String[] str = new String[8];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = trainingPlan.getTitle();
			str[2] = trainingPlan.getDepartment().getDescription();
			str[3] = trainingPlan.getTrainingTime() != null ? Constants.DATE_FORMAT_YMD.format(trainingPlan.getTrainingTime()) : "";
			str[4] = trainingPlan.getStateUuid() == null ? "" : trainingPlan.getState().getDescription();
			str[5] = trainingPlan.getUuid();

			Constraint c1 = new Constraint("ApplyInfo");
			c1.addCondition("bizDataUuid", trainingPlan.getUuid());
			c1.addCondition("applicantUuid", EMPLOYEE.getUuid());
			ApplyInfo applyInfo = trainingService.selectApplyInfo(c1);
			str[6] = applyInfo.getCurriculum() != null ? "1" : "0";
			str[7] = trainingPlan.getLecturer().getPerson().getName();

			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
