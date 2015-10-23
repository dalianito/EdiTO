package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryStudentStatusAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		String mark = request.getParameter("mark");
		String personNo = request.getParameter("personNo");
		String name = request.getParameter("name");
		String campusUuid = request.getParameter("campusUuid");
		String classTypeUuid = request.getParameter("classTypeUuid");
		String clsNo = request.getParameter("clsNo");
		String courseName = request.getParameter("courseName");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Student S, ClassEnrollment C, Person P ,ArrangeClass A ,Course O ";
		String sqlSelect = "select distinct C.* from Student S, ClassEnrollment C, Person P ,ArrangeClass A , Course O ";
		String sqlCondition = "where S.personUuid = P.uuid and S.uuid = C.studentUuid and S.ifUsing = true and A.uuid = C.arrangeClassUuid and  O.uuid = A.courseUuid ";
		if (mark != null && mark.equals("enrollment")) {
			sqlCondition += "and C.enrollmentStateUuid =  '" + Constants.STUDENT_APPLY + "' ";
		}
		if (mark != null && mark.equals("quit")) {
			sqlCondition += "and C.enrollmentStateUuid =  '" + Constants.STUDENT_QUIT + "' ";
		}
		if (personNo != null && personNo.length() > 0) {
			sqlCondition += "and S.studentID like '%" + personNo + "%' ";
		}
		if (name != null && name.length() > 0) {
			sqlCondition += "and P.name like '%" + name + "%' ";
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			sqlCondition += "and A.campusUuid = '" + campusUuid + "' ";
		}
		if (classTypeUuid != null && classTypeUuid.length() > 0) {
			sqlCondition += "and A.clsTypeUuid = '" + classTypeUuid + "' ";
		}
		if (clsNo != null && clsNo.length() > 0) {
			sqlCondition += "and A.clsNo like '%" + clsNo + "%' ";
		}
		if (courseName != null && courseName.length() > 0) {
			sqlCondition += "and O.courseName like '%" + courseName + "%' ";
		}
		if (beginDate != null && beginDate.length() > 0) {
			sqlCondition += "and P.birthDate >= '" + beginDate + " 00:00:00' ";
		}
		if (endDate != null && endDate.length() > 0) {
			sqlCondition += "and P.birthDate <= '" + endDate + " 23:59:59' ";
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

		Constraint constraint = new Constraint("ClassEnrollment");
		constraint.addSQLCondition(sqlSelect, null);
		List<ClassEnrollment> list = classService.selectClassEnrollments(constraint);
		List<String[]> tempList = new ArrayList<String[]>();

		for (int i = 0; i < list.size(); i++) {
			ClassEnrollment classEnrollment = list.get(i);
			Student student = classEnrollment.getStudent();
			Person person = student.getPerson();

			String[] str = new String[10];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = student.getStudentID() != null ? student.getStudentID() : "";
			str[2] = person.getName();
			str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
			str[4] = classEnrollment.getArrangeClass().getCampus() != null ? classEnrollment.getArrangeClass().getCampus().getDescription() : "";
			str[5] = classEnrollment.getArrangeClass().getClsNo() != null ? classEnrollment.getArrangeClass().getClsNo() : "";
			str[6] = classEnrollment.getArrangeClass().getCourse().getCourseName() != null ? classEnrollment.getArrangeClass().getCourse().getCourseName() : "";
			str[7] = classEnrollment.getArrangeClass().getClsType() != null ? classEnrollment.getArrangeClass().getClsType().getDescription() : "";
			str[8] = classEnrollment.getUuid();
			str[9] = mark;

			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);

	}
}
