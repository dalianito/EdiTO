package com.ito.edito.action.get;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.JobAuthority;
import com.ito.edito.schema.User;
import com.ito.edito.util.Constants;
import com.ito.edito.util.WechatUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetWechatLeaveApprovalAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

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
		}

		if (employee != null) {
			Constraint jobAuthorityC = new Constraint("JobAuthority");
			jobAuthorityC.addCondition("menuUuid", Constants.MENU_ATHORITY_MANAGE_UUID);
			jobAuthorityC.addCondition("jobUuid", employee.getJobUuid());
			JobAuthority jobAuthority = userService.selectJobAuthority(jobAuthorityC);
			if (jobAuthority != null) {
				Constraint userC = new Constraint("User");
				userC.addCondition("personUuid", employee.getPersonUuid());
				userC.addCondition("ifUsing", true);
				User user = userService.selectUser(userC);

				List<String> authorityUuidList = new ArrayList<String>();
				authorityUuidList.add(Constants.APPROVAL_AUTHORITY_4_1);
				authorityUuidList.add(Constants.APPROVAL_AUTHORITY_4_2);
				authorityUuidList.add(Constants.APPROVAL_AUTHORITY_4_3);

				Constraint approvalAuthorityC = new Constraint("ApprovalAuthority");
				approvalAuthorityC.addCondition("userUuid", user.getUuid());
				approvalAuthorityC.addCondition("authorityUuid", authorityUuidList, Constraint.IN_LIST);
				ApprovalAuthority approvalAuthority = userService.selectApprovalAuthority(approvalAuthorityC);
				if (approvalAuthority != null) {
					request.setAttribute("employeeUuid", employee.getUuid());
					request.setAttribute("employeeName", employee.getPerson().getName());
					resultCode = Constants.WECHAT_USER_AUTHORITY_YES;

					if (approvalAuthority.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_4_1)) {
						request.setAttribute("authorityLevel", Constants.WECHAT_LEAVE_APPROVAL_LEVEL1);
						request.setAttribute("campuss", employee.getCampus());
					}
					else if (approvalAuthority.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_4_2)) {
						request.setAttribute("authorityLevel", Constants.WECHAT_LEAVE_APPROVAL_LEVEL2);
						request.setAttribute("campuss", employee.getCampus());
					}
					else if (approvalAuthority.getAuthorityUuid().equals(Constants.APPROVAL_AUTHORITY_4_3)) {
						request.setAttribute("authorityLevel", Constants.WECHAT_LEAVE_APPROVAL_LEVEL3);

						Constraint campusC = new Constraint("Campus");
						campusC.addCondition("ifUsing", true);
						List<Campus> campusList = campusService.selectCampuss(campusC);
						request.setAttribute("campuss", campusList);
					}
					else {
						resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
					}
				}
				else {
					resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
				}
			}
			else {
				resultCode = Constants.WECHAT_USER_AUTHORITY_NO;
			}
		}
	}
}
