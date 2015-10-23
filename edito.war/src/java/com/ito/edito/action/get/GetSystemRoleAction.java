package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Menu;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetSystemRoleAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String stationName = request.getParameter("stationName");

		Constraint c = new Constraint("Menu");
		c.addCondition("parentUuid", null);
		c.addCondition("stationName", stationName);
		c.addOrderCondition("sequence", "asc");
		List<Menu> menuList = userService.selectAllMenus(c);

		setResponseText(menuList);
	}
}
