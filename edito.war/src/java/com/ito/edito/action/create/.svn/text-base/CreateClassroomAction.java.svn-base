package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Classroom;
import com.ito.fai.util.JndiFactory;

public class CreateClassroomAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		Classroom classroom = (Classroom) carrier.fetchInstance("Classroom");
		classroom.setIfUsing(true);
		classroom.setCampusUuid(EMPLOYEE.getCampusUuid(), false);

		String classroomUuid = classroom.getUuid();
		ut.begin();
		try {
			if (classroomUuid != null) {
				campusService.updateClassroom(classroom, USER.getAccount());
			}
			else {
				classroomUuid = campusService.insertClassroom(classroom, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
