package com.ito.edito.action.get;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.schema.Menu;
import com.ito.edito.util.MenuFilter;

public class GetMenuIfOpenedAction extends AjaxAction {
	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		String menuUuid = request.getParameter("menuUuid");
		String ifOpened = request.getParameter("ifOpened");

		HashMap<String, Menu> menuMap = (HashMap<String, Menu>) request.getSession().getAttribute(MenuFilter.USER_MENU_KEY);
		Menu menu = menuMap.get(menuUuid);
		menu.setOpened(ifOpened);
	}
}
