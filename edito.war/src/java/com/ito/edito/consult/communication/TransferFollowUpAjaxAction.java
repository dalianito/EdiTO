package com.ito.edito.consult.communication;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.fai.util.JndiFactory;

public class TransferFollowUpAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        
        String followUpUuid = request.getParameter("followUpUuid");
        String employeeUuid = request.getParameter("employeeUuid");
        
        CommunicationFollowUp followUp = consultService.selectCommunicationFollowUpByUuid(followUpUuid);
        followUp.setOwnerUuid(employeeUuid);
        
        ut.begin();
        try {
            consultService.updateCommunicationFollowUp(followUp, USER.getAccount());
            ut.commit();
        } catch (Exception e) {
            e.printStackTrace();
            ut.rollback();
            throw e;
        }
    }

}
