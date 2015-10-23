package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.MaterialExport;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialUsageAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String state = request.getParameter("state");
		String campusUuid = request.getParameter("campusUuid");
		String flag = request.getParameter("flag");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct M.* from MaterialExport M where M.ifUsing = true ";
		Constraint c = new Constraint("MaterialExport");
		c.addCondition("ifUsing", true);
		if (flag.equals("1")) {
			sql += "and M.keeperUuid = '" + EMPLOYEE.getUuid() + "' ";
			c.addCondition("keeperUuid", EMPLOYEE.getUuid());
		}
		if (state != null && state.length() > 0) {
			sql += "and M.stateUuid = '" + state + "' ";
			c.addCondition("stateUuid", state);
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			sql += "and M.campusUuid = '" + campusUuid + "' ";
			c.addCondition("campusUuid", campusUuid);
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and exportDate >= '" + beginDate + " 00:00:00'";
			c.addCondition("exportDate", Constants.DATE_FORMAT.parse(beginDate + " 00:00:00' "), Constraint.RTE);
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and exportDate <= '" + endDate + " 23:59:59' ";
			c.addCondition("exportDate", Constants.DATE_FORMAT.parse(endDate + " 23:59:59'"), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct M.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);

		List<MaterialExport> list = materialService.selectMaterialExports(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			MaterialExport materialExport = list.get(i);

			String[] str = new String[8];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = materialExport.getMaterial().getType().getDescription();
			str[2] = Integer.toString(materialExport.getAmount());
			str[3] = materialExport.getDepartment().getDescription();
			str[4] = materialExport.getExportDate() != null ? Constants.DATE_FORMAT_YMD.format(materialExport.getExportDate()) : "";
			str[5] = materialExport.getState().getDescription();
			str[6] = materialExport.getReturnDate() != null ? Constants.DATE_FORMAT_YMD.format(materialExport.getReturnDate()) : "";
			str[7] = materialExport.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
