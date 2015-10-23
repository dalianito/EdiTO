package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetCampusEmployeeNoAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String campusUuid = request.getParameter("campusUuid");

		if (campusUuid != null && campusUuid.length() > 0) {
			Constraint c = new Constraint("Employee");
			c.addCondition("campusUuid", campusUuid);
			c.addCondition("ifUsing", true);
			List<Employee> list = userService.selectEmployees(c);

			setResponseText(list.size());
		}
	}
}
