package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Room;
import com.ito.fai.util.JndiFactory;

public class DeleteRoomAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		Room room = classService.selectRoomByUuid(uuid);
		room.setIfUsing(false);

		ut.begin();
		classService.updateRoom(room, USER.getAccount());
		ut.commit();
	}
}
