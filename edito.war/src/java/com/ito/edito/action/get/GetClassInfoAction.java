package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetClassInfoAction extends DefaultAction {
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		ArrangeClass arrangeClass = classService.selectArrangeClassByUuid(uuid);
		request.setAttribute("arrangeClass", arrangeClass);

		Constraint timePositionTeacherInfoC = new Constraint("TimePositionTeacherInfo");
		timePositionTeacherInfoC.addCondition("bizDataUuid", uuid);
		List<TimePositionTeacherInfo> timePositionTeacherInfoList = classService.selectTimePositionTeacherInfos(timePositionTeacherInfoC);
		request.setAttribute("timePositionTeacherInfoList", timePositionTeacherInfoList);
	}
}
