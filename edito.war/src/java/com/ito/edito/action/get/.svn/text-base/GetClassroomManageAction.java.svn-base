package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Classroom;
import com.ito.fai.util.JndiFactory;

public class GetClassroomManageAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Classroom classroom = campusService.selectClassroomByUuid(uuid);
			request.setAttribute("classroom", classroom);
		}
	}
}
