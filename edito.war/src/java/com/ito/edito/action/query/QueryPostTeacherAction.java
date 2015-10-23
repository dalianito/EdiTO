package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Teacher;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryPostTeacherAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		TeacherService teacherService = (TeacherService) JndiFactory.lookup("teacherService");

		String name = request.getParameter("name");
		String campusUuid = request.getParameter("campusUuid");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Teacher T, Employee E,Person P ";
		String sqlSelect = "select T.* from Teacher T, Employee E, Person P ";
		String sqlCondition = "where T.employeeUuid = E.uuid and E.personUuid = P.uuid and T.serviceStateUuid = '" + Constants.TEMP_DEPATURE + "' and T.ifUsing = true ";

		if (!(USER.getUuid().equals(Constants.ADMIN_USER_UUID))) {
			sqlCondition += "and P.uuid != '" + Constants.ADMIN_PERSON_UUID + "' ";
		}
		if (name != null && name.length() > 0) {
			sqlCondition += "and P.name like '%" + name + "%' ";
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			sqlCondition += "and E.campusUuid = '" + campusUuid + "' ";
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
		sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint teacherC = new Constraint("Teacher");
		teacherC.addSQLCondition(sqlSelect, null);
		List<Teacher> list = teacherService.selectTeachers(teacherC);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Teacher teacher = list.get(i);
			Person person = teacher.getEmployee().getPerson();

			String[] str = new String[12];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = person.getName();
			str[2] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
			str[3] = person.getEducationUuid() != null ? person.getEducation().getDescription() : "";
			str[4] = teacher.getWorkUnit() != null ? teacher.getWorkUnit() : "";
			str[5] = teacher.getDuty() != null ? teacher.getDuty() : "";
			str[6] = teacher.getEmployee().getDepartmentUuid() != null ? teacher.getEmployee().getDepartment().getDescription() : "";
			str[7] = teacher.getEmployee().getCampusUuid() != null ? teacher.getEmployee().getCampus().getDescription() : "";
			str[8] = teacher.getEmployee().getFromDate() != null ? Constants.DATE_FORMAT_YMD.format(teacher.getEmployee().getFromDate()) : "";
			str[9] = teacher.getUuid();
			str[10] = teacher.getServiceStateUuid() != null ? teacher.getServiceState().getDescription() : "";
			str[11] = teacher.getTeacherTypeUuid() != null ? teacher.getTeacherType().getDescription() : "";
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
