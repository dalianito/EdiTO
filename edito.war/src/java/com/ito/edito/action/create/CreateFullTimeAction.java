package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateFullTimeAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		TeacherService teacherService = (TeacherService) JndiFactory.lookup("teacherService");

		Teacher teacher = (Teacher) carrier.fetchInstance("Teacher");
		List<PreTeachingExpInfo> preTeachingExpInfoList = (List<PreTeachingExpInfo>) carrier.fetchInstances("PreTeachingExpInfo");
		teacher.setPreTeachingExpInfos(preTeachingExpInfoList);
		teacher.setServiceStateUuid(Constants.ON_JOB, false);
		teacher.setTeacherTypeUuid(Constants.TEACHER_TYPE_FULLTIME, false);
		teacher.setRecordTime(new Date());
		teacher.setRecorderUuid(EMPLOYEE.getUuid(), false);
		teacher.setIfUsing(true);

		ut.begin();
		try {
			String teacherUuid = teacher.getUuid();
			if (teacherUuid == null) {
				teacherService.insertTeacher(teacher, USER.getAccount());
			}
			else {
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
