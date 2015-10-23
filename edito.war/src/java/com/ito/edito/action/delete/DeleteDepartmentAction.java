package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Department;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class DeleteDepartmentAction extends AjaxAction {
	private String HAVE_CHILDREN_STATUS = "0";
	// private String HAVE_PERSON_STATUS = "1";
	private String SUCCESS_STATUS = "2";

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Constraint constraint = new Constraint("Department");
		constraint.addCondition("parentUuid", uuid);
		constraint.addCondition("ifUsing", true);
		List<Department> departmentList = userService.selectDepartments(constraint);

		if (departmentList.size() > 0) {
			setResponseText(HAVE_CHILDREN_STATUS);
		}
		else {
			Department department = userService.selectDepartmentByUuid(uuid);
			department.setIfUsing(false);

			String parentUuid = department.getParentUuid();

			Constraint constraint3 = new Constraint("Department");
			constraint3.addCondition("parentUuid", parentUuid);
			constraint3.addCondition("ifUsing", true);
			List<Department> brotherDepartmentList = userService.selectDepartments(constraint3);
			Department parentDepartment = null;
			if (brotherDepartmentList.size() == 1) {
				parentDepartment = userService.selectDepartmentByUuid(parentUuid);
				parentDepartment.setIfHasChild(false);
			}
			ut.begin();
			try {
				userService.updateDepartment(department, USER.getAccount());
				if (parentDepartment != null) {
					userService.updateDepartment(parentDepartment, USER.getAccount());
				}
				ut.commit();
				setResponseText(SUCCESS_STATUS);
			}
			catch (Exception e) {
				ut.rollback();
			}
		}
	}
}
