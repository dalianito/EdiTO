package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWorkRecordAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct W.* from WorkRecord W where W.ifUsing = true ";

		Constraint c1 = new Constraint("WorkRecord");
		c1.addCondition("ifUsing", true);
		c1.addCondition("recordUuid", EMPLOYEE.getUuid());
		sql += " and W.recordUuid = '" + EMPLOYEE.getUuid() + "' ";

		if (beginDate != null && !beginDate.equals("")) {
			sql += " and recordTime >= '" + beginDate + " 00:00:00' ";
			c1.addCondition("recordTime", Constants.DATE_FORMAT.parse(beginDate + " 00:00:00"), Constraint.RTE);
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and recordTime <= '" + endDate + " 23:59:59' ";
			c1.addCondition("recordTime", Constants.DATE_FORMAT.parse(endDate + " 23:59:59"), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from ("
				+ sql.replace("distinct W.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c1.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c1.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);
		c1.addOrderCondition("recordTime", "desc");

		List<WorkRecord> campussTemp = campusService.selectWorkRecords(c1);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < campussTemp.size(); i++) {
			WorkRecord workRecord = campussTemp.get(i);
			String[] str = new String[5];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = workRecord.getRecord().getPerson().getName();
			str[2] = workRecord.getRecordTime() == null ? "" : Constants.DATE_FORMAT_YMD.format(workRecord
					.getRecordTime());
			str[3] = workRecord.getUuid();
			str[4] = workRecord.getReviewFlagUuid() == null ? "" : workRecord.getReviewFlag().getDescription();
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
