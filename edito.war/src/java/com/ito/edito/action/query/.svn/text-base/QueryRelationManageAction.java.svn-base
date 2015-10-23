package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryRelationManageAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct A.* from Apply A where A.ifUsing = true and A.typeUuid = '" + Constants.APPLY_TYPE_UUID_RELATIONSHIP + "' and A.stateUuid = '" + Constants.EXAMINATION_STATE_PASSED + "'";

		Constraint c1 = new Constraint("Apply");
		c1.addCondition("typeUuid", Constants.APPLY_TYPE_UUID_RELATIONSHIP);
		c1.addCondition("stateUuid", Constants.EXAMINATION_STATE_PASSED);
		c1.addCondition("ifUsing", true);

		if (beginDate != null && !beginDate.equals("")) {
			sql += " and applicationTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
			c1.addCondition("applicationTime", Constants.DATE_FORMAT_YMD.parse(beginDate), Constraint.RTE);
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and applicationTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
			c1.addCondition("applicationTime", Constants.DATE_FORMAT_YMD.parse(endDate), Constraint.LTE);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct A.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c1.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c1.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);
		c1.addOrderCondition("applicationTime", "desc");

		List<Apply> applysTemp = applyService.selectApplys(c1);
		List<String[]> tempList = new ArrayList<String[]>();

		for (int i = 0; i < applysTemp.size(); i++) {
			Apply apply = applysTemp.get(i);
			Constraint c2 = new Constraint("Relationship");
			c2.addCondition("applyUuid", apply.getUuid());
			Relationship relationship = applyService.selectRelationship(c2);

			String[] str = new String[8];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = relationship.getTeacher().getPerson().getName();
			str[2] = apply.getApplicationTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime());
			str[3] = relationship.getOriginalUuid() == null ? "" : relationship.getOriginal().getDescription();
			str[4] = relationship.getTransferUuid() == null ? "" : relationship.getTransfer().getDescription();
			str[5] = apply.getUuid();
			str[6] = relationship.getUuid();
			str[7] = relationship.getIfDeal() ? "1" : "0";
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
