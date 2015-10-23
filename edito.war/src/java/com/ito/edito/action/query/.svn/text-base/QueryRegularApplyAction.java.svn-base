package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.RegularApplication;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryRegularApplyAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct R.* from RegularApplication R, Apply A, Person P, Employee E where A.ifUsing = true and R.applyUuid = A.Uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and E.uuid = '" + EMPLOYEE.getUuid() + "' and A.typeUuid = '" + Constants.APPLY_TYPE_UUID_REGULAR + "'";

		Constraint c1 = new Constraint("RegularApplication");

		if (beginDate != null && !beginDate.equals("")) {
			sql += " and A.applicationTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and A.applicationTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct R.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}
		sql += " order by A.applicationTime desc limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;
		c1.addSQLCondition(sql, null);

		List<RegularApplication> regularApplicationList = applyService.selectRegularApplications(c1);
		List<String[]> tempList = new ArrayList<String[]>();

		for (int i = 0; i < regularApplicationList.size(); i++) {
			RegularApplication regularApplication = regularApplicationList.get(i);

			String[] str = new String[7];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = regularApplication.getApply().getApplicationTime() != null ? Constants.DATE_FORMAT_YMD.format(regularApplication.getApply().getApplicationTime()) : "";
			str[2] = regularApplication.getDepartmentUuid() == null ? "" : regularApplication.getDepartment().getDescription();
			str[3] = regularApplication.getCampusUuid() != null ? regularApplication.getCampus().getDescription() : "";
			str[4] = regularApplication.getJobUuid() != null ? regularApplication.getJob().getDescription() : "";
			str[5] = regularApplication.getApproval().getApprovalStateUuid() != null ? regularApplication.getApproval().getApprovalState().getDescription() : "";
			str[6] = regularApplication.getApplyUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
