package com.ito.edito.consult.communication;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CancelFollowUpAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        
        String followUpUuid = request.getParameter("followUpUuid");
        
        CommunicationFollowUp followUp = consultService.selectCommunicationFollowUpByUuid(followUpUuid);
        followUp.setStatus(Constants.COMMUNICATION_FOLLOW_UP_STATUS_CANCELLED);
        
        ut.begin();
        try {
            consultService.updateCommunicationFollowUp(followUp, USER.getAccount());
            ut.commit();
            System.out.println("Person " + USER.getPersonUuid() + " has cancelled follow up: " + followUpUuid);
        } catch (Exception e) {
            e.printStackTrace();
            ut.rollback();
            throw e;
        }
    }
}
