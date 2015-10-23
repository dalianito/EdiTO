package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryLeftAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String name = request.getParameter("name");
		String genderUuid = request.getParameter("genderUuid");
		String departmentUuid = request.getParameter("departmentUuid");
		String campusUuid = request.getParameter("campusUuid");
		String sortField = request.getParameter("sortField");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++
				+ "' as uuid, 1 as timeStamp, count from (select count(*) as count from Employee E, Person P, Quit Q ";
		String sqlSelect = "select E.* from Employee E, Person P, Quit Q ";
		String sqlCondition = "where E.personUuid = P.uuid and E.ifUsing = false and E.ifShow = true and Q.employeeUuid = E.uuid and E.personUuid = P.uuid and Q.ifUsing = true ";

		if (name != null && name.length() > 0) {
			sqlCondition += "and P.name like '%" + name + "%' ";
		}
		if (genderUuid != null && genderUuid.length() > 0) {
			sqlCondition += "and P.genderUuid = '" + genderUuid + "' ";
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			sqlCondition += "and E.campusUuid = '" + campusUuid + "' ";
		}
		if (departmentUuid != null && departmentUuid.length() > 0) {
			sqlCondition += "and E.departmentUuid = '" + departmentUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sqlCondition += " and toDate >= '"
					+ Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sqlCondition += " and toDate <= '"
					+ Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
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
		sqlSelect += "order by " + sortField + " asc, personNo asc ";
		sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint employeeC = new Constraint("Employee");
		employeeC.addSQLCondition(sqlSelect, null);
		List<Employee> list = userService.selectEmployees(employeeC);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Employee employee = list.get(i);
			Person person = employee.getPerson();

			String[] str = new String[11];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = person.getPersonNo();
			str[2] = person.getName();
			str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
			str[4] = person.getEducationUuid() != null ? person.getEducation().getDescription() : "";
			str[5] = employee.getDepartmentUuid() != null ? employee.getDepartment().getDescription() : "";
			str[6] = employee.getFromDate() != null ? Constants.DATE_FORMAT_YMD.format(employee.getFromDate()) : "";
			str[7] = employee.getToDate() != null ? Constants.DATE_FORMAT_YMD.format(employee.getToDate()) : "";
			str[8] = person.getUuid();
			str[9] = employee.getCampusUuid() != null ? employee.getCampus().getDescription() : "";
			str[10] = employee.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
