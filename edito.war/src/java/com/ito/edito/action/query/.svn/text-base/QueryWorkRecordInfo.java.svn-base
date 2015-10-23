package com.ito.edito.action.query;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.WorkRecord;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWorkRecordInfo extends AjaxAction {
	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String uuid = request.getParameter("uuid");

		Constraint c = new Constraint("WorkRecord");
		c.addCondition("uuid", uuid);
		c.addCondition("ifUsing", true);
		WorkRecord workRecord = campusService.selectWorkRecord(c);
		if (workRecord != null) {
			map.put("workRecordInfo", workRecord);
		}

		setResponseText(map);
	}
}
