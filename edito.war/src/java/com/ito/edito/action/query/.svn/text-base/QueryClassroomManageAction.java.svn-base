package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Classroom;
import com.ito.edito.schema.JdoVirtual;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryClassroomManageAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String classroomType = request.getParameter("classroomType");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sql = "select distinct C.* from Classroom C where C.ifUsing = true and C.campusUuid = '" + EMPLOYEE.getCampusUuid() + "'";
		Constraint c = new Constraint("Classroom");
		c.addCondition("campusUuid", EMPLOYEE.getCampusUuid());
		c.addCondition("ifUsing", true);
		if (classroomType != null && !classroomType.equals("")) {
			sql += " and C.classroomTypeUuid like '%" + classroomType + "%' ";
			c.addCondition("classroomTypeUuid", classroomType);
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct C.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		c.addLimitedCondition(Integer.parseInt(offset) - 1, Constraint.OFFSET);
		c.addLimitedCondition(Integer.parseInt(recnum), Constraint.LIMIT);

		List<Classroom> list = campusService.selectClassrooms(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Classroom classroom = list.get(i);

			String[] str = new String[5];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = Integer.toString(classroom.getDoorplate());
			str[2] = Integer.toString(classroom.getNumberOf());
			str[3] = classroom.getClassroomType().getDescription();
			str[4] = classroom.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
