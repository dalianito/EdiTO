package com.ito.edito.consult.communication;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.fai.util.JndiFactory;

public class ChangeFollowUpTimeAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        
        String followUpUuid = request.getParameter("followUpUuid");
        String newTime = request.getParameter("newTime");
        
        CommunicationFollowUp followUp = consultService.selectCommunicationFollowUpByUuid(followUpUuid);

        DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd HH:mm");
        followUp.setScheduledDateTime(fmt.parse(newTime));
        
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
