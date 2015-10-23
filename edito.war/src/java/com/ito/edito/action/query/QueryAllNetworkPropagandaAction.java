package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAllNetworkPropagandaAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String name = request.getParameter("name");
		String departmentUuid = request.getParameter("departmentUuid");
		String campusUuid = request.getParameter("campusUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String reviewStateUuid = request.getParameter("reviewStateUuid");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct I.* from InternetPublicity I, Employee E, Person P, Campus C";
		sql += " where I.recordUuid = E.Uuid and E.personUuid = P.Uuid and E.campusUuid = C.Uuid and I.ifUsing = true";

		if (name != null && name.length() > 0) {
			sql += " and P.name like '%" + name + "%' ";
		}
		if (departmentUuid != null && departmentUuid.length() > 0) {
			sql += " and E.departmentUuid = '" + departmentUuid + "' ";
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			if (campusUuid.equals("none")) {
				sql += " and E.campusUuid = '" + EMPLOYEE.getCampusUuid() + "' ";
			}
			else if (!campusUuid.equals("all")) {
				sql += " and E.campusUuid = '" + campusUuid + "' ";
			}
		}
		if (reviewStateUuid != null && reviewStateUuid.length() > 0) {
			sql += " and I.reviewFlagUuid = '" + reviewStateUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sql += " and recordTime >= '" + beginDate + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and recordTime <= '" + endDate + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += " order by C.sequence asc, I.recordTime asc ";
		sql += " limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;
		Constraint c1 = new Constraint("InternetPublicity");
		c1.addSQLCondition(sql, null);
		List<InternetPublicity> campussTempN = campusService.selectInternetPublicitys(c1);

		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < campussTempN.size(); i++) {
			InternetPublicity internetPublicity = campussTempN.get(i);
			String[] str = new String[13];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = internetPublicity.getRecord().getPerson().getName();
			str[2] = internetPublicity.getRecordTime() == null ? "" : Constants.DATE_FORMAT.format(internetPublicity.getRecordTime());
			str[3] = internetPublicity.getRecord().getDepartmentUuid() != null ? internetPublicity.getRecord().getDepartment().getDescription() : "";
			str[4] = internetPublicity.getRecord().getCampusUuid() != null ? internetPublicity.getRecord().getCampus().getDescription() : "";
			str[5] = Integer.toString(internetPublicity.getPosterInfosCount());
			str[6] = internetPublicity.getUuid();
			str[7] = internetPublicity.getReviewFlagUuid() != null ? internetPublicity.getReviewFlag().getDescription() : "";
			str[8] = internetPublicity.getReviewComment() != null ? internetPublicity.getReviewComment() : "";
			str[9] = internetPublicity.getTimeStamp() != null ? internetPublicity.getTimeStamp().toString() : "";
			str[10] = internetPublicity.getRecordUuid() != null ? internetPublicity.getRecordUuid() : "";
			str[11] = internetPublicity.getNotes() != null ? internetPublicity.getNotes() : "";
			str[12] = internetPublicity.getReviewEmployeeUuid() != null ? internetPublicity.getReviewEmployee().getPerson().getName() : "";
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
