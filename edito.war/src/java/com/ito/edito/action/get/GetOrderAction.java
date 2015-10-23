package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetOrderAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		String orderGenerateUuid = request.getParameter("uuid");

		if (orderGenerateUuid != null && orderGenerateUuid.length() > 0) {
			Constraint c = new Constraint("OfficeApplicationInfo");
			c.addCondition("orderGenerateUuid", orderGenerateUuid);
			List<OfficeApplicationInfo> officeApplicationInfosTemp = materialService.selectOfficeApplicationInfos(c);
			OrderGenerate orderGenerate = materialService.selectOrderGenerateByUuid(orderGenerateUuid);

			request.setAttribute("officeApplicationInfosTemp", officeApplicationInfosTemp);
			request.setAttribute("orderGenerate", orderGenerate);
		}
	}
}
