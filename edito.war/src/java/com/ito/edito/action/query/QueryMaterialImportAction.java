package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.MaterialImport;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialImportAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String departmentUuid = request.getParameter("departmentUuid");
		String campusUuid = request.getParameter("campusUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct M.* from MaterialImport M where 1 = 1 ";
		Constraint c = new Constraint("MaterialImport");
		if (departmentUuid != null && departmentUuid.length() > 0) {
			sql += "and M.departmentUuid = '" + departmentUuid + "' ";
			c.addCondition("departmentUuid", departmentUuid);
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			sql += "and M.campusUuid = '" + campusUuid + "' ";
			c.addCondition("campusUuid", campusUuid);
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and importDate >= '" + beginDate + " 00:00:00'";
			c.addCondition("importDate", Constants.DATE_FORMAT.parse(beginDate + " 00:00:00' "), Constraint.RTE);
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and importDate <= '" + endDate + " 23:59:59' ";
			c.addCondition("importDate", Constants.DATE_FORMAT.parse(endDate + " 23:59:59'"), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct M.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c.addOrderCondition("importDate", "asc");
		c.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);

		List<MaterialImport> list = materialService.selectMaterialImports(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			MaterialImport materialImport = list.get(i);

			String[] str = new String[9];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = materialImport.getMaterial().getType().getDescription();
			str[2] = Integer.toString(materialImport.getAmount());
			str[3] = materialImport.getSupplier().getDescription();
			str[4] = materialImport.getDepartment().getDescription();
			str[5] = materialImport.getCampus().getDescription();
			str[6] = materialImport.getRecorder().getPerson().getName();
			str[7] = materialImport.getImportDate() != null ? Constants.DATE_FORMAT_YMD.format(materialImport.getImportDate()) : "";
			str[8] = materialImport.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
