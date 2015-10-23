package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryClassInfosAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String clsNo = request.getParameter("clsNo");
		String clsTypeUuid = request.getParameter("clsTypeUuid");
		String courseName = request.getParameter("courseName");
		String campusUuid = request.getParameter("campusUuid");

		List<ArrangeClass> arrangeClassList = new ArrayList<ArrangeClass>();

		String sql = "select distinct A.* from ArrangeClass A, Course C ";
		sql += " where A.courseUuid = C.uuid and A.ifUsing = true ";

		if (clsNo != null && !clsNo.equals("")) {
			sql += " and A.clsNo like '%" + clsNo + "%' ";
		}
		if (clsTypeUuid != null && !clsTypeUuid.equals("")) {
			sql += " and A.clsTypeUuid = '" + clsTypeUuid + "' ";
		}
		if (courseName != null && !courseName.equals("")) {
			sql += " and C.courseName like '%" + courseName + "%' ";
		}
		if (campusUuid != null && !campusUuid.equals("")) {
			sql += " and A.campusUuid = '" + campusUuid + "' ";
		}

		Constraint c = new Constraint("ArrangeClass");
		c.addSQLCondition(sql, null);
		arrangeClassList = classService.selectArrangeClasses(c);

		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < arrangeClassList.size(); i++) {
			ArrangeClass arrangeClass = arrangeClassList.get(i);

			if (arrangeClass != null) {
				String str[] = new String[5];
				str[0] = arrangeClass.getUuid();
				str[1] = arrangeClass.getClsNo() != null ? arrangeClass.getClsNo() : "";
				str[2] = arrangeClass.getClsTypeUuid() != null ? arrangeClass.getClsType().getDescription() : "";
				str[3] = arrangeClass.getCampusUuid() != null ? arrangeClass.getCampus().getDescription() : "";
				str[4] = arrangeClass.getCourseUuid() != null ? arrangeClass.getCourse().getCourseName() : "";
				resultList.add(str);
			}
		}
		setResponseText(resultList);
	}
}
