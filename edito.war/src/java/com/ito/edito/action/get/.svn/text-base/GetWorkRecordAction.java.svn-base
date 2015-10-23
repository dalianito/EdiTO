package com.ito.edito.action.get;

import java.util.Date;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWorkRecordAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String today = Constants.DATE_FORMAT_YMD.format(new Date());

		Constraint c = new Constraint("WorkRecord");
		c.addCondition("recordUuid", EMPLOYEE.getUuid());
		c.addCondition("recordTime", today + "%", Constraint.LIKE);
		c.addCondition("ifUsing", true);
		WorkRecord workRecord = campusService.selectWorkRecord(c);
		request.setAttribute("workRecord", workRecord);

	}
}
