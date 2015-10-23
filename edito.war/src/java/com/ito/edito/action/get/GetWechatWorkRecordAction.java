package com.ito.edito.action.get;

import java.util.Date;
import java.util.HashMap;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.edito.util.WechatUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWechatWorkRecordAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String code = request.getParameter("code");

		Employee employee = null;

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
					resultCode = Constants.WECHAT_USER_AUTHORITY_UNBIND;
					request.setAttribute("fromUserName", openId);
				}
				else {
					Constraint workRecordC = new Constraint("WorkRecord");
					String today = Constants.DATE_FORMAT_YMD.format(new Date());
					workRecordC.addCondition("recordUuid", employee.getUuid());
					workRecordC.addCondition("recordTime", today + "%", Constraint.LIKE);
					WorkRecord workRecord = campusService.selectWorkRecord(workRecordC);

					request.setAttribute("workRecord", workRecord);
					request.setAttribute("employee", employee);
					resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
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
				request.setAttribute("employee", employee);
				resultCode = Constants.WECHAT_USER_AUTHORITY_YES;
			}
			else {
				resultCode = Constants.WECHAT_USER_AUTHORITY_UNBIND;
			}
		}
	}
}
