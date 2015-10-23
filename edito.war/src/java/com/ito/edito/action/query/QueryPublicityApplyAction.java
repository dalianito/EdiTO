package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryPublicityApplyAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		String name = request.getParameter("name");
		String departmentUuid = request.getParameter("departmentUuid");
		String applicationStateUuid = request.getParameter("applicationStateUuid");
		String flag = request.getParameter("flag");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct PA.* from PublicityApplication PA, Apply A, Employee E, Person P ";
		sql += "where PA.applyUuid = A.uuid and A.applicantUuid = E.uuid and E.personUuid = P.uuid and PA.ifUsing = true ";

		if (name != null && name.length() > 0) {
			sql += " and P.name like '%" + name + "%' ";
		}
		if (departmentUuid != null && departmentUuid.length() > 0) {
			sql += "and PA.departmentUuid = '" + departmentUuid + "' ";
		}
		if (applicationStateUuid != null && applicationStateUuid.length() > 0) {
			sql += "and A.StateUuid = '" + applicationStateUuid + "' ";
		}
		if (flag.equals("1")) {
			sql += "and A.stateUuid = '" + Constants.EXAMINATION_STATE_PASSED + "' ";
		}
		if (beginDate != null && beginDate.length() > 0) {
			sql += " and A.applicationTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && endDate.length() > 0) {
			sql += " and A.applicationTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;
		Constraint c1 = new Constraint("PublicityApplication");

		c1.addSQLCondition(sql, null);
		List<PublicityApplication> publicityApplicationsTemp = applyService.selectPublicityApplications(c1);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < publicityApplicationsTemp.size(); i++) {
			PublicityApplication publicityApplication = publicityApplicationsTemp.get(i);
			Apply apply = publicityApplication.getApply();

			String[] str = new String[13];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = apply.getApplicantUuid() != null ? apply.getApplicant().getPerson().getName() : "";
			str[2] = apply.getApplicationTime() != null ? Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime()) : "";
			str[3] = apply.getStateUuid() != null ? apply.getState().getDescription() : "";
			str[4] = publicityApplication.getDepartmentUuid() != null ? publicityApplication.getDepartment().getDescription() : "";
			str[5] = publicityApplication.getCampusUuid() != null ? publicityApplication.getCampus().getDescription() : "";
			str[6] = publicityApplication.getDescription() != null ? publicityApplication.getDescription() : "";
			str[7] = publicityApplication.getActivityTime() != null ? Constants.DATE_FORMAT_YMDHM.format(publicityApplication.getActivityTime()) : "";
			str[8] = apply.getStateUuid();
			str[9] = apply.getCheckStateOneUuid();
			str[10] = publicityApplication.getUuid();
			str[11] = publicityApplication.getApplyUuid();
			str[12] = publicityApplication.getEvaluate() != null ? publicityApplication.getEvaluate() : "";
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
