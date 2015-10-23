package com.ito.edito.action.get;

import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Job;
import com.ito.edito.schema.Menu;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetJobRoleAction extends AjaxAction {
	private String NO_ROLES_STATUS = "1";

	private HashMap<String, Object> map = new HashMap<String, Object>();

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String stationName = request.getParameter("stationName");

		Job job = userService.selectJobByUuid(uuid);

		String jobUuid = job.getUuid();
		List<Menu> menuList = null;
		Constraint cm = new Constraint("Menu");
		cm.addCondition("stationName", stationName);
		cm.addCondition("parentUuid", null);
		cm.addOrderCondition("sequence", "asc");
		menuList = userService.selectJobMenus(cm, jobUuid);

		if (menuList != null && menuList.size() > 0) {
			map.put("job", job);
			map.put("menus", menuList);
		}
		else {
			map.put("job", job);
			map.put("menus", NO_ROLES_STATUS);
		}

		setResponseText(map);
	}
}
