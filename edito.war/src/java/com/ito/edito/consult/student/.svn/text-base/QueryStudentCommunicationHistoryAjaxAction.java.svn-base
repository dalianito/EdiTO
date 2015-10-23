package com.ito.edito.consult.student;

import java.io.IOException;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.course.CourseFancyTreeUtil;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.Course;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.util.FancyTreeNode;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryStudentCommunicationHistoryAjaxAction extends AjaxAction {
    private ClassService classService;

    public void executeManualUT() throws Exception {
        classService = (ClassService) JndiFactory.lookup("classService");
        String personUuid = request.getParameter("personUuid");

        AjaxActionResponse ajaxActionResponse = getPersonBasicInfo(personUuid);

        ajaxActionResponse
                .setCommunicationHistories(getPersonCommunicationHistories(personUuid));

        setResponseText(ajaxActionResponse);
    }

    private List<CommunicationHistoryResponse> getPersonCommunicationHistories(
            String personUuid) throws Exception {
        List<CommunicationHistoryResponse> comHistories = new ArrayList<CommunicationHistoryResponse>();

        SimpleDateFormat dateToStrFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        for (Communication comm : consultService.selectCommunicationsByCustomerUuid(personUuid)) {
            CommunicationHistoryResponse commResponse = new CommunicationHistoryResponse();
            commResponse.setCommunicationUuid(comm.getUuid());
            commResponse.setDate(dateToStrFormat.format(comm.getStartAt()));
            commResponse.setOwner(comm.getCustomer().getName());
            if (comm.getForm() != null) {
                commResponse.setCourses(getInterestedCourses(comm.getForm().getData()));
            }
            commResponse.setDecision(comm.getCustomerDecision());
            comHistories.add(commResponse);
        }
        return comHistories;
    }

    @SuppressWarnings("unchecked")
    private List<FancyTreeNode> getInterestedCourses(String jsonData) throws RemoteException, Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        ObjectMapper objectMapper = new ObjectMapper();
        
        try {
            map = objectMapper.readValue(jsonData, new TypeReference<HashMap<String,Object>>(){});
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        List<String> list = (List<String>) map.get("interestedCoursesUuids");
        if (list == null) {
            return null;
        }
        
        List<String> uuids = new ArrayList<String>();
        for (String tmp : list) {
            String[] splitUuids = tmp.split(",");
            for (String uuid : splitUuids){
                uuids.add(uuid);
            }
        }
        
        return CourseFancyTreeUtil.formatCourseDataInFancyTree(uuids);
        
    }
    
    private AjaxActionResponse getPersonBasicInfo(String personUuid)
            throws Exception, RemoteException {
        UserService userService = (UserService) JndiFactory
                .lookup("userService");

        Person person = userService.selectPersonByUuid(personUuid);
        AjaxActionResponse ajaxActionResponse = new AjaxActionResponse();
        ajaxActionResponse.setPersonUuid(person.getUuid());
        ajaxActionResponse.setName(person.getName());
        ajaxActionResponse.setGenderUuid(person.getGenderUuid());
        ajaxActionResponse.setEstAge(person.getEstAge());
        ajaxActionResponse.setEducationUuid(person.getEducationUuid());
        ajaxActionResponse.setParentName(person.getParentName());
        ajaxActionResponse.setParentPhone(person.getParentPhone());
        ajaxActionResponse.setCellPhone(person.getCellPhone());
        ajaxActionResponse.setQq(person.getQq());
        ajaxActionResponse.setRealAddress(person.getRealAddress());
        
        Constraint constraint = new Constraint("Student");
        constraint.addCondition("personUuid", person.getUuid());
        
        Student student = userService.selectStudent(constraint);
        if (student != null){
            ajaxActionResponse.setStudentID(student.getStudentID());
        }

        return ajaxActionResponse;
    }

    private class CommunicationHistoryResponse {
        private String communicationUuid;
        private String date;
        private String owner;
        private List<FancyTreeNode> courses;
        private String decision;

        public String getCommunicationUuid() {
            return communicationUuid;
        }
        public void setCommunicationUuid(String communicationUuid) {
            this.communicationUuid = communicationUuid;
        }
        public String getDate() {
            return date;
        }
        public void setDate(String date) {
            this.date = date;
        }
        public String getOwner() {
            return owner;
        }
        public void setOwner(String owner) {
            this.owner = owner;
        }
        public List<FancyTreeNode> getCourses() {
            return courses;
        }
        public void setCourses(List<FancyTreeNode> courses) {
            this.courses = courses;
        }
        public String getDecision() {
            return decision;
        }
        public void setDecision(String decision) {
            this.decision = decision;
        }
    }

    private class AjaxActionResponse {
        private String personUuid;
        private String studentID;
        private String name;
        private String genderUuid;
        private Integer estAge;
        private String educationUuid;
        private String parentName;
        private String parentPhone;
        private String cellPhone;
        private String qq;
        private String realAddress;
        private List<CommunicationHistoryResponse> communicationHistories;

        public String getPersonUuid() {
            return personUuid;
        }

        public void setPersonUuid(String personUuid) {
            this.personUuid = personUuid;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getGenderUuid() {
            return genderUuid;
        }

        public void setGenderUuid(String genderUuid) {
            this.genderUuid = genderUuid;
        }

        public Integer getEstAge() {
            return estAge;
        }

        public void setEstAge(Integer estAge) {
            this.estAge = estAge;
        }

        public String getEducationUuid() {
            return educationUuid;
        }

        public void setEducationUuid(String educationUuid) {
            this.educationUuid = educationUuid;
        }

        public String getParentName() {
            return parentName;
        }

        public void setParentName(String parentName) {
            this.parentName = parentName;
        }

        public String getParentPhone() {
            return parentPhone;
        }

        public void setParentPhone(String parentPhone) {
            this.parentPhone = parentPhone;
        }

        public String getCellPhone() {
            return cellPhone;
        }

        public void setCellPhone(String cellPhone) {
            this.cellPhone = cellPhone;
        }

        public String getQq() {
            return qq;
        }

        public void setQq(String qq) {
            this.qq = qq;
        }

        public String getRealAddress() {
            return realAddress;
        }

        public void setRealAddress(String realAddress) {
            this.realAddress = realAddress;
        }

        public List<CommunicationHistoryResponse> getCommunicationHistories() {
            return communicationHistories;
        }

        public void setCommunicationHistories(
                List<CommunicationHistoryResponse> communicationHistories) {
            this.communicationHistories = communicationHistories;
        }

        public String getStudentID() {
            return studentID;
        }

        public void setStudentID(String studentID) {
            this.studentID = studentID;
        }
    }
}
