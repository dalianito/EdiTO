package com.ito.edito.action.create;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ClassManagement;
import com.ito.fai.util.JndiFactory;

public class CreateClassManagementAction extends AjaxAction  {

	public void executeManualUT() throws Exception {
		ClassManagement classManagement = (ClassManagement) carrier.fetchInstance("ClassManagement");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
	
		classManagement.setIfUsing(true);
		classManagement.setIfHasChild(false);

		ut.begin();
		try {
			if (classManagement.getUuid() != null) {		
				classService.updateClassManagement(classManagement, USER.getAccount());	
			}
			else {
				classService.insertClassManagement(classManagement, USER.getAccount());
			}			
			ut.commit();
		}
		catch (Exception ex) {
			ut.rollback();
		}
	}
}
