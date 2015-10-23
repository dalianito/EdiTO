package com.ito.edito.action.query;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.InternetPublicity;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAllNetworkPropagandaInfoAction extends AjaxAction {
	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");

		Constraint c = new Constraint("InternetPublicity");
		c.addCondition("uuid", uuid);
		c.addCondition("ifUsing", true);
		InternetPublicity internetPublicity = campusService.selectInternetPublicity(c);
		if (internetPublicity != null) {
			map.put("NetworkInfo", internetPublicity);
		}
		setResponseText(map);
	}
}
