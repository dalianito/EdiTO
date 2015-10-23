package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Mistake.MistakeService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Mistake;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMistakeAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MistakeService mistakeService = (MistakeService) JndiFactory.lookup("mistakeService");

		String title = request.getParameter("title");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct M.* from Mistake M where M.ifUsing = true ";
		Constraint c = new Constraint("Mistake");
		c.addCondition("ifUsing", true);
		if (title != null && title.length() > 0) {
			sql += " and title like '%" + title + "%' ";
			c.addCondition("title", "%" + title + "%");
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and recordTime >= '" + beginDate + " 00:00:00'";
			c.addCondition("recordTime", Constants.DATE_FORMAT.parse(beginDate + " 00:00:00' "), Constraint.RTE);
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and recordTime <= '" + endDate + " 23:59:59' ";
			c.addCondition("recordTime", Constants.DATE_FORMAT.parse(endDate + " 23:59:59'"), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct M.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c.addOrderCondition("recordTime", "asc");
		c.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);

		List<Mistake> list = mistakeService.selectMistakes(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Mistake mistake = list.get(i);

			String[] str = new String[5];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = mistake.getTitle();
			str[2] = mistake.getRecorder().getPerson().getName();
			str[3] = mistake.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(mistake.getRecordTime()) : "";
			str[4] = mistake.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
