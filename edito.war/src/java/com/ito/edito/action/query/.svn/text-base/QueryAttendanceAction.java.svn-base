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

public class QueryAttendanceAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		AttendanceService attendanceService = (AttendanceService) JndiFactory.lookup("attendanceService");

		Date todayD = new Date();
		String todayStr = Constants.DATE_FORMAT_YMD.format(todayD);

		String campusUuid = request.getParameter("campusUuid");
		String dateStr = request.getParameter("date");
		Date dateD = Constants.DATE_FORMAT_YMD_0.parse(dateStr + " 00:00:00");

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dateD);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		Date curSundayD = calendar.getTime();

		String sql = "select E.* from Employee E, Campus C where E.personUuid != '" + Constants.ADMIN_PERSON_UUID + "' and E.campusUuid = C.uuid and E.ifUsing = true ";
		if (campusUuid != null && campusUuid.length() > 0) {
			if (campusUuid.equals("none")) {
				sql += " and E.campusUuid = '" + EMPLOYEE.getCampusUuid() + "' ";
			}
			else if (!campusUuid.equals("all")) {
				sql += " and E.campusUuid = '" + campusUuid + "' ";
			}
		}
		sql += " order by C.sequence asc ";

		Constraint employeeC = new Constraint("Employee");
		employeeC.addSQLCondition(sql, null);
		List<Employee> employeeList = userService.selectEmployees(employeeC);
		int num = employeeList.size();

		List<Object> resultList = new ArrayList<Object>();
		String[] employeeInfo = new String[num];
		String[][][] string = new String[num][3][7];

		for (int i = 0; i < num; i++) {
			Employee employee = employeeList.get(i);
			employeeInfo[i] = employee.getUuid() + "|" + employee.getPerson().getName() + "|" + (employee.getCampusUuid() != null ? employee.getCampus().getDescription() : "") + "|";
			for (int z = 0; z < 3; z++) {

				for (int j = 0; j < 7; j++) {
					String curDate = Constants.DATE_FORMAT_YMD.format(new Date(curSundayD.getTime() + 86400000 * j));

					if (curDate.compareTo(todayStr) > 0) {
						string[i][z][j] = "none";
					}
					else {
						Constraint attendanceC = new Constraint("Attendance");
						attendanceC.addCondition("employeeUuid", employee.getUuid());
						attendanceC.addCondition("checkDate", curDate);
						attendanceC.addCondition("timesFlag", z);
						Attendance attendance = attendanceService.selectAttendance(attendanceC);
						if (attendance == null) {
							string[i][z][j] = "null";
						}
						else {
							string[i][z][j] = attendance.getUuid() + "|";
							if (attendance.getTypeUuid() != null) {
								string[i][z][j] += attendance.getTypeUuid() + "|";
								if (attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_NORMAL) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_GENERAL_HOLIDAY) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_STRING_BREAK) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BRANCH_CAMPUS) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_OUT) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_BUSINESS_TRIP) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_CLASS) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_REST) || attendance.getTypeUuid().equals(Constants.ATTENDANCE_TYPE_UUID_DUTY)) {
									string[i][z][j] += attendance.getType().getDescription() + "|";
								}
								else {
									string[i][z][j] += "<font color='red'>" + attendance.getType().getDescription() + "</font>|";
								}
							}
							else {
								string[i][z][j] += "||";
							}
							string[i][z][j] += attendance.getIntroduction() != null ? attendance.getIntroduction() + "|" : "|";
						}
					}
				}
			}
		}
		resultList.add(employeeInfo);
		resultList.add(string);

		setResponseText(resultList);
	}
}
