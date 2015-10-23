package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class DeleteMaterialTypeAction extends AjaxAction {
	private String HAVE_CHILDREN_STATUS = "0";
	private String SUCCESS_STATUS = "1";

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");

		Constraint constraint = new Constraint("MaterialType");
		constraint.addCondition("parentUuid", uuid);
		constraint.addCondition("ifUsing", true);
		List<MaterialType> materialTypeList = materialService.selectMaterialTypes(constraint);

		if (materialTypeList.size() > 0) {
			setResponseText(HAVE_CHILDREN_STATUS);
		}
		else {
			MaterialType materialType = materialService.selectMaterialTypeByUuid(uuid);
			materialType.setIfUsing(false);

			MaterialType parentMaterialType = null;
			String parentUuid = materialType.getParentUuid();
			if (parentUuid != null) {
				Constraint constraint2 = new Constraint("MaterialType");
				constraint2.addCondition("parentUuid", parentUuid);
				constraint2.addCondition("ifUsing", true);
				List<MaterialType> brotherMaterialTypeList = materialService.selectMaterialTypes(constraint2);
				if (brotherMaterialTypeList.size() == 1) {
					parentMaterialType = materialService.selectMaterialTypeByUuid(parentUuid);
					parentMaterialType.setIfHasChild(false);
				}
			}

			ut.begin();
			try {
				materialService.updateMaterialType(materialType, USER.getAccount());
				if (parentMaterialType != null) {
					materialService.updateMaterialType(parentMaterialType, USER.getAccount());
				}
				ut.commit();
				setResponseText(SUCCESS_STATUS);
			}
			catch (Exception e) {
				ut.rollback();
			}
		}
	}
}
