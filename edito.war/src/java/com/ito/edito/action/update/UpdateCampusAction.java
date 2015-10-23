package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Campus;
import com.ito.fai.util.JndiFactory;

public class UpdateCampusAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		String uuid = request.getParameter("uuid");

		Campus campus = campusService.selectCampusByUuid(uuid);
		campus.setIfUsing(false);

		ut.begin();
		try {
			campusService.updateCampus(campus, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
