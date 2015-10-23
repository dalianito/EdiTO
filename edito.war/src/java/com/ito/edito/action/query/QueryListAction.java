package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.MaterialInfo;
import com.ito.edito.schema.Supplier;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryListAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String name = request.getParameter("name");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select * from Supplier S where S.ifUsing = true ";
		Constraint c = new Constraint("Supplier");
		c.addCondition("ifUsing", true);
		if (name != null && name.length() > 0) {
			sql += " and description like '%" + name + "%' ";
			c.addCondition("description", "%" + name + "%", Constraint.LIKE);
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and recordTime >= '" + beginDate + " 00:00:00'";
			c.addCondition("recordTime", Constants.DATE_FORMAT.parse(beginDate + " 00:00:00' "), Constraint.RTE);
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and recordTime <= '" + endDate + " 23:59:59' ";
			c.addCondition("recordTime", Constants.DATE_FORMAT.parse(endDate + " 23:59:59'"), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c.addOrderCondition("recordTime", "desc");
		c.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);

		List<Supplier> list = materialService.selectSuppliers(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Supplier supplier = list.get(i);

			String[] str = new String[8];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = supplier.getDescription();
			str[2] = "";
			List<MaterialInfo> materialList = supplier.getMaterialsAsReference();
			for (int j = 0; j < materialList.size(); j++) {
				MaterialInfo materialInfo = materialList.get(j);
				str[2] += "&nbsp;" + materialInfo.getMaterial().getType().getDescription() + "(" + materialInfo.getMaterial().getMaterialNo() + ")";
				if (j != materialList.size() - 1) {
					str[2] += "<br>";
				}
			}
			str[3] = supplier.getContact() != null ? supplier.getContact() : "";
			str[4] = supplier.getTelephone() != null ? supplier.getTelephone() : "";
			str[5] = supplier.getRecorder() != null ? supplier.getRecorder().getPerson().getName() : "";
			str[6] = supplier.getRecordTime() != null ? Constants.DATE_FORMAT_YMDHM.format(supplier.getRecordTime()) : "";
			str[7] = supplier.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
