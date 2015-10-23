package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Relationship;
import com.ito.fai.util.JndiFactory;

public class UpdateRelationTransferAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String uuid = request.getParameter("uuid");

		Relationship relationship = applyService.selectRelationshipByUuid(uuid);
		relationship.setIfDeal(true);

		Employee employee = relationship.getTeacher();
		employee.setDepartmentUuid(relationship.getTransferUuid(), false);

		ut.begin();
		try {
			if (employee != null) {
				userService.updateEmployee(employee, USER.getAccount());
			}
			if (relationship != null) {
				applyService.updateRelationship(relationship, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
