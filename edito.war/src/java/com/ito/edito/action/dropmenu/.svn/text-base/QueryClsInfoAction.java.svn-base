package com.ito.edito.action.dropmenu;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.ClsFactory.ClsFactoryService;
import com.ito.fai.util.JndiFactory;

public class QueryClsInfoAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		ClsFactoryService clsFactoryService = (ClsFactoryService) JndiFactory.lookup("clsFactoryService");

		String ucid = request.getParameter("uuid");
		String relationId = request.getParameter("relationId");

		HashMap<String, String> map = new HashMap<String, String>();

		map = clsFactoryService.selectClsByUcid(ucid);

		String name = (String) map.get("name");
		String chinese = (String) map.get("chineseName");

		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("relationId", relationId);
		map2.put("ucid", ucid);
		map2.put("name", name);
		map2.put("chinese", chinese);
		setResponseText(map2);
	}
}
