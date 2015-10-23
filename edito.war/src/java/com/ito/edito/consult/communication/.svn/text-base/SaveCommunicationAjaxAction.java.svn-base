package com.ito.edito.consult.communication;

import java.rmi.RemoteException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.action.JacksonJsonMapper;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Form;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class SaveCommunicationAjaxAction extends AjaxAction {
    
    private String personUuid;
    private String formData;
    private String action;
    private String customerDecision;
    private String employeeUuid;
    ConsultService consultService;

    @SuppressWarnings("unchecked")
    public void executeManualUT() throws Exception {
        personUuid = parseString(request.getParameter("personUuid"));
        action = request.getParameter("action");
        customerDecision = request.getParameter("studentDecision");
        String typeUuid = request.getParameter("typeUuid");

        
        
        Map requestParamsMap = request.getParameterMap();
        
        String otherFieldUuid = getOrCreateDefaultOptionForOtherField("consultMannerOther", Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_MANNER);
        if (otherFieldUuid != null){
            requestParamsMap.put("consultMannerOtherDescription", Arrays.asList(otherFieldUuid));
        }
        otherFieldUuid = getOrCreateDefaultOptionForOtherField("consultSourceOther", Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_SOURCE);
        if (otherFieldUuid != null){
            requestParamsMap.put("consultSourceOtherDescription", Arrays.asList(otherFieldUuid));
        }
        
        if (customerDecision != null && customerDecision.equals("考虑中")){
            otherFieldUuid = getOrCreateDefaultOptionForOtherField("studentDecisionOther", Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_CONSIDERING_REASON);
            if (otherFieldUuid != null){
                requestParamsMap.put("studentDecisionOtherDescription", Arrays.asList(otherFieldUuid));
            }
        } else if (customerDecision != null && customerDecision.equals("拒绝")){
            otherFieldUuid = getOrCreateDefaultOptionForOtherField("studentDecisionOther", Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_REFUSE_REASON);
            if (otherFieldUuid != null) {
                requestParamsMap.put("studentDecisionOtherDescription", Arrays.asList(otherFieldUuid));
            }
        }
        
        
        employeeUuid = getEmployeeUuid();
        
        formData = JacksonJsonMapper.getJsonFromMap(requestParamsMap);
        
        consultService = (ConsultService) JndiFactory.lookup("consultService");

        ResponseWrapper responseWrapper = new ResponseWrapper();
        String uuid = createNewCommunication(typeUuid);
        responseWrapper.setSuccess("success");
        responseWrapper.setCommunicationUuid(uuid);
        
        setResponseText(responseWrapper);
    }

    private String getOrCreateDefaultOptionForOtherField(String fieldName, String attr) throws Exception {
        String field = request.getParameter(fieldName);
        if (field == null || !field.equals("1") 
                || request.getParameter(fieldName+"Description") == null
                || request.getParameter(fieldName+"Description").trim().length() == 0) {
            return null;
        }
        String description = request.getParameter(fieldName+"Description").trim();
        DefaultOptionService dos = (DefaultOptionService) JndiFactory.lookup("defaultOptionService");
        DefaultOption defaultOption = dos.getDefaultOptionByEntityAndAttributeAndDescription("consult", attr, description);
        if (defaultOption != null){
            return defaultOption.getUuid();
        }
        
        defaultOption = new DefaultOption();
        defaultOption.setEntity("consult");
        defaultOption.setAttribute(attr);
        defaultOption.setDescription(description);
        defaultOption.setIfUsing(false);
        
        ut.begin();
        try{
            String uuid = dos.insertDefaultOption(defaultOption, USER.getAccount());
            ut.commit();
            return uuid;
        } catch (Exception e) {
            e.printStackTrace();
            ut.rollback();
        }
        
        return null;
    }

    private String parseString(String s) {
        return (s == null || s.length() == 0) ? null : s;
    }
    
    private String getEmployeeUuid() throws RemoteException, Exception{
        Constraint constraint = new Constraint("Employee");
        constraint.addCondition("personUuid", USER.getPersonUuid());
        UserService userService = (UserService) JndiFactory.lookup("userService");
        Employee employee = userService.selectEmployee(constraint); 
        return employee == null ? null : employee.getUuid();
    }
    
    private String createNewCommunication(String typeUuid) throws Exception {
        Communication communication = new Communication();
        communication.setCustomerUuid(personUuid);
        communication.setCustomerDecision(customerDecision);
        communication.setEmployeeUuid(employeeUuid);
        communication.setStartAt(new Date());
        communication.setTypeUuid(typeUuid);
        communication.setFollowUps(getCommunicationFollowUps());
        if (action != null && action.equals("submit")) {
            communication.setStatus(Constants.COMMUNICATION_STATUS_COMPLETED);
            communication.setCompleteAt(new Date());
        } else {
            communication.setStatus(Constants.COMMUNICATION_STATUS_DRAFT);
        }

        Form form = new Form();
        form.setData(formData);
        
        communication.setForm(form);
        
        String commUuid = null;
        String followUpUuid = request.getParameter("followUpUuid");
        CommunicationFollowUp followUp = null;
        if (followUpUuid != null && followUpUuid.trim().length() == 32) {
            followUp = consultService.selectCommunicationFollowUpByUuid(followUpUuid);
            followUp.setStatus(Constants.COMMUNICATION_FOLLOW_UP_STATUS_COMPLETED);
        }
        ut.begin();
        try {
            commUuid = consultService.insertCommunication(communication, USER.getAccount());
            ut.commit();
        } catch (Exception e) {
            e.printStackTrace();
            ut.rollback();
            throw new Exception("Failed in DB transaction. Please retry.");
        }

        if (followUp != null){
        ut.begin();
        try {
            
            followUp.setCommunicationUuid(commUuid);
            consultService.updateCommunicationFollowUp(followUp, USER.getAccount());
            ut.commit();
        } catch(Exception e){
            e.printStackTrace();
            ut.rollback();
        }
        }
        return commUuid;
    }

    private List<CommunicationFollowUp> getCommunicationFollowUps() throws ParseException{
        List<CommunicationFollowUp> cfus = new ArrayList<CommunicationFollowUp>();
        String[] followUps = request.getParameterValues("followUps");
        if (followUps == null) {
            return cfus;
        }
        String scheduledDateTime;
        DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (String followUp : followUps) {
            CommunicationFollowUp cfu = new CommunicationFollowUp();
            cfu.setOwnerUuid(employeeUuid);
            cfu.setStatus(Constants.COMMUNICATION_FOLLOW_UP_STATUS_NOT_STARTED);
            cfu.setType(followUp);
            
            scheduledDateTime = request.getParameter(followUp.concat("_TIME"));
            if (scheduledDateTime == null || scheduledDateTime.trim().length() == 0) {
                System.out.println("User selected the followup but did not set up a time.");
            } else {
                cfu.setScheduledDateTime(fmt.parse(scheduledDateTime));
            }
            cfus.add(cfu);
        }
       
        return cfus;
    }
    
    private class ResponseWrapper{
        private String communicationUuid;
        private String success;

        public String getCommunicationUuid() {
            return communicationUuid;
        }
        public void setCommunicationUuid(String communicationUuid) {
            this.communicationUuid = communicationUuid;
        }
        public String getSuccess() {
            return success;
        }
        public void setSuccess(String success) {
            this.success = success;
        }
    }
}