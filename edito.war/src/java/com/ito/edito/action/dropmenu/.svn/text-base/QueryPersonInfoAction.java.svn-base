package com.ito.edito.action.dropmenu;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryPersonInfoAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String relationId = request.getParameter("relationId");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("relatedId", relationId);

		Person person = userService.selectPersonByUuid(uuid);
		map.put("person", person);

		Constraint employeeC = new Constraint("Employee");
		employeeC.addCondition("personUuid", person.getUuid());
		Employee employee = userService.selectEmployee(employeeC);
		map.put("employee", employee);

		Constraint studentC = new Constraint("Student");
		studentC.addCondition("personUuid", person.getUuid());
		Student student = userService.selectStudent(studentC);
		map.put("student", student);

		setResponseText(map);
	}
}
