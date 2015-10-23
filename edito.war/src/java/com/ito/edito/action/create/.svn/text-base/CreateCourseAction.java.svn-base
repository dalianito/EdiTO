package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.fai.util.JndiFactory;

public class CreateCourseAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		Course course = (Course) carrier.fetchInstance("Course");
		course.setIfUsing(true);
		ut.begin();
		try {
			if((course.getUuid() != null) && (course.getUuid().length() > 0)) {
				classService.updateCourse(course, USER.getAccount());
			}
			else {
				classService.insertCourse(course, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
