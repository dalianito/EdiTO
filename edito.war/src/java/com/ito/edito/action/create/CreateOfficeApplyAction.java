package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.fai.util.JndiFactory;

public class CreateOfficeApplyAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		OfficeApplication officeApplication = (OfficeApplication) carrier.fetchInstance("OfficeApplication");
		Apply apply = (Apply) carrier.fetchInstance("Apply");
		List<OfficeApplicationInfo> officeApplicationInfoList = (List<OfficeApplicationInfo>) carrier.fetchInstances("OfficeApplicationInfo");
		officeApplication.setOfficeMaterials(officeApplicationInfoList);
		officeApplication.setIfUsing(true);
		apply.setApplicantUuid(EMPLOYEE.getUuid(), false);
		apply.setApplicationTime(new Date());
		apply.setIfUsing(true);

		ut.begin();
		try {
			String applyUuid = apply.getUuid();
			if (applyUuid == null) {
				applyUuid = applyService.insertApply(apply, USER.getAccount());
			}
			else {
				applyService.updateApply(apply, USER.getAccount());
			}
			officeApplication.setApplyUuid(applyUuid, false);

			String officeApplicationUuid = officeApplication.getUuid();
			if (officeApplicationUuid == null) {
				materialService.insertOfficeApplication(officeApplication, USER.getAccount());
			}
			else {
				materialService.updateOfficeApplication(officeApplication, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
