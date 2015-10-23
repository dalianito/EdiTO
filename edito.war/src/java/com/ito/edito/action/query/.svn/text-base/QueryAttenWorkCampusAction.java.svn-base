package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.Campus;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAttenWorkCampusAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		Constraint c = new Constraint("Campus");
		if ((!EMPLOYEE.getJobUuid().equals(Constants.ADMIN_JOB_UUID)) && (!EMPLOYEE.getJobUuid().equals(Constants.SYS_JOB_UUID)) && (!EMPLOYEE.getJobUuid().equals(Constants.HR_JOB_UUID))) {
			c.addCondition("uuid", EMPLOYEE.getCampusUuid());
		}
		c.addCondition("ifUsing", true);
		c.addOrderCondition("sequence", "asc");
		List<Campus> campusList = campusService.selectCampuss(c);

		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < campusList.size(); i++) {
			Campus campus = campusList.get(i);
			String[] str = new String[2];
			str[0] = campus.getDescription() != null ? campus.getDescription() : "";
			str[1] = campus.getUuid();

			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
