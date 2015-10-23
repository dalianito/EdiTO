package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Department;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateDepartmentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		Department department = (Department) carrier.fetchInstance("Department");
		department.setIfHasChild(false);
		department.setIfUsing(true);

		Department parentdepartment = null;
		if (department.getParentUuid() != null) {
			parentdepartment = userService.selectDepartmentByUuid(department.getParentUuid());
			parentdepartment.setIfHasChild(true);
		}

		Department presentParentdepartment = null;
		if (department.getUuid() != null) {
			Department departmentDB = userService.selectDepartmentByUuid(department.getUuid());
			if (departmentDB.getParentUuid() != null && !departmentDB.getParentUuid().equals(department.getParentUuid())) {
				Constraint constraint = new Constraint("Department");
				constraint.addCondition("parentUuid", departmentDB.getParentUuid());
				List<Department> presentBrotherDepartments = userService.selectDepartments(constraint);
				if (presentBrotherDepartments.size() == 1) {
					presentParentdepartment = userService.selectDepartmentByUuid(departmentDB.getParentUuid());
					presentParentdepartment.setIfHasChild(false);
				}
			}
		}

		ut.begin();
		try {
			if (department.getUuid() != null) {
				userService.updateDepartment(department, USER.getAccount());
				if (presentParentdepartment != null) {
					userService.updateDepartment(presentParentdepartment, USER.getAccount());
				}
			}
			else {
				userService.insertDepartment(department, USER.getAccount());
			}
			if (parentdepartment != null) {
				if (parentdepartment.getUuid() != null) {
					userService.updateDepartment(parentdepartment, USER.getAccount());
				}
				else {
					userService.insertDepartment(parentdepartment, USER.getAccount());
				}
			}
			ut.commit();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			ut.rollback();
		}
	}
}
