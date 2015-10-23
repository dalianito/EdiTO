package com.ito.edito.action.get;

import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Menu;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetEmployeeRoleAction extends AjaxAction {
	private String NO_ROLES_STATUS = "1";
	private String NO_USER_STATUS = "2";

	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String stationName = request.getParameter("stationName");

		Person person = userService.selectPersonByUuid(uuid);
		Constraint cUser = new Constraint("User");
		cUser.addCondition("personUuid", person.getUuid());
		User user = userService.selectUser(cUser);
		if (user != null) {
			String userUuid = user.getUuid();
			List<Menu> menuList = null;
			Constraint cm = new Constraint("Menu");
			cm.addCondition("stationName", stationName);
			cm.addCondition("parentUuid", null);
			cm.addOrderCondition("sequence", "ASC");
			menuList = userService.selectMenus(cm, userUuid);

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
