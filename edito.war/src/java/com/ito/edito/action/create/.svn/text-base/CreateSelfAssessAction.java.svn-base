package com.ito.edito.action.create;

import java.util.Date;

import com.ito.fai.util.JndiFactory;
import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.schema.SelfAssess;
import com.ito.edito.schema.SelfAssessExamine;

public class CreateSelfAssessAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		SelfAssess selfAssess = (SelfAssess) carrier.fetchInstance("SelfAssess");
		selfAssess.setSelfAssessTime(new Date());
		selfAssess.setIfUsing(true);

		SelfAssess selfAssessT = null;
		SelfAssessExamine selfAssessExamine = null;
		if(selfAssess.getUuid() != null) {
			selfAssessT = campusService.selectSelfAssessByUuid(selfAssess.getUuid());
		}

		ut.begin();
		try {
			if(selfAssess.getExamineUuid() == null) {
				selfAssessExamine = new SelfAssessExamine();
				String examineUuid = campusService.insertSelfAssessExamine(selfAssessExamine, USER.getAccount());
				selfAssess.setExamineUuid(examineUuid, false);
			}
			if(selfAssess.getUuid() == null) {
				campusService.insertSelfAssess(selfAssess, USER.getAccount());
			}
			else {
				selfAssessT.setFromDt(selfAssess.getFromDt());
				selfAssessT.setToDt(selfAssess.getToDt());
				selfAssessT.setWorkContant(selfAssess.getWorkContant());
				selfAssessT.setThinkings(selfAssess.getThinkings());
				selfAssessT.setHarvest(selfAssess.getHarvest());
				selfAssessT.setReflect(selfAssess.getReflect());
				campusService.updateSelfAssess(selfAssessT, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
