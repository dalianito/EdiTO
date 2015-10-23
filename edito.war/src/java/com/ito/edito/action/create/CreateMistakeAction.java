package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Mistake.MistakeService;
import com.ito.edito.schema.Mistake;
import com.ito.fai.util.JndiFactory;

public class CreateMistakeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MistakeService mistakeService = (MistakeService) JndiFactory.lookup("mistakeService");

		Mistake mistake = (Mistake) carrier.fetchInstance("Mistake");
		mistake.setRecordTime(new Date());
		mistake.setRecorderUuid(EMPLOYEE.getUuid(), false);
		mistake.setIfUsing(true);

		String mistakeUuid = "";
		ut.begin();
		if (mistake.getUuid() != null) {
			mistakeUuid = mistake.getUuid();
			mistakeService.updateMistake(mistake, USER.getAccount());
		}
		else {
			mistakeUuid = mistakeService.insertMistake(mistake, USER.getAccount());
		}
		ut.commit();
		setResponseText(mistakeUuid);

	}
}
