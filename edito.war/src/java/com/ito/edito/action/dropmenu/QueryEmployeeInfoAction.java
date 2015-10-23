package com.ito.edito.action.dropmenu;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.fai.util.JndiFactory;

public class QueryEmployeeInfoAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String relationId = request.getParameter("relationId");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("relatedId", relationId);

		Employee employee = userService.selectEmployeeByUuid(uuid);
		map.put("employee", employee);

		setResponseText(map);
	}
}
