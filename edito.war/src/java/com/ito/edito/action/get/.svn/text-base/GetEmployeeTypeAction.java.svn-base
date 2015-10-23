package com.ito.edito.action.get;

import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.PerformanceType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeTypeAction extends AjaxAction {
	private String NO_TYPES_STATUS = "1";

	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Employee employee = userService.selectEmployeeByUuid(uuid);

		Constraint c = new Constraint("PerformanceType");
		c.addCondition("parentUuid", null);
		c.addOrderCondition("sequence", "asc");
		List<PerformanceType> performanceTypeList = performanceService.selectPerformanceTypes(c, uuid);

		if (performanceTypeList != null && performanceTypeList.size() > 0) {
			map.put("employeeName", employee.getPerson().getName());
			map.put("types", performanceTypeList);
		}
		else {
			map.put("employeeName", employee.getPerson().getName());
			map.put("types", NO_TYPES_STATUS);
		}

		setResponseText(map);
	}
}
