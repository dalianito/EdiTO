package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.LeaveApplication;
import com.ito.fai.util.JndiFactory;

public class GetWechatForwardApprovalLeaveAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String uuid = request.getParameter("uuid");
		String employeeUuid = request.getParameter("employeeUuid");
		String authorityLevel = request.getParameter("authorityLevel");

		request.setAttribute("employeeUuid", employeeUuid);
		request.setAttribute("authorityLevel", authorityLevel);
		if (uuid != null) {
			LeaveApplication leaveApplication = applyService.selectLeaveApplicationByUuid(uuid);
			request.setAttribute("leaveApplication", leaveApplication);
		}
	}
}
