package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Mistake.MistakeService;
import com.ito.edito.schema.Mistake;
import com.ito.fai.util.JndiFactory;

public class DeleteMistakeAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		MistakeService mistakeService = (MistakeService) JndiFactory.lookup("mistakeService");

		String uuid = request.getParameter("uuid");

		Mistake mistake = mistakeService.selectMistakeByUuid(uuid);
		mistake.setIfUsing(false);

		ut.begin();
		mistakeService.updateMistake(mistake, USER.getAccount());
		ut.commit();
	}
}
