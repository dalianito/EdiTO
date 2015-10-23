package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Person;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeIfExistAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String personNo = request.getParameter("personNo");

		String flag = "false";
		Constraint c = new Constraint("Person");
		c.addCondition("ifUsing", true);
		if (uuid != null && uuid.length() > 0) {
			c.addCondition("uuid", uuid, Constraint.UNEQUAL);
		}
		c.addCondition("personNo", personNo);
		Person person = userService.selectPerson(c);
		if (person != null) {
			flag = "true";
		}
		setResponseText(flag);
	}
}
