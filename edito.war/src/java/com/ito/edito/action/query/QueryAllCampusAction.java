package com.ito.edito.action.query;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Campus;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAllCampusAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		Constraint c = new Constraint("Campus");
		c.addCondition("ifUsing", true);
		List<Campus> campusList = campusService.selectCampuss(c);

		setResponseText(campusList);
	}
}
