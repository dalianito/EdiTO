package com.ito.edito.action.get;

import java.util.Date;
import java.util.HashMap;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.util.Constants;
import com.ito.edito.util.WechatUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWechatNetworkPropagandaAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String code = request.getParameter("code");

		if (code != null) {
			HashMap<String, String> resultMap = WechatUtil.getNewAccessTokenOauth2(code);
			if (resultMap != null) {
				
				String openId = resultMap.get("openid");

				Constraint employeeC = new Constraint("Employee");
				employeeC.addCondition("ifUsing", true);
				employeeC.addCondition("openId", openId);
				employeeC.addCondition("openId", null, Constraint.UNEQUAL);
				Employee employee = userService.selectEmployee(employeeC);

				if (employee == null) {
					request.setAttribute("fromUserName", openId);
					resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
				}
				else {
					String today = Constants.DATE_FORMAT_YMD.format(new Date());
					Constraint c = new Constraint("InternetPublicity");
					c.addCondition("recordUuid", employee.getUuid());
					c.addCondition("recordTime", today + "%", Constraint.LIKE);
					c.addCondition("ifUsing", true);
					InternetPublicity internetPublicity = campusService.selectInternetPublicity(c);
					request.setAttribute("internetPublicity", internetPublicity);
					request.setAttribute("employee", employee);
					if (internetPublicity != null) {
						if (internetPublicity.getPosterInfos() != null) {
							int countFlag = 1;
							int nullFlag = internetPublicity.getPosterInfos().length;
							for (int j = 0; j < internetPublicity.getPosterInfos().length; j++) {
								if (internetPublicity.getPosterInfos(j).getSite() != null) {
									request.setAttribute("posterInfo" + (countFlag), internetPublicity.getPosterInfos(j));
									countFlag++;
								}
								else {
									request.setAttribute("posterInfo" + (nullFlag), internetPublicity.getPosterInfos(j));
									nullFlag--;
								}
							}
							for (int i = internetPublicity.getPosterInfos().length; i < 10; i++) {
								request.setAttribute("PosterInfo" + (i + 1), null);
							}
						}
					}
					resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
				}
			}
			else {
				resultCode = Constants.WECHAT_INTERNET_CONNECT_ERROR;
			}
		}
		else {
			String uuid = request.getParameter("Uuid");
			if (uuid != null) {
				Constraint c = new Constraint("InternetPublicity");
				c.addCondition("recordUuid", uuid);
				c.addCondition("ifUsing", true);
				InternetPublicity internetPublicity = campusService.selectInternetPublicity(c);

				Employee employee = userService.selectEmployeeByUuid(uuid);
				request.setAttribute("internetPublicity", internetPublicity);
				request.setAttribute("employee", employee);
				resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
			}
		}
	}
}
