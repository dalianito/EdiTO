package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.MaterialStorage;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialStorageAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String campusUuid = request.getParameter("campusUuid");
		String material = request.getParameter("material");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct M.* from MaterialStorage M where 1 = 1 ";
		Constraint c = new Constraint("MaterialStorage");
		if (campusUuid != null && campusUuid.length() > 0) {
			sql += "and M.campusUuid = '" + campusUuid + "' ";
			c.addCondition("campusUuid", campusUuid);
		}
		if (material != null && material.length() > 0) {
			sql += "and M.materialUuid = '" + material + "' ";
			c.addCondition("materialUuid", material);
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

		List<MaterialStorage> list = materialService.selectMaterialStorages(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			MaterialStorage MaterialStorage = list.get(i);

			String[] str = new String[6];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = MaterialStorage.getMaterial().getType().getDescription();
			str[2] = Integer.toString(MaterialStorage.getTotal());
			str[3] = Integer.toString(MaterialStorage.getAmount());
			str[4] = MaterialStorage.getCampus().getDescription();
			str[5] = MaterialStorage.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
