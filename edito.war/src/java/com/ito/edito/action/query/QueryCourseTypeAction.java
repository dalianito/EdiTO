package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryCourseTypeAction extends AjaxAction {

	public void executeAutoUT() throws Exception {

		List<String[]> courseCategoryTypes = new ArrayList<String[]>();
		getChildren(courseCategoryTypes, null, 0);
		setResponseText(courseCategoryTypes);
	}

	private static void getChildren(List<String[]> courseCategoryTypes, String uuid, int level) throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		Constraint constraint = new Constraint("CourseCategoryType");
		constraint.addCondition("parentUuid", uuid);
		constraint.addCondition("ifUsing", "1");
		List<CourseCategoryType> courseCategoryTypesTemp = classService.selectCourseCategoryTypes(constraint);
		for (int i = 0; i < courseCategoryTypesTemp.size(); i++) {
			CourseCategoryType courseCategoryType = courseCategoryTypesTemp.get(i);
			String[] str = new String[3];
			str[0] = String.valueOf(level);
			str[1] = courseCategoryType.getDescription();
			str[2] = courseCategoryType.getUuid();
			courseCategoryTypes.add(str);
			int nextLevel = level + 1;
			getChildren(courseCategoryTypes, courseCategoryType.getUuid(), nextLevel);
		}
	}
}
