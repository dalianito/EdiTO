package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Room;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryRoomManageAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		ClassService classService  = (ClassService) JndiFactory.lookup("classService");

		String campusUuid = request.getParameter("campusUuid");
		String numberOf = request.getParameter("numberOf");
		String classroomName = request.getParameter("classroomName");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Room R    ";
		String sqlSelect = "select distinct R.* from Room R ";
		String sqlCondition = " where  R.ifUsing = true  ";
		if (campusUuid != null && !campusUuid.equals("")) {
			sqlCondition += " and R.campusUuid = '" + campusUuid + "' ";
		}
		if (numberOf != null && !numberOf.equals("")) {
			sqlCondition += " and R.numberOf = '" + numberOf + "' ";
		}
		if (classroomName != null && !classroomName.equals("")) {
			sqlCondition += " and R.classroomName like '%" + classroomName + "%' ";
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
		sqlSelect += " limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;
		
		Constraint c = new Constraint("Room");
		c.addSQLCondition(sqlSelect, null);
		List<Room> list = classService.selectRooms(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Room room = list.get(i);

			String[] str = new String[5];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = room.getClassroomName();
			str[2] = Integer.toString(room.getNumberOf());
			str[3] = room.getCampus().getDescription();
			str[4] = room.getUuid();
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
