package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.PosterInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateNetworkPropagandaAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		InternetPublicity internetPublicity = (InternetPublicity) carrier.fetchInstance("InternetPublicity");
		List<PosterInfo> posterInfoList = (List<PosterInfo>) carrier.fetchInstances("PosterInfo");
		internetPublicity.setRecordTime(new Date());
		internetPublicity.setPosterInfos(posterInfoList);
		internetPublicity.setReviewFlagUuid(Constants.NOT_REVIEW_FLAG, false);

		ut.begin();
		try {
			String internetPublicityUuid = internetPublicity.getUuid();
			if (internetPublicityUuid == null) {
				internetPublicityUuid = campusService.insertInternetPublicity(internetPublicity, USER.getAccount());
			}
			else {
				campusService.updateInternetPublicity(internetPublicity, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
