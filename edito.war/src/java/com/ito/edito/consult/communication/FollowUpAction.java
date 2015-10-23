package com.ito.edito.consult.communication;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class FollowUpAction extends DefaultAction {

    private CommunicationFollowUp followUp;
    private String followUpType;
    private Communication communication;
    private List<DefaultOption> studentRefuseReasonOptions;
    private List<DefaultOption> studentConsideringReasonOptions;
    public final static String communicationTypeUuid = Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_FOLLOW_UP_UUID;

    public void executeManualUT() throws Exception {
        String followUpUuid = request.getParameter("followUpUuid"); 
        System.out.println("Taking request with id: " + followUpUuid);
        if (followUpUuid == null || followUpUuid.trim().length() != 32) {
            System.out.println("Incorrect followUpUuid: " + followUpUuid);
            throw new Exception("错误的请求。");
        }
        
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        followUp = consultService.selectCommunicationFollowUpByUuid(followUpUuid);
        if (followUp == null) {
            System.out.println("Cannot find the instance with ID: " + followUpUuid);
            throw new Exception("错误的请求。");
        }
        
        if (!followUp.getStatus().equals(Constants.COMMUNICATION_FOLLOW_UP_STATUS_NOT_STARTED)) {
            System.out.println("User is trying to access completed follow up: " + followUpUuid); 
            throw new Exception("Trying to complete a completed follow up.");
        }
        communication = (Communication) followUp.getBizData();
        followUpType = Constants.COMMUNICATION_FOLLOW_UP_TYPES.get(followUp.getType());
        
        setDefaultOptions();
    }
    
    private void setDefaultOptions() throws Exception {
        studentRefuseReasonOptions = new ArrayList<DefaultOption>();
        studentConsideringReasonOptions = new ArrayList<DefaultOption>();

        DefaultOptionService defaultOptionService = (DefaultOptionService) JndiFactory.lookup("defaultOptionService");
        List<DefaultOption> activeDefaultOptions = defaultOptionService.getActiveDefaultOptionsByEntity(Constants.DEFAULT_OPTION_ENTITY_CONSULT);
        for (DefaultOption defaultOption : activeDefaultOptions) {
            if (defaultOption.getAttribute().equals(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_CONSIDERING_REASON)) {
                studentConsideringReasonOptions.add(defaultOption);
            } else if (defaultOption.getAttribute().equals(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_REFUSE_REASON)) {
                studentRefuseReasonOptions.add(defaultOption);
            }
        }
    }
    
    public CommunicationFollowUp getFollowUp(){
        return followUp;
    }
    
    public Communication getCommunication(){
        return communication;
    }
    
    public List<DefaultOption> getStudentRefuseReasonOptions() {
        return studentRefuseReasonOptions;
    }

    public List<DefaultOption> getStudentConsideringReasonOptions() {
        return studentConsideringReasonOptions;
    }
    
    public String getCommunicationTypeUuid(){
        return communicationTypeUuid;
    }
    
    public String getFollowUpType() {
        return followUpType;
    }
}
