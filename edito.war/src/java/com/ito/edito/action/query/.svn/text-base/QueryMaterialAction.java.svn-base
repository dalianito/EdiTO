package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Material;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String materialNo = request.getParameter("materialNo");
		String specification = request.getParameter("specification");
		String typeUuid = request.getParameter("typeUuid");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select * from Material M where M.ifUsing = true ";
		Constraint c = new Constraint("Material");
		c.addCondition("ifUsing", true);
		if (materialNo != null && materialNo.length() > 0) {
			sql += " and materialNo like '%" + materialNo + "%' ";
			c.addCondition("materialNo", "%" + materialNo + "%", Constraint.LIKE);
		}
		if (specification != null && specification.length() > 0) {
			sql += " and specification like '%" + specification + "%' ";
			c.addCondition("specification", "%" + specification + "%", Constraint.LIKE);
		}
		if (typeUuid != null && typeUuid.length() > 0) {
			sql += " and typeUuid = '" + typeUuid + "' ";
			c.addCondition("typeUuid", typeUuid);
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

		List<Material> list = materialService.selectMaterials(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Material material = list.get(i);

			String[] str = new String[10];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = material.getMaterialNo() != null ? material.getMaterialNo() : "";
			str[2] = material.getSpecification() != null ? material.getSpecification() : "";
			str[3] = material.getUnit() != null ? material.getUnit() : "";
			str[4] = material.getTypeUuid() != null ? material.getType().getDescription() : "";
			str[5] = material.getMinValue() != null ? material.getMinValue().toString() : "";
			str[6] = material.getRecorderUuid() != null ? material.getRecorder().getPerson().getName() : "";
			str[7] = material.getRecordTime() != null ? Constants.DATE_FORMAT_YMDHM.format(material.getRecordTime()) : "";
			str[8] = material.getNotes() != null ? material.getNotes() : "";
			str[9] = material.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
