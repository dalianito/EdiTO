package com.ito.edito.action.get;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.PosterInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetInternetPublicityAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String today = Constants.DATE_FORMAT_YMD.format(new Date());
		String uuid = request.getParameter("uuid");
		if (uuid != null) {
			InternetPublicity internetPublicity = campusService.selectInternetPublicityByUuid(uuid);
			Employee employee = userService.selectEmployeeByUuid(internetPublicity.getRecordUuid());
			Constraint constraint = new Constraint("PosterInfo");
			constraint.addCondition("bizDataUuid", uuid);
			List<PosterInfo> educationExpInfoList = campusService.selectPosterInfos(constraint);

			request.setAttribute("employee", employee);
			request.setAttribute("posterInfo", educationExpInfoList);
			request.setAttribute("internetPublicity", internetPublicity);
		}
		else if (EMPLOYEE.getUuid() != null) {
			Constraint c = new Constraint("InternetPublicity");
			c.addCondition("recordUuid", EMPLOYEE.getUuid());
			c.addCondition("recordTime", today + "%", Constraint.LIKE);
			c.addCondition("ifUsing", true);
			InternetPublicity internetPublicity = campusService.selectInternetPublicity(c);
			request.setAttribute("internetPublicity", internetPublicity);
		}
	}
}
