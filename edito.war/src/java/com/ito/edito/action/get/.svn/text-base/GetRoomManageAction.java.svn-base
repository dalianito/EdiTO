package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Room;
import com.ito.fai.util.JndiFactory;

public class GetRoomManageAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Room room = classService.selectRoomByUuid(uuid);
			request.setAttribute("room", room);
		}
	}
}
