package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ClassManagement;
import com.ito.fai.util.JndiFactory;

public class GetClassManagementAction extends AjaxAction {
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		
		String uuid = request.getParameter("uuid");
		ClassManagement classManagement = classService.selectClassManagementByUuid(uuid);
		setResponseText(classManagement);
	}
}
