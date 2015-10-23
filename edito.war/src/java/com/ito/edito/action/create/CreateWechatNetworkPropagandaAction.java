package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.PosterInfo;
import com.ito.edito.schema.User;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateWechatNetworkPropagandaAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		InternetPublicity internetPublicity = (InternetPublicity) carrier.fetchInstance("InternetPublicity");
		List<PosterInfo> posterInfoList = (List<PosterInfo>) carrier.fetchInstances("PosterInfo");
		internetPublicity.setRecordTime(new Date());
		internetPublicity.setPosterInfos(posterInfoList);
		internetPublicity.setReviewFlagUuid(Constants.NOT_REVIEW_FLAG, false);

		Employee employee = userService.selectEmployeeByUuid(internetPublicity.getRecordUuid());
		Constraint c = new Constraint("User");
		c.addCondition("personUuid", employee.getPersonUuid());
		c.addCondition("ifUsing", true);
		User user = userService.selectUser(c);

		ut.begin();
		try {
			String internetPublicityUuid = internetPublicity.getUuid();
			if (internetPublicityUuid == null) {
				internetPublicityUuid = campusService.insertInternetPublicity(internetPublicity, Constants.WECHAT_USER + user.getAccount());
			}
			else {
				campusService.updateInternetPublicity(internetPublicity, Constants.WECHAT_USER + user.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}

	}
}
