package com.ito.edito.action.create;

import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Candidates;
import com.ito.edito.schema.EducateInfo;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.WorkExperienceInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateEmployeeAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		Person person = (Person) carrier.fetchInstance("Person");
		Employee employee = (Employee) carrier.fetchInstance("Employee");
		Candidates candidates = (Candidates) carrier.fetchInstance("Candidates");

		person.setIfUsing(true);
		employee.setIfUsing(true);
		employee.setIfShow(true);

		Candidates candidatesDB = null;
		if (candidates != null) {
			candidatesDB = userService.selectCandidatesByUuid(candidates.getUuid());
			candidatesDB.setRecruitStateUuid(Constants.RECRUIT_STATE_PASSED, false);
			candidatesDB.setWorkExperienceInfos(new ArrayList<WorkExperienceInfo>());
			candidatesDB.setEducateInfos(new ArrayList<EducateInfo>());
		}
		ut.begin();
		try {
			String personUuid = person.getUuid();
			if (personUuid == null) {
				personUuid = userService.insertPerson(person, USER.getAccount());
			}
			else {
				userService.updatePerson(person, USER.getAccount());
			}

			employee.setPersonUuid(personUuid, false);
			if (employee.getUuid() == null) {
				userService.insertEmployee(employee, USER.getAccount());
			}
			else {
				userService.updateEmployee(employee, USER.getAccount());
			}

			if (candidatesDB != null) {
				userService.updateCandidates(candidatesDB, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
