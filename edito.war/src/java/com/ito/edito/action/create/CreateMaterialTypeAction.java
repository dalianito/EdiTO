package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateMaterialTypeAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		MaterialType materialType = (MaterialType) carrier.fetchInstance("MaterialType");
		materialType.setIfHasChild(false);
		materialType.setIfUsing(true);

		MaterialType parentMaterialType = null;
		if (materialType.getParentUuid() != null) {
			parentMaterialType = materialService.selectMaterialTypeByUuid(materialType.getParentUuid());
			parentMaterialType.setIfHasChild(true);
		}

		MaterialType presentParentMaterialType = null;
		if (materialType.getUuid() != null) {
			MaterialType materialTypeDB = materialService.selectMaterialTypeByUuid(materialType.getUuid());
			if (materialTypeDB.getParentUuid() != null && !materialTypeDB.getParentUuid().equals(materialType.getParentUuid())) {
				Constraint constraint = new Constraint("MaterialType");
				constraint.addCondition("parentUuid", materialTypeDB.getParentUuid());
				List<MaterialType> presentBrotherMaterialTypes = materialService.selectMaterialTypes(constraint);
				if (presentBrotherMaterialTypes.size() == 1) {
					presentParentMaterialType = materialService.selectMaterialTypeByUuid(materialTypeDB.getParentUuid());
					presentParentMaterialType.setIfHasChild(false);
				}
			}
		}

		ut.begin();
		try {
			if (materialType.getUuid() != null) {
				materialService.updateMaterialType(materialType, USER.getAccount());
				if (presentParentMaterialType != null) {
					materialService.updateMaterialType(presentParentMaterialType, USER.getAccount());
				}
			}
			else {
				materialService.insertMaterialType(materialType, USER.getAccount());
			}
			if (parentMaterialType != null) {
				if (parentMaterialType.getUuid() != null) {
					materialService.updateMaterialType(parentMaterialType, USER.getAccount());
				}
				else {
					materialService.insertMaterialType(parentMaterialType, USER.getAccount());
				}
			}
			ut.commit();
		}
		catch (Exception ex) {
			ut.rollback();
		}
	}
}
