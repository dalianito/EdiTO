package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Teacher.TeacherService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.Teacher;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryTeacherInfosAction extends AjaxAction{
	public void executeManualUT() throws Exception {
		TeacherService teacherService  = (TeacherService) JndiFactory.lookup("teacherService");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid= request.getParameter("uuid");

		Constraint teacherC = new Constraint("Teacher");
		if(uuid != null && uuid.length() >0) {
			teacherC.addCondition("uuid", uuid);
		}
		teacherC.addCondition("ifUsing", true);
		List<Teacher> teacherList = teacherService.selectTeachers(teacherC);
		List<String[]> resultList = new ArrayList<String[]>();
		for(int i=0; i<teacherList.size(); i++) {
			Teacher teacher = teacherList.get(i);
			String []str = new String[6];
			str[0] = teacher.getUuid();
			str[1] = teacher.getEmployee().getPerson().getPersonNo() != null ? teacher.getEmployee().getPerson().getPersonNo() : "";
			str[2] = teacher.getEmployee().getPerson().getName() != null ? teacher.getEmployee().getPerson().getName() : "";
			str[3] = teacher.getTeacherTypeUuid() != null? teacher.getTeacherType().getDescription() : "" ;
			str[4] = teacher.getEmployee().getCampusUuid() != null? teacher.getEmployee().getCampus().getDescription() : "";
			str[5] = "";
			Constraint timePositionTeacherInfoC = new Constraint("TimePositionTeacherInfo");
			timePositionTeacherInfoC.addCondition("arrangeClsTeacherUuid", str[0]);
			List<TimePositionTeacherInfo> TimePositionTeacherInfoList =  classService.selectTimePositionTeacherInfos(timePositionTeacherInfoC);
			for(int j=0; j<TimePositionTeacherInfoList.size(); j++) {
				TimePositionTeacherInfo timePositionTeacherInfo = TimePositionTeacherInfoList.get(j);
				ArrangeClass arrangeClass = classService.selectArrangeClassByUuid(timePositionTeacherInfo.getBizDataUuid());
				str[5] += arrangeClass.getClsNo() != null ? arrangeClass.getClsNo() : "";
				str[5] += "	   ";
				str[5] += timePositionTeacherInfo.getArrangeClsTime().getClsStartTimeH() + "：" + timePositionTeacherInfo.getArrangeClsTime().getClsStartTimeM();
				str[5] += "-";
				str[5] += timePositionTeacherInfo.getArrangeClsTime().getClsFinishTimeH() + "：" + timePositionTeacherInfo.getArrangeClsTime().getClsFinishTimeM();
				str[5] += "	   ";
				str[5] += timePositionTeacherInfo.getArrangeRm().getClassroomName() + "[" + timePositionTeacherInfo.getArrangeRm().getCampus().getDescription() + "]";
				str[5] += "<br>";
			}
			resultList.add(str);
		}
		setResponseText(resultList);
	}
}
