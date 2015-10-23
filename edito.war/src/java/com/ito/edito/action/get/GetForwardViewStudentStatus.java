package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetForwardViewStudentStatus extends DefaultAction {

	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			ClassEnrollment classEnrollment = classService.selectClassEnrollmentByUuid(uuid);
			Student student = classEnrollment.getStudent();
			request.setAttribute("student", student);
			Person person = student.getPerson();
			request.setAttribute("person", person);

			ArrangeClass arrangeClass = classEnrollment.getArrangeClass();

			Constraint TimePositionTeacherInfo = new Constraint("TimePositionTeacherInfo");
			TimePositionTeacherInfo.addCondition("bizDataUuid", arrangeClass.getUuid());
			List<TimePositionTeacherInfo> list = classService.selectTimePositionTeacherInfos(TimePositionTeacherInfo);

			request.setAttribute("timePositionTeacherInfoList", list);
			request.setAttribute("classEnrollment", classEnrollment);

		}
	}
}
