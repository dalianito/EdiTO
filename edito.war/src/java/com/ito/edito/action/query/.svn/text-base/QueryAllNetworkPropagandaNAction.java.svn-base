package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Attendance.AttendanceService;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Attendance;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAllNetworkPropagandaNAction extends AjaxAction {
	public void executeAutoUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		AttendanceService attendanceService = (AttendanceService) JndiFactory.lookup("attendanceService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		int maxNum = 0;
		int actulNum = 0;
		int numC = 0;
		String beginDate = "";
		String endDate = "";
		String beginDateC = "";
		String endDateC = "";
		boolean flagN = true;

		String sql = "select distinct E.* from Employee E, Person P, Campus C where E.personUuid = P.uuid and E.campusUuid = C.uuid ";

		String date = request.getParameter("data");
		String campusUuid = request.getParameter("campusUuid");
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
		calendar.set(Calendar.MONTH, (Integer.parseInt(date.substring(6, 7)) - 1));
		calendar.set(Calendar.DATE, 1);
		beginDateC = Constants.DATE_FORMAT_YMD.format(calendar.getTime());
		beginDate = beginDateC + " 00:00:00";
		maxNum = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		calendar.set(Calendar.DATE, maxNum);
		endDateC = Constants.DATE_FORMAT_YMD.format(calendar.getTime());
		endDate = endDateC + " 23:59:59";

		String sqlCondition = sql + " and E.ifUsing = true and C.uuid = '" + campusUuid + "' order by C.sequence asc ";
		Constraint employeeC = new Constraint("Employee");
		employeeC.addSQLCondition(sqlCondition, null);
		List<Employee> employeeList = userService.selectEmployees(employeeC);
		String[] empInfo = new String[employeeList.size()];
		String[][] resInfo = new String[employeeList.size()][];
		String[][] uuid = new String[employeeList.size()][];
		List<Object> resultList = new ArrayList<Object>();

		for (int j = 0; j < employeeList.size(); j++) {

			Employee employee = employeeList.get(j);
			empInfo[j] = employee.getPerson().getName();

			Constraint internetPublicityC = new Constraint("InternetPublicity");
			internetPublicityC.addCondition("recordUuid", employee.getUuid());
			internetPublicityC.addCondition("recordTime", Constants.DATE_FORMAT.parse(beginDate), Constraint.RTE);
			internetPublicityC.addCondition("recordTime", Constants.DATE_FORMAT.parse(endDate), Constraint.LTE);
			internetPublicityC.addOrderCondition("recordTime", "asc");
			List<InternetPublicity> internetPublicityList = (List<InternetPublicity>) campusService.selectInternetPublicitys(internetPublicityC);

			resInfo[j] = new String[maxNum + 2];
			uuid[j] = new String[maxNum];

			String sqla = "select A.* from Attendance A where A.employeeUuid = '" + employee.getUuid() + "' and timesFlag != '2' and A.checkDate >= '" + beginDateC + "' and A.checkDate <= '" + endDateC + "' order by A.checkDate asc ";
			Constraint attendanceC = new Constraint("Attendance");
			attendanceC.addSQLCondition(sqla, null);

			for (int k = 0; k < maxNum; k++) {
				resInfo[j][k] = "0";
				uuid[j][k] = "0";
			}
			actulNum = 0;

			List<Attendance> attendanceList = (List<Attendance>) attendanceService.selectAttendances(attendanceC);

			numC = 0;
			if (internetPublicityList.size() != 0) {
				for (int l = 0; l < internetPublicityList.size(); l++) {
					numC += internetPublicityList.get(l).getPosterInfosCount();
					resInfo[j][Integer.parseInt((Constants.DATE_FORMAT_YMD.format(internetPublicityList.get(l).getRecordTime())).substring(8, 10)) - 1] = String.valueOf(internetPublicityList.get(l).getPosterInfosCount());
					uuid[j][Integer.parseInt((Constants.DATE_FORMAT_YMD.format(internetPublicityList.get(l).getRecordTime())).substring(8, 10)) - 1] = String.valueOf(internetPublicityList.get(l).getUuid());
				}
			}

			for (int a = 0; a < attendanceList.size(); a++) {
				if (attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_NORMAL) || attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BRANCH_CAMPUS) || attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OUT) || attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_LATE) || attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_EARLY) || attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OTHER) || attendanceList.get(a).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_CLASS)) {
					actulNum += 5;
					if (((a + 1) < attendanceList.size()) && (attendanceList.get(a).getCheckDate().equals(attendanceList.get(a + 1).getCheckDate()))) {
						if (attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_NORMAL) || attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BRANCH_CAMPUS) || attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OUT) || attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_LATE) || attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_EARLY) || attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OTHER) || attendanceList.get(a + 1).getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_CLASS)) {
							actulNum += 5;
							for (int l = 0; l < internetPublicityList.size(); l++) {
								if ((Constants.DATE_FORMAT_YMD.format(internetPublicityList.get(l).getRecordTime())).equals(attendanceList.get(a).getCheckDate())) {
									if (internetPublicityList.get(l).getPosterInfosCount() >= 10) {
										resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = String.valueOf(internetPublicityList.get(l).getPosterInfosCount());
									}
									else {
										resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = "<font color='red'>" + internetPublicityList.get(l).getPosterInfosCount() + "</font>";
									}
									flagN = false;
								}
							}
							if (flagN) {
								resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = "<font color='red'>0</font>";
							}
							flagN = true;
						}
						else {
							for (int l = 0; l < internetPublicityList.size(); l++) {
								if ((Constants.DATE_FORMAT_YMD.format(internetPublicityList.get(l).getRecordTime())).equals(attendanceList.get(a).getCheckDate())) {
									if (internetPublicityList.get(l).getPosterInfosCount() >= 5) {
										resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = String.valueOf(internetPublicityList.get(l).getPosterInfosCount());
									}
									else {
										resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = "<font color='red'>" + internetPublicityList.get(l).getPosterInfosCount() + "</font>";
									}
								}
							}
						}
						a++;
					}
					else {
						for (int l = 0; l < internetPublicityList.size(); l++) {
							if ((Constants.DATE_FORMAT_YMD.format(internetPublicityList.get(l).getRecordTime())).equals(attendanceList.get(a).getCheckDate())) {
								if (internetPublicityList.get(l).getPosterInfosCount() >= 5) {
									resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = String.valueOf(internetPublicityList.get(l).getPosterInfosCount());
								}
								else {
									resInfo[j][Integer.parseInt((attendanceList.get(a).getCheckDate().toString()).substring(8, 10)) - 1] = "<font color='red'>" + internetPublicityList.get(l).getPosterInfosCount() + "</font>";
								}
							}
						}
					}
				}
			}

			resInfo[j][maxNum] = String.valueOf(numC);
			resInfo[j][maxNum + 1] = String.valueOf(actulNum);
		}

		resultList.add(empInfo);
		resultList.add(resInfo);
		resultList.add(uuid);
		setResponseText(resultList);
	}
}
