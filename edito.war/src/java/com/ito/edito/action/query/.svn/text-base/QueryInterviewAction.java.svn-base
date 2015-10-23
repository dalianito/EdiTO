package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.InterviewRecord;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryInterviewAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService interviewRecordService = (CampusService) JndiFactory.lookup("campusService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String pageMark = request.getParameter("pageMark");
		String interviewer = request.getParameter("interviewer");
		String interviewercampusUuid = request.getParameter("interviewercampusUuid");
		String interviewerdepartmentUuid = request.getParameter("interviewerdepartmentUuid");
		String interviewerjobUuid = request.getParameter("interviewerjobUuid");

		String interviewee = request.getParameter("interviewee");
		String intervieweecampusUuid = request.getParameter("intervieweecampusUuid");
		String intervieweedepartmentUuid = request.getParameter("intervieweedepartmentUuid");
		String intervieweejobUuid = request.getParameter("intervieweejobUuid");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from InterviewRecord I  join Employee E on I.interviewerUuid = E.uuid  join Person P on E.personUuid = P.uuid  join Employee E1 on I.intervieweeUuid = E1.uuid  join Person P1 on E1.personUuid = P1.uuid  ";
		String sqlSelect = "select distinct I.* from InterviewRecord I, Employee E, Person P , Employee E1, Person P1";
		String sqlCondition = " where  I.ifUsing = true and I.interviewerUuid = E.uuid and E.personUuid = P.uuid and I.intervieweeUuid = E1.uuid and E1.personUuid = P1.uuid ";

		if (pageMark != null && pageMark.equals("campus")) {
			sqlCondition += " and E.uuid = '" + EMPLOYEE.getUuid() + "' ";
		}

		if (interviewer != null && interviewer.length() > 0) {
			sqlCondition += " and P.name like '%" + interviewer + "%' ";
		}
		if (interviewercampusUuid != null && interviewercampusUuid.length() > 0) {
			sqlCondition += " and I.interviewerCampusUuid = '" + interviewercampusUuid + "' ";
		}
		if (interviewerdepartmentUuid != null && interviewerdepartmentUuid.length() > 0) {
			sqlCondition += " and I.interviewerDepartmentUuid = '" + interviewerdepartmentUuid + "' ";

		}
		if (interviewerjobUuid != null && interviewerjobUuid.length() > 0) {
			sqlCondition += " and I.interviewerJobUuid = '" + interviewerjobUuid + "' ";
		}

		if (interviewee != null && interviewee.length() > 0) {
			sqlCondition += " and P1.name like '%" + interviewee + "%' ";
		}
		if (intervieweecampusUuid != null && intervieweecampusUuid.length() > 0) {
			sqlCondition += " and I.intervieweeCampusUuid = '" + intervieweecampusUuid + "' ";
		}
		if (intervieweedepartmentUuid != null && intervieweedepartmentUuid.length() > 0) {
			sqlCondition += " and I.intervieweeDepartmentUuid= '" + intervieweedepartmentUuid + "' ";

		}
		if (intervieweejobUuid != null && intervieweejobUuid.length() > 0) {
			sqlCondition += " and I.intervieweeJobUuid = '" + intervieweejobUuid + "' ";
		}

		if (beginDate != null && beginDate.length() > 0) {
			sqlCondition += " and I.interviewDate >= '" + beginDate + " 00:00:00'";
		}
		if (endDate != null && endDate.length() > 0) {
			sqlCondition += " and I.interviewDate <= '" + endDate + " 23:59:59' ";
		}

		sqlCount += sqlCondition + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sqlSelect += sqlCondition;
		sqlSelect += " limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint c = new Constraint("InterviewRecord");
		c.addSQLCondition(sqlSelect, null);
		List<InterviewRecord> list = interviewRecordService.selectInterviewRecords(c);
		List<String[]> tempList = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {
			InterviewRecord interviewRecord = list.get(i);
			String[] str = new String[11];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = interviewRecord.getInterviewerUuid() != null ? interviewRecord.getInterviewer().getPerson().getName() : "";
			str[2] = interviewRecord.getInterviewerCampusUuid() != null ? interviewRecord.getInterviewerCampus().getDescription() : "";
			str[3] = interviewRecord.getInterviewerDepartmentUuid() != null ? interviewRecord.getInterviewerDepartment().getDescription() : "";
			str[4] = interviewRecord.getInterviewerJobUuid() != null ? interviewRecord.getInterviewerJob().getDescription() : "";
			str[5] = interviewRecord.getIntervieweeUuid() != null ? interviewRecord.getInterviewee().getPerson().getName() : "";
			str[6] = interviewRecord.getIntervieweeCampusUuid() != null ? interviewRecord.getIntervieweeCampus().getDescription() : "";
			str[7] = interviewRecord.getIntervieweeDepartmentUuid() != null ? interviewRecord.getIntervieweeDepartment().getDescription() : "";
			str[8] = interviewRecord.getIntervieweeJobUuid() != null ? interviewRecord.getIntervieweeJob().getDescription() : "";
			str[9] = interviewRecord.getInterviewDate() != null ? Constants.DATE_FORMAT_YMD.format(interviewRecord.getInterviewDate()) : "";
			str[10] = interviewRecord.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
