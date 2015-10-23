package com.ito.edito.action.dropmenu;

import java.util.HashMap;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Material;
import com.ito.edito.schema.MaterialStorage;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialInfoAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		String uuid = request.getParameter("uuid");
		String relationId = request.getParameter("relationId");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("relationId", relationId);

		Material material = materialService.selectMaterialByUuid(uuid);
		map.put("material", material);
		
		Constraint c = new Constraint("MaterialStorage");
		c.addCondition("materialUuid", uuid);
		c.addCondition("campusUuid", relationId);
		MaterialStorage materialStorage = materialService.selectMaterialStorage(c);
		map.put("materialStorage", materialStorage);

		setResponseText(map);
	}
}
