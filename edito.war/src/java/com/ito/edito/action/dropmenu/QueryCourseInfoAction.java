package com.ito.edito.action.dropmenu;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.fai.util.JndiFactory;

public class QueryCourseInfoAction extends AjaxAction{
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");
		String relationId = request.getParameter("relationId");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("relatedId", relationId);

		Course course = classService.selectCourseByUuid(uuid);
		map.put("course", course);

		setResponseText(map);
	}
}
