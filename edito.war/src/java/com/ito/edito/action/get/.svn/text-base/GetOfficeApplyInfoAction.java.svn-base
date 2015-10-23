package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Material;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.fai.util.JndiFactory;

public class GetOfficeApplyInfoAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		String materialUuid = request.getParameter("materialUuid");
		String officeApplicationInfoUuid = request.getParameter("officeApplicationInfoUuid");
		String orderGenerateUuid = null;

		if (materialUuid != null && materialUuid.length() > 0) {
			Material material = materialService.selectMaterialByUuid(materialUuid);
			OfficeApplicationInfo officeApplicationInfo = materialService.selectOfficeApplicationInfoByUuid(officeApplicationInfoUuid);
			orderGenerateUuid = officeApplicationInfo.getOrderGenerateUuid();
			OrderGenerate orderGenerate = materialService.selectOrderGenerateByUuid(orderGenerateUuid);
			
			request.setAttribute("material", material);
			request.setAttribute("officeApplicationInfo", officeApplicationInfo);
			request.setAttribute("orderGenerate", orderGenerate);
		}
	}
}
