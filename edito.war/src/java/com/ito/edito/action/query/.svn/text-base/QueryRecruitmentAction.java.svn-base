package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryRecruitmentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String applicationType = request.getParameter("applicationType");
		String name = request.getParameter("name");
		String departmentUuid = request.getParameter("departmentUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct A.* from Apply A, Employee E, Person P, Department D, Recruitment R";
		sql += " where A.applicantUuid = E.uuid and E.personUuid = P.Uuid and R.applyUuid = A.Uuid and R.departmentUuid = D.Uuid and A.ifUsing = true and E.ifUsing = true ";
		sql += " and A.applicantUuid = '" + EMPLOYEE.getUuid() + "' ";

		if (applicationType != null && !applicationType.equals("")) {
			sql += " and A.typeUuid like '%" + applicationType + "%' ";
		}
		if (name != null && name.length() > 0) {
			sql += " and P.name like '%" + name + "%' ";
		}
		if (departmentUuid != null && departmentUuid.length() > 0) {
			sql += " and R.departmentUuid = '" + departmentUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sql += " and A.applicationTime >= '" + beginDate + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and A.applicationTime <= '" + endDate + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += " limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;
		Constraint c1 = new Constraint("Apply");
		c1.addSQLCondition(sql, null);
		List<Apply> applysTemp = applyService.selectApplys(c1);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < applysTemp.size(); i++) {
			Apply apply = applysTemp.get(i);
			String[] str = new String[8];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = apply.getApplicant().getPerson().getName();
			str[2] = apply.getApplicationTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime());
			str[3] = "";
			if (apply.getCheckTimeFour() != null) {
				str[3] = Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeFour());
			}
			else if (apply.getCheckTimeThree() != null) {
				str[3] = Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeThree());
			}
			else if (apply.getCheckTimeTwo() != null) {
				str[3] = Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeTwo());
			}
			else if (apply.getCheckTimeOne() != null) {
				str[3] = Constants.DATE_FORMAT_YMDHM.format(apply.getCheckTimeOne());
			}
			str[4] = apply.getState() == null ? "" : apply.getState().getDescription();
			str[5] = apply.getUuid();
			str[6] = apply.getStateUuid() == null ? "" : apply.getStateUuid();
			str[7] = apply.getCheckerOneUuid() == null ? "" : apply.getCheckerOneUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
