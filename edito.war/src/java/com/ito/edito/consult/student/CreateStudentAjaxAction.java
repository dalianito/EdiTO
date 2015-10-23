package com.ito.edito.consult.student;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Person;
import com.ito.fai.util.JndiFactory;

public class CreateStudentAjaxAction extends AjaxAction {

	public void executeManualUT() throws Exception {
	    Person person = new Person();
	    person.setName(request.getParameter("studentName"));
	    person.setCellPhone(request.getParameter("studentContactInfo"));
	    
		UserService userService = (UserService) JndiFactory.lookup("userService");
		ut.begin();
		try {
		    String personUuid = userService.insertPerson(person, USER.getAccount());
		    setResponseText(personUuid);
		    ut.commit();
		} catch (Exception e) {
		    e.printStackTrace();
		    ut.rollback();
		}
	}
}
