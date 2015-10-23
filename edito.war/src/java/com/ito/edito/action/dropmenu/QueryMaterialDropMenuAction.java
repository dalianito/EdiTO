package com.ito.edito.action.dropmenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Material;
import com.ito.edito.schema.MaterialType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryMaterialDropMenuAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String key = request.getParameter("key");
		String constraints = request.getParameter("constraints");
		String constraintValues = request.getParameter("constraintValues");
		List<String> values = new ArrayList<String>();
		if (constraintValues != "") {
			String ss[] = constraintValues.split(",");
			for (int m = 0; m < ss.length; m++) {
				values.add(ss[m]);
			}
		}
		Constraint constraint = new Constraint("MaterialType");
		constraint.addCondition("description", key + "%", Constraint.LIKE);

		if (constraints != "") {
			constraint.addCondition(constraints, values, Constraint.IN_LIST);
		}

		constraint.addOrderCondition("description", "asc");
		List<MaterialType> materialTypes = materialService.selectMaterialTypes(constraint);

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		int count = 0;
		for (int i = 0; i < materialTypes.size(); i++) {
			MaterialType materialType = materialTypes.get(i);

			Constraint materialC = new Constraint("Material");
			materialC.addCondition("typeUuid", materialType.getUuid());
			List<Material> materialList = materialService.selectMaterials(materialC);
			for (int j = 0; j < materialList.size(); j++) {
				Material material = materialList.get(j);
				if (material != null) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("id", count++);
					map.put("uuid", material.getUuid());
					map.put("name", materialType.getDescription());
					String[] text = { materialType.getDescription(), material.getMaterialNo() == null ? "" : material.getMaterialNo(), material.getSpecification() == null ? "" : material.getSpecification(), material.getMinValue().toString() == null ? "" : material.getUnit().toString(), material.getUnit().toString() == null ? "" : material.getMinValue().toString() };
					map.put("text", text);
					list.add(map);
				}
			}

		}
		setResponseText(list);
	}
}
