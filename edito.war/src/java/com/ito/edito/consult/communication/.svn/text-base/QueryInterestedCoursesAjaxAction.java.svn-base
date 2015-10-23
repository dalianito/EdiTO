package com.ito.edito.consult.communication;

import java.io.IOException;
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
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.Communication;
import com.ito.edito.util.FancyTreeNode;
import com.ito.fai.util.JndiFactory;

public class QueryInterestedCoursesAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {

        String communicationUuid = request.getParameter("uuid");
        if (communicationUuid == null || communicationUuid.length() != 32) {
            return;
        }

        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        Communication communication = consultService.selectCommunicationByUuid(communicationUuid);
        if (communication == null){
            return;
        }
        Map<String, Object> formDataMap = new HashMap<String,Object>();
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
        
        List<String> uuids = CommunicationUtils.getStringsFromFormDataMap(formDataMap, "interestedCoursesUuids");
        List<FancyTreeNode> nodes = CourseFancyTreeUtil.formatCourseDataInFancyTree(uuids);
        if (nodes == null || nodes.size() == 0){
            nodes = new ArrayList<FancyTreeNode>();
            FancyTreeNode emptyNode = new FancyTreeNode();
            emptyNode.setTitle("未选择");
            
            nodes.add(emptyNode);
        }
        setResponseText(nodes);
    }
}
