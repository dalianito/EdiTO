package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Contract;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryContractAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		String contractNo = request.getParameter("contractNo");
		String mouldUuid = request.getParameter("mouldUuid");
		String beginSignDate = request.getParameter("beginSignDate");
		String endSignDate = request.getParameter("endSignDate");
		String recorder = request.getParameter("recorder");
		String signer = request.getParameter("signer");
		String beginExpireDate = request.getParameter("beginExpireDate");
		String endExpireDate = request.getParameter("endExpireDate");
		String expireDay = request.getParameter("expireDay");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct C.* from Contract C, Employee E, Person P where C.recorderUuid = E.uuid and E.personUuid = P.uuid and C.ifUsing = true ";
		if (contractNo != null && contractNo.length() > 0) {
			sql += " and C.contractNo like '%" + contractNo + "%' ";
		}
		if (mouldUuid != null && mouldUuid.length() > 0) {
			sql += " and C.mouldUuid = '" + mouldUuid + "' ";
		}
		if (beginSignDate != null && beginSignDate.length() > 0) {
			sql += " and C.signTime >= '" + beginSignDate + " 00:00:00'";
		}
		if (endSignDate != null && endSignDate.length() > 0) {
			sql += " and C.signTime <= '" + endSignDate + " 23:59:59' ";
		}
		if (recorder != null && recorder.length() > 0) {
			sql += " and P.name like '%" + recorder + "%' ";
		}
		if (signer != null && signer.length() > 0) {
			sql += " and C.signer like '%" + signer + "%' ";
		}
		if (beginExpireDate != null && beginExpireDate.length() > 0) {
			sql += " and C.expireTime >= '" + beginExpireDate + " 00:00:00'";
		}
		if (endExpireDate != null && endExpireDate.length() > 0) {
			sql += " and C.expireTime <= '" + endExpireDate + " 23:59:59' ";
		}
		if (expireDay != null && expireDay.length() > 0) {
			Date nowTime = new Date();
			String todayStr = Constants.DATE_FORMAT_YMD_0.format(nowTime);
			if (expireDay.equals("0")) {
				sql += " and C.expireTime < '" + todayStr + "' ";
			}
			else if (!expireDay.equals("-1")) {
				Date expireTime = new Date(nowTime.getTime() + Long.valueOf(expireDay) * 86400000);
				String expireDayStr = Constants.DATE_FORMAT_YMD_0.format(expireTime);

				sql += " and C.expireTime >= '" + todayStr + "' ";
				sql += " and C.expireTime < '" + expireDayStr + "' ";
			}
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct C.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		if (expireDay != null && expireDay.length() > 0) {
			sql += "order by expireTime asc ";
		}
		else {
			sql += "order by signTime desc ";
		}
		sql += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint c = new Constraint("Contract");
		c.addSQLCondition(sql, null);
		List<Contract> list = contractService.selectContracts(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Contract contract = list.get(i);

			String[] str = new String[8];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = contract.getMouldUuid() != null ? contract.getMould().getDescription() : "";
			str[2] = contract.getContractNo() != null ? contract.getContractNo() : "";
			str[3] = contract.getRecorderUuid() != null ? contract.getRecorder().getPerson().getName() : "";
			str[4] = contract.getSigner() != null ? contract.getSigner() : "";
			str[5] = contract.getSignTime() != null ? Constants.DATE_FORMAT_YMD.format(contract.getSignTime()) : "";
			str[6] = contract.getExpireTime() != null ? Constants.DATE_FORMAT_YMD.format(contract.getExpireTime()) : "";
			str[7] = contract.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
