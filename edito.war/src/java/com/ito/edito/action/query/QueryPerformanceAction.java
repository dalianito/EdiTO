package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Attendance.AttendanceService;
import com.ito.edito.ejb.BehaviourStandard.BehaviourStandardService;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.schema.Attendance;
import com.ito.edito.schema.BehaviourStandard;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.JobPerfType;
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
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryPerformanceAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");
		AttendanceService attendanceService = (AttendanceService) JndiFactory.lookup("attendanceService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		BehaviourStandardService behaviourStandardService = (BehaviourStandardService) JndiFactory.lookup("behaviourStandardService");

		String month = request.getParameter("month");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String mark = "false";

		Constraint jobPerfTypeC = new Constraint("JobPerfType");
		jobPerfTypeC.addCondition("jobUuid", EMPLOYEE.getJobUuid());
		List<JobPerfType> jobPerfTypeList = performanceService.selectJobPerfTypes(jobPerfTypeC);
		List<String> perfTypeList = new ArrayList<String>();
		for (int i = 0; i < jobPerfTypeList.size(); i++) {
			JobPerfType jobPerfType = jobPerfTypeList.get(i);
			perfTypeList.add(jobPerfType.getTypeUuid());
		}

		PerfAttendance perfAttendance = (PerfAttendance) queryPerformance("PerfAttendance", month, performanceService);
		if (perfAttendance != null) {
			mark = "true";
			map.put("perfAttendance", perfAttendance);
			map.put("perfAttendanceCreate", "是");
		}
		else if (perfTypeList.contains(Constants.PERFORMANCE_TYPE_1_1)) {
			mark = "true";
			map.put("perfAttendanceCreate", "<font color='red'>否</font>");

			perfAttendance = new PerfAttendance();

			int[] num = new int[35];

			Constraint c1 = new Constraint("Attendance");
			c1.addCondition("checkDate", month + "%", Constraint.LIKE);
			c1.addCondition("employeeUuid", EMPLOYEE.getUuid());
			List<Attendance> attendanceList = attendanceService.selectAttendances(c1);
			for (int j = 0; j < attendanceList.size(); j++) {
				Attendance attendance = attendanceList.get(j);
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_NORMAL)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[0]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[1]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_GENERAL_HOLIDAY)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[2]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[3]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_STRING_BREAK)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[4]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[5]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BRANCH_CAMPUS)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[6]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[7]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OUT)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[8]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[9]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_LATE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[10]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[11]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_EARLY)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[12]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[13]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_ABSENCE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[14]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[15]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_AFFAIR_LEAVE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[16]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[17]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_SICK_LEAVE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[18]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[19]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_FUNERAL_LEAVE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[20]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[21]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_MARITAL_LEAVE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[22]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[23]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BUSINESS_TRIP)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[24]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[25]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OTHER)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[26]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[27]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_CLASS)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[28]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[29]++;
					}
					else if (attendance.getTimesFlag().equals("2")) {
						num[33]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_MATERNITY_LEAVE)) {
					if (attendance.getTimesFlag().equals("0")) {
						num[30]++;
					}
					else if (attendance.getTimesFlag().equals("1")) {
						num[31]++;
					}
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_REST)) {
					num[32]++;
				}
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_DUTY)) {
					num[34]++;
				}
			}

			perfAttendance.setPerfAttendanceM0(num[0]);
			perfAttendance.setPerfAttendanceA0(num[1]);
			perfAttendance.setPerfAttendanceM1(num[2]);
			perfAttendance.setPerfAttendanceA1(num[3]);
			perfAttendance.setPerfAttendanceM2(num[4]);
			perfAttendance.setPerfAttendanceA2(num[5]);
			perfAttendance.setPerfAttendanceM3(num[6]);
			perfAttendance.setPerfAttendanceA3(num[7]);
			perfAttendance.setPerfAttendanceM4(num[8]);
			perfAttendance.setPerfAttendanceA4(num[9]);
			perfAttendance.setPerfAttendanceM5(num[10]);
			perfAttendance.setPerfAttendanceA5(num[11]);
			perfAttendance.setPerfAttendanceM6(num[12]);
			perfAttendance.setPerfAttendanceA6(num[13]);
			perfAttendance.setPerfAttendanceM7(num[14]);
			perfAttendance.setPerfAttendanceA7(num[15]);
			perfAttendance.setPerfAttendanceM8(num[16]);
			perfAttendance.setPerfAttendanceA8(num[17]);
			perfAttendance.setPerfAttendanceM9(num[18]);
			perfAttendance.setPerfAttendanceA9(num[19]);
			perfAttendance.setPerfAttendanceM10(num[20]);
			perfAttendance.setPerfAttendanceA10(num[21]);
			perfAttendance.setPerfAttendanceM11(num[22]);
			perfAttendance.setPerfAttendanceA11(num[23]);
			perfAttendance.setPerfAttendanceM12(num[24]);
			perfAttendance.setPerfAttendanceA12(num[25]);
			perfAttendance.setPerfAttendanceM13(num[26]);
			perfAttendance.setPerfAttendanceA13(num[27]);
			perfAttendance.setPerfAttendanceM14(num[28]);
			perfAttendance.setPerfAttendanceA14(num[29]);
			perfAttendance.setPerfAttendanceM15(num[30]);
			perfAttendance.setPerfAttendanceA15(num[31]);
			perfAttendance.setPerfAttendanceE0(num[32]);
			perfAttendance.setPerfAttendanceE1(num[33]);
			perfAttendance.setPerfAttendanceE2(num[34]);

			map.put("perfAttendance", perfAttendance);
		}

		PerfBehaviour perfBehaviour = (PerfBehaviour) queryPerformance("PerfBehaviour", month, performanceService);
		if (perfBehaviour != null) {
			mark = "true";
			map.put("perfBehaviour", perfBehaviour);
			map.put("perfBehaviourCreate", "是");
		}
		else if (perfTypeList.contains(Constants.PERFORMANCE_TYPE_1_2)) {
			mark = "true";
			map.put("perfBehaviourCreate", "<font color='red'>否</font>");

			perfBehaviour = new PerfBehaviour();

			int[] num = new int[32];

			Constraint c1 = new Constraint("WorkRecord");
			c1.addCondition("recordTime", month + "%", Constraint.LIKE);
			c1.addCondition("recordUuid", EMPLOYEE.getUuid());
			c1.addCondition("ifUsing", true);
			List<WorkRecord> workRecordList = campusService.selectWorkRecords(c1);
			num[0] = workRecordList.size();

			Constraint c2 = new Constraint("InternetPublicity");
			c2.addCondition("recordTime", month + "%", Constraint.LIKE);
			c2.addCondition("recordUuid", EMPLOYEE.getUuid());
			c2.addCondition("ifUsing", true);
			List<InternetPublicity> internetPublicityList = campusService.selectInternetPublicitys(c2);
			for (int j = 0; j < internetPublicityList.size(); j++) {
				num[1] += internetPublicityList.get(j).getPosterInfosCount();
			}

			Constraint c3 = new Constraint("BehaviourStandard");
			c3.addCondition("checkDate", month + "%", Constraint.LIKE);
			c3.addCondition("employeeUuid", EMPLOYEE.getUuid());
			List<BehaviourStandard> behaviourStandardList = behaviourStandardService.selectBehaviourStandards(c3);
			for (int j = 0; j < behaviourStandardList.size(); j++) {
				BehaviourStandard behaviourStandard = behaviourStandardList.get(j);
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING)) {
					num[2]++;
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING)) {
					num[3]++;
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_FROCK)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[4]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[5]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[6]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_CARD)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[7]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[8]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[9]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[10]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[11]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[12]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_GAUNT)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[13]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[14]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[15]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_EATING)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[16]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[17]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[18]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_MOVIE)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[19]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[20]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[21]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_SONG)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[22]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[23]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[24]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[25]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[26]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[27]++;
					}
				}
				if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_OTHER)) {
					if (behaviourStandard.getTimesFlag().equals("0")) {
						num[28]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("1")) {
						num[29]++;
					}
					else if (behaviourStandard.getTimesFlag().equals("2")) {
						num[30]++;
					}
				}
			}

			Constraint c4 = new Constraint("Attendance");
			c4.addCondition("checkDate", month + "%", Constraint.LIKE);
			c4.addCondition("employeeUuid", EMPLOYEE.getUuid());
			List<Attendance> attendanceList = attendanceService.selectAttendances(c4);

			int workRocordNum = 0;
			int postNum = 0;
			HashSet<String> workRocordSet = new HashSet<String>();
			for (int j = 0; j < attendanceList.size(); j++) {
				Attendance attendance = attendanceList.get(j);
				if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_NORMAL) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BRANCH_CAMPUS) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OUT) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_LATE) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_EARLY) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OTHER) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_CLASS)) {
					workRocordSet.add(attendance.getCheckDate());
					if (attendance.getTimesFlag().equals("0") || attendance.getTimesFlag().equals("1")) {
						postNum += 5;
					}
				}
			}
			workRocordNum = workRocordSet.size();

			perfBehaviour.setPerfBehaviour0(num[0]);
			perfBehaviour.setPerfBehaviourS0(workRocordNum);
			perfBehaviour.setPerfBehaviour1(num[1]);
			perfBehaviour.setPerfBehaviourS1(postNum);
			perfBehaviour.setPerfBehaviour2(num[2]);
			perfBehaviour.setPerfBehaviour3(num[3]);
			perfBehaviour.setPerfBehaviourM4(num[4]);
			perfBehaviour.setPerfBehaviourA4(num[5]);
			perfBehaviour.setPerfBehaviourE4(num[6]);
			perfBehaviour.setPerfBehaviourM5(num[7]);
			perfBehaviour.setPerfBehaviourA5(num[8]);
			perfBehaviour.setPerfBehaviourE5(num[9]);
			perfBehaviour.setPerfBehaviourM6(num[10]);
			perfBehaviour.setPerfBehaviourA6(num[11]);
			perfBehaviour.setPerfBehaviourE6(num[12]);
			perfBehaviour.setPerfBehaviourM7(num[13]);
			perfBehaviour.setPerfBehaviourA7(num[14]);
			perfBehaviour.setPerfBehaviourE7(num[15]);
			perfBehaviour.setPerfBehaviourM8(num[16]);
			perfBehaviour.setPerfBehaviourA8(num[17]);
			perfBehaviour.setPerfBehaviourE8(num[18]);
			perfBehaviour.setPerfBehaviourM9(num[19]);
			perfBehaviour.setPerfBehaviourA9(num[20]);
			perfBehaviour.setPerfBehaviourE9(num[21]);
			perfBehaviour.setPerfBehaviourM10(num[22]);
			perfBehaviour.setPerfBehaviourA10(num[23]);
			perfBehaviour.setPerfBehaviourE10(num[24]);
			perfBehaviour.setPerfBehaviourM11(num[25]);
			perfBehaviour.setPerfBehaviourA11(num[26]);
			perfBehaviour.setPerfBehaviourE11(num[27]);
			perfBehaviour.setPerfBehaviourM12(num[28]);
			perfBehaviour.setPerfBehaviourA12(num[29]);
			perfBehaviour.setPerfBehaviourE12(num[30]);
			perfBehaviour.setPerfBehaviour13(num[31]);

			map.put("perfBehaviour", perfBehaviour);
		}

		PerfReception perfReception = (PerfReception) queryPerformance("PerfReception", month, performanceService);
		if (perfReception != null) {
			map.put("perfReception", perfReception);
			mark = "true";
			map.put("perfReceptionCreate", "是");
		}

		PerfFacility perfFacility = (PerfFacility) queryPerformance("PerfFacility", month, performanceService);
		if (perfFacility != null) {
			map.put("perfFacility", perfFacility);
			mark = "true";
			map.put("perfFacilityCreate", "是");
		}

		PerfMaterial perfMaterial = (PerfMaterial) queryPerformance("PerfMaterial", month, performanceService);
		if (perfMaterial != null) {
			map.put("perfMaterial", perfMaterial);
			mark = "true";
			map.put("perfMaterialCreate", "是");
		}

		PerfFinancial perfFinancial = (PerfFinancial) queryPerformance("PerfFinancial", month, performanceService);
		if (perfFinancial != null) {
			map.put("perfFinancial", perfFinancial);
			mark = "true";
			map.put("perfFinancialCreate", "是");
		}

		PerfLession perfLession = (PerfLession) queryPerformance("PerfLession", month, performanceService);
		if (perfLession != null) {
			map.put("perfLession", perfLession);
			mark = "true";
			map.put("perfLessionCreate", "是");
		}

		PerfTeaching perfTeaching = (PerfTeaching) queryPerformance("PerfTeaching", month, performanceService);
		if (perfTeaching != null) {
			map.put("perfTeaching", perfTeaching);
			mark = "true";
			map.put("perfTeachingCreate", "是");
		}

		PerfChildren perfChildren = (PerfChildren) queryPerformance("PerfChildren", month, performanceService);
		if (perfChildren != null) {
			map.put("perfChildren", perfChildren);
			mark = "true";
			map.put("perfChildrenCreate", "是");
		}

		PerfLongTerm perfLongTerm = (PerfLongTerm) queryPerformance("PerfLongTerm", month, performanceService);
		if (perfLongTerm != null) {
			map.put("perfLongTerm", perfLongTerm);
			mark = "true";
			map.put("perfLongTermCreate", "是");
		}

		PerfShortTerm perfShortTerm = (PerfShortTerm) queryPerformance("PerfShortTerm", month, performanceService);
		if (perfShortTerm != null) {
			map.put("perfShortTerm", perfShortTerm);
			mark = "true";
			map.put("perfShortTermCreate", "是");
		}

		PerfObtain perfObtain = (PerfObtain) queryPerformance("PerfObtain", month, performanceService);
		if (perfObtain != null) {
			map.put("perfObtain", perfObtain);
			mark = "true";
			map.put("perfObtainCreate", "是");
		}

		PerfRecruit perfRecruit = (PerfRecruit) queryPerformance("PerfRecruit", month, performanceService);
		if (perfRecruit != null) {
			map.put("perfRecruit", perfRecruit);
			mark = "true";
			map.put("perfRecruitCreate", "是");
		}

		PerfPropaganda perfPropaganda = (PerfPropaganda) queryPerformance("PerfPropaganda", month, performanceService);
		if (perfPropaganda != null) {
			map.put("perfPropaganda", perfPropaganda);
			mark = "true";
			map.put("perfPropagandaCreate", "是");
		}

		PerfAdmin perfAdmin = (PerfAdmin) queryPerformance("PerfAdmin", month, performanceService);
		if (perfAdmin != null) {
			map.put("perfAdmin", perfAdmin);
			mark = "true";
			map.put("perfAdminCreate", "是");
		}

		PerfIncharge perfIncharge = (PerfIncharge) queryPerformance("PerfIncharge", month, performanceService);
		if (perfIncharge != null) {
			map.put("perfIncharge", perfIncharge);
			mark = "true";
			map.put("perfInchargeCreate", "是");
		}

		PerfDriver perfDriver = (PerfDriver) queryPerformance("PerfDriver", month, performanceService);
		if (perfDriver != null) {
			map.put("perfDriver", perfDriver);
			mark = "true";
			map.put("perfDriverCreate", "是");
		}

		PerfSecurityClean perfSecurityClean = (PerfSecurityClean) queryPerformance("PerfSecurityClean", month, performanceService);
		if (perfSecurityClean != null) {
			map.put("perfSecurityClean", perfSecurityClean);
			mark = "true";
			map.put("perfSecurityCleanCreate", "是");
		}

		PerfOther perfOther = (PerfOther) queryPerformance("PerfOther", month, performanceService);
		if (perfOther != null) {
			map.put("perfOther", perfOther);
			mark = "true";
			map.put("perfOtherCreate", "是");
		}

		map.put("mark", mark);

		setResponseText(map);
	}

	private Object queryPerformance(String performanceName, String month, PerformanceService performanceService) throws Exception {
		String sql = "select P.* from EmployeePerformance E, " + performanceName + " P where P.performanceUuid = E.uuid and E.employeeUuid = '" + EMPLOYEE.getUuid() + "' and E.month = '" + month + "'";
		Constraint c = new Constraint(performanceName);
		c.addSQLCondition(sql, null);
		return performanceService.selectPerformance(c);
	}
}
