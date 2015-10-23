package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryClassAction extends AjaxAction  {
	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String clsNo = request.getParameter("clsNo");
		String courseNo = request.getParameter("courseNo");
		String clsTeacher = request.getParameter("clsTeacher");
		String arrangeClsTypeUuid = request.getParameter("arrangeClsTypeUuid");
		String campusUuid = request.getParameter("campusUuid");
		String courseCategoryTypeUuid = request.getParameter("courseCategoryTypeUuid");
		String classStateUuid = request.getParameter("classStateUuid");
		String clsName = request.getParameter("clsName");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");
		String uuids = null;

		String sql = "select distinct A.* from ArrangeClass A, Course C ";
		if (clsTeacher != null && clsTeacher.length() > 0) {
			sql += " , TimePositionTeacherInfo TP, Teacher T, Employee E, Person P ";
		}
		sql += " where A.courseUuid = C.Uuid and A.ifUsing = true ";

		if (clsTeacher != null && clsTeacher.length() > 0) {
			sql += " and TP.bizDataUuid = A.Uuid and TP.arrangeClsTeacherUuid = T.Uuid and T.employeeUuid = E.Uuid and E.personUuid = P.uuid";
			sql += " and P.name like '%" + clsTeacher + "%' ";
		}
		if (courseNo != null && courseNo.length() > 0) {
			sql += " and C.courseNo like '%" + courseNo + "%' ";
		}
		if (clsName != null && clsName.length() > 0) {
			sql += " and C.courseName like '%" + clsName + "%' ";
		}
		if (clsNo != null && clsNo.length() > 0) {
			sql += " and A.clsNo like '%" + clsNo + "%' ";
		}
		if (arrangeClsTypeUuid != null && arrangeClsTypeUuid.length() > 0) {
			sql += " and A.clsTypeUuid = '" + arrangeClsTypeUuid + "' ";
		}
		if (campusUuid != null && campusUuid.length() > 0) {
			sql += " and A.campusUuid = '" + campusUuid + "' ";
		}
		if (courseCategoryTypeUuid != null && courseCategoryTypeUuid.length() > 0) {
			String uuid = courseCategoryTypeUuid;
			uuids = getUuids(uuid);
			sql += "and C.courseTypeUuid in (" + uuids.substring(0,uuids.length() - 1) + ") ";
		}
		if (classStateUuid != null && !classStateUuid.equals("")) {
			sql += " and A.classStateUuid = '" + classStateUuid + "' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += " order by A.clsNo asc ";
		sql += " limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;
		Constraint c1 = new Constraint("ArrangeClass");
		c1.addSQLCondition(sql, null);
		List<ArrangeClass> ArrangeClassesTempN = classService.selectArrangeClasses(c1);

		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < ArrangeClassesTempN.size(); i++) {
			ArrangeClass arrangeClass = ArrangeClassesTempN.get(i);
			String[] str = new String[11];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = arrangeClass.getUuid();
			str[2] = arrangeClass.getClsNo() != null ? arrangeClass.getClsNo() : "";
			str[3] = arrangeClass.getCourseUuid() != null ? arrangeClass.getCourse().getCourseName() : "";
			str[4] = arrangeClass.getClsType() != null ? arrangeClass.getClsType().getDescription() : "";
			str[5] = arrangeClass.getCampusUuid() != null ? arrangeClass.getCampus().getDescription() : "";
			str[6] = arrangeClass.getCourse().getCourseType() != null ? arrangeClass.getCourse().getCourseType().getDescription() :"";
			str[7] = arrangeClass.getClassStateUuid() != null ? arrangeClass.getClassState().getDescription() : "";
			str[8] = arrangeClass.getCourse().getCourseNo() != null ? arrangeClass.getCourse().getCourseNo() :"";
			str[9] = arrangeClass.getMaxNoP() != null ? arrangeClass.getMaxNoP() :"";

			Constraint classEnrollmentc = new Constraint("ClassEnrollment");
			classEnrollmentc.addCondition("arrangeClassUuid", str[1]);
			classEnrollmentc.addCondition("enrollmentStateUuid", Constants.STUDENT_APPLY);
			List<ClassEnrollment> classEnrollmentList = classService.selectClassEnrollments(classEnrollmentc);
			str[10] = String.valueOf(classEnrollmentList.size());

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
