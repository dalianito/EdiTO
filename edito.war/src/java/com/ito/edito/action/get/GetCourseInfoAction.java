package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.fai.util.JndiFactory;

public class GetCourseInfoAction extends DefaultAction {
	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Course course = classService.selectCourseByUuid(uuid);
			request.setAttribute("course", course);
		}
	}
}
