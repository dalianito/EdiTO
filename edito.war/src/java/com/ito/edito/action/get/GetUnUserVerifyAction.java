package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.User;
import com.ito.edito.util.Constants;
import com.ito.edito.util.WechatUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetUnUserVerifyAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		String fromUserName = request.getParameter("fromUserName");
		Employee employee = WechatUtil.getEmployeeMessage(fromUserName);
		
		String flag = "";
		if (employee == null) {
			flag = "noEmployee";
		}
		else {
			Constraint userC = new Constraint("User");
			userC.addCondition("ifUsing", true);
			userC.addCondition("personUuid", employee.getPersonUuid());
			User user = userService.selectUser(userC);
			employee.setOpenId(null);

			ut.begin();
			try {
				userService.updateEmployee(employee, Constants.WECHAT_USER + user.getAccount());
				ut.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
				ut.rollback();
			}
			flag = "success";
		}
		setResponseText(flag);
	}
}
