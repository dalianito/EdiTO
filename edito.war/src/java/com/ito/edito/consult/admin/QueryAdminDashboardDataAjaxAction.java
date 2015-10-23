package com.ito.edito.consult.admin;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.util.Constants;
import com.ito.edito.util.DateUtil;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryAdminDashboardDataAjaxAction extends AjaxAction {

    StatisticsService statisticsService;
    ResponseWrapper responseWrapper;
    private static final int MAX_NO_OF_WEEKS = 8;

    public void executeManualUT() throws Exception {
        statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
        
        responseWrapper = new ResponseWrapper();
        responseWrapper.setDayData(getDayData());
        setHistoryData();

        setResponseText(responseWrapper);
    }
    
    private class ResponseWrapper{
        private Map<String, Integer> dayData;
        private List<List<Integer>> consultationData;
        private List<List<Integer>> followUpData;
        private List<List<Object>> ticksData;

        public Map<String, Integer> getDayData() {
            return dayData;
        }
        public void setDayData(Map<String, Integer> dayData) {
            this.dayData = dayData;
        }
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
    
    private void setHistoryData() throws Exception{
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:/MYSQLXADS");
        conn = ds.getConnection();
        stmt = conn.createStatement();
        
        String sql = "SELECT WEEK(NOW(), 1) as currentWeekNo, WEEK(completeAt, 1) as weekNo, count(*) as count, typeUuid FROM Communication ";
        sql += "WHERE completeAt >= DATE_SUB(NOW(),INTERVAL 9 WEEK) ";
        sql += "AND status='" + Constants.COMMUNICATION_STATUS_COMPLETED + "' ";
        sql += "GROUP BY WEEK(completeAt, 1), typeUuid ";
        sql += "ORDER BY weekNo desc";
       
        rs = stmt.executeQuery(sql);
        Map<Integer, Integer> consultationWeekCnts = new HashMap<Integer, Integer>();
        Map<Integer, Integer> followUpWeekCnts = new HashMap<Integer, Integer>();
        int currentWeekNo = 0;
        while (rs.next()){
            currentWeekNo = rs.getInt("currentWeekNo");
            if (rs.getInt("weekNo") > currentWeekNo - 8) {
                if (rs.getString("typeUuid") == null) {
                    continue;
                }

                if (rs.getString("typeUuid").equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID)) {
                    consultationWeekCnts.put(rs.getInt("weekNo"), rs.getInt("count"));
                } else if (rs.getString("typeUuid").equals(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_FOLLOW_UP_UUID)) {
                    followUpWeekCnts.put(rs.getInt("weekNo"), rs.getInt("count"));
                }
            }
        }
        
        rs.close();
        stmt.close();
        conn.close(); 
        setTicksData(currentWeekNo);
        responseWrapper.setConsultationData(getResponseDataFromCounts(currentWeekNo, consultationWeekCnts));
        responseWrapper.setFollowUpData(getResponseDataFromCounts(currentWeekNo, followUpWeekCnts));
    }
    
    private List<List<Integer>> getResponseDataFromCounts(int currentWeekNo, Map<Integer, Integer> cnts) {
        List<List<Integer>> data = new ArrayList<List<Integer>>();
        

        int index = 1;
        for (int weekNo = currentWeekNo - 7; weekNo <= currentWeekNo; weekNo++){
            List<Integer> list = new ArrayList<Integer>();
            list.add(index);
            if (cnts.get(weekNo) == null) {
                list.add(0);
            } else {
                list.add(cnts.get(weekNo));
            }
            data.add(list);
            
            index ++;
        }
        
        return data;
    }
    
    private void setTicksData(int currentWeekNo){
        List<List<Object>> ticksData = new ArrayList<List<Object>>();
        
        int index = 1;
        for (int weekNo = currentWeekNo - MAX_NO_OF_WEEKS + 1; weekNo < currentWeekNo;  weekNo ++) {
            List<Object> tickData = new ArrayList<Object>();
            tickData.add(index);
            tickData.add("第" + weekNo + "周");

            index ++;
            ticksData.add(tickData);
        }
        List<Object> tickData = new ArrayList<Object>();
        tickData.add(MAX_NO_OF_WEEKS);
        tickData.add("本周"); 
        ticksData.add(tickData);

        responseWrapper.setTicksData(ticksData);
    }
    
    private int getCurDayNoOfConsultations() throws RemoteException, Exception{
        return getNoOfCommunications(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID, DateUtil.getCurDayStartTime(), null);
    }

    private int getCurDayNoOfCompletedFollowUps() throws RemoteException, Exception {
        return getNoOfCommunications(Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_FOLLOW_UP_UUID, DateUtil.getCurDayStartTime(), null);
    }
    
    private int getNoOfCommunications(String typeUuid, Date startDateTime, Date endDateTime) throws RemoteException, Exception{
        String sql = "SELECT distinct C.* FROM Communication C WHERE ";
        sql += "C.typeUuid='" + typeUuid + "' ";
        sql += "AND C.status='" + Constants.COMMUNICATION_STATUS_COMPLETED + "' ";
        sql += "AND C.completeAt >= '" + Constants.DATE_FORMAT.format(startDateTime) + "' ";
        if (endDateTime != null) {
            sql += "AND C.completeAt <= '" + Constants.DATE_FORMAT.format(endDateTime) + "' ";
        }
        
        
        String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
        Constraint jdoVirtualC = new Constraint("JdoVirtual");
        int count = 0;
        jdoVirtualC.addSQLCondition(sqlCount, null);
        JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
        if (jdoVirtual.getCount() != null) {
            count = jdoVirtual.getCount().intValue();
        }
        
        return count;
    }
    
    private int getCurDayNoOfToDoFollowUps() throws RemoteException, Exception {
        String sql = "SELECT distinct C.* FROM CommunicationFollowUp C WHERE ";
        sql += "C.status='" + Constants.COMMUNICATION_FOLLOW_UP_STATUS_NOT_STARTED + "' ";
        sql += "AND C.scheduledDateTime >= '" + Constants.DATE_FORMAT.format(DateUtil.getCurDayStartTime()) + "' ";
        sql += "AND C.scheduledDateTime <= '" + Constants.DATE_FORMAT.format(DateUtil.getCurDayEndTime()) + "' ";
        
        
        String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
        Constraint jdoVirtualC = new Constraint("JdoVirtual");
        int count = 0;
        jdoVirtualC.addSQLCondition(sqlCount, null);
        JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
        if (jdoVirtual.getCount() != null) {
            count = jdoVirtual.getCount().intValue();
        }
        
        return count;
    }
    
    private Map<String, Integer> getDayData() throws RemoteException, Exception{
        Map<String, Integer> dayData = new HashMap<String, Integer>();
        dayData.put("CompletedConsultations", getCurDayNoOfConsultations());
        dayData.put("CompletedFollowUps", getCurDayNoOfCompletedFollowUps());
        dayData.put("ToDoFollowUps", getCurDayNoOfToDoFollowUps());
        
        return dayData;
    }
}
