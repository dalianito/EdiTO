package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAllWorkRecordAction extends AjaxAction {
	public void executeAutoUT() throws Exception {

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

		String sql = "select distinct W.* from WorkRecord W, Employee E, Person P, Campus C";
		sql += " where W.recordUuid = E.Uuid and E.personUuid = P.Uuid and E.campusUuid = C.uuid and W.ifUsing = true";

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
			sql += " and W.reviewFlagUuid = '" + reviewStateUuid + "' ";
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

		sql += " order by C.sequence asc, W.recordTime asc ";
		sql += " limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;

		Constraint c1 = new Constraint("WorkRecord");
		c1.addSQLCondition(sql, null);
		List<WorkRecord> campussTempA = (List<WorkRecord>) campusService.selectWorkRecords(c1);

		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < campussTempA.size(); i++) {
			WorkRecord workRecord = campussTempA.get(i);
			String[] str = new String[16];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = workRecord.getRecord().getPerson().getName();
			str[2] = workRecord.getRecordTime() == null ? "" : Constants.DATE_FORMAT.format(workRecord.getRecordTime());
			str[3] = workRecord.getRecord().getDepartmentUuid() != null ? workRecord.getRecord().getDepartment().getDescription() : "";
			str[4] = workRecord.getRecord().getCampusUuid() != null ? workRecord.getRecord().getCampus().getDescription() : "";
			str[5] = workRecord.getUuid();
			str[6] = workRecord.getRecordUuid() == null ? "" : workRecord.getRecordUuid();
			str[7] = workRecord.getReviewComment() == null ? "" : workRecord.getReviewComment();
			str[8] = workRecord.getReviewFlag() == null ? "" : workRecord.getReviewFlag().getDescription();
			str[9] = workRecord.getTimeStamp() == null ? "" : workRecord.getTimeStamp().toString();
			str[10] = workRecord.getSummary() == null ? "" : workRecord.getSummary();
			str[11] = workRecord.getSchedule() == null ? "" : workRecord.getSchedule();
			str[12] = workRecord.getShare() == null ? "" : workRecord.getShare();
			str[13] = workRecord.getFileUuid() == null ? "" : workRecord.getFileUuid();
			str[14] = workRecord.getReviewFlagUuid() == null ? "" : workRecord.getReviewFlagUuid();
			str[15] = workRecord.getReviewEmployeeUuid() == null ? "" : workRecord.getReviewEmployee().getPerson().getName();
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
