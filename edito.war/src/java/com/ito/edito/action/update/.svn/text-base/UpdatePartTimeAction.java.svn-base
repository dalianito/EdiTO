package com.ito.edito.action.update;

import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.fai.util.JndiFactory;

public class UpdatePartTimeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		TeacherService teacherService = (TeacherService) JndiFactory.lookup("teacherService");

		String uuid = request.getParameter("uuid");

		Teacher teacher = null;
		Employee employee = null;
		Person person = null;

		if (uuid != null) {
			teacher = teacherService.selectTeacherByUuid(uuid);
			teacher.setIfUsing(false);
			teacher.setPreTeachingExpInfos(new ArrayList<PreTeachingExpInfo>());

			employee = teacher.getEmployee();
			if (employee != null) {
				employee.setIfUsing(false);

				person = employee.getPerson();
				if (person != null) {
					person.setIfUsing(false);
				}
			}
		}

		ut.begin();
		try {
			if (teacher != null) {
				teacherService.updateTeacher(teacher, USER.getAccount());
			}

			if (employee != null) {
				userService.updateEmployee(employee, USER.getAccount());
			}

			if (person != null) {
				userService.updatePerson(person, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
