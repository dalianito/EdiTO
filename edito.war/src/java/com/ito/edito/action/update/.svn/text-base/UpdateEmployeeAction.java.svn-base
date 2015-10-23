package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class UpdateEmployeeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Person person = userService.selectPersonByUuid(uuid);
		person.setIfUsing(false);

		Constraint employeeC = new Constraint("Employee");
		employeeC.addCondition("personUuid", uuid);
		Employee employee = userService.selectEmployee(employeeC);
		if (employee != null) {
			employee.setIfUsing(false);
		}

		Constraint userC = new Constraint("User");
		userC.addCondition("personUuid", uuid);
		User user = userService.selectUser(userC);
		if (user != null) {
			user.setIfUsing(false);
		}

		ut.begin();
		try {
			if (user != null) {
				userService.updateUser(user, USER.getAccount());
			}
			if (employee != null) {
				userService.updateEmployee(employee, USER.getAccount());
			}
			userService.updatePerson(person, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
