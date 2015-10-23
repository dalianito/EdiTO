package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ArrangeClassTime;
import com.ito.edito.schema.ArrangeClassTimeInfo;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryClassInfoAction extends AjaxAction  {
	public void executeManualUT() throws Exception {

	ClassService classService = (ClassService) JndiFactory.lookup("classService");

	List<Object> resultList = new ArrayList<Object>();
	String campusUuid = request.getParameter("campusUuid");
	String courseName = request.getParameter("courseName");
	String name = request.getParameter("data");
	
	Constraint arrangeClassTimeInfoC = new Constraint("ArrangeClassTimeInfo");
	List<ArrangeClassTimeInfo> arrangeClassTimeInfoList = classService.selectArrangeClassTimeInfos(arrangeClassTimeInfoC);
	for(int i=0; i<arrangeClassTimeInfoList.size(); i++) {
		boolean flag = true;
		Map<String, String> map = new HashMap<String, String>();
		ArrangeClassTimeInfo arrangeClassTimeInfo = arrangeClassTimeInfoList.get(i);
		ArrangeClassTime arrangeClassTime = classService.selectArrangeClassTimeByUuid(arrangeClassTimeInfo.getBizDataUuid());

		Constraint timePositionTeacherInfoC = new Constraint("TimePositionTeacherInfo");
		String sql = "";
		sql += "select distinct TPT.* ";
		sql += " from TimePositionTeacherInfo TPT ";
		if((name != null) && (name.length() > 0)) {
			sql += " , Teacher T, Employee E, Person P ";
		}
		sql += " where TPT.arrangeClsTimeUuid = '" + arrangeClassTime.getUuid() + "' ";
		if((name != null) && (name.length() > 0)) {
			sql += " and TPT.arrangeClsTeacherUuid = T.uuid and T.employeeUuid = E.uuid and E.personUuid = P.uuid and P.name like '%" + name + "%' ";
		}
		timePositionTeacherInfoC.addSQLCondition(sql, null);
		List<TimePositionTeacherInfo> timePositionTeacherInfos = classService.selectTimePositionTeacherInfos(timePositionTeacherInfoC);

		if(timePositionTeacherInfos.size() !=0){
			ArrangeClass arrangeClass = classService.selectArrangeClassByUuid(timePositionTeacherInfos.get(0).getBizDataUuid());
			if((campusUuid != null) && (campusUuid.length() > 0)) {
				if(arrangeClass.getCampusUuid().equals(campusUuid)) {
				}
				else	{
					flag = false;
				}
			}
			if((courseName != null) && (courseName.length() > 0)) {
				if(arrangeClass.getCourse().getCourseName().indexOf(courseName) == -1) {
					flag = false;
				}
			}
			if(flag) {
				map.put("title", arrangeClass.getCourse().getCourseName());
				map.put("start", Constants.DATE_FORMAT_YMD.format(arrangeClassTimeInfo.getArrangeClsDate())+"T"+arrangeClassTime.getClsStartTimeH()+":"+arrangeClassTime.getClsStartTimeM());
				map.put("end", Constants.DATE_FORMAT_YMD.format(arrangeClassTimeInfo.getArrangeClsDate())+"T"+arrangeClassTime.getClsFinishTimeH()+":"+arrangeClassTime.getClsFinishTimeM());
				resultList.add(map);
			}
		}
	}
	setResponseText(resultList);
	}
}
