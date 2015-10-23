package com.ito.edito.consult.admin;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.util.Constants;
import com.ito.edito.util.DateUtil;
import com.ito.edito.util.FlotLineChart;
import com.ito.edito.util.FlotLineChartData;
import com.ito.edito.util.FormWrapper;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWeeklyConsultSourceAjaxAction extends AjaxAction {

    FlotLineChart resultLineChart; 
    private static final int MAX_NO_OF_WEEKS = 12;

    public void executeManualUT() throws Exception {
        resultLineChart = new FlotLineChart();
        
        int currentWeekNo = getCurWeekNo();
        setTicksData(currentWeekNo);
        
        Map<Integer, List<FormWrapper>> forms = getFormsDataInWeekNo();
        
        resultLineChart.setDataArray(getFlotLineChartData(currentWeekNo, forms));

        setResponseText(resultLineChart);
    }
    
    private List<FlotLineChartData> getFlotLineChartData(int currentWeekNo, Map<Integer, List<FormWrapper>> forms) throws RemoteException, Exception {
        List<FlotLineChartData> chartData = new ArrayList<FlotLineChartData>();

        Map<Integer, Map<String, Integer>> mappedUuidCnts = new HashMap<Integer, Map<String, Integer>>();
        
        Set<String> defaultOptionUuids = new HashSet<String>();
        
        for (int key : forms.keySet()) {
            for (FormWrapper form : forms.get(key)) {
                for (String uuid : form.getUuidListForKey("consultSourceUuid",
                        "consultSourceOtherDescription")) {
                    defaultOptionUuids.add(uuid);
                    if (!mappedUuidCnts.containsKey(key)) {
                        mappedUuidCnts.put(key, new HashMap<String, Integer>());
                    }
                    if (!mappedUuidCnts.get(key).containsKey(uuid)) {
                        mappedUuidCnts.get(key).put(uuid, 1);
                    } else {
                        mappedUuidCnts.get(key).put(uuid, 1 + mappedUuidCnts.get(key).get(uuid));
                    }
                }
            }
        }

        for (DefaultOption defaultOption : getDefaultOptions(defaultOptionUuids)){
            FlotLineChartData data = new FlotLineChartData();
            data.setLabel(defaultOption.getDescription());
            
            int index = 1;
            for (int weekNo = currentWeekNo - MAX_NO_OF_WEEKS + 1; weekNo <= currentWeekNo;  weekNo ++) {
                if (mappedUuidCnts.get(weekNo) == null || mappedUuidCnts.get(weekNo).get(defaultOption.getUuid()) == null) {
                    data.addDataPoint(index, 0);
                } else {
                    data.addDataPoint(index, mappedUuidCnts.get(weekNo).get(defaultOption.getUuid()));
                }
                
                index ++;
            }
            
            chartData.add(data);
        }
        
        return chartData;
    }
    
    private List<DefaultOption> getDefaultOptions(Set<String> uuids)
            throws RemoteException, Exception {
        List<String> dbUuids = new ArrayList<String>();
        dbUuids.addAll(uuids);
        DefaultOptionService dos = (DefaultOptionService) JndiFactory
                .lookup("defaultOptionService");
        Constraint constraint = new Constraint("DefaultOption");
        constraint.addCondition("uuid", dbUuids, Constraint.IN_LIST);

        return dos.getDefaultOptionsByConstraint(constraint);
    }

    private Date getEarliestWeekStartTime(){
        Calendar currentDate = new GregorianCalendar();   
        currentDate.setFirstDayOfWeek(Calendar.MONDAY);  
        currentDate.add(Calendar.WEEK_OF_YEAR, - (MAX_NO_OF_WEEKS + 1));
                  
        currentDate.set(Calendar.HOUR_OF_DAY, 0);  
        currentDate.set(Calendar.MINUTE, 0);  
        currentDate.set(Calendar.SECOND, 0);  
        currentDate.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);  
        return (Date)currentDate.getTime().clone(); 
    }
    
    private int getCurWeekNo(){
        Calendar currentDate = new GregorianCalendar();   
        currentDate.setFirstDayOfWeek(Calendar.MONDAY);  
        return currentDate.get(Calendar.WEEK_OF_YEAR);
    }
    
    private Map<Integer, List<FormWrapper>> getFormsDataInWeekNo() throws Exception {

        Constraint constraint = new Constraint("Communication");
        constraint.addCondition("completeAt", getEarliestWeekStartTime(), Constraint.RTE);
        constraint.addCondition("typeUuid", Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID);
        ConsultService consultService = (ConsultService) JndiFactory
                .lookup("consultService");
        Map<Integer, List<FormWrapper>> formsInWeekNo = new HashMap<Integer, List<FormWrapper>>();
        for (Communication comm : consultService.selectCommunications(constraint)) {
            int weekNo = DateUtil.getWeekNoForDate(comm.getCompleteAt());
            if (formsInWeekNo.get(weekNo) == null){
                List<FormWrapper> forms = new ArrayList<FormWrapper>();
                formsInWeekNo.put(weekNo, forms);
            }
            formsInWeekNo.get(weekNo).add(new FormWrapper(comm.getForm().getData()));
        }
        return formsInWeekNo;
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

        resultLineChart.setTicksData(ticksData);
    }

}
