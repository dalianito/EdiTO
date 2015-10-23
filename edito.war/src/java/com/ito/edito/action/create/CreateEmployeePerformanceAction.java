package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.schema.EmployeePerformance;
import com.ito.edito.schema.PerfAdmin;
import com.ito.edito.schema.PerfAttendance;
import com.ito.edito.schema.PerfBehaviour;
import com.ito.edito.schema.PerfChildren;
import com.ito.edito.schema.PerfDriver;
import com.ito.edito.schema.PerfFacility;
import com.ito.edito.schema.PerfFinancial;
import com.ito.edito.schema.PerfIncharge;
import com.ito.edito.schema.PerfLession;
import com.ito.edito.schema.PerfLongTerm;
import com.ito.edito.schema.PerfMaterial;
import com.ito.edito.schema.PerfObtain;
import com.ito.edito.schema.PerfOther;
import com.ito.edito.schema.PerfPropaganda;
import com.ito.edito.schema.PerfReception;
import com.ito.edito.schema.PerfRecruit;
import com.ito.edito.schema.PerfSecurityClean;
import com.ito.edito.schema.PerfShortTerm;
import com.ito.edito.schema.PerfTeaching;
import com.ito.fai.util.JndiFactory;

public class CreateEmployeePerformanceAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");

		EmployeePerformance employeePerformance = (EmployeePerformance) carrier.fetchInstance("EmployeePerformance");
		String employeePerformanceUuid = performanceService.insertEmployeePerformance(employeePerformance, USER.getAccount());

		PerfAttendance perfAttendance = (PerfAttendance) carrier.fetchInstance("PerfAttendance");
		if (perfAttendance != null) {
			perfAttendance.setPerformanceUuid(employeePerformanceUuid, false);
			perfAttendance.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfAttendance.setCheckTime(new Date());
			performanceService.insertPerfAttendance(perfAttendance, USER.getAccount());
		}

		PerfBehaviour perfBehaviour = (PerfBehaviour) carrier.fetchInstance("PerfBehaviour");
		if (perfBehaviour != null) {
			perfBehaviour.setPerformanceUuid(employeePerformanceUuid, false);
			perfBehaviour.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfBehaviour.setCheckTime(new Date());
			performanceService.insertPerfBehaviour(perfBehaviour, USER.getAccount());
		}

		PerfReception perfReception = (PerfReception) carrier.fetchInstance("PerfReception");
		if (perfReception != null) {
			perfReception.setPerformanceUuid(employeePerformanceUuid, false);
			perfReception.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfReception.setCheckTime(new Date());
			performanceService.insertPerfReception(perfReception, USER.getAccount());
		}

		PerfFacility perfFacility = (PerfFacility) carrier.fetchInstance("PerfFacility");
		if (perfFacility != null) {
			perfFacility.setPerformanceUuid(employeePerformanceUuid, false);
			perfFacility.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfFacility.setCheckTime(new Date());
			performanceService.insertPerfFacility(perfFacility, USER.getAccount());
		}

		PerfMaterial perfMaterial = (PerfMaterial) carrier.fetchInstance("PerfMaterial");
		if (perfMaterial != null) {
			perfMaterial.setPerformanceUuid(employeePerformanceUuid, false);
			perfMaterial.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfMaterial.setCheckTime(new Date());
			performanceService.insertPerfMaterial(perfMaterial, USER.getAccount());
		}

		PerfFinancial perfFinancial = (PerfFinancial) carrier.fetchInstance("PerfFinancial");
		if (perfFinancial != null) {
			perfFinancial.setPerformanceUuid(employeePerformanceUuid, false);
			perfFinancial.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfFinancial.setCheckTime(new Date());
			performanceService.insertPerfFinancial(perfFinancial, USER.getAccount());
		}

		PerfLession perfLession = (PerfLession) carrier.fetchInstance("PerfLession");
		if (perfLession != null) {
			perfLession.setPerformanceUuid(employeePerformanceUuid, false);
			perfLession.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfLession.setCheckTime(new Date());
			performanceService.insertPerfLession(perfLession, USER.getAccount());
		}

		PerfTeaching perfTeaching = (PerfTeaching) carrier.fetchInstance("PerfTeaching");
		if (perfTeaching != null) {
			perfTeaching.setPerformanceUuid(employeePerformanceUuid, false);
			perfTeaching.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfTeaching.setCheckTime(new Date());
			performanceService.insertPerfTeaching(perfTeaching, USER.getAccount());
		}

		PerfChildren perfChildren = (PerfChildren) carrier.fetchInstance("PerfChildren");
		if (perfChildren != null) {
			perfChildren.setPerformanceUuid(employeePerformanceUuid, false);
			perfChildren.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfChildren.setCheckTime(new Date());
			performanceService.insertPerfChildren(perfChildren, USER.getAccount());
		}

		PerfLongTerm perfLongTerm = (PerfLongTerm) carrier.fetchInstance("PerfLongTerm");
		if (perfLongTerm != null) {
			perfLongTerm.setPerformanceUuid(employeePerformanceUuid, false);
			perfLongTerm.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfLongTerm.setCheckTime(new Date());
			performanceService.insertPerfLongTerm(perfLongTerm, USER.getAccount());
		}

		PerfShortTerm perfShortTerm = (PerfShortTerm) carrier.fetchInstance("PerfShortTerm");
		if (perfShortTerm != null) {
			perfShortTerm.setPerformanceUuid(employeePerformanceUuid, false);
			perfShortTerm.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfShortTerm.setCheckTime(new Date());
			performanceService.insertPerfShortTerm(perfShortTerm, USER.getAccount());
		}

		PerfObtain perfObtain = (PerfObtain) carrier.fetchInstance("PerfObtain");
		if (perfObtain != null) {
			perfObtain.setPerformanceUuid(employeePerformanceUuid, false);
			perfObtain.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfObtain.setCheckTime(new Date());
			performanceService.insertPerfObtain(perfObtain, USER.getAccount());
		}

		PerfRecruit perfRecruit = (PerfRecruit) carrier.fetchInstance("PerfRecruit");
		if (perfRecruit != null) {
			perfRecruit.setPerformanceUuid(employeePerformanceUuid, false);
			perfRecruit.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfRecruit.setCheckTime(new Date());
			performanceService.insertPerfRecruit(perfRecruit, USER.getAccount());
		}

		PerfPropaganda perfPropaganda = (PerfPropaganda) carrier.fetchInstance("PerfPropaganda");
		if (perfPropaganda != null) {
			perfPropaganda.setPerformanceUuid(employeePerformanceUuid, false);
			perfPropaganda.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfPropaganda.setCheckTime(new Date());
			performanceService.insertPerfPropaganda(perfPropaganda, USER.getAccount());
		}

		PerfAdmin perfAdmin = (PerfAdmin) carrier.fetchInstance("PerfAdmin");
		if (perfAdmin != null) {
			perfAdmin.setPerformanceUuid(employeePerformanceUuid, false);
			perfAdmin.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfAdmin.setCheckTime(new Date());
			performanceService.insertPerfAdmin(perfAdmin, USER.getAccount());
		}

		PerfIncharge perfIncharge = (PerfIncharge) carrier.fetchInstance("PerfIncharge");
		if (perfIncharge != null) {
			perfIncharge.setPerformanceUuid(employeePerformanceUuid, false);
			perfIncharge.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfIncharge.setCheckTime(new Date());
			performanceService.insertPerfIncharge(perfIncharge, USER.getAccount());
		}

		PerfDriver perfDriver = (PerfDriver) carrier.fetchInstance("PerfDriver");
		if (perfDriver != null) {
			perfDriver.setPerformanceUuid(employeePerformanceUuid, false);
			perfDriver.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfDriver.setCheckTime(new Date());
			performanceService.insertPerfDriver(perfDriver, USER.getAccount());
		}

		PerfSecurityClean perfSecurityClean = (PerfSecurityClean) carrier.fetchInstance("PerfSecurityClean");
		if (perfSecurityClean != null) {
			perfSecurityClean.setPerformanceUuid(employeePerformanceUuid, false);
			perfSecurityClean.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfSecurityClean.setCheckTime(new Date());
			performanceService.insertPerfSecurityClean(perfSecurityClean, USER.getAccount());
		}

		PerfOther perfOther = (PerfOther) carrier.fetchInstance("PerfOther");
		if (perfOther != null) {
			perfOther.setPerformanceUuid(employeePerformanceUuid, false);
			perfOther.setCheckerUuid(EMPLOYEE.getUuid(), false);
			perfOther.setCheckTime(new Date());
			performanceService.insertPerfOther(perfOther, USER.getAccount());
		}
	}
}
