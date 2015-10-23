package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Department;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryDepartmentAction extends AjaxAction {

	public void executeAutoUT() throws Exception {

		List<String[]> departments = new ArrayList<String[]>();
		getChildren(departments, null, 0);

		setResponseText(departments);
	}

	private static void getChildren(List<String[]> departments, String uuid, int level) throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		Constraint constraint = new Constraint("Department");
		constraint.addCondition("parentUuid", uuid);
		constraint.addCondition("ifUsing", "1");
		List<Department> departmentsTemp = userService.selectDepartments(constraint);
		for (int i = 0; i < departmentsTemp.size(); i++) {
			Department department = departmentsTemp.get(i);
			String[] str = new String[3];
			str[0] = String.valueOf(level);
			str[1] = department.getDescription();
			str[2] = department.getUuid();
			departments.add(str);
			int nextLevel = level + 1;
			getChildren(departments, department.getUuid(), nextLevel);
		}
	}
}
