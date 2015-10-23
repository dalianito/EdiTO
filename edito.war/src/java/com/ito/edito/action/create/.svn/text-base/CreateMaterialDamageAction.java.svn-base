package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialScrap;
import com.ito.edito.schema.MaterialStorage;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateMaterialDamageAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		MaterialScrap materialScrap = (MaterialScrap) carrier.fetchInstance("MaterialScrap");

		materialScrap.setKeeperUuid(EMPLOYEE.getUuid(), false);
		materialScrap.setCampusUuid(EMPLOYEE.getCampusUuid(), false);
		materialScrap.setRecordTime(new Date());
		materialScrap.setIfUsing(true);

		Constraint c = new Constraint("MaterialStorage");
		c.addCondition("materialUuid", materialScrap.getMaterialUuid());
		c.addCondition("campusUuid", EMPLOYEE.getCampusUuid());
		MaterialStorage materialStorage = materialService.selectMaterialStorage(c);
		materialStorage.setAmount(materialStorage.getAmount() - materialScrap.getAmount());
		materialStorage.setTotal(materialStorage.getTotal() - materialScrap.getAmount());

		materialScrap.setMaterialStorageUuid(materialStorage.getUuid(), false);

		ut.begin();
		try {
			if (materialScrap.getUuid() == null) {
				materialService.insertMaterialScrap(materialScrap, USER.getAccount());
			}
			else {
				materialService.updateMaterialScrap(materialScrap, USER.getAccount());
			}

			materialService.updateMaterialStorage(materialStorage, USER.getAccount());

			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
