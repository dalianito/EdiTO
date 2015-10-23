package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.EducationExpInfo;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.fai.util.JndiFactory;

public class CreateStudentAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		Person person = (Person) carrier.fetchInstance("Person");
		Student student = (Student) carrier.fetchInstance("Student");
		List<EducationExpInfo> EducationExpInfo = (List<EducationExpInfo>) carrier.fetchInstances("EducationExpInfo");
		person.setIfUsing(true);
		person.setEducationExpInfos(EducationExpInfo);
		student.setIfUsing(true);

		ut.begin();
		try {

			String personUuid = person.getUuid();
			if (personUuid == null) {
				personUuid = userService.insertPerson(person, USER.getAccount());
			}
			else {
				userService.updatePerson(person, USER.getAccount());
			}

			student.setPersonUuid(personUuid, false);

			String studentUuid = student.getUuid();
			if (studentUuid == null) {
				userService.insertStudent(student, USER.getAccount());
			}
			else {
				userService.updateStudent(student, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			// TODO: handle exception
			ut.rollback();
		}

	}
}
