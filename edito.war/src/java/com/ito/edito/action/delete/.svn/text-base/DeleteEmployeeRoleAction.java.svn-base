package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Authority;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class DeleteEmployeeRoleAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String personUuid = request.getParameter("personUuid");

		Constraint c = new Constraint("User");
		c.addCondition("personUuid", personUuid);
		User user = userService.selectUser(c);
		String userUuid = user.getUuid();
		List<Authority> authorityList = userService.selectAuthorityDeleted(uuid, userUuid, USER.getAccount());

		ut.begin();
		try {
			for (int i = 0; i < authorityList.size(); i++) {
				Authority authority = authorityList.get(i);
				userService.deleteAuthority(authority, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
