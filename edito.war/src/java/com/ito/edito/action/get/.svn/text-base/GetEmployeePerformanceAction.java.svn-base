package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
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
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeePerformanceAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");

		String employeeUuid = request.getParameter("uuid");
		String month = request.getParameter("resultCode");

		Constraint employeePerformanceC = new Constraint("EmployeePerformance");
		employeePerformanceC.addCondition("employeeUuid", employeeUuid);
		employeePerformanceC.addCondition("month", month);
		EmployeePerformance employeePerformance = performanceService.selectEmployeePerformance(employeePerformanceC);
		request.setAttribute("employee", employeePerformance.getEmployee());
		request.setAttribute("month", month);

		Constraint perfAttendanceC = new Constraint("PerfAttendance");
		perfAttendanceC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfAttendance perfAttendance = performanceService.selectPerfAttendance(perfAttendanceC);
		if (perfAttendance != null) {
			request.setAttribute("perfAttendance", perfAttendance);
		}

		Constraint perfBehaviourC = new Constraint("PerfBehaviour");
		perfBehaviourC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfBehaviour perfBehaviour = performanceService.selectPerfBehaviour(perfBehaviourC);
		if (perfBehaviour != null) {
			request.setAttribute("perfBehaviour", perfBehaviour);
		}

		Constraint perfReceptionC = new Constraint("PerfReception");
		perfReceptionC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfReception perfReception = performanceService.selectPerfReception(perfReceptionC);
		if (perfReception != null) {
			request.setAttribute("perfReception", perfReception);
		}

		Constraint perfFacilityC = new Constraint("PerfFacility");
		perfFacilityC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfFacility perfFacility = performanceService.selectPerfFacility(perfFacilityC);
		if (perfFacility != null) {
			request.setAttribute("perfFacility", perfFacility);
		}

		Constraint perfMaterialC = new Constraint("PerfMaterial");
		perfMaterialC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfMaterial perfMaterial = performanceService.selectPerfMaterial(perfMaterialC);
		if (perfMaterial != null) {
			request.setAttribute("perfMaterial", perfMaterial);
		}

		Constraint perfFinancialC = new Constraint("PerfFinancial");
		perfFinancialC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfFinancial perfFinancial = performanceService.selectPerfFinancial(perfFinancialC);
		if (perfFinancial != null) {
			request.setAttribute("perfFinancial", perfFinancial);
		}

		Constraint perfLessionC = new Constraint("PerfLession");
		perfLessionC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfLession perfLession = performanceService.selectPerfLession(perfLessionC);
		if (perfLession != null) {
			request.setAttribute("perfLession", perfLession);
		}

		Constraint perfTeachingC = new Constraint("PerfTeaching");
		perfTeachingC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfTeaching perfTeaching = performanceService.selectPerfTeaching(perfTeachingC);
		if (perfTeaching != null) {
			request.setAttribute("perfTeaching", perfTeaching);
		}

		Constraint perfChildrenC = new Constraint("PerfChildren");
		perfChildrenC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfChildren perfChildren = performanceService.selectPerfChildren(perfChildrenC);
		if (perfChildren != null) {
			request.setAttribute("perfChildren", perfChildren);
		}

		Constraint perfLongTermC = new Constraint("PerfLongTerm");
		perfLongTermC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfLongTerm perfLongTerm = performanceService.selectPerfLongTerm(perfLongTermC);
		if (perfLongTerm != null) {
			request.setAttribute("perfLongTerm", perfLongTerm);
		}

		Constraint perfShortTermC = new Constraint("PerfShortTerm");
		perfShortTermC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfShortTerm perfShortTerm = performanceService.selectPerfShortTerm(perfShortTermC);
		if (perfShortTerm != null) {
			request.setAttribute("perfShortTerm", perfShortTerm);
		}

		Constraint perfObtainC = new Constraint("PerfObtain");
		perfObtainC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfObtain perfObtain = performanceService.selectPerfObtain(perfObtainC);
		if (perfObtain != null) {
			request.setAttribute("perfObtain", perfObtain);
		}

		Constraint perfRecruitC = new Constraint("PerfRecruit");
		perfRecruitC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfRecruit perfRecruit = performanceService.selectPerfRecruit(perfRecruitC);
		if (perfRecruit != null) {
			request.setAttribute("perfRecruit", perfRecruit);
		}

		Constraint perfPropagandaC = new Constraint("PerfPropaganda");
		perfPropagandaC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfPropaganda perfPropaganda = performanceService.selectPerfPropaganda(perfPropagandaC);
		if (perfPropaganda != null) {
			request.setAttribute("perfPropaganda", perfPropaganda);
		}

		Constraint perfAdminC = new Constraint("PerfAdmin");
		perfAdminC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfAdmin perfAdmin = performanceService.selectPerfAdmin(perfAdminC);
		if (perfAdmin != null) {
			request.setAttribute("perfAdmin", perfAdmin);
		}

		Constraint perfInchargeC = new Constraint("PerfIncharge");
		perfInchargeC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfIncharge perfIncharge = performanceService.selectPerfIncharge(perfInchargeC);
		if (perfIncharge != null) {
			request.setAttribute("perfIncharge", perfIncharge);
		}

		Constraint perfDriverC = new Constraint("PerfDriver");
		perfDriverC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfDriver perfDriver = performanceService.selectPerfDriver(perfDriverC);
		if (perfDriver != null) {
			request.setAttribute("perfDriver", perfDriver);
		}

		Constraint perfSecurityCleanC = new Constraint("PerfSecurityClean");
		perfSecurityCleanC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfSecurityClean perfSecurityClean = performanceService.selectPerfSecurityClean(perfSecurityCleanC);
		if (perfSecurityClean != null) {
			request.setAttribute("perfSecurityClean", perfSecurityClean);
		}

		Constraint perfOtherC = new Constraint("PerfOther");
		perfOtherC.addCondition("performanceUuid", employeePerformance.getUuid());
		PerfOther perfOther = performanceService.selectPerfOther(perfOtherC);
		if (perfOther != null) {
			request.setAttribute("perfOther", perfOther);
		}
	}
}
