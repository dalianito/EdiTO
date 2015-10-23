package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.Apply;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryQuitsApplyAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		JndiFactory.lookup("statisticsService");

		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String sql = "select A.* from Apply A, Quit Q, Employee E where A.ifUsing = true and Q.ifUsing = true and Q.applyUuid = A.uuid and Q.employeeUuid = E.uuid ";

		sql += " and A.applicantUuid = E.uuid ";
		sql += " and Q.employeeUuid = E.uuid ";
		sql += " and A.typeUuid = '" + Constants.APPLY_TYPE_UUID_QUIT + "' ";

		if (beginDate != null && !beginDate.equals("")) {
			sql += " and applicationTime >= '" + beginDate + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and applicationTime <= '" + endDate + " 23:59:59' ";
		}

		Constraint c = new Constraint("Apply");
		c.addSQLCondition(sql, null);

		List<Apply> applysTemp = applyService.selectApplys(c);
		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < applysTemp.size(); i++) {
			Apply apply = applysTemp.get(i);

			String[] str = new String[10];
			str[0] = apply.getApplicationTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime());
			str[1] = apply.getCheckerOneUuid() == null ? "" : apply.getCheckerOne().getPerson().getName();
			str[2] = apply.getCheckStateOneUuid() == null ? "" : apply.getCheckStateOne().getDescription();
			str[3] = apply.getCheckerTwoUuid() == null ? "" : apply.getCheckerTwo().getPerson().getName();
			str[4] = apply.getCheckStateTwoUuid() == null ? "" : apply.getCheckStateTwo().getDescription();
			str[5] = apply.getCheckerThreeUuid() == null ? "" : apply.getCheckerThree().getPerson().getName();
			str[6] = apply.getCheckStateThreeUuid() == null ? "" : apply.getCheckStateThree().getDescription();
			str[7] = apply.getCheckerFourUuid() == null ? "" : apply.getCheckerFour().getPerson().getName();
			str[8] = apply.getCheckStateFourUuid() == null ? "" : apply.getCheckStateFour().getDescription();
			str[9] = apply.getUuid();

			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
