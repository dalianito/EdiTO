package com.ito.edito.action.update;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class UpdateTempDepartureAction extends AjaxAction{
	public void executeManualUT() throws Exception {
		TeacherService teacherService = (TeacherService) JndiFactory.lookup("teacherService");

		String uuid = request.getParameter("uuid");
		Teacher teacher = teacherService.selectTeacherByUuid(uuid);
		teacher.setServiceStateUuid(Constants.TEMP_DEPATURE, false);
		List<PreTeachingExpInfo> preTeachingExpInfoList = new ArrayList<PreTeachingExpInfo>();
		teacher.setPreTeachingExpInfos(preTeachingExpInfoList);

		ut.begin();
		try {
			if (teacher != null) {
				teacherService.updateTeacher(teacher, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
