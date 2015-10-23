package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.BehaviourStandard.BehaviourStandardService;
import com.ito.edito.schema.BehaviourStandard;
import com.ito.fai.util.JndiFactory;

public class CreateBehaviorRecordAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		BehaviourStandardService behaviourStandardService = (BehaviourStandardService) JndiFactory.lookup("behaviourStandardService");

		List<BehaviourStandard> behaviourStandardList = (List<BehaviourStandard>) carrier.fetchInstances("BehaviourStandard");
		for (int i = 0; i < behaviourStandardList.size(); i++) {
			BehaviourStandard behaviourStandard = behaviourStandardList.get(i);
			behaviourStandard.setRecordTime(new Date());
			behaviourStandard.setRecorderUuid(EMPLOYEE.getUuid(), false);

			if (behaviourStandard.getUuid() == null) {
				ut.begin();
				behaviourStandardService.insertBehaviourStandard(behaviourStandard, USER.getAccount());
				ut.commit();
			}
			else {
				BehaviourStandard behaviourStandardDB = behaviourStandardService.selectBehaviourStandardByUuid(behaviourStandard.getUuid());
				behaviourStandardDB.setTypeUuid(behaviourStandard.getTypeUuid(), false);
				behaviourStandardDB.setIntroduction(behaviourStandard.getIntroduction());

				ut.begin();
				behaviourStandardService.updateBehaviourStandard(behaviourStandardDB, USER.getAccount());
				ut.commit();
			}
		}
	}
}
