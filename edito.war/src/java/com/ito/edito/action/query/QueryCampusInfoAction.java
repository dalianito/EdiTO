package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Employee;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryCampusInfoAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		Constraint c = new Constraint("Campus");
		c.addCondition("ifUsing", true);
		c.addOrderCondition("sequence", "asc");
		List<Campus> campusList = campusService.selectCampuss(c);

		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < campusList.size(); i++) {
			Campus campus = campusList.get(i);
			String[] str = new String[7];
			str[0] = campus.getDescription() != null ? campus.getDescription() : "";
			str[1] = campus.getAddress() != null ? campus.getAddress() : "";
			str[2] = campus.getContact() != null ? campus.getContact() : "";
			str[3] = campus.getTelephone() != null ? campus.getTelephone() : "";
			str[4] = "";
			if (campus.getHeadmasterUuid() != null) {
				Employee employee = userService.selectEmployeeByUuid(campus.getHeadmasterUuid());
				str[4] = employee.getPerson().getName();
			}
			str[5] = campus.getInstruction() != null ? campus.getInstruction().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;") : "";
			str[6] = campus.getUuid();

			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
