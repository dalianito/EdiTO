package com.ito.edito.action.dropmenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryCourseDropMenuAction  extends AjaxAction {
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String field = request.getParameter("field");
		String key = request.getParameter("key");
		String constraints = request.getParameter("constraints");
		String constraintValues = request.getParameter("constraintValues");

		List<String> values = new ArrayList<String>();
		if (constraintValues != "") {
			String ss[] = constraintValues.split(",");
			for (int m = 0; m < ss.length; m++) {
				values.add(ss[m]);
			}
		}
		if (field == "") {
			field = "name";
		}
		Constraint constraint = new Constraint("Course");
		constraint.addCondition("ifUsing", true);
		constraint.addCondition(field, key + "%", Constraint.LIKE);

		if (constraints != "") {
			constraint.addCondition(constraints, values, Constraint.IN_LIST);
		}

		constraint.addOrderCondition("courseNo", "asc");
		List<Course> courses = classService.selectCourses(constraint);

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for (int i = 0; i < courses.size(); i++) {
			Course course = courses.get(i);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", i);
				map.put("uuid", course.getUuid());
				map.put("name", course.getCourseName());

				String[] text = { course.getCourseNo(), course.getCourseName()};
				map.put("text", text);
				list.add(map);
		}
		setResponseText(list);
	}
}
