package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.ContractMould;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryContractMouldAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		String uuid = request.getParameter("uuid");
		String creator = request.getParameter("creator");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct C.* from ContractMould C, Employee E, Person P where C.creatorUuid = E.uuid and E.personUuid = P.uuid and C.ifUsing = true ";
		if (uuid != null && uuid.length() > 0) {
			sql += " and C.uuid = '" + uuid + "' ";
		}
		if (creator != null && creator.length() > 0) {
			sql += " and P.name like '%" + creator + "%' ";
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and createTime >= '" + beginDate + " 00:00:00'";
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and createTime <= '" + endDate + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct C.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += "order by createTime desc ";
		sql += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint c = new Constraint("ContractMould");
		c.addSQLCondition(sql, null);
		List<ContractMould> list = contractService.selectContractMoulds(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			ContractMould contractMould = list.get(i);

			String[] str = new String[5];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = contractMould.getDescription() != null ? contractMould.getDescription() : "";
			str[2] = contractMould.getCreatorUuid() != null ? contractMould.getCreator().getPerson().getName() : "";
			str[3] = contractMould.getCreateTime() != null ? Constants.DATE_FORMAT_YMDHM.format(contractMould.getCreateTime()) : "";
			str[4] = contractMould.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
