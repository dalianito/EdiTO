package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.fai.util.JndiFactory;

public class GetCourseAction extends DefaultAction {
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		Course course = classService.selectCourseByUuid(uuid);
		request.setAttribute("course", course);
	}
}
