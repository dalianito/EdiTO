package com.ito.edito.action.update;

import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Candidates;
import com.ito.edito.schema.EducateInfo;
import com.ito.edito.schema.WorkExperienceInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class UpdateFailedCandidatesAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		Constraint candidatesC = new Constraint("Candidates");
		candidatesC.addCondition("uuid", uuid);
		Candidates candidates = userService.selectCandidates(candidatesC);
		if (candidates != null) {
			candidates.setRecruitStateUuid(Constants.RECRUIT_STATE_UNPASSED, false);
			candidates.setWorkExperienceInfos(new ArrayList<WorkExperienceInfo>());
			candidates.setEducateInfos(new ArrayList<EducateInfo>());
		}

		ut.begin();
		try {
			if (candidates != null) {
				userService.updateCandidates(candidates, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
