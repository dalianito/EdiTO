package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Classroom;
import com.ito.fai.util.JndiFactory;

public class DeleteClassroomAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");

		Classroom classroom = campusService.selectClassroomByUuid(uuid);
		classroom.setIfUsing(false);

		ut.begin();
		campusService.updateClassroom(classroom, USER.getAccount());
		ut.commit();
	}
}
