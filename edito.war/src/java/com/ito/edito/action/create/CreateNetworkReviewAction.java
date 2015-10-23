package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateNetworkReviewAction extends AjaxAction {
	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		List<InternetPublicity> internetPublicity = (List<InternetPublicity>) carrier.fetchInstances("InternetPublicity");
		for (int i = 0; i < internetPublicity.size(); i++) {
			ut.begin();
			try {
				internetPublicity.get(i).setIfUsing(true);
				internetPublicity.get(i).setReviewEmployeeUuid(EMPLOYEE.getUuid());
				if(internetPublicity.get(i).getReviewFlagUuid().equals(Constants.REVIEWD_FLAG)){
					internetPublicity.get(i).setReviewTime(new Date());
				}
				campusService.updateInternetPublicity(internetPublicity.get(i), USER.getAccount());

				ut.commit();
			}
			catch (Exception e) {
				ut.rollback();
			}
		}
	}
}
