package com.ito.edito.action.delete;

import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.ParticipatorInfo;
import com.ito.edito.schema.PreParticipatorInfo;
import com.ito.edito.schema.PropagandaMaterialInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.Relationship;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class DeleteApplyAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");

		String uuid = request.getParameter("uuid");

		Apply apply = applyService.selectApplyByUuid(uuid);
		apply.setIfUsing(false);

		Recruitment recruitment = null;
		Relationship relationship = null;
		Quit quit = null;
		LeaveApplication leaveApplication = null;
		PublicityApplication publicityApplication = null;

		if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RECRUITMENT)) {
			Constraint c = new Constraint("Recruitment");
			c.addCondition("applyUuid", apply.getUuid());
			recruitment = applyService.selectRecruitment(c);
			recruitment.setIfUsing(false);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_TEACHER_RECRUITMENT)) {
			Constraint c = new Constraint("Recruitment");
			c.addCondition("applyUuid", apply.getUuid());
			recruitment = applyService.selectRecruitment(c);
			recruitment.setIfUsing(false);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_RELATIONSHIP)) {
			Constraint c = new Constraint("Relationship");
			c.addCondition("applyUuid", apply.getUuid());
			relationship = applyService.selectRelationship(c);
			relationship.setIfUsing(false);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_QUIT)) {
			Constraint c = new Constraint("Quit");
			c.addCondition("applyUuid", apply.getUuid());
			quit = applyService.selectQuit(c);
			quit.setIfUsing(false);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_LEAVE)) {
			Constraint c = new Constraint("LeaveApplication");
			c.addCondition("applyUuid", apply.getUuid());
			leaveApplication = applyService.selectLeaveApplication(c);
			leaveApplication.setIfUsing(false);
		}
		else if (apply.getTypeUuid().equals(Constants.APPLY_TYPE_UUID_PUBLICITY)) {
			Constraint c = new Constraint("PublicityApplication");
			c.addCondition("applyUuid", apply.getUuid());
			publicityApplication = applyService.selectPublicityApplication(c);
			publicityApplication.setIfUsing(false);
			publicityApplication.setPreParticipators(new ArrayList<PreParticipatorInfo>());
			publicityApplication.setMaterials(new ArrayList<PropagandaMaterialInfo>());
			publicityApplication.setParticipators(new ArrayList<ParticipatorInfo>());
		}

		ut.begin();
		applyService.updateApply(apply, USER.getAccount());
		if (recruitment != null) {
			applyService.updateRecruitment(recruitment, USER.getAccount());
		}
		else if (relationship != null) {
			applyService.updateRelationship(relationship, USER.getAccount());
		}

		else if (quit != null) {
			applyService.updateQuit(quit, USER.getAccount());
		}

		else if (leaveApplication != null) {
			applyService.updateLeaveApplication(leaveApplication, USER.getAccount());
		}
		else if (publicityApplication != null) {
			applyService.updatePublicityApplication(publicityApplication, USER.getAccount());
		}
		ut.commit();
	}
}
