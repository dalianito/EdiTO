package com.ito.edito.action.get;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.MaterialImport;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetOfficeApplyAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		String uuid = request.getParameter("uuid");
		int passNum = 0;

		if (uuid != null && uuid.length() > 0) {
			OfficeApplication officeApplication = materialService.selectOfficeApplicationByUuid(uuid);
			for (int i = 0; i < officeApplication.getOfficeMaterialsAsReference().size(); i++) {
				OfficeApplicationInfo officeApplicationInfo = officeApplication.getOfficeMaterialsAsReference().get(i);
				if (Constants.EXAMINATION_STATE_PASSED.equals(officeApplicationInfo.getStateUuid())) {
					passNum++;
				}
			}

			List<OfficeApplicationInfo> officeApplicationInfoList = officeApplication.getOfficeMaterialsAsReference();
			List<String> priceList = new ArrayList<String>();
			for (int i = 0; i < officeApplicationInfoList.size(); i++) {
				OfficeApplicationInfo officeApplicationInfo = officeApplicationInfoList.get(i);

				Constraint c = new Constraint("MaterialImport");
				c.addCondition("applicationInfoUuid", officeApplicationInfo.getUuid());
				MaterialImport materialImport = materialService.selectMaterialImport(c);
				if (materialImport != null) {
					priceList.add(Constants.DECIMAL_FORMAT.format(materialImport.getPrice()));
				}
				else {
					priceList.add("");
				}
			}
			request.setAttribute("priceList", priceList);
			request.setAttribute("officeApplication", officeApplication);
			request.setAttribute("passNum", passNum);
			request.setAttribute("receipStateUuid", Constants.RECEIPT_STATE_UNDONE);
		}
	}
}
