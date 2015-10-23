package com.ito.edito.action.create;

import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateCourseTypeAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		CourseCategoryType courseCategoryType = (CourseCategoryType) carrier.fetchInstance("CourseCategoryType");
		courseCategoryType.setIfHasChild(false);
		courseCategoryType.setIfUsing(true);

		CourseCategoryType parentCourseCategoryType = null;
		if (courseCategoryType.getParentUuid() != null) {
			parentCourseCategoryType = classService.selectCourseCategoryTypeByUuid(courseCategoryType.getParentUuid());
			parentCourseCategoryType.setIfHasChild(true);
		}

		CourseCategoryType presentParentCourseCategoryType = null;
		if (courseCategoryType.getUuid() != null) {
			CourseCategoryType courseCategoryTypeDB = classService.selectCourseCategoryTypeByUuid(courseCategoryType.getUuid());
			if (courseCategoryTypeDB.getParentUuid() != null && !courseCategoryTypeDB.getParentUuid().equals(courseCategoryType.getParentUuid())) {
				Constraint constraint = new Constraint("CourseCategoryType");
				constraint.addCondition("parentUuid", courseCategoryTypeDB.getParentUuid());
				List<CourseCategoryType> presentBrotherCourseCategoryTypes = classService.selectCourseCategoryTypes(constraint);
				if (presentBrotherCourseCategoryTypes.size() == 1) {
					presentParentCourseCategoryType = classService.selectCourseCategoryTypeByUuid(courseCategoryTypeDB.getParentUuid());
					presentParentCourseCategoryType.setIfHasChild(false);
				}
			}
		}

		ut.begin();
		try {
			if (courseCategoryType.getUuid() != null) {
				classService.updateCourseCategoryType(courseCategoryType, USER.getAccount());
				if (presentParentCourseCategoryType != null) {
					classService.updateCourseCategoryType(presentParentCourseCategoryType, USER.getAccount());
				}
			}
			else {
				classService.insertCourseCategoryType(courseCategoryType, USER.getAccount());
			}
			if (parentCourseCategoryType != null) {
				if (parentCourseCategoryType.getUuid() != null) {
					classService.updateCourseCategoryType(parentCourseCategoryType, USER.getAccount());
				}
				else {
					classService.insertCourseCategoryType(parentCourseCategoryType, USER.getAccount());
				}
			}
			ut.commit();
		}
		catch (Exception ex) {
			ut.rollback();
		}
	}
}
