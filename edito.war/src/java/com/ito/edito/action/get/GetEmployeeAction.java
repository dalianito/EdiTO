package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Employee employee = userService.selectEmployeeByUuid(uuid);
			request.setAttribute("employee", employee);
			request.setAttribute("person", employee.getPerson());

			Constraint c = new Constraint("User");
			c.addCondition("personUuid", employee.getPersonUuid());
			User user = userService.selectUser(c);
			if (user != null) {
				request.setAttribute("account", user.getAccount());
			}
		}
	}
}
