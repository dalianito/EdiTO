package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialTypeAction extends AjaxAction {

	public void executeAutoUT() throws Exception {

		List<String[]> materialTypes = new ArrayList<String[]>();
		getChildren(materialTypes, null, 0);

		setResponseText(materialTypes);
	}

	private static void getChildren(List<String[]> materialTypes, String uuid, int level) throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		Constraint constraint = new Constraint("MaterialType");
		constraint.addCondition("parentUuid", uuid);
		constraint.addCondition("ifUsing", "1");
		List<MaterialType> materialTypesTemp = materialService.selectMaterialTypes(constraint);
		for (int i = 0; i < materialTypesTemp.size(); i++) {
			MaterialType materialType = materialTypesTemp.get(i);
			String[] str = new String[3];
			str[0] = String.valueOf(level);
			str[1] = materialType.getDescription();
			str[2] = materialType.getUuid();
			materialTypes.add(str);
			int nextLevel = level + 1;
			getChildren(materialTypes, materialType.getUuid(), nextLevel);
		}
	}
}
