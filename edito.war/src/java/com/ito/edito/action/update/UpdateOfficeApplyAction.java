package com.ito.edito.action.update;

import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.fai.util.JndiFactory;

public class UpdateOfficeApplyAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String uuid = request.getParameter("uuid");

		OfficeApplication officeApplication = materialService.selectOfficeApplicationByUuid(uuid);

		if (officeApplication != null) {
			officeApplication.setIfUsing(false);
			Apply apply = officeApplication.getApply();
			apply.setIfUsing(false);
			officeApplication.setOfficeMaterials(new ArrayList<OfficeApplicationInfo>());

			ut.begin();
			try {
				materialService.updateOfficeApplication(officeApplication, USER.getAccount());
				applyService.updateApply(apply, USER.getAccount());
				ut.commit();
			}
			catch (Exception e) {
				ut.rollback();
			}
		}
	}
}
