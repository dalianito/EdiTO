package com.ito.edito.action.get;

import java.util.HashMap;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.util.Constants;
import com.ito.edito.util.WechatUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWechatLeaveApplyAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

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
					resultCode = Constants.WECHAT_USER_AUTHORITY_UNBIND;
				}
				else {
					request.setAttribute("employee", employee);
					resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
				}
			}
			else {
				resultCode = Constants.WECHAT_INTERNET_CONNECT_ERROR;
			}
		}
		else {
			ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
			String uuid = request.getParameter("uuid");

			if (uuid != null) {
				LeaveApplication leaveApplication = applyService.selectLeaveApplicationByUuid(uuid);

				request.setAttribute("leaveApplication", leaveApplication);
			}

		}
	}
}
