package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.SelfAssess;
import com.ito.fai.util.JndiFactory;

public class UpdateSelfAssessAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");

		SelfAssess selfAssess = campusService.selectSelfAssessByUuid(uuid);
		selfAssess.setIfUsing(false);

		ut.begin();
		try {
			if (selfAssess != null) {
				campusService.updateSelfAssess(selfAssess, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
