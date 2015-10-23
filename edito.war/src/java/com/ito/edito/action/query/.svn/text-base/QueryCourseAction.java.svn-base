package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Course;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.schema.JdoVirtual;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryCourseAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String courseNo = request.getParameter("courseNo");
		String courseName = request.getParameter("courseName");
		String courseTypeUuid = request.getParameter("courseTypeUuid");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");
		String uuids = null;

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Course C ";
		String sqlSelect = "select C.* from Course C ";
		String sqlCondition = "where C.ifUsing = true ";

		if(courseNo != null && courseNo.length() > 0) {
			sqlCondition += "and C.courseNo = '" + courseNo + "' ";
		}
		if(courseName != null && courseName.length() > 0) {
			sqlCondition += "and C.courseName like '%" + courseName + "%' ";
		}
		if(courseTypeUuid != null && courseTypeUuid.length() > 0) {
			String uuid = courseTypeUuid;
			uuids = getUuids(uuid);
			sqlCondition += "and C.courseTypeUuid in (" + uuids.substring(0,uuids.length() - 1) + ") ";
		}

		sqlCount += sqlCondition + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sqlSelect += sqlCondition;
		sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint courseC = new Constraint("Course");
		courseC.addSQLCondition(sqlSelect, null);
		List<Course> list = classService.selectCourses(courseC);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Course course = list.get(i);
			String[] str = new String[5];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = course.getCourseNo() != null ? course.getCourseNo(): "";
		    str[2] = course.getCourseName() != null ? course.getCourseName() :"";
	        str[3] = course.getCourseTypeUuid() != null ? course.getCourseType().getDescription() : "";
	        str[4] = course.getUuid() != null ? course.getUuid(): "";
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
	public String getUuids(String uuid) throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		CourseCategoryType courseCategoryType = classService.selectCourseCategoryTypeByUuid(uuid);
		if(courseCategoryType.getIfHasChild() == true)
		{
			return "'"+uuid+"',"+getChildren(uuid);
			
		}
		else{
			return "'"+uuid+"',";
		}
	}
	public String getChildren(String uuid) throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		Constraint courseCategoryTypeC = new Constraint("CourseCategoryType");
		courseCategoryTypeC.addCondition("parentUuid", uuid);
		courseCategoryTypeC.addCondition("ifUsing", true);
		List<CourseCategoryType> list = classService.selectCourseCategoryTypes(courseCategoryTypeC);
		String tempUuids = "";
		for(int j=0; j<list.size(); j++){
			CourseCategoryType courseCategoryType = list.get(j);
			if(courseCategoryType.getIfHasChild() == true) {
				tempUuids += getChildren(courseCategoryType.getUuid());
			}
			else {
			}
			tempUuids += "'"+courseCategoryType.getUuid()+"',";
		}
		return tempUuids;
	}
}
