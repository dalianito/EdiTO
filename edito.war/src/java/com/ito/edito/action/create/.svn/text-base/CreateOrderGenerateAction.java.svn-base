package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateOrderGenerateAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String materialUuid = request.getParameter("materialUuid");
		String materialAmount =request.getParameter("materialAmount");
		String supplierUuid = request.getParameter("supplierUuid");
		String infoUuids = request.getParameter("infoUuids");
		OrderGenerate orderGenerate = new OrderGenerate();
		
		orderGenerate.setMaterialUuid(materialUuid,false);
		orderGenerate.setMaterialAmount(Integer.parseInt(materialAmount));
		orderGenerate.setSupplierUuid(supplierUuid,false);
		orderGenerate.setGeneratorUuid(EMPLOYEE.getUuid(),false);
		orderGenerate.setGenerateTime(new Date());
		orderGenerate.setAcceptStateUuid(Constants.RECEIPT_STATE_UNDONE,false);
		orderGenerate.setIfUsing(true);
		
		ut.begin();
		try {
			String orderGenerateUuid = orderGenerate.getUuid();
			if (orderGenerateUuid == null) {
				 orderGenerateUuid = materialService.insertOrderGenerate(orderGenerate, USER.getAccount());
			}
			else {
				materialService.updateOrderGenerate(orderGenerate, USER.getAccount());
			}
			ut.commit();
			String infoUuidArr[] = infoUuids.split(",");
			for(int i=0;i<infoUuidArr.length;i++){
				String infoUuid = infoUuidArr[i];
				OfficeApplicationInfo officeApplicationInfo = materialService.selectOfficeApplicationInfoByUuid(infoUuid);
				officeApplicationInfo.setOrderGenerateUuid(orderGenerateUuid,false);
				officeApplicationInfo.setIfGenerate(true);
				ut.begin();
				materialService.updateOfficeApplicationInfo(officeApplicationInfo, USER.getAccount());
				ut.commit();
			}
			setResponseText(orderGenerateUuid);
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
