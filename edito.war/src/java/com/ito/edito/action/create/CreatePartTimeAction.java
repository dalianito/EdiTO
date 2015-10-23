package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreatePartTimeAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		TeacherService teacherService = (TeacherService) JndiFactory.lookup("teacherService");

		Person person = (Person) carrier.fetchInstance("Person");
		Employee employee = (Employee) carrier.fetchInstance("Employee");
		Teacher teacher = (Teacher) carrier.fetchInstance("Teacher");
		List<PreTeachingExpInfo> preTeachingExpInfoList = (List<PreTeachingExpInfo>) carrier.fetchInstances("PreTeachingExpInfo");

		person.setIfUsing(true);
		employee.setWorkingStateUuid(Constants.WORKING_STATE_PARTTIME, false);
		teacher.setServiceStateUuid(Constants.ON_JOB, false);
		employee.setIfUsing(true);
		employee.setIfShow(true);
		teacher.setPreTeachingExpInfos(preTeachingExpInfoList);
		teacher.setTeacherTypeUuid(Constants.TEACHER_TYPE_PARTTIME, false);
		teacher.setRecordTime(new Date());
		teacher.setRecorderUuid(EMPLOYEE.getUuid(), false);
		teacher.setIfUsing(true);

		ut.begin();
		try {
			String personUuid = person.getUuid();
			if (personUuid == null) {
				personUuid = userService.insertPerson(person, USER.getAccount());
			}
			else {
				userService.updatePerson(person, USER.getAccount());
			}

			employee.setPersonUuid(personUuid, false);

			String employeeUuid = employee.getUuid();
			if (employeeUuid == null) {
				employeeUuid = userService.insertEmployee(employee, USER.getAccount());
			}
			else {
				userService.updateEmployee(employee, USER.getAccount());
			}

			teacher.setEmployeeUuid(employeeUuid, false);

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
