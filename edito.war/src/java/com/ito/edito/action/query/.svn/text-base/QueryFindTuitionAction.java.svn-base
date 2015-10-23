package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.Tuition;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryFindTuitionAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String studentUuid = request.getParameter("studentUuid");
		String arrangeClassUuid = request.getParameter("arrangeClassUuid");

		Constraint cC = new Constraint("ClassEnrollment");
		cC.addCondition("studentUuid", studentUuid);
		cC.addCondition("arrangeClassUuid", arrangeClassUuid);
		ClassEnrollment classEnrollment = classService.selectClassEnrollment(cC);

		List<String[]> resultList = new ArrayList<String[]>();
		if (classEnrollment != null && classEnrollment.getTuitionUuid() != null) {
			Tuition tuition = classService.selectTuitionByUuid(classEnrollment.getTuitionUuid());

			String str[] = new String[6];
			str[0] = tuition.getUuid();
			str[1] = tuition.getPreDiscountAmount() != null ? tuition.getPreDiscountAmount() : "";
			str[2] = tuition.getDiscount() != null ? tuition.getDiscount() : "";
			str[3] = tuition.getDiscountReason() != null ? tuition.getDiscountReason() : "无";
			str[4] = tuition.getActualTotalAmount() != null ? tuition.getActualTotalAmount() : "";
			str[5] = tuition.getAmountPaid() != null ? tuition.getAmountPaid() : "";
			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
