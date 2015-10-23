package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class UpdateFormalEmployeeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Employee employee = userService.selectEmployeeByUuid(uuid);
		employee.setWorkingStateUuid(Constants.WORKING_STATE_FORMAL, false);

		ut.begin();
		try {
			if (employee != null) {
				userService.updateEmployee(employee, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
