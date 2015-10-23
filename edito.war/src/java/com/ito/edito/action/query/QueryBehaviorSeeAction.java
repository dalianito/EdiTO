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

public class QueryBehaviorSeeAction extends AjaxAction {
	public void executeAutoUT() throws Exception {

		Date todayD = new Date();
		String todayStr = Constants.DATE_FORMAT_YMD.format(todayD);

		UserService userService = (UserService) JndiFactory.lookup("userService");
		BehaviourStandardService behaviourStandardService = (BehaviourStandardService) JndiFactory.lookup("behaviourStandardService");

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
						Constraint behaviourStandardC = new Constraint("BehaviourStandard");
						behaviourStandardC.addCondition("employeeUuid", employee.getUuid());
						behaviourStandardC.addCondition("timesFlag", z);
						behaviourStandardC.addCondition("checkDate", curDate);
						BehaviourStandard behaviourStandard = behaviourStandardService.selectBehaviourStandard(behaviourStandardC);
						if (behaviourStandard == null) {
							resInfo[j][z][k] = "null";
						}
						else {
							resInfo[j][z][k] = behaviourStandard.getTypeUuid() + "|";
							if (behaviourStandard.getTypeUuid().equals(Constants.BEHAVIOUR_STANDARD_UUID_NORMAL)) {
								resInfo[j][z][k] = behaviourStandard.getType().getDescription();
							}
							else {
								resInfo[j][z][k] = "<font color='red'>" + behaviourStandard.getType().getDescription() + "</font>";
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
