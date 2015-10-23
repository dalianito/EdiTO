package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Employee;
import com.ito.fai.util.JndiFactory;

public class GetCampusAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Campus campus = campusService.selectCampusByUuid(uuid);
			request.setAttribute("campus", campus);

			if (campus.getHeadmasterUuid() != null) {
				Employee employee = userService.selectEmployeeByUuid(campus.getHeadmasterUuid());
				request.setAttribute("headMasterName", employee.getPerson().getName());
			}
			else {
				request.setAttribute("headMasterName", "");
			}
		}
	}
}
