package com.ito.edito.action.tree;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.BaseData.BaseDataService;
import com.ito.edito.schema.BaseData;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetDataOfInitBaseTreeAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		String className = request.getParameter("className");
		String value = request.getParameter("value");
		String sortField = request.getParameter("sortField");
		String sortType = request.getParameter("sortType");
		String rJavaClassName = request.getParameter("rJavaClassName");
		String parentKey = request.getParameter("parentKey");
		String parentValue = request.getParameter("parentValue");
		String childKey = request.getParameter("childKey");
		Boolean bool = false;

		BaseDataService baseDataService = (BaseDataService) JndiFactory.lookup("baseDataService");

		if ((rJavaClassName != null && rJavaClassName.length() > 0) || (parentKey != null && parentKey.length() > 0) || (parentValue != null && parentValue.length() > 0) || (childKey != null && childKey.length() > 0)) {
			bool = true;
		}

		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		List<String> uuidList = new ArrayList<String>();
		BaseData bd = baseDataService.selectBaseDataByUuid(value);
		while (bd != null) {
			uuidList.add(bd.getUuid());
			bd = bd.getParent();
		}
		uuidList.add(null);
		Collections.reverse(uuidList);
		int level = uuidList.size();
		for (int i = 0; i < uuidList.size() - 1; i++) {
			Constraint constraint = new Constraint(className);
			constraint.addCondition("parentUuid", (String) uuidList.get(i));// 找子节点
			if (bool) {
				String childKeysName = childKey.substring(0, 1).toUpperCase() + childKey.substring(1);

				Constraint c = new Constraint(rJavaClassName);
				// c.addCondition(parentKey, parentValue);
				if (parentValue.equals("true")) {
					c.addCondition(parentKey, Boolean.TRUE);
				}
				else if (parentValue.equals("false")) {
					c.addCondition(parentKey, Boolean.FALSE);
				}
				else {
					c.addCondition(parentKey, parentValue);
				}
				List<BaseData> list2 = baseDataService.selectBaseDatas(c);
				List<String> uuidList2 = new ArrayList<String>();
				for (int j = 0; j < list2.size(); j++) {
					Class<?> cls = Class.forName("com.ito.edito.schema." + rJavaClassName);

					Method method = cls.getMethod("get" + childKeysName);
					String uuid = (String) method.invoke(list2.get(j));
					uuidList2.add(uuid);
				}
				if (uuidList2.size() > 0)
					constraint.addCondition("uuid", uuidList2, Constraint.IN_LIST);
				else
					constraint.addCondition("uuid", null);
			}

			constraint.addCondition("ifUsing", Boolean.TRUE);
			constraint.addOrderCondition(sortField, sortType);
			List<BaseData> bds = baseDataService.selectBaseDatas(constraint);

			for (int j = 0; j < bds.size(); j++) {
				BaseData baseData = bds.get(j);
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("uuid", baseData.getUuid());
				map.put("text", baseData.getDescription());
				if (baseData.getUuid().equals(uuidList.get(i + 1))) {// 此节点是否是页面上的节点
					if (i == level - 2) {
						if (baseData.getIfHasChild()) {
							map.put("status", "0");
						}
						else {
							map.put("status", "1");
						}
					}
					else {
						map.put("status", "2");
					}
				}
				else {
					if (baseData.getIfHasChild()) {
						map.put("status", "0");
					}
					else {
						map.put("status", "1");
					}
				}
				map.put("parentUuid", (String) uuidList.get(i));
				map.put("level", String.valueOf(i));
				list.add(map);
			}
		}
		setResponseText(list);
	}
}
