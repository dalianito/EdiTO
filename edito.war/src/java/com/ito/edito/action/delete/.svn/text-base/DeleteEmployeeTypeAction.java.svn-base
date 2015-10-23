package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.schema.EmployeePerfType;
import com.ito.fai.util.JndiFactory;

public class DeleteEmployeeTypeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");

		String uuid = request.getParameter("uuid");
		String employeeUuid = request.getParameter("employeeUuid");

		List<EmployeePerfType> employeePerfTypeList = performanceService.selectEmployeePerfTypeDeleted(uuid, employeeUuid);

		ut.begin();
		try {
			for (int i = 0; i < employeePerfTypeList.size(); i++) {
				EmployeePerfType employeePerfType = employeePerfTypeList.get(i);
				performanceService.deleteEmployeePerfType(employeePerfType, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
