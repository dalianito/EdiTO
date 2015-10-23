package com.ito.edito.consult.consultant;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.Consultant;
import com.ito.fai.util.JndiFactory;

public class DeleteConsultantAjaxAction extends AjaxAction {

	public void executeManualUT() throws Exception {

	    String uuid = request.getParameter("uuid");
	    
	    ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
	    
	    Consultant consultant = consultService.selectConsultantByUuid(uuid); 
	    if (consultant == null){
	        throw new Exception("Cannot find consultant with uuid: " + uuid);
	    }
	    
	    consultant.setIfUsing(false);
	    ut.begin();
	    try{
	        consultService.updateConsultant(consultant, USER.getAccount());
	        ut.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        ut.rollback();
	    }
	}
}
