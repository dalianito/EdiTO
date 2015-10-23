package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.User;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryJobEmployeeAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Constraint c = new Constraint("Employee");
		c.addCondition("ifUsing", true);
		if (uuid != null && uuid.length() > 0) {
			c.addCondition("jobUuid", uuid);
		}
		List<Employee> list = userService.selectEmployees(c);
		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Employee employee = list.get(i);
			Person person = employee.getPerson();

			String[] str = new String[10];
			str[0] = Integer.toString(i + 1);
			str[1] = person.getPersonNo();
			str[2] = person.getName();
			str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
			str[4] = person.getEducationUuid() != null ? person.getEducation().getDescription() : "";
			str[5] = employee.getDepartmentUuid() != null ? employee.getDepartment().getDescription() : "";
			str[6] = employee.getFromDate() != null ? Constants.DATE_FORMAT_YMD.format(employee.getFromDate()) : "";
			str[7] = employee.getWorkingStateUuid() != null ? employee.getWorkingState().getDescription() : "";

			Constraint userC = new Constraint("User");
			userC.addCondition("personUuid", person.getUuid());
			User user = userService.selectUser(userC);
			str[8] = user != null ? "true" : "false";
			str[9] = employee.getUuid();
			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
