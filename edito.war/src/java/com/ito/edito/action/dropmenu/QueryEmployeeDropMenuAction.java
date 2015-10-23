package com.ito.edito.action.dropmenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryEmployeeDropMenuAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String field = request.getParameter("field");
		String key = request.getParameter("key");
		String constraints = request.getParameter("constraints");
		String constraintValues = request.getParameter("constraintValues");

		List<String> values = new ArrayList<String>();
		if (constraintValues != "") {
			String ss[] = constraintValues.split(",");
			for (int m = 0; m < ss.length; m++) {
				values.add(ss[m]);
			}
		}
		if (field == "") {
			field = "name";
		}
		Constraint constraint = new Constraint("Person");
		constraint.addCondition("ifUsing", true);
		constraint.addCondition(field, key + "%", Constraint.LIKE);

		if (constraints != "") {
			constraint.addCondition(constraints, values, Constraint.IN_LIST);
		}

		constraint.addOrderCondition("genderUuid", "asc");
		constraint.addOrderCondition("name", "asc");
		List<Person> persons = userService.selectPersons(constraint);

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (int i = 0; i < persons.size(); i++) {
			Person person = persons.get(i);

			Constraint employeeC = new Constraint("Employee");
			employeeC.addCondition("personUuid", person.getUuid());
			Employee employee = userService.selectEmployee(employeeC);
			if (employee != null) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", i);
				map.put("uuid", employee.getUuid());
				map.put("name", person.getName());
				String department = "";
				if (employee.getDepartmentUuid() != null) {
					department = employee.getDepartment().getDescription();
				}

				String[] text = { person.getName(), person.getGenderUuid() == null ? "" : person.getGender().getDescription(), department };
				map.put("text", text);
				list.add(map);
			}
		}
		setResponseText(list);
	}
}
