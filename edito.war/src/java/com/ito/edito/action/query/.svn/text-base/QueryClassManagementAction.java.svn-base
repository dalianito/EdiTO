package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ClassManagement;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryClassManagementAction extends AjaxAction {
	public void executeAutoUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		
		Constraint constraint = new Constraint("ClassManagement");
		constraint.addCondition("ifUsing", true);
		List<ClassManagement> classManagementTemp = classService.selectClassManagements(constraint);

		List<String[]> classManagements = new ArrayList<String[]>();
		for (int i = 0; i < classManagementTemp.size(); i++) {
			ClassManagement classManagement = classManagementTemp.get(i);
			String[] str = new String[2];
			str[0] = classManagement.getUuid();
			str[1] = classManagement.getDescription();
			classManagements.add(str);
		}
		setResponseText(classManagements);
	}
}
