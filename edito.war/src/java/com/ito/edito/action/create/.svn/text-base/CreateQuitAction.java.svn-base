package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.Student;
import com.ito.edito.schema.Tuition;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateQuitAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		ArrangeClass arrangeClass = (ArrangeClass) carrier.fetchInstance("ArrangeClass");
		Student student = (Student) carrier.fetchInstance("Student");
		Tuition tuition = (Tuition) carrier.fetchInstance("Tuition");
		ClassEnrollment classEnrollment = (ClassEnrollment) carrier.fetchInstance("ClassEnrollment");

		String studentUuid = student.getUuid();
		String arrangeClassUuid = arrangeClass.getUuid();

		Tuition oldTuition = null;
		Constraint c = new Constraint("ClassEnrollment");
		c.addCondition("studentUuid", studentUuid);
		c.addCondition("arrangeClassUuid", arrangeClassUuid);
		if (tuition != null) {
			String tuitionUuid = tuition.getUuid();
			c.addCondition("tuitionUuid", tuitionUuid);
			oldTuition = classService.selectTuitionByUuid(tuitionUuid);
		}
		ClassEnrollment oldClassEnrollment = classService.selectClassEnrollment(c);

		ut.begin();
		try {
			if (tuition != null) {
				String amountReturn = tuition.getAmountReturn();
				oldTuition.setAmountReturn(amountReturn);

				classService.updateTuition(oldTuition, USER.getAccount());
			}

			String quitReason = classEnrollment.getQuitReason();
			String remark = classEnrollment.getRemark();
			oldClassEnrollment.setQuitReason(quitReason);
			oldClassEnrollment.setRemark(remark);
			oldClassEnrollment.setEnrollmentStateUuid(Constants.STUDENT_QUIT, false);
			oldClassEnrollment.setEnrollmentTime(new Date());

			classService.updateClassEnrollment(oldClassEnrollment, USER.getAccount());

			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
