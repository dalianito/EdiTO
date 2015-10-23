package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialInfo;
import com.ito.edito.schema.Supplier;
import com.ito.fai.util.JndiFactory;

public class CreateListAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		Supplier supplier = (Supplier) carrier.fetchInstance("Supplier");
		List<MaterialInfo> materialInfoList = (List<MaterialInfo>) carrier.fetchInstances("MaterialInfo");

		supplier.setIfHasChild(false);
		supplier.setIfUsing(true);
		supplier.setRecorderUuid(EMPLOYEE.getUuid(), false);
		supplier.setRecordTime(new Date());
		supplier.setMaterials(materialInfoList);

		ut.begin();
		if (supplier.getUuid() != null) {
			materialService.updateSupplier(supplier, USER.getAccount());
		}
		else {
			materialService.insertSupplier(supplier, USER.getAccount());
		}
		ut.commit();
	}
}
