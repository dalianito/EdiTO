package com.ito.edito.action.delete;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class DeleteCourseTypeAction extends AjaxAction {
	private String HAVE_CHILDREN_STATUS = "0";
	private String SUCCESS_STATUS = "1";

	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");

		String uuid = request.getParameter("uuid");

		Constraint constraint = new Constraint("CourseCategoryType");
		constraint.addCondition("parentUuid", uuid);
		constraint.addCondition("ifUsing", true);
		List<CourseCategoryType> courseCategoryTypeList = classService.selectCourseCategoryTypes(constraint);

		if (courseCategoryTypeList.size() > 0) {
			setResponseText(HAVE_CHILDREN_STATUS);
		}
		else {
			CourseCategoryType courseCategoryType = classService.selectCourseCategoryTypeByUuid(uuid);
			courseCategoryType.setIfUsing(false);

			CourseCategoryType parentCourseCategoryType = null;
			String parentUuid = courseCategoryType.getParentUuid();
			if (parentUuid != null) {
				Constraint constraint2 = new Constraint("CourseCategoryType");
				constraint2.addCondition("parentUuid", parentUuid);
				constraint2.addCondition("ifUsing", true);
				List<CourseCategoryType> brotherCourseCategoryTypeList = classService.selectCourseCategoryTypes(constraint2);
				if (brotherCourseCategoryTypeList.size() == 1) {
					parentCourseCategoryType = classService.selectCourseCategoryTypeByUuid(parentUuid);
					parentCourseCategoryType.setIfHasChild(false);
				}
			}

			ut.begin();
			try {
				classService.updateCourseCategoryType(courseCategoryType, USER.getAccount());
				if (parentCourseCategoryType != null) {
					classService.updateCourseCategoryType(parentCourseCategoryType, USER.getAccount());
				}
				ut.commit();
				setResponseText(SUCCESS_STATUS);
			}
			catch (Exception e) {
				ut.rollback();
			}
		}
	}
}
