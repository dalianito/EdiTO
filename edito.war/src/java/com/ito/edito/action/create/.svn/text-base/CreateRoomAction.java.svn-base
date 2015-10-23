package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Room;
import com.ito.fai.util.JndiFactory;

public class CreateRoomAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		Room room = (Room) carrier.fetchInstance("Room");
		room.setIfUsing(true);

		String classroomUuid = room.getUuid();
		ut.begin();
		try {
			if (classroomUuid != null) {
				classService.updateRoom(room, USER.getAccount());
			}
			else {
				classroomUuid = classService.insertRoom(room, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
