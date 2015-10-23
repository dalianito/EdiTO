package com.ito.edito.action.update;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialImport;
import com.ito.edito.schema.MaterialStorage;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class UpdateReceiptStateAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");
		String price = request.getParameter("price");

		MaterialImport materialImport = new MaterialImport();
		materialImport.setPrice(Double.parseDouble(price));
		materialImport.setRecorderUuid(EMPLOYEE.getUuid(), false);

		OfficeApplicationInfo officeApplicationInfo = materialService.selectOfficeApplicationInfoByUuid(uuid);
		OfficeApplication officeApplication = materialService.selectOfficeApplicationByUuid(officeApplicationInfo.getBizDataUuid());
		if (officeApplicationInfo != null) {
			officeApplicationInfo.setReceipStateUuid(Constants.RECEIPT_STATE_DONE, false);
			Constraint c = new Constraint("MaterialStorage");
			c.addCondition("materialUuid", officeApplicationInfo.getMaterialUuid());
			c.addCondition("campusUuid", officeApplication.getCampusUuid());
			MaterialStorage materialStorage = materialService.selectMaterialStorage(c);
			if (materialStorage != null) {
				materialStorage.setAmount(officeApplicationInfo.getApprovalAmount() + materialStorage.getAmount());
				materialStorage.setTotal(officeApplicationInfo.getApprovalAmount() + materialStorage.getTotal());
			}
			else {
				materialStorage = new MaterialStorage();
				materialStorage.setAmount(officeApplicationInfo.getApprovalAmount());
				materialStorage.setTotal(officeApplicationInfo.getApprovalAmount());
			}
			materialStorage.setMaterialUuid(officeApplicationInfo.getMaterialUuid(), false);
			materialStorage.setCampusUuid(officeApplication.getCampusUuid(), false);

			ut.begin();
			try {
				materialService.updateOfficeApplicationInfo(officeApplicationInfo, USER.getAccount());
				String materialStorageUuid = "";
				if (materialStorage.getUuid() != null) {
					materialService.updateMaterialStorage(materialStorage, USER.getAccount());
					materialStorageUuid = materialStorage.getUuid();
				}
				else {
					materialStorageUuid = materialService.insertMaterialStorage(materialStorage, USER.getAccount());
				}
				materialImport.setMaterialStorageUuid(materialStorageUuid, false);
				materialImport.setApplicationInfoUuid(officeApplicationInfo.getUuid(), false);
				materialImport.setMaterialUuid(officeApplicationInfo.getMaterialUuid(), false);
				materialImport.setSupplierUuid(officeApplicationInfo.getOrderGenerate().getSupplierUuid(), false);
				materialImport.setAmount(officeApplicationInfo.getApprovalAmount());
				materialImport.setUnit(officeApplicationInfo.getMaterial().getUnit());
				materialImport.setDepartmentUuid(officeApplication.getDepartmentUuid(), false);
				materialImport.setCampusUuid(officeApplication.getCampusUuid(), false);
				materialImport.setImportDate(new Date());
				materialService.insertMaterialImport(materialImport, USER.getAccount());

				ut.commit();
			}
			catch (Exception e) {

				ut.rollback();
			}
			setResponseText(officeApplicationInfo.getReceipStateUuid());
		}
	}
}
