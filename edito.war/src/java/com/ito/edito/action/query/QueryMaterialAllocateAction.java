package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.MaterialAllocate;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialAllocateAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct M.* from MaterialAllocate M where M.ifUsing = true ";
		Constraint c = new Constraint("MaterialAllocate");
		c.addCondition("ifUsing", true);
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

		List<MaterialAllocate> list = materialService.selectMaterialAllocates(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			MaterialAllocate materialAllocate = list.get(i);

			String[] str = new String[7];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = materialAllocate.getMaterial().getType().getDescription();
			str[2] = Integer.toString(materialAllocate.getAmount());
			str[3] = materialAllocate.getDemandCampus().getDescription();
			str[4] = materialAllocate.getDeployedCampus().getDescription();
			str[5] = materialAllocate.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(materialAllocate.getRecordTime()) : "";
			str[6] = materialAllocate.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
