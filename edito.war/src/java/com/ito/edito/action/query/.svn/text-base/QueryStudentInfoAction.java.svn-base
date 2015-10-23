package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryStudentInfoAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String cellPhone = request.getParameter("cellPhone");
		String tag = request.getParameter("tag");
		boolean flag = true;

		List<Person> personList = new ArrayList<Person>();
		Constraint cP = new Constraint("Person");

		if (name != null && !name.equals("")) {
			cP.addCondition("name", "%" + name + "%", Constraint.LIKE);
		}
		if (cellPhone != null && !cellPhone.equals("")) {
			cP.addCondition("cellPhone", cellPhone);
		}
		if (birthDate != null && !birthDate.equals("")) {
			flag = false;
		}
		personList = userService.selectPersons(cP);

		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < personList.size(); i++) {
			Person person = personList.get(i);

			if (flag) {
				Constraint cS = new Constraint("Student");
				cS.addCondition("personUuid", person.getUuid());
				Student student = userService.selectStudent(cS);

				String str[] = new String[7];
				if (tag.equals("person")) {
					if (student != null) {
						str[0] = student.getUuid();
						str[1] = student.getStudentID() != null ? student.getStudentID() : "";
					}
					else {
						str[0] = "";
						str[1] = "";
					}
					str[2] = person.getName() != null ? person.getName() : "";
					str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
					str[4] = person.getBirthDate() != null ? Constants.DATE_FORMAT_YMD.format(person.getBirthDate()) : "";
					str[5] = person.getCellPhone() != null ? person.getCellPhone() : "";
					str[6] = person.getUuid();
				}
				else {
					if (student != null) {
						Constraint cC = new Constraint("ClassEnrollment");
						cC.addCondition("studentUuid", student.getUuid());
						cC.addCondition("enrollmentStateUuid", Constants.STUDENT_APPLY);
						List<ClassEnrollment> classEnrollmentList = classService.selectClassEnrollments(cC);
						if (classEnrollmentList.size() > 0) {
							str[0] = student.getUuid();
							str[1] = student.getStudentID();
							str[2] = person.getName() != null ? person.getName() : "";
							str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
							str[4] = person.getBirthDate() != null ? Constants.DATE_FORMAT_YMD.format(person.getBirthDate()) : "";
							str[5] = person.getCellPhone() != null ? person.getCellPhone() : "";
							str[6] = person.getUuid();
						}
					}
				}
				resultList.add(str);
			}
			else {
				String date = "";
				if (person.getBirthDate() != null && !person.getBirthDate().equals("")) {
					date = Constants.DATE_FORMAT_YMD.format(person.getBirthDate());
				}
				if (date.equals(birthDate)) {
					Constraint cS = new Constraint("Student");
					cS.addCondition("personUuid", person.getUuid());
					Student student = userService.selectStudent(cS);

					String str[] = new String[7];
					if (tag.equals("person")) {
						if (student != null) {
							str[0] = student.getUuid();
							str[1] = student.getStudentID() != null ? student.getStudentID() : "";
						}
						else {
							str[0] = "";
							str[1] = "";
						}
						str[2] = person.getName() != null ? person.getName() : "";
						str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
						str[4] = person.getBirthDate() != null ? Constants.DATE_FORMAT_YMD.format(person.getBirthDate()) : "";
						str[5] = person.getCellPhone() != null ? person.getCellPhone() : "";
						str[6] = person.getUuid();
					}
					else {
						if (student != null) {
							Constraint cC = new Constraint("ClassEnrollment");
							cC.addCondition("studentUuid", student.getUuid());
							cC.addCondition("enrollmentStateUuid", Constants.STUDENT_APPLY);
							List<ClassEnrollment> classEnrollmentList = classService.selectClassEnrollments(cC);
							if (classEnrollmentList.size() > 0) {
								str[0] = student.getUuid();
								str[1] = student.getStudentID();
								str[2] = person.getName() != null ? person.getName() : "";
								str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
								str[4] = person.getBirthDate() != null ? Constants.DATE_FORMAT_YMD.format(person.getBirthDate()) : "";
								str[5] = person.getCellPhone() != null ? person.getCellPhone() : "";
								str[6] = person.getUuid();
							}
						}
					}
					resultList.add(str);
				}
			}
		}
		setResponseText(resultList);
	}
}
