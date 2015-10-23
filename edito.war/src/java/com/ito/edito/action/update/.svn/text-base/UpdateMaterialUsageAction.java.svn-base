package com.ito.edito.action.update;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialExport;
import com.ito.edito.schema.MaterialStorage;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class UpdateMaterialUsageAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");

		MaterialExport materialExport = materialService.selectMaterialExportByUuid(uuid);
		materialExport.setStateUuid(Constants.RETURN_STATE_DONE, false);
		materialExport.setReturnDate(new Date());

		MaterialStorage materialStorage = materialService.selectMaterialStorageByUuid(materialExport.getMaterialStorageUuid());
		materialStorage.setAmount(materialStorage.getAmount() + materialExport.getAmount());

		ut.begin();
		try {
			if (materialExport != null) {
				materialService.updateMaterialExport(materialExport, USER.getAccount());
				materialService.updateMaterialStorage(materialStorage, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
