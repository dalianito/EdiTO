package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.PublicityApplication;
import com.ito.fai.util.JndiFactory;

public class GetPublicityApplyAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		String uuid = request.getParameter("uuid");
		if (uuid != null && uuid.length() > 0) {
			PublicityApplication publicityApplication = applyService.selectPublicityApplicationByUuid(uuid);
			request.setAttribute("publicityApplication", publicityApplication);
		}
	}
}
