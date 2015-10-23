package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.fai.util.JndiFactory;

public class UpdateCourseAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		String uuid = request.getParameter("uuid");

		Course course = classService.selectCourseByUuid(uuid);
		course.setIfUsing(false);

		ut.begin();
		try {
			classService.updateCourse(course, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
