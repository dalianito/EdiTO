package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.InternetPublicity;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetViewWorkPropagandaAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");

		Constraint c = new Constraint("InternetPublicity");
		c.addCondition("uuid", uuid);
		c.addCondition("ifUsing", true);
		InternetPublicity internetPublicity = campusService.selectInternetPublicity(c);
		request.setAttribute("internetPublicity", internetPublicity);

	}
}
