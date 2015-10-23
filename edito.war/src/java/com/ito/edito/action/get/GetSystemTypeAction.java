package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.schema.PerformanceType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetSystemTypeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");

		Constraint c = new Constraint("PerformanceType");
		c.addCondition("parentUuid", null);
		c.addOrderCondition("sequence", "asc");
		List<PerformanceType> performanceTypeList = performanceService.selectAllPerformanceTypes(c);

		setResponseText(performanceTypeList);
	}
}
