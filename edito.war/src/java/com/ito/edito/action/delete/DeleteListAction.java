package com.ito.edito.action.delete;

import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialInfo;
import com.ito.edito.schema.Supplier;
import com.ito.fai.util.JndiFactory;

public class DeleteListAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");

		Supplier supplier = materialService.selectSupplierByUuid(uuid);
		supplier.setIfUsing(false);
		supplier.setMaterials(new ArrayList<MaterialInfo>());

		ut.begin();
		materialService.updateSupplier(supplier, USER.getAccount());
		ut.commit();
	}
}
