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

public class GetStudentAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Student student = userService.selectStudentByUuid(uuid);
			request.setAttribute("student", student);
			Person person = student.getPerson();
			request.setAttribute("person", person);

			Constraint classEnrollmentC = new Constraint("ClassEnrollment");
			classEnrollmentC.addCondition("studentUuid", student.getUuid());
			classEnrollmentC.addCondition("enrollmentStateUuid", Constants.STUDENT_APPLY);
			List<ClassEnrollment> classEnrollmentList = classService.selectClassEnrollments(classEnrollmentC);
			request.setAttribute("classEnrollmentList", classEnrollmentList);

			Constraint educationExpInfoC = new Constraint("EducationExpInfo");
			educationExpInfoC.addCondition("bizDataUuid", person.getUuid());
			List<EducationExpInfo> educationExpInfoList = userService.selectEducationExpInfos(educationExpInfoC);
			request.setAttribute("educationExpInfoList", educationExpInfoList);

		}
	}
}
