package com.ito.edito.action.get;

import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Candidates;
import com.ito.edito.schema.EducateInfo;
import com.ito.edito.schema.WorkExperienceInfo;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class GetCandidatesAction extends DefaultAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			Candidates candidates = userService.selectCandidatesByUuid(uuid);
			request.setAttribute("candidates", candidates);

			Constraint workExperienceInfoC = new Constraint("WorkExperienceInfo");
			workExperienceInfoC.addCondition("bizDataUuid", uuid);
			workExperienceInfoC.addOrderCondition("sequence", "asc");
			List<WorkExperienceInfo> workExperienceInfos = userService.selectWorkExperienceInfos(workExperienceInfoC);
			request.setAttribute("workExperienceInfos", workExperienceInfos);

			Constraint educateInfoC = new Constraint("EducateInfo");
			educateInfoC.addCondition("bizDataUuid", uuid);
			educateInfoC.addOrderCondition("sequence", "asc");
			List<EducateInfo> educateInfos = userService.selectEducateInfos(educateInfoC);
			request.setAttribute("educateInfos", educateInfos);
		}
	}
}
