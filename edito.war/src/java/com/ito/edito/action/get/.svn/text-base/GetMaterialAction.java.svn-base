package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Material;
import com.ito.fai.util.JndiFactory;

public class GetMaterialAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Material material = materialService.selectMaterialByUuid(uuid);
			request.setAttribute("material", material);
		}
	}
}
