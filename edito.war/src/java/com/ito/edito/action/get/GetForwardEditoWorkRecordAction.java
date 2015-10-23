package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.WorkRecord;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetForwardEditoWorkRecordAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		
		String uuid = request.getParameter("uuid");
		String employeeUuid = request.getParameter("employeeUuid");
		
		if (uuid != null) {
			WorkRecord workRecord = campusService.selectWorkRecordByUuid(uuid);
			request.setAttribute("workRecord", workRecord);
			
			Constraint ec = new Constraint("Employee");
			ec.addCondition("uuid", employeeUuid);
			ec.addCondition("ifUsing", true);
			Employee employee = userService.selectEmployee(ec);
			request.setAttribute("employee", employee);
		}
	}
}
