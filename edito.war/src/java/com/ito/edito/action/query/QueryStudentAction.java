package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryStudentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String personNo = request.getParameter("personNo");
		String name = request.getParameter("name");
		String genderUuid = request.getParameter("genderUuid");
		String educationUuid = request.getParameter("educationUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Student S, Person P ";
		String sqlSelect = "select distinct S.* from Student S, Person P ";
		String sqlCondition = "where S.personUuid = P.uuid and S.ifUsing = true ";
		if (personNo != null && personNo.length() > 0) {
			sqlCondition += "and S.studentID like '%" + personNo + "%' ";
		}
		if (name != null && name.length() > 0) {
			sqlCondition += "and P.name like '%" + name + "%' ";
		}
		if (genderUuid != null && genderUuid.length() > 0) {
			sqlCondition += "and P.genderUuid = '" + genderUuid + "' ";
		}
		if (beginDate != null && beginDate.length() > 0) {
			sqlCondition += "and P.birthDate >= '" + beginDate + " 00:00:00' ";
		}
		if (endDate != null && endDate.length() > 0) {
			sqlCondition += "and P.birthDate <= '" + endDate + " 23:59:59' ";
		}
		if (educationUuid != null && educationUuid.length() > 0) {
			sqlCondition += "and P.educationUuid = '" + educationUuid + "' ";
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
		sqlSelect += "order by S.studentID asc ";
		sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint constraint = new Constraint("Student");
		constraint.addSQLCondition(sqlSelect, null);
		List<Student> list = userService.selectStudents(constraint);
		List<String[]> tempList = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {
			Student student = list.get(i);
			Person person = student.getPerson();

			String[] str = new String[6];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = student.getStudentID() != null ? student.getStudentID() : "";
			str[2] = person.getName();
			str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
			str[4] = person.getEducationUuid() != null ? person.getEducation().getDescription() : "";
			str[5] = student.getUuid();

			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);

	}
}
