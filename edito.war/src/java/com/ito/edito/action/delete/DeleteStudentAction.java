package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Student;
import com.ito.fai.util.JndiFactory;

public class DeleteStudentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Student student = userService.selectStudentByUuid(uuid);
		student.setIfUsing(false);

		ut.begin();
		userService.updateStudent(student, USER.getAccount());
		ut.commit();
	}
}
