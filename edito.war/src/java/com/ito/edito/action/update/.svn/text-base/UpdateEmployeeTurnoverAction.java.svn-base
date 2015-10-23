package com.ito.edito.action.update;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class UpdateEmployeeTurnoverAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String uuid = request.getParameter("uuid");

		Quit quit = applyService.selectQuitByUuid(uuid);
		quit.setIfDeal(true);

		Employee employee = quit.getEmployee();
		employee.setToDate(new Date());
		employee.setIfUsing(false);

		Person person = employee.getPerson();
		person.setIfUsing(false);

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
			if (person != null) {
				userService.updatePerson(person, USER.getAccount());
			}
			if (quit != null) {
				applyService.updateQuit(quit, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
