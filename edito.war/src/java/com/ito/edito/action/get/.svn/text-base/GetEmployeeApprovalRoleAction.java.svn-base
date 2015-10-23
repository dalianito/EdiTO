package com.ito.edito.action.get;

import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ApprovalAuthorityType;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeApprovalRoleAction extends AjaxAction {
	private String NO_ROLES_STATUS = "1";
	private String NO_USER_STATUS = "2";

	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Person person = userService.selectPersonByUuid(uuid);
		Constraint cUser = new Constraint("User");
		cUser.addCondition("personUuid", uuid);
		User user = userService.selectUser(cUser);
		if (user != null) {
			String sql = "select T.* from ApprovalAuthority A, ApprovalAuthorityType T where A.authorityUuid = T.uuid and A.userUuid = '" + user.getUuid() + "' order by T.uuid";

			Constraint c = new Constraint("ApprovalAuthorityType");
			c.addSQLCondition(sql, null);
			List<ApprovalAuthorityType> menuList = userService.selectApprovalAuthorityTypes(c);
			if (menuList != null && menuList.size() > 0) {
				map.put("person", person);
				map.put("menus", menuList);
			}
			else {
				map.put("person", person);
				map.put("menus", NO_ROLES_STATUS);
			}
		}
		else {
			map.put("person", person);
			map.put("menus", NO_USER_STATUS);
		}
		setResponseText(map);
	}
}
