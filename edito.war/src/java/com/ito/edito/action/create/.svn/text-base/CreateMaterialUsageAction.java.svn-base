package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialExport;
import com.ito.edito.schema.MaterialStorage;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateMaterialUsageAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		MaterialExport materialExport = (MaterialExport) carrier.fetchInstance("MaterialExport");
		materialExport.setStateUuid(Constants.RETURN_STATE_UNDONE, false);
		materialExport.setKeeperUuid(EMPLOYEE.getUuid(), false);
		materialExport.setCampusUuid(EMPLOYEE.getCampusUuid(), false);
		materialExport.setExportDate(new Date());
		materialExport.setIfUsing(true);

		Constraint c = new Constraint("MaterialStorage");
		c.addCondition("materialUuid", materialExport.getMaterialUuid());
		c.addCondition("campusUuid", EMPLOYEE.getCampusUuid());
		MaterialStorage materialStorage = materialService.selectMaterialStorage(c);
		materialStorage.setAmount(materialStorage.getAmount() - materialExport.getAmount());

		materialExport.setMaterialStorageUuid(materialStorage.getUuid(), false);

		ut.begin();
		try {
			if (materialExport.getUuid() == null) {
				materialService.insertMaterialExport(materialExport, USER.getAccount());
			}

			materialService.updateMaterialStorage(materialStorage, USER.getAccount());

			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
