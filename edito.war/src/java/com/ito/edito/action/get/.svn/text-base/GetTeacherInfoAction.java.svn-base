package com.ito.edito.action.get;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetTeacherInfoAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		TeacherService teacherService = (TeacherService) JndiFactory.lookup("teacherService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Teacher teacher = teacherService.selectTeacherByUuid(uuid);
			request.setAttribute("teacher", teacher);

			Constraint preTeachingExpInfoC = new Constraint("PreTeachingExpInfo");
			preTeachingExpInfoC.addCondition("bizDataUuid", uuid);
			preTeachingExpInfoC.addOrderCondition("sequence", "asc");
			List<PreTeachingExpInfo> preTeachingExpInfoList = teacherService.selectPreTeachingExpInfos(preTeachingExpInfoC);
			request.setAttribute("preTeachingExpInfoList", preTeachingExpInfoList);

			String teachCourse = teacher.getTeachingCourse();
			if(teachCourse != null) {
				String []str =  teachCourse.split(",");
				List<String> uuidList = new ArrayList<String>();
				for(int i = 0; i < str.length; i++){
					uuidList.add(str[i]);
				}
				Constraint teachCourseC = new Constraint("CourseCategoryType");
				teachCourseC.addCondition("uuid", uuidList, Constraint.IN_LIST);
				teachCourseC.addCondition("ifHasChild", false);
				teachCourseC.addCondition("ifUsing", true);
				List<CourseCategoryType> courseCategoryTypesTemp = classService.selectCourseCategoryTypes(teachCourseC);
				request.setAttribute("courseCategoryTypes", courseCategoryTypesTemp);

			}
		}
	}
}
