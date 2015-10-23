package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryFindClassAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String arrangeClassUuid = request.getParameter("arrangeClassUuid");

		ArrangeClass arrangeClass = classService.selectArrangeClassByUuid(arrangeClassUuid);

		List<Object> resultList = new ArrayList<Object>();
		List<String[]> classList = new ArrayList<String[]>();
		List<String[]> courseList = new ArrayList<String[]>();

		String classStr[] = new String[7];
		classStr[0] = arrangeClass.getClsNo() != null ? arrangeClass.getClsNo() : "";
		classStr[1] = arrangeClass.getClsTypeUuid() != null ? arrangeClass.getClsType().getDescription() : "";
		classStr[2] = arrangeClass.getCourse().getCourseNo() != null ? arrangeClass.getCourse().getCourseNo() : "";
		classStr[3] = arrangeClass.getCourse().getCourseName() != null ? arrangeClass.getCourse().getCourseName() : "";
		classStr[4] = arrangeClass.getCourse().getCourseTypeUuid() != null ? arrangeClass.getCourse().getCourseType().getDescription() : "";
		classStr[5] = arrangeClass.getCampusUuid() != null ? arrangeClass.getCampus().getDescription() : "";
		classStr[6] = arrangeClass.getActualCost() != null ? arrangeClass.getActualCost() : "";
		classList.add(classStr);
		resultList.add(classList);

		Constraint c = new Constraint("TimePositionTeacherInfo");
		c.addCondition("bizDataUuid", arrangeClassUuid);
		List<TimePositionTeacherInfo> timePositionTeacherInfoList = classService.selectTimePositionTeacherInfos(c);
		for (int i = 0; i < timePositionTeacherInfoList.size(); i++) {
			String courseStr[] = new String[3];
			TimePositionTeacherInfo timePositionTeacherInfo = timePositionTeacherInfoList.get(i);

			courseStr[0] = timePositionTeacherInfo.getArrangeClsTimeUuid() != null ? timePositionTeacherInfo.getArrangeClsTime().getDescription() : "";
			courseStr[1] = timePositionTeacherInfo.getArrangeRmUuid() != null ? timePositionTeacherInfo.getArrangeRm().getClassroomName() : "";
			courseStr[2] = timePositionTeacherInfo.getArrangeClsTeacherUuid() != null ? timePositionTeacherInfo.getArrangeClsTeacher().getEmployee().getPerson().getName() : "";
			courseList.add(courseStr);
		}
		resultList.add(courseList);

		setResponseText(resultList);
	}
}
