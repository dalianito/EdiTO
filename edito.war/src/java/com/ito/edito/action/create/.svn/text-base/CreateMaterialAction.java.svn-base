package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Material;
import com.ito.fai.util.JndiFactory;

public class CreateMaterialAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		Material material = (Material) carrier.fetchInstance("Material");
		material.setRecorderUuid(EMPLOYEE.getUuid(), false);
		material.setRecordTime(new Date());
		material.setIfUsing(true);

		ut.begin();
		if (material.getUuid() != null) {
			materialService.updateMaterial(material, USER.getAccount());
		}
		else {
			materialService.insertMaterial(material, USER.getAccount());
		}
		ut.commit();
	}
}
