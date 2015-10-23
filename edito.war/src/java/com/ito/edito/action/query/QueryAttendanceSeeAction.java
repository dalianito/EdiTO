package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Attendance.AttendanceService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Attendance;
import com.ito.edito.schema.Employee;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAttendanceSeeAction extends AjaxAction {
	public void executeAutoUT() throws Exception {

		Date todayD = new Date();
		String todayStr = Constants.DATE_FORMAT_YMD.format(todayD);

		AttendanceService attendanceService = (AttendanceService) JndiFactory.lookup("attendanceService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		int maxNum = 0;
		long dayPerMSec = 86400000;

		String sql = "select distinct E.* from Employee E, Person P, Campus C where E.personUuid = P.uuid and E.campusUuid = C.uuid ";

		String date = request.getParameter("data");
		String campusUuid = request.getParameter("campusUuid");
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
		calendar.set(Calendar.MONTH, (Integer.parseInt(date.substring(6, 7)) - 1));
		calendar.set(Calendar.DATE, 1);
		maxNum = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		Date tempDate = calendar.getTime();

		String sqlCondition = sql + " and E.ifUsing = true and C.uuid = '" + campusUuid + "' order by C.sequence asc ";
		Constraint employeeC = new Constraint("Employee");
		employeeC.addSQLCondition(sqlCondition, null);
		List<Employee> employeeList = userService.selectEmployees(employeeC);

		String[] empInfo = new String[employeeList.size()];
		String[][][] resInfo = new String[employeeList.size()][3][maxNum];

		List<Object> resultList = new ArrayList<Object>();

		for (int j = 0; j < employeeList.size(); j++) {
			Employee employee = employeeList.get(j);
			empInfo[j] = employee.getPerson().getName();
			for (int z = 0; z < 3; z++) {
				for (int k = 0; k < maxNum; k++) {
					String curDate = Constants.DATE_FORMAT_YMD.format(new Date(tempDate.getTime() + dayPerMSec * k));
					if (curDate.compareTo(todayStr) > 0) {
						resInfo[j][z][k] = "none";
					}
					else {
						Constraint attendanceC = new Constraint("Attendance");
						attendanceC.addCondition("employeeUuid", employee.getUuid());
						attendanceC.addCondition("timesFlag", z);
						attendanceC.addCondition("checkDate", curDate);
						Attendance attendance = attendanceService.selectAttendance(attendanceC);
						if (attendance == null) {
							resInfo[j][z][k] = "null";
						}
						else {
							resInfo[j][z][k] = attendance.getTypeUuid() + "|";
							if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_NORMAL) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_GENERAL_HOLIDAY) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_STRING_BREAK) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BRANCH_CAMPUS) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OUT) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BUSINESS_TRIP) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_CLASS) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_REST) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_DUTY)) {
								resInfo[j][z][k] = attendance.getType().getDescription();
							}
							else {
								resInfo[j][z][k] = "<font color='red'>" + attendance.getType().getDescription() + "</font>";
							}
						}
					}
				}
			}
		}

		resultList.add(empInfo);
		resultList.add(resInfo);
		setResponseText(resultList);
	}
}
