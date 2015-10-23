package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.SelfAssess;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryEmployeeAssessAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String name = request.getParameter("name");
		String selfAssesstypeUuid = request.getParameter("selfAssesstypeUuid");
		String assessStateUuid = request.getParameter("assessStateUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String campusUuid = request.getParameter("campusUuid");
		String departmentUuid = request.getParameter("departmentUuid");
		String jobUuid = request.getParameter("jobUuid");

		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "";
		sql += "";
		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from SelfAssess S, Employee E, Person P, SelfAssessExamine Ex, Department D, Campus C, Job J, SelfAssessType Sa, AssessState A ";
		String sqlSelect = "select S.* from SelfAssess S, Employee E, Person P, SelfAssessExamine Ex, Department D, Campus C, Job J, SelfAssessType Sa, AssessState A ";
		String sqlCondition = "where S.selfAssessEmployeeUuid = E.uuid and E.personUuid = P.uuid and S.examineUuid = Ex.uuid and S.departmentUuid = D.uuid and S.campusUuid = C.uuid and S.jobUuid = J.uuid and S.selfAssessTypeUuid = Sa.uuid and S.assessStateUuid = A.uuid and S.ifUsing = true ";

		if(name.equals("myself")) {
			sqlCondition += " and E.uuid = '" + EMPLOYEE.getUuid() + "' ";
		}
		else if(name != null && name.length() > 0) {
			sqlCondition += " and P.name like '%" + name + "%' ";
		}
		if (selfAssesstypeUuid != null && selfAssesstypeUuid.length() > 0) {
			sqlCondition += " and S.selfAssessTypeUuid = '" + selfAssesstypeUuid + "' ";
		}
		if (assessStateUuid != null && assessStateUuid.length() > 0) {
			sqlCondition += " and S.assessStateUuid = '" + assessStateUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sqlCondition += " and S.selfAssessTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sqlCondition += " and S.selfAssessTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}
		if(campusUuid != null && campusUuid.length() > 0) {
			sqlCondition += "and S.campusUuid = '" + campusUuid + "' ";
		}
		if(departmentUuid != null && departmentUuid.length() > 0) {
			sqlCondition += "and S.departmentUuid = '" + departmentUuid + "' ";
		}
		if(jobUuid != null && jobUuid.length() > 0) {
			sqlCondition += "and S.jobUuid = '" + jobUuid + "' ";
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
		sqlSelect += "order by S.selfAssessTime desc ";
		sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint selfAssessC = new Constraint("SelfAssess");
		selfAssessC.addSQLCondition(sqlSelect, null);
		List<SelfAssess> list = campusService.selectSelfAssesss(selfAssessC);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			SelfAssess selfAssess = list.get(i);

			String[] str = new String[12];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = selfAssess.getSelfAssessTypeUuid() != null ? selfAssess.getSelfAssessType().getDescription() : "";
			str[2] = selfAssess.getSelfAssessTime() != null ? Constants.DATE_FORMAT_YMD.format(selfAssess.getSelfAssessTime()) : "";
			str[3] = selfAssess.getDepartmentUuid() != null ? selfAssess.getDepartment().getDescription() : "";
			str[4] = selfAssess.getCampusUuid() != null ? selfAssess.getCampus().getDescription() : "";
			str[5] = selfAssess.getJobUuid() != null ? selfAssess.getJob().getDescription() : "";
			str[6] = selfAssess.getAssessStateUuid() != null ? selfAssess.getAssessState().getDescription() : "";
			str[7] = selfAssess.getUuid() != null ? selfAssess.getUuid() : "";
			str[8] = selfAssess.getSelfAssessTypeUuid() != null ? selfAssess.getSelfAssessType().getDescription() : "";
			str[9] = selfAssess.getSelfAssessEmployeeUuid() != null ? selfAssess.getSelfAssessEmployee().getPerson().getName() : "";

			str[10] = selfAssess.getExamine().getAssessmentPerson() != null ? selfAssess.getExamine().getAssessmentPerson().getPerson().getName() :"";
			str[11] = selfAssess.getExamine().getAssessmentTime() != null ? Constants.DATE_FORMAT_YMD.format(selfAssess.getExamine().getAssessmentTime()) : "";
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
