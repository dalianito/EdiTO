package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryFindStudentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String personUuid = request.getParameter("personUuid");

		Person person = userService.selectPersonByUuid(personUuid);

		Constraint c = new Constraint("Student");
		c.addCondition("personUuid", personUuid);
		Student student = userService.selectStudent(c);

		List<Object> resultList = new ArrayList<Object>();
		List<String[]> studentList = new ArrayList<String[]>();
		List<String[]> classList = new ArrayList<String[]>();

		String studentStr[] = new String[20];
		if (student != null) {
			studentStr[0] = student.getStudentID();
		}
		else {
			studentStr[0] = "";
		}
		studentStr[1] = person.getName() != null ? person.getName() : "";
		studentStr[2] = person.getGenderUuid() != null ? person.getGenderUuid() : "";
		studentStr[3] = person.getBirthDate() != null ? Constants.DATE_FORMAT_YMD.format(person.getBirthDate()) : "";
		studentStr[4] = person.getNationalityUuid() != null ? person.getNationalityUuid() : "";
		studentStr[5] = person.getMarriageUuid() != null ? person.getMarriageUuid() : "";
		studentStr[6] = person.getEducationUuid() != null ? person.getEducationUuid() : "";
		studentStr[7] = person.getParentName() != null ? person.getParentName() : "";
		studentStr[8] = person.getParentPhone() != null ? person.getParentPhone() : "";
		studentStr[9] = person.getPoliticalUuid() != null ? person.getPoliticalUuid() : "";
		studentStr[10] = person.getIdNo() != null ? person.getIdNo() : "";
		studentStr[11] = person.getCellPhone() != null ? person.getCellPhone() : "";
		studentStr[12] = person.getAddress() != null ? person.getAddress() : "";
		studentStr[13] = person.getQq() != null ? person.getQq() : "";
		studentStr[14] = person.getRealAddress() != null ? person.getRealAddress() : "";
		studentStr[15] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
		studentStr[16] = person.getNationalityUuid() != null ? person.getNationality().getDescription() : "";
		studentStr[17] = person.getMarriageUuid() != null ? person.getMarriage().getDescription() : "";
		studentStr[18] = person.getEducationUuid() != null ? person.getEducation().getDescription() : "";
		studentStr[19] = person.getPoliticalUuid() != null ? person.getPolitical().getDescription() : "";
		studentList.add(studentStr);
		resultList.add(studentList);

		if (student != null) {
			Constraint cC = new Constraint("ClassEnrollment");
			cC.addCondition("studentUuid", student.getUuid());
			cC.addCondition("enrollmentStateUuid", Constants.STUDENT_APPLY);
			List<ClassEnrollment> classEnrollmentList = classService.selectClassEnrollments(cC);

			for (int i = 0; i < classEnrollmentList.size(); i++) {
				ClassEnrollment classEnrollment = classEnrollmentList.get(i);

				Constraint cA = new Constraint("ArrangeClass");
				cA.addCondition("uuid", classEnrollment.getArrangeClassUuid());
				ArrangeClass arrangeClass = classService.selectArrangeClass(cA);

				String classStr[] = new String[2];
				classStr[0] = arrangeClass.getUuid();
				classStr[1] = arrangeClass.getClsNo();
				classList.add(classStr);
			}
			resultList.add(classList);
		}

		setResponseText(resultList);
	}
}
