package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialAllocate;
import com.ito.edito.schema.MaterialStorage;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateMaterialAllocateAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		MaterialAllocate materialAllocate = (MaterialAllocate) carrier.fetchInstance("MaterialAllocate");
		materialAllocate.setKeeperUuid(EMPLOYEE.getUuid(), false);
		materialAllocate.setRecordTime(new Date());
		materialAllocate.setIfUsing(true);

		Constraint c = new Constraint("MaterialStorage");
		c.addCondition("materialUuid", materialAllocate.getMaterialUuid());
		c.addCondition("campusUuid", materialAllocate.getDemandCampusUuid());
		MaterialStorage materialStorageA = materialService.selectMaterialStorage(c);
		materialStorageA.setAmount(materialStorageA.getAmount() + materialAllocate.getAmount());
		materialStorageA.setTotal(materialStorageA.getTotal() + materialAllocate.getAmount());
		materialAllocate.setDemandInventoryUuid(materialStorageA.getUuid(), false);

		Constraint c1 = new Constraint("MaterialStorage");
		c1.addCondition("materialUuid", materialAllocate.getMaterialUuid());
		c1.addCondition("campusUuid", materialAllocate.getDeployedCampusUuid());
		MaterialStorage materialStorageB = materialService.selectMaterialStorage(c1);
		materialStorageB.setAmount(materialStorageB.getAmount() - materialAllocate.getAmount());
		materialStorageB.setTotal(materialStorageB.getTotal() - materialAllocate.getAmount());
		materialAllocate.setDeployedInventoryUuid(materialStorageB.getUuid(), false);

		ut.begin();
		try {
			if (materialAllocate.getUuid() == null) {
				materialService.insertMaterialAllocate(materialAllocate, USER.getAccount());
			}

			materialService.updateMaterialStorage(materialStorageA, USER.getAccount());
			materialService.updateMaterialStorage(materialStorageB, USER.getAccount());

			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
