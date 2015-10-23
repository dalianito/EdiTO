package com.ito.edito.consult.communication;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class ViewCommunicationInfoAction extends DefaultAction {
    private String studentID;
    private Person person;
    private Communication communication;
    private String consultForHimself;
    private List<String> consultManners;
    private List<String> consultSources;
    private List<String> interestedCampuses;
    private List<String> availableTimesForClass;
    private List<String> studentDecisionReasons;
    private String consultDetails;
    private boolean isFollowUpView;
    private Map<String, String> followUps;
    Map<String, Object> formDataMap;

    public void executeManualUT() throws Exception {
        String communicationUuid = request.getParameter("uuid");
        
        if (communicationUuid == null) {
            return;
        }
        
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        communication = consultService.selectCommunicationByUuid(communicationUuid);
        person = communication.getCustomer();
        
        formDataMap = new HashMap<String,Object>();
        ObjectMapper objectMapper = new ObjectMapper();
        
        try {
            formDataMap = objectMapper.readValue(communication.getForm().getData(), new TypeReference<HashMap<String,Object>>(){});
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        setStudentID();
        setConsultForHimself();
        setConsultDetails();
        setConsultManners();
        setConsultSources();
        setInterestedCampuses();
        setStudentDecisionReasons();
        setAvailableTimesForClasses();
        setFollowUps();
        setIsFollowUpView();
    }
    
    private void setIsFollowUpView(){
        isFollowUpView = communication.getType() != null && communication.getTypeUuid().equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_FOLLOW_UP_UUID);
    }
    
    public boolean getIsFollowUpView(){
        return isFollowUpView;
    }
    
    private void setConsultForHimself(){
        List<String> result = getStringsFromFormDataMap("consultForHimself");
        consultForHimself = result == null || result.size() == 0 ? "未选择" : result.get(0);
    }
    
    private void setConsultDetails(){
         List<String> result = getStringsFromFormDataMap("communicationDetails");
         consultDetails = result == null || result.size() == 0 ? "未填写详细记录" : result.get(0);
    }
    
    private void setFollowUps() {
        List<String> followUpNames = getStringsFromFormDataMap("followUps");
        if (followUpNames == null) {
            return;
        }
        followUps = new HashMap<String, String>();
        for (String fu : followUpNames) {
            List<String> tmp = getStringsFromFormDataMap(fu+"_TIME");
            String time = (tmp == null || tmp.get(0) == null || tmp.get(0).trim().length() == 0 )? "有，但未设定时间" : tmp.get(0);
            followUps.put(Constants.COMMUNICATION_FOLLOW_UP_TYPES.get(fu), time);
        }
    }

    private void setStudentID() throws Exception {
        if (person == null) {
            return;
        }
        UserService userService = (UserService) JndiFactory.lookup("userService");
        Constraint constraint = new Constraint("Student");
        constraint.addCondition("personUuid", person.getUuid());
        Student student = userService.selectStudent(constraint);
        studentID = student == null ? null : student.getStudentID();
    }
    
    private List<String> getDefaultOptionsDescriptions(List<String> uuids) throws RemoteException, Exception {
        DefaultOptionService dos = (DefaultOptionService) JndiFactory.lookup("defaultOptionService");
        Constraint constraint = new Constraint("DefaultOption");
        constraint.addCondition("uuid", uuids, Constraint.IN_LIST);
        
        List<String> descriptions = new ArrayList<String>();
        for (DefaultOption option : dos.getDefaultOptionsByConstraint(constraint)){
            descriptions.add(option.getDescription());
        } 
        
        return descriptions;
    }
    private void setConsultManners() throws Exception{
        consultManners = getCheckBoxOtherFieldDescriptions("consultMannerUuid", "consultMannerOtherDescription");
    }
    
    private void setConsultSources() throws Exception{
        consultSources = getCheckBoxOtherFieldDescriptions("consultSourceUuid", "consultSourceOtherDescription");
    }
    
    private List<String> getCheckBoxOtherFieldDescriptions(String fieldName, String otherFieldName) throws RemoteException, Exception {
        List<String> uuids = getStringsFromFormDataMap(fieldName); 
        List<String> descriptions = null;
        if (uuids != null && uuids.size() > 0) {
            descriptions = getDefaultOptionsDescriptions(uuids);
        }
        
        uuids = getStringsFromFormDataMap(otherFieldName); 
        if (uuids == null || uuids.size() == 0) {
            return descriptions;
        }else{
            List<String> otherDescriptions = getDefaultOptionsDescriptions(uuids); 
            if (otherDescriptions != null) {
                if (descriptions == null){
                    descriptions = new ArrayList<String>();
                }
                descriptions.addAll(otherDescriptions);
            }
        }
        
        return descriptions;
    }
    
    private void setInterestedCampuses() throws RemoteException, Exception{
        List<String> uuids = getStringsFromFormDataMap("interestedCampuses");
        if (uuids == null) {
            interestedCampuses = null;
            return;
        }
        
        CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

        interestedCampuses = new ArrayList<String>();
        Constraint constraint = new Constraint("Campus");
        constraint.addCondition("uuid", uuids, Constraint.IN_LIST);
        for (Campus campus : campusService.selectCampuss(constraint)) {
            interestedCampuses.add(campus.getDescription());
        }
    }
    
    private void setAvailableTimesForClasses() {
        availableTimesForClass = getStringsFromFormDataMap("availableTimeForClass");
    }
    
    private void setStudentDecisionReasons() throws Exception {
        String decisionName;
        if (communication.getCustomerDecision() == null){
            studentDecisionReasons = null;
            return;
        }
        
        if (communication.getCustomerDecision().equals("考虑中")){
            decisionName = "studentConsideringReasonUuid";
        } else if (communication.getCustomerDecision().equals("拒绝")){
            decisionName = "studentRefuseReasonUuid";
        } else {
            studentDecisionReasons = null;
            return;
        }
        
        studentDecisionReasons = getCheckBoxOtherFieldDescriptions(decisionName, "studentDecisionOtherDescription");
    }
    private List<String> getStringsFromFormDataMap(String key) {
        @SuppressWarnings("unchecked")
        List<String> list = (List<String>) formDataMap.get(key);
        if (list == null || list.size() == 0) {
            return null;
        }
        
        List<String> strings = new ArrayList<String>();
        for (String str : list){
            if (str == null) {
                continue;
            }
            String[] strs = str.split(",");
            
            for (String s : strs) {
                strings.add(s);
            }
        }
        
        return strings;
    }
    public String getStudentID(){
        return studentID;
    }
    
    public Person getPerson(){
        return person;
    }
    
    public Communication getCommunication(){
        return communication;
    }

    public String getConsultForHimself() {
        return consultForHimself;
    }

    public List<String> getConsultManners() {
        return consultManners;
    }

    public List<String> getInterestedCampuses() {
        return interestedCampuses;
    }

    public List<String> getStudentDecisionReasons() {
        return studentDecisionReasons;
    }

    public String getConsultDetails() {
        return consultDetails;
    }

    public List<String> getConsultSources() {
        return consultSources;
    }

    public List<String> getAvailableTimesForClass() {
        return availableTimesForClass;
    }

    public Map<String, String> getFollowUps() {
        return followUps;
    }
}
