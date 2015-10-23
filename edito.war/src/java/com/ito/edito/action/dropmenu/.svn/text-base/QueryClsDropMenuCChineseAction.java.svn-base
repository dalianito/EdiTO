package com.ito.edito.action.dropmenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.ClsFactory.ClsFactoryService;
import com.ito.fai.util.JndiFactory;

public class QueryClsDropMenuCChineseAction extends AjaxAction {
	public void executeAutoUT() throws Exception {
		ClsFactoryService clsFactoryService = (ClsFactoryService) JndiFactory.lookup("clsFactoryService");

		String key = request.getParameter("key");

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = new HashMap<String, Object>();

		HashMap<String, String> map2 = clsFactoryService.selectClsByChineseName(key);
		if (!map2.isEmpty()) {
			map.put("id", 0);
			map.put("uuid", map2.get("ucid"));
			map.put("chinese", map2.get("chineseName"));
			String[] text = { (String) map2.get("ucid"), (String) map2.get("name"), (String) map2.get("chineseName") };
			map.put("text", text);

			list.add(map);
			setResponseText(list);
		}
	}
}
