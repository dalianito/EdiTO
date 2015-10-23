package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Mistake.MistakeService;
import com.ito.edito.schema.Mistake;
import com.ito.fai.util.JndiFactory;

public class GetMistakeAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		MistakeService mistakeService = (MistakeService) JndiFactory.lookup("mistakeService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Mistake mistake = mistakeService.selectMistakeByUuid(uuid);
			request.setAttribute("mistake", mistake);
		}
	}
}
