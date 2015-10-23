package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialType;
import com.ito.fai.util.JndiFactory;

public class GetMaterialTypeAction extends AjaxAction {
	public void executeAutoUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");

		MaterialType materialType = materialService.selectMaterialTypeByUuid(uuid);
		setResponseText(materialType);
	}
}
