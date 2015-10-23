package com.ito.edito.action.query;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryOrderCancelAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		String orderGenerateUuid = request.getParameter("uuid");

		Constraint c = new Constraint("OfficeApplicationInfo");
		c.addCondition("stateUuid", Constants.EXAMINATION_STATE_PASSED);
		c.addCondition("ifGenerate", 1);
		c.addCondition("orderGenerateUuid", orderGenerateUuid);
		c.addOrderCondition("materialUuid", "asc");
		List<OfficeApplicationInfo> officeApplicationInfosTemp = materialService.selectOfficeApplicationInfos(c);
		for (int i = 0; i < officeApplicationInfosTemp.size(); i++) {
			OfficeApplicationInfo officeApplicationInfo = officeApplicationInfosTemp.get(i);
			officeApplicationInfo.setIfGenerate(false);
			officeApplicationInfo.setOrderGenerateUuid(null, false);
			ut.begin();
			materialService.updateOfficeApplicationInfo(officeApplicationInfo, USER.getAccount());
			ut.commit();
		}
		OrderGenerate orderGenerate = materialService.selectOrderGenerateByUuid(orderGenerateUuid);
		orderGenerate.setIfUsing(false);
		ut.begin();
		materialService.deleteOrderGenerate(orderGenerate, USER.getAccount());
		ut.commit();
	}
}
