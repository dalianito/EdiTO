package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.fai.util.JndiFactory;

public class GetCourseTypeAction extends AjaxAction {
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		CourseCategoryType courseCategoryType = classService.selectCourseCategoryTypeByUuid(uuid);
		setResponseText(courseCategoryType);
	}
}
