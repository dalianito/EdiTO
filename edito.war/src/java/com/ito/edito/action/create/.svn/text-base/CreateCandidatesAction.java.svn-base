package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Candidates;
import com.ito.edito.schema.EducateInfo;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.WorkExperienceInfo;
import com.ito.fai.util.JndiFactory;

public class CreateCandidatesAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		Person person = (Person) carrier.fetchInstance("Person");
		Candidates candidates = (Candidates) carrier.fetchInstance("Candidates");
		List<WorkExperienceInfo> workExperienceInfoList = (List<WorkExperienceInfo>) carrier.fetchInstances("WorkExperienceInfo");
		List<EducateInfo> educateInfoList = (List<EducateInfo>) carrier.fetchInstances("EducateInfo");

		person.setIfUsing(true);
		candidates.setWorkExperienceInfos(workExperienceInfoList);
		candidates.setEducateInfos(educateInfoList);
		candidates.setIfUsing(true);

		ut.begin();
		try {
			String personUuid = person.getUuid();
			if (personUuid == null) {
				personUuid = userService.insertPerson(person, USER.getAccount());
			}
			else {
				userService.updatePerson(person, USER.getAccount());
			}

			candidates.setPersonUuid(personUuid, false);
			if (candidates.getUuid() == null) {
				userService.insertCandidates(candidates, USER.getAccount());
			}
			else {
				userService.updateCandidates(candidates, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
