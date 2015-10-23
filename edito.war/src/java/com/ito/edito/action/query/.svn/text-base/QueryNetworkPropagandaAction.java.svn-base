package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryNetworkPropagandaAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct I.* from InternetPublicity I where I.ifUsing = true ";

		Constraint c1 = new Constraint("InternetPublicity");
		c1.addCondition("ifUsing", true);
		c1.addCondition("recordUuid", EMPLOYEE.getUuid());
		sql += " and I.recordUuid = '" + EMPLOYEE.getUuid() + "' ";

		if (beginDate != null && !beginDate.equals("")) {
			sql += " and recordTime >= '" + beginDate + " 00:00:00' ";
			c1.addCondition("recordTime", Constants.DATE_FORMAT.parse(beginDate + " 00:00:00"), Constraint.RTE);
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and recordTime <= '" + endDate + " 23:59:59' ";
			c1.addCondition("recordTime", Constants.DATE_FORMAT.parse(endDate + " 23:59:59"), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from ("
				+ sql.replace("distinct I.*", " count(*) as count ") + ") as JdoVirtual";
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

		List<InternetPublicity> campussTemp = campusService.selectInternetPublicitys(c1);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < campussTemp.size(); i++) {
			InternetPublicity internetPublicity = campussTemp.get(i);
			String[] str = new String[6];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = internetPublicity.getRecord().getPerson().getName();
			str[2] = internetPublicity.getRecordTime() == null ? "" : Constants.DATE_FORMAT_YMD
					.format(internetPublicity.getRecordTime());
			str[3] = internetPublicity.getUuid();
			str[4] = Integer.toString(internetPublicity.getPosterInfosCount());
			str[5] = internetPublicity.getReviewFlagUuid() == null ? "" : internetPublicity.getReviewFlag().getDescription();
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
