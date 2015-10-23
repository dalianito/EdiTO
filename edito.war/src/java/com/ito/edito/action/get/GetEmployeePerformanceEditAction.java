package com.ito.edito.action.get;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Attendance.AttendanceService;
import com.ito.edito.ejb.BehaviourStandard.BehaviourStandardService;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Performance.PerformanceService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Attendance;
import com.ito.edito.schema.BehaviourStandard;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.EmployeePerformance;
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

public class GetEmployeePerformanceEditAction extends AjaxAction {

	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {

		PerformanceService performanceService = (PerformanceService) JndiFactory.lookup("performanceService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		AttendanceService attendanceService = (AttendanceService) JndiFactory.lookup("attendanceService");
		BehaviourStandardService behaviourStandardService = (BehaviourStandardService) JndiFactory.lookup("behaviourStandardService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String employeeUuid = request.getParameter("employeeUuid");
		String month = request.getParameter("month");

		Employee employee = userService.selectEmployeeByUuid(employeeUuid);

		Constraint c = new Constraint("EmployeePerformance");
		c.addCondition("employeeUuid", employeeUuid);
		c.addCondition("month", month);

		EmployeePerformance employeePerformance = performanceService.selectEmployeePerformance(c);
		if (employeePerformance != null) {
			map.put("employeePerformance", "created");

			Constraint perfAttendanceC = new Constraint("PerfAttendance");
			perfAttendanceC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfAttendance perfAttendance = performanceService.selectPerfAttendance(perfAttendanceC);
			map.put("perfAttendance", perfAttendance);

			Constraint perfBehaviourC = new Constraint("PerfBehaviour");
			perfBehaviourC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfBehaviour perfBehaviour = performanceService.selectPerfBehaviour(perfBehaviourC);
			map.put("perfBehaviour", perfBehaviour);

			Constraint perfReceptionC = new Constraint("PerfReception");
			perfReceptionC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfReception perfReception = performanceService.selectPerfReception(perfReceptionC);
			map.put("perfReception", perfReception);

			Constraint perfFacilityC = new Constraint("PerfFacility");
			perfFacilityC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfFacility perfFacility = performanceService.selectPerfFacility(perfFacilityC);
			map.put("perfFacility", perfFacility);

			Constraint perfMaterialC = new Constraint("PerfMaterial");
			perfMaterialC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfMaterial perfMaterial = performanceService.selectPerfMaterial(perfMaterialC);
			map.put("perfMaterial", perfMaterial);

			Constraint perfFinancialC = new Constraint("PerfFinancial");
			perfFinancialC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfFinancial perfFinancial = performanceService.selectPerfFinancial(perfFinancialC);
			map.put("perfFinancial", perfFinancial);

			Constraint perfLessionC = new Constraint("PerfLession");
			perfLessionC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfLession perfLession = performanceService.selectPerfLession(perfLessionC);
			map.put("perfLession", perfLession);

			Constraint perfTeachingC = new Constraint("PerfTeaching");
			perfTeachingC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfTeaching perfTeaching = performanceService.selectPerfTeaching(perfTeachingC);
			map.put("perfTeaching", perfTeaching);

			Constraint perfChildrenC = new Constraint("PerfChildren");
			perfChildrenC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfChildren perfChildren = performanceService.selectPerfChildren(perfChildrenC);
			map.put("perfChildren", perfChildren);

			Constraint perfLongTermC = new Constraint("PerfLongTerm");
			perfLongTermC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfLongTerm perfLongTerm = performanceService.selectPerfLongTerm(perfLongTermC);
			map.put("perfLongTerm", perfLongTerm);

			Constraint perfShortTermC = new Constraint("PerfShortTerm");
			perfShortTermC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfShortTerm perfShortTerm = performanceService.selectPerfShortTerm(perfShortTermC);
			map.put("perfShortTerm", perfShortTerm);

			Constraint perfObtainC = new Constraint("PerfObtain");
			perfObtainC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfObtain perfObtain = performanceService.selectPerfObtain(perfObtainC);
			map.put("perfObtain", perfObtain);

			Constraint perfRecruitC = new Constraint("PerfRecruit");
			perfRecruitC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfRecruit perfRecruit = performanceService.selectPerfRecruit(perfRecruitC);
			map.put("perfRecruit", perfRecruit);

			Constraint perfPropagandaC = new Constraint("PerfPropaganda");
			perfPropagandaC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfPropaganda perfPropaganda = performanceService.selectPerfPropaganda(perfPropagandaC);
			map.put("perfPropaganda", perfPropaganda);

			Constraint perfAdminC = new Constraint("PerfAdmin");
			perfAdminC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfAdmin perfAdmin = performanceService.selectPerfAdmin(perfAdminC);
			map.put("perfAdmin", perfAdmin);

			Constraint perfInchargeC = new Constraint("PerfIncharge");
			perfInchargeC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfIncharge perfIncharge = performanceService.selectPerfIncharge(perfInchargeC);
			map.put("perfIncharge", perfIncharge);

			Constraint perfDriverC = new Constraint("PerfDriver");
			perfDriverC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfDriver perfDriver = performanceService.selectPerfDriver(perfDriverC);
			map.put("perfDriver", perfDriver);

			Constraint perfSecurityCleanC = new Constraint("PerfSecurityClean");
			perfSecurityCleanC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfSecurityClean perfSecurityClean = performanceService.selectPerfSecurityClean(perfSecurityCleanC);
			map.put("perfSecurityClean", perfSecurityClean);

			Constraint perfOtherC = new Constraint("PerfOther");
			perfOtherC.addCondition("performanceUuid", employeePerformance.getUuid());
			PerfOther perfOther = performanceService.selectPerfOther(perfOtherC);
			map.put("perfOther", perfOther);
		}
		else {
			Constraint jobPerfTypeC = new Constraint("JobPerfType");
			jobPerfTypeC.addCondition("jobUuid", employee.getJobUuid());
			List<JobPerfType> jobPerfTypeList = performanceService.selectJobPerfTypes(jobPerfTypeC);
			if (jobPerfTypeList.size() > 0) {
				map.put("employeePerformance", "licensed");

				for (int i = 0; i < jobPerfTypeList.size(); i++) {
					JobPerfType jobPerfType = jobPerfTypeList.get(i);

					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_1_1)) {
						int[] num = new int[35];

						Constraint c1 = new Constraint("Attendance");
						c1.addCondition("checkDate", month + "%", Constraint.LIKE);
						c1.addCondition("employeeUuid", employeeUuid);
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

						map.put("attendance", num);
						map.put("perfAttendance", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_1_2)) {
						int[] num = new int[33];

						Constraint c1 = new Constraint("WorkRecord");
						c1.addCondition("recordTime", month + "%", Constraint.LIKE);
						c1.addCondition("recordUuid", employeeUuid);
						c1.addCondition("ifUsing", true);
						List<WorkRecord> workRecordList = campusService.selectWorkRecords(c1);
						num[0] = workRecordList.size();

						Constraint c2 = new Constraint("InternetPublicity");
						c2.addCondition("recordTime", month + "%", Constraint.LIKE);
						c2.addCondition("recordUuid", employeeUuid);
						c2.addCondition("ifUsing", true);
						List<InternetPublicity> internetPublicityList = campusService.selectInternetPublicitys(c2);
						for (int j = 0; j < internetPublicityList.size(); j++) {
							num[1] += internetPublicityList.get(j).getPosterInfosCount();
						}

						Constraint c3 = new Constraint("BehaviourStandard");
						c3.addCondition("checkDate", month + "%", Constraint.LIKE);
						c3.addCondition("employeeUuid", employeeUuid);
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
						c4.addCondition("employeeUuid", employeeUuid);
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

						num[31] = workRocordNum;
						num[32] = postNum;

						map.put("behaviour", num);
						map.put("perfBehaviour", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_2_1)) {
						map.put("perfReception", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_3_1)) {
						map.put("perfFacility", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_3_2)) {
						map.put("perfMaterial", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_4_1)) {
						map.put("perfFinancial", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_5_1)) {
						map.put("perfLession", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_5_2)) {
						map.put("perfTeaching", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_5_3)) {
						map.put("perfChildren", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_5_4)) {
						map.put("perfLongTerm", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_5_5)) {
						map.put("perfShortTerm", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_5_6)) {
						map.put("perfObtain", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_6_1)) {
						map.put("perfRecruit", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_6_2)) {
						map.put("perfPropaganda", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_7_1)) {
						map.put("perfAdmin", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_7_2)) {
						map.put("perfIncharge", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_8_1)) {
						map.put("perfDriver", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_8_2)) {
						map.put("perfSecurityClean", "licensed");
					}
					if (jobPerfType.getTypeUuid().equals(Constants.PERFORMANCE_TYPE_9_1)) {
						map.put("perfOther", "licensed");
					}
				}
			}
			else {
				map.put("employeePerformance", "no_licensed");
			}
		}

		setResponseText(map);
	}
}
