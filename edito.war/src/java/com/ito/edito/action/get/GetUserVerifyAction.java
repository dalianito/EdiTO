package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.User;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetUserVerifyAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String reflag = request.getParameter("reflag");
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String fromUserName = request.getParameter("fromUserName");

		Constraint userC = new Constraint("User");
		userC.addCondition("ifUsing", true);
		userC.addCondition("account", userName);
		userC.addCondition("password", userPassword);
		User user = userService.selectUser(userC);

		Constraint eC = new Constraint("Employee");
		eC.addCondition("ifUsing", true);
		eC.addCondition("openId", fromUserName);
		Employee e = userService.selectEmployee(eC);

		// reflag == true 页面检测到用户已关联账户后重复操作
		if (reflag != null) {
			if (user != null) {
				Constraint employeeC = new Constraint("Employee");
				employeeC.addCondition("personUuid", user.getPersonUuid());
				employeeC.addCondition("ifUsing", true);
				Employee employee = userService.selectEmployee(employeeC);
				/*
				 * employee 表示 用户输入账户 的openId
				 * e 表示 手机端微信登录时给的openId
				 */
				if (e == null) {

					employee.setOpenId(fromUserName);
					ut.begin();
					userService.updateEmployee(employee, Constants.WECHAT_USER + user.getAccount());
					ut.commit();
					setResponseText("success");
				}
				else {

					if (employee.getUuid().equals(e.getUuid())) {
						// employee.setOpenId(fromUserName);
						// ut.begin();
						// userService.updateEmployee(employee,
						// Constants.WECHAT_USER + user.getAccount());
						// ut.commit();
						setResponseText("verified");
					}
					else {
						e.setOpenId(null);
						employee.setOpenId(fromUserName);
						ut.begin();
						userService.updateEmployee(e, Constants.WECHAT_USER + user.getAccount());
						userService.updateEmployee(employee, Constants.WECHAT_USER + user.getAccount());
						ut.commit();
						setResponseText("success");
					}
				}
			}

		}
		else {

			String flag = "";

			if (user == null) {
				flag = "noUser";
			}
			else if (e != null) {
				flag = "verified";
			}
			else {
				Constraint employeeC = new Constraint("Employee");
				employeeC.addCondition("personUuid", user.getPersonUuid());
				employeeC.addCondition("ifUsing", true);
				Employee employee = userService.selectEmployee(employeeC);

				if (employee.getOpenId() == null) {

					employee.setOpenId(fromUserName);

					ut.begin();
					userService.updateEmployee(employee, Constants.WECHAT_USER + user.getAccount());
					ut.commit();

					flag = "success";
				}
				else {
					flag = "verified";

				}

			}

			setResponseText(flag);
		}
	}
}
