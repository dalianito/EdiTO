package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.LeaveType;
import com.ito.fai.util.JndiFactory;

public class GetLeaveNotesAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");
		if (uuid != null && uuid.length() > 0) {
			LeaveType leaveType = campusService.selectLeaveTypeByUuid(uuid);
			setResponseText(leaveType.getNotes());
		}
	}
}
