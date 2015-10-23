package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Campus;
import com.ito.fai.util.JndiFactory;

public class CreateCampusAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		Campus campus = (Campus) carrier.fetchInstance("Campus");
		campus.setIfUsing(true);

		ut.begin();
		try {
			if (campus.getUuid() == null) {
				campusService.insertCampus(campus, USER.getAccount());
			}
			else {
				campusService.updateCampus(campus, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
