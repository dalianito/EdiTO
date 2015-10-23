package com.ito.edito.consult.admin;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.Consultant;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWeeklyCommunicationDataByConsultantAjaxAction extends AjaxAction {

    ResponseWrapper responseWrapper;
    Map<String, Consultant> activeConsultants;
    int max_no_of_weeks = 10;

    public void executeManualUT() throws Exception {
        setActiveConsultants();
        responseWrapper = new ResponseWrapper();
        setHistoryData();

        setResponseText(responseWrapper);
    }
    
    private void setActiveConsultants() throws RemoteException, Exception {
        activeConsultants = new HashMap<String, Consultant>();
        
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        Constraint constraint = new Constraint("Consultant");
        constraint.addCondition("ifUsing", true);
        List<Consultant> consultants = consultService.selectConsultants(constraint);
        
        for (Consultant consultant : consultants){
            activeConsultants.put(consultant.getEmployeeUuid(), consultant);
        }
    }

    private class ResponseWrapper{
        private List<FlotData> consultationData;
        private List<FlotData> followUpData;
        private List<List<Object>> ticksData;

        public List<FlotData> getConsultationData() {
            return consultationData;
        }
        public void setConsultationData(List<FlotData> consultationData) {
            this.consultationData = consultationData;
        }
        public List<List<Object>> getTicksData() {
            return ticksData;
        }
        public void setTicksData(List<List<Object>> ticksData) {
            this.ticksData = ticksData;
        }
        public List<FlotData> getFollowUpData() {
            return followUpData;
        }
        public void setFollowUpData(List<FlotData> followUpData) {
            this.followUpData = followUpData;
        }
        
    }
    
    private class FlotData{
        private List<List<Integer>> data;
        private String label;
        public List<List<Integer>> getData() {
            return data;
        }
        public void setData(List<List<Integer>> data) {
            this.data = data;
        }
        public String getLabel() {
            return label;
        }
        public void setLabel(String label) {
            this.label = label;
        }
        
    }
    
    private void setHistoryData() throws Exception{
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:/MYSQLXADS");
        conn = ds.getConnection();
        stmt = conn.createStatement();
        
        String sql = "SELECT WEEK(NOW(), 1) as currentWeekNo, WEEK(completeAt, 1) as weekNo, count(*) as count, typeUuid, employeeUuid FROM Communication ";
        sql += "WHERE completeAt >= DATE_SUB(NOW(),INTERVAL " + String.valueOf(max_no_of_weeks + 1) + " WEEK) ";
        sql += "AND status='" + Constants.COMMUNICATION_STATUS_COMPLETED + "' ";
        sql += "GROUP BY WEEK(completeAt, 1), typeUuid, employeeUuid ";
       
        rs = stmt.executeQuery(sql);
        Map<String, Map<Integer, Integer>> consultationCnts = new HashMap<String, Map<Integer, Integer>>();
        Map<String, Map<Integer, Integer>> followUpCnts = new HashMap<String, Map<Integer, Integer>>();
        int currentWeekNo = 0;
        while (rs.next()){
            currentWeekNo = rs.getInt("currentWeekNo");
                if (rs.getString("typeUuid") == null) {
                    continue;
                }

                if (rs.getString("typeUuid").equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID)) {
                    if (consultationCnts.get(rs.getString("employeeUuid")) == null) {
                        consultationCnts.put(rs.getString("employeeUuid"), new HashMap<Integer, Integer>());
                    }
                    consultationCnts.get(rs.getString("employeeUuid")).put(rs.getInt("weekNo"), rs.getInt("count"));
                } else if (rs.getString("typeUuid").equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_FOLLOW_UP_UUID)) {
                    if (followUpCnts.get(rs.getString("employeeUuid")) == null) {
                        followUpCnts.put(rs.getString("employeeUuid"), new HashMap<Integer, Integer>());
                    }
                    followUpCnts.get(rs.getString("employeeUuid")).put(rs.getInt("weekNo"), rs.getInt("count"));
                }
        }
        rs.close();
        stmt.close();
        conn.close();
        
        setTicksData(currentWeekNo);
        responseWrapper.setConsultationData(getResponseDataFromCounts(currentWeekNo, consultationCnts));
        responseWrapper.setFollowUpData(getResponseDataFromCounts(currentWeekNo, followUpCnts));
    }
    
    private List<FlotData> getResponseDataFromCounts(int currentWeekNo, Map<String, Map<Integer, Integer>> cnts) {
        List<FlotData> flotDataList = new ArrayList<FlotData>();
        
        for (String employeeUuid : activeConsultants.keySet()) {
            FlotData flotData = new FlotData();

            Consultant consultant = activeConsultants.get(employeeUuid);
            List<List<Integer>> data = new ArrayList<List<Integer>>();
            int index = 1;
            for (int weekNo = currentWeekNo - max_no_of_weeks + 1; weekNo <= currentWeekNo; weekNo++){
                List<Integer> list = new ArrayList<Integer>();
                list.add(index);
                if (cnts.get(employeeUuid) == null || cnts.get(employeeUuid).get(weekNo) == null) {
                    list.add(0);
                } else {
                    list.add(cnts.get(employeeUuid).get(weekNo));
                }
                data.add(list);
                
                index ++;
            }

            flotData.setLabel(consultant.getEmployee().getPerson().getName());
            flotData.setData(data);

            flotDataList.add(flotData);
        }

        return flotDataList;
    }
    
    private void setTicksData(int currentWeekNo){
        List<List<Object>> ticksData = new ArrayList<List<Object>>();
        
        int index = 1;
        for (int weekNo = currentWeekNo - max_no_of_weeks + 1; weekNo <= currentWeekNo;  weekNo ++) {
            List<Object> tickData = new ArrayList<Object>();
            tickData.add(index);
            tickData.add("第" + weekNo + "周");

            index ++;
            ticksData.add(tickData);
        }

        responseWrapper.setTicksData(ticksData);
    }
}
