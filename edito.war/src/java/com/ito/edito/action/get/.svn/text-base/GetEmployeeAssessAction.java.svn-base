package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.SelfAssess;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeAssessAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		String uuid = request.getParameter("uuid");
		SelfAssess selfAssess = campusService.selectSelfAssessByUuid(uuid);
		request.setAttribute("selfAssess", selfAssess);
	}
}
