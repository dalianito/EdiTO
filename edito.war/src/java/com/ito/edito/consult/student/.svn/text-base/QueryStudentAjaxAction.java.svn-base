package com.ito.edito.consult.student;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Person;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryStudentAjaxAction extends AjaxAction {
    
	public void executeManualUT() throws Exception {
	    String studentName = request.getParameter("studentName");
	    String studentContactInfo = request.getParameter("studentContactInfo");
	    
	    boolean hasStudentName = (studentName != null && studentName.length() > 0);
	    boolean hasStudentContactInfo = (studentContactInfo != null && studentContactInfo.length() > 0);
	    
	    if (!hasStudentName && !hasStudentContactInfo) {
	        return;
	    }
	    
	    String sql = "SELECT * FROM Person WHERE ";

	    if (hasStudentName) {
	        sql += "name LIKE '%" + studentName + "%' ";
	    }
	    
	    if (hasStudentContactInfo) {
	        if (hasStudentName) {
	            sql += "OR ";
	        }
	        sql += "cellPhone LIKE '%" + studentContactInfo + "%' "
	            + "OR qq LIKE '%" + studentContactInfo + "%' "
	            + "OR parentPhone LIKE '%" + studentContactInfo + "%'";
	    }

	    Constraint constraint = new Constraint("Person");
	    constraint.addSQLCondition(sql, null);
	    

		UserService userService = (UserService) JndiFactory.lookup("userService");
		List<Person> personList = userService.selectPersons(constraint);
		
		List<QueryStudentAjaxActionResponse> responses = new ArrayList<QueryStudentAjaxActionResponse>();
		for (Person person : personList) {
		    QueryStudentAjaxActionResponse response = new QueryStudentAjaxActionResponse();
		    response.setPersonUuid(person.getUuid());
		    response.setName(person.getName());

		    List<String> contactInfo = new ArrayList<String>();
		    if (person.getCellPhone() != null && person.getCellPhone().length() > 0) {
		        contactInfo.add("手机:".concat(person.getCellPhone()));
		    }
		    if (person.getParentPhone() != null && person.getParentPhone().length() > 0) {
		        contactInfo.add("家长电话:".concat(person.getParentPhone()));
		    }
		    if (person.getQq() != null && person.getQq().length() > 0) {
		        contactInfo.add("QQ".concat(person.getQq()));
		    }
		    response.setContactInfo(contactInfo);
		    responses.add(response);
		}

		setResponseText(responses);
	}
	
	private class QueryStudentAjaxActionResponse {
	    private String personUuid;
	    private String name;
	    private List<String> contactInfo;

        public String getPersonUuid() {
            return personUuid;
        }
        public void setPersonUuid(String personUuid) {
            this.personUuid = personUuid;
        }
        public String getName() {
            return name;
        }
        public void setName(String name) {
            this.name = name;
        }
        public List<String> getContactInfo() {
            return contactInfo;
        }
        public void setContactInfo(List<String> contactInfo) {
            this.contactInfo = contactInfo;
        }
	}
}
