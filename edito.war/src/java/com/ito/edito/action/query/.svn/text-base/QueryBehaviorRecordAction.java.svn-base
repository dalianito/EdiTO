package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.BehaviourStandard.BehaviourStandardService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.BehaviourStandard;
import com.ito.edito.schema.Employee;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryBehaviorRecordAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		BehaviourStandardService behaviourStandardService = (BehaviourStandardService) JndiFactory.lookup("behaviourStandardService");

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
			for(int z = 0; z < 3; z++){

				for (int j = 0; j < 7; j++) {
					String curDate = Constants.DATE_FORMAT_YMD.format(new Date(curSundayD.getTime() + 86400000 * j));
	
					if (curDate.compareTo(todayStr) > 0) {
						string[i][z][j] = "none";
					}
					else {
						Constraint behaviourStandardC = new Constraint("BehaviourStandard");
						behaviourStandardC.addCondition("employeeUuid", employee.getUuid());
						behaviourStandardC.addCondition("checkDate", curDate);
						behaviourStandardC.addCondition("timesFlag", z);
						BehaviourStandard behaviourStandard = behaviourStandardService.selectBehaviourStandard(behaviourStandardC);
						if (behaviourStandard == null) {
							string[i][z][j] = "null";
						}
						else {
							string[i][z][j] = behaviourStandard.getUuid() + "|";
							if (behaviourStandard.getTypeUuid() != null) {
								string[i][z][j] += behaviourStandard.getTypeUuid() + "|";
								if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_NORMAL)) {
									string[i][z][j] += behaviourStandard.getType().getDescription() + "|";
								}
								else {
									string[i][z][j] += "<font color='red'>" + behaviourStandard.getType().getDescription() + "</font>|";
								}
							}
							else {
								string[i][z][j] += "||";
							}
							string[i][z][j] += behaviourStandard.getIntroduction() != null ? behaviourStandard.getIntroduction() + "|" : "|";
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
