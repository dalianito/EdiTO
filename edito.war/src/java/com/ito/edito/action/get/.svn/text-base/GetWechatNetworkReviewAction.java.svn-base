package com.ito.edito.action.get;

import java.util.HashMap;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.JobAuthority;
import com.ito.edito.util.Constants;
import com.ito.edito.util.WechatUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWechatNetworkReviewAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		Employee employee = null;
		String code = request.getParameter("code");

		if (code != null) {
			HashMap<String, String> resultMap = WechatUtil.getNewAccessTokenOauth2(code);
			if (resultMap != null) {
				
				String openId = resultMap.get("openid");

				Constraint employeeC = new Constraint("Employee");
				employeeC.addCondition("ifUsing", true);
				employeeC.addCondition("openId", openId);
				employeeC.addCondition("openId", null, Constraint.UNEQUAL);
				employee = userService.selectEmployee(employeeC);

				if (employee == null) {
					request.setAttribute("fromUserName", openId);
					resultCode = Constants.WECHAT_USER_AUTHORITY_UNBIND;
				}
				else {
					Constraint jobAuthorityC = new Constraint("JobAuthority");
					jobAuthorityC.addCondition("jobUuid", employee.getJobUuid());
					jobAuthorityC.addCondition("menuUuid", Constants.MENUUUID_NETWORK_REVIEW);
					JobAuthority jobAuthority = userService.selectJobAuthority(jobAuthorityC);
					if (jobAuthority == null) {
						request.setAttribute("fromUserName", openId);
						resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
					}
					else {
						request.setAttribute("employee", employee);
						resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
					}
				}
			}
			else {
				resultCode = Constants.WECHAT_INTERNET_CONNECT_ERROR;
			}
		}
		else {
			String employeeUuid = request.getParameter("employeeUuid");
			if (employeeUuid != null && employeeUuid.length() > 0) {
				employee = userService.selectEmployeeByUuid(employeeUuid);
			}
			if (employee != null) {
				Constraint jobAuthorityC = new Constraint("JobAuthority");
				jobAuthorityC.addCondition("jobUuid", employee.getJobUuid());
				jobAuthorityC.addCondition("menuUuid", Constants.MENUUUID_NETWORK_REVIEW);
				JobAuthority jobAuthority = userService.selectJobAuthority(jobAuthorityC);
				if (jobAuthority == null) {
					request.setAttribute("fromUserName", employee.getOpenId());
					resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
				}
				else {
					request.setAttribute("employee", employee);
					resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
				}
			}
			else {
				resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
			}
		}
	}
}
