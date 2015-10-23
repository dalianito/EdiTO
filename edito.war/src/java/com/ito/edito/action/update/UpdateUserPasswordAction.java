package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class UpdateUserPasswordAction extends AjaxAction {
	private String responseText = null;
	private String INPUT_ERROR_STATUS = "1";
	private String UPDATE_SUCCESS_STATUS = "2";

	public void executeManualUT() throws Exception {
		boolean byAdmin = "admin".equals(request.getParameter("role"));
		String account = request.getParameter("account");
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		update(byAdmin, account, oldPassword, newPassword);
	}

	private void update(boolean bool, String account, String oldPassword, String newPassword) throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		Constraint userC = new Constraint("User");
		userC.addCondition("ifUsing", true);
		if (bool) {
			userC.addCondition("account", account);
			User user = userService.selectUser(userC);
			user.setPassword(newPassword);
			ut.begin();
			try {
				userService.updateUser(user, USER.getAccount());
				ut.commit();
			}
			catch (Exception ex) {
				ut.rollback();
			}
			responseText = UPDATE_SUCCESS_STATUS;
		}
		else {
			userC.addCondition("account", USER.getAccount());
			userC.addCondition("password", oldPassword);
			User user = userService.selectUser(userC);
			if (user == null) {
				responseText = INPUT_ERROR_STATUS;
			}
			else {
				user.setPassword(newPassword);
				ut.begin();
				try {
					userService.updateUser(user, USER.getAccount());
					ut.commit();
				}
				catch (Exception ex) {
					ut.rollback();
				}
				responseText = UPDATE_SUCCESS_STATUS;
			}
		}
		setResponseText(responseText);
	}
}
