package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Material;
import com.ito.fai.util.JndiFactory;

public class DeleteMaterialAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");

		Material material = materialService.selectMaterialByUuid(uuid);
		material.setIfUsing(false);

		ut.begin();
		materialService.updateMaterial(material, USER.getAccount());
		ut.commit();
	}
}
