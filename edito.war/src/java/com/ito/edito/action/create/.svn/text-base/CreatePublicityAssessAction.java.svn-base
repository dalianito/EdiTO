package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.ParticipatorInfo;
import com.ito.edito.schema.PropagandaMaterialInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.fai.util.JndiFactory;

public class CreatePublicityAssessAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		PublicityApplication publicityApplication = (PublicityApplication) carrier.fetchInstance("PublicityApplication");
		List<ParticipatorInfo> participatorInfoList = (List<ParticipatorInfo>) carrier.fetchInstances("ParticipatorInfo");
		List<PropagandaMaterialInfo> propagandaMaterialInfoList = (List<PropagandaMaterialInfo>) carrier.fetchInstances("PropagandaMaterialInfo");

		publicityApplication.setParticipators(participatorInfoList);
		publicityApplication.setMaterials(propagandaMaterialInfoList);

		ut.begin();
		try {
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
