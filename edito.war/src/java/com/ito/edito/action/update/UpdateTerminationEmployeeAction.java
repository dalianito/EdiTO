package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class UpdateTerminationEmployeeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Employee employee = userService.selectEmployeeByUuid(uuid);
		employee.setIfUsing(false);

		Person person = employee.getPerson();
		person.setIfUsing(false);

		Constraint c = new Constraint("User");
		c.addCondition("personUuid", person.getUuid());
		c.addCondition("ifUsing", true);
		User user = userService.selectUser(c);
		if (user != null) {
			user.setIfUsing(false);
		}

		ut.begin();
		try {
			if (employee != null) {
				userService.updateEmployee(employee, USER.getAccount());
			}
			userService.updatePerson(person, USER.getAccount());

			if (user != null) {
				userService.updateUser(user, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
