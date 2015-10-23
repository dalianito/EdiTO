package com.ito.edito.consult.admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class QueryDailyDashboardDataAjaxAction extends AjaxAction {

    StatisticsService statisticsService;
    ResponseWrapper responseWrapper;
    Map<Integer, String> dateKeys;
    int max_no_of_days = 30;

    public void executeManualUT() throws Exception {
        //TODO
        // We should allow user to pass in start date and end date.
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        

        statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
        
        responseWrapper = new ResponseWrapper();
        setDateKeys();
        setHistoryData();

        setResponseText(responseWrapper);
    }
    
    private class ResponseWrapper{
        private List<List<Integer>> consultationData;
        private List<List<Integer>> followUpData;
        private List<List<Object>> ticksData;

        public List<List<Integer>> getConsultationData() {
            return consultationData;
        }
        public void setConsultationData(List<List<Integer>> consultationData) {
            this.consultationData = consultationData;
        }
        public List<List<Object>> getTicksData() {
            return ticksData;
        }
        public void setTicksData(List<List<Object>> ticksData) {
            this.ticksData = ticksData;
        }
        public List<List<Integer>> getFollowUpData() {
            return followUpData;
        }
        public void setFollowUpData(List<List<Integer>> followUpData) {
            this.followUpData = followUpData;
        }
        
    }
    
    private void setDateKeys(){
        dateKeys = new HashMap<Integer, String>();
        Calendar today = new GregorianCalendar();
        today.add(Calendar.DAY_OF_MONTH, 1);
        for (int i=max_no_of_days; i>=1; i--) {
            today.add(Calendar.DAY_OF_MONTH, -1);
            Date date = today.getTime();
            String month = String.valueOf(date.getMonth() + 1);
            String day = String.valueOf(date.getDate());
            dateKeys.put(i, month + "." + day);
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
        
        String dateFormat = "DATE_FORMAT(completeAt, \"%c.%e\") ";
        
        String sql = "SELECT " + dateFormat + " as dayMark, count(*) as count, typeUuid FROM Communication ";
        sql += "WHERE completeAt >= DATE_SUB(NOW(),INTERVAL " + String.valueOf((max_no_of_days + 1)) + " DAY) ";
        sql += "AND status='" + Constants.COMMUNICATION_STATUS_COMPLETED + "' ";
        sql += "GROUP BY " + dateFormat + ", typeUuid ";
       
        rs = stmt.executeQuery(sql);
        Map<String, Integer> consultationCnts = new HashMap<String, Integer>();
        Map<String, Integer> followUpCnts = new HashMap<String, Integer>();
        while (rs.next()){
                if (rs.getString("typeUuid") == null) {
                    continue;
                }

                if (rs.getString("typeUuid").equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID)) {
                    consultationCnts.put(rs.getString("dayMark"), rs.getInt("count"));
                } else if (rs.getString("typeUuid").equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_FOLLOW_UP_UUID)) {
                    followUpCnts.put(rs.getString("dayMark"), rs.getInt("count"));
                }
        }
        
        rs.close();
        stmt.close();
        conn.close(); 

        setTicksData();
        responseWrapper.setConsultationData(getResponseDataFromCounts(consultationCnts));
        responseWrapper.setFollowUpData(getResponseDataFromCounts(followUpCnts));
    }
    
    private List<List<Integer>> getResponseDataFromCounts(Map<String, Integer> cnts) {
        List<List<Integer>> data = new ArrayList<List<Integer>>();
        

        for (int i=max_no_of_days; i>=1; i--){
            List<Integer> list = new ArrayList<Integer>();
            list.add(i);
            if (cnts.get(dateKeys.get(i)) == null) {
                list.add(0);
            } else {
                list.add(cnts.get(dateKeys.get(i)));
            }
            data.add(list);
        }
        
        return data;
    }
    
    private void setTicksData(){
        Calendar today = new GregorianCalendar();
        
        List<List<Object>> ticksData = new ArrayList<List<Object>>();
        today.add(Calendar.DAY_OF_MONTH, 1);
        
        int index = max_no_of_days;
        for (int i=1; i<=max_no_of_days; i++) {
            today.add(Calendar.DAY_OF_MONTH, -1);
            Date date = today.getTime();
            List<Object> tickData = new ArrayList<Object>();
            tickData.add(index);
            String month = String.valueOf(date.getMonth() + 1);
            String day = String.valueOf(date.getDate());
            tickData.add(month + "." + day);

            index --;
            ticksData.add(tickData);
        }

        responseWrapper.setTicksData(ticksData);
    }
}
