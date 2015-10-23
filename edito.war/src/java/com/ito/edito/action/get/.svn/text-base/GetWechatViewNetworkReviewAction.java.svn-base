package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWechatViewNetworkReviewAction extends DefaultAction {
	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String employeeUuid = request.getParameter("employeeUuid");

		Constraint c = new Constraint("InternetPublicity");
		c.addCondition("uuid", uuid);
		c.addCondition("ifUsing", true);
		InternetPublicity internetPublicity = campusService.selectInternetPublicity(c);
		request.setAttribute("internetPublicity", internetPublicity);

		Constraint ec = new Constraint("Employee");
		ec.addCondition("uuid", employeeUuid);
		ec.addCondition("ifUsing", true);
		Employee employee = userService.selectEmployee(ec);
		request.setAttribute("employee", employee);
	}
}
