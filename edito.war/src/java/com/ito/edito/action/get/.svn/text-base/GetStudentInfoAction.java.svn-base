package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.EducationExpInfo;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetStudentInfoAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Person person = userService.selectPersonByUuid(uuid);
			request.setAttribute("person", person);
			Constraint studentC = new Constraint("Student");
			studentC.addCondition("personUuid", uuid);
			Student student = userService.selectStudent(studentC);
			if (student != null) {
				request.setAttribute("student", student);
			}
			else {
				request.setAttribute("student", "");
			}

			if (student != null) {
				Constraint classEnrollmentC = new Constraint("ClassEnrollment");
				classEnrollmentC.addCondition("studentUuid", student.getUuid());
				classEnrollmentC.addCondition("enrollmentStateUuid", Constants.STUDENT_APPLY);
				List<ClassEnrollment> classEnrollmentList = classService.selectClassEnrollments(classEnrollmentC);
				request.setAttribute("classEnrollmentList", classEnrollmentList);
			}

			Constraint educationExpInfoC = new Constraint("EducationExpInfo");
			educationExpInfoC.addCondition("bizDataUuid", uuid);
			List<EducationExpInfo> educationExpInfoList = userService.selectEducationExpInfos(educationExpInfoC);
			request.setAttribute("educationExpInfoList", educationExpInfoList);

		}
	}
}
