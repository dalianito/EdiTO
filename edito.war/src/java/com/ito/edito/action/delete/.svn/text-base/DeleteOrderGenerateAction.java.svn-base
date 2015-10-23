package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.OrderGenerate;
import com.ito.fai.util.JndiFactory;

public class DeleteOrderGenerateAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		String uuid = request.getParameter("uuid");
		OrderGenerate orderGenerate = materialService.selectOrderGenerateByUuid(uuid);
		orderGenerate.setIfUsing(false);
		ut.begin();
		materialService.updateOrderGenerate(orderGenerate, USER.getAccount());
		ut.commit();
	}
}
