package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.ParticipatorInfo;
import com.ito.edito.schema.PreParticipatorInfo;
import com.ito.edito.schema.PropagandaMaterialInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.fai.util.JndiFactory;

public class CreatePublicityApplyAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		Apply apply = (Apply) carrier.fetchInstance("Apply");
		PublicityApplication publicityApplication = (PublicityApplication) carrier.fetchInstance("PublicityApplication");
		List<PreParticipatorInfo> preParticipatorInfoList = (List<PreParticipatorInfo>) carrier.fetchInstances("PreParticipatorInfo");
		List<PropagandaMaterialInfo> propagandaMaterialInfoList = (List<PropagandaMaterialInfo>) carrier.fetchInstances("PropagandaMaterialInfo");
		List<ParticipatorInfo> participatorInfoList = (List<ParticipatorInfo>) carrier.fetchInstances("ParticipatorInfo");

		apply.setApplicantUuid(EMPLOYEE.getUuid(), false);
		apply.setApplicationTime(new Date());
		apply.setIfUsing(true);

		publicityApplication.setPreParticipators(preParticipatorInfoList);
		publicityApplication.setMaterials(propagandaMaterialInfoList);
		publicityApplication.setParticipators(participatorInfoList);

		publicityApplication.setIfUsing(true);

		ut.begin();
		try {
			String applyUuid = apply.getUuid();
			if (applyUuid == null) {
				applyUuid = applyService.insertApply(apply, USER.getAccount());
			}
			else {
				applyService.updateApply(apply, USER.getAccount());
			}
			publicityApplication.setApplyUuid(applyUuid, false);

			String publicityApplicationUuid = publicityApplication.getUuid();
			if (publicityApplicationUuid == null) {
				publicityApplicationUuid = applyService.insertPublicityApplication(publicityApplication, USER.getAccount());
			}
			else {
				applyService.updatePublicityApplication(publicityApplication, USER.getAccount());
			}
			ut.commit();

			setResponseText(publicityApplicationUuid);
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
