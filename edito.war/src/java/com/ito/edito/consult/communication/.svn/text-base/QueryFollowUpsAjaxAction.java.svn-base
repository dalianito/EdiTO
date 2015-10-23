package com.ito.edito.consult.communication;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.util.CommonUtils;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryFollowUpsAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {

        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

        String offset = request.getParameter("offset");
        String recnum = request.getParameter("recnum");
        String status = request.getParameter("status");

        String sql = "select distinct C.* from CommunicationFollowUp C";
        sql += " where C.ownerUuid = '" + CommonUtils.getCurrentEmployeeUuid(USER.getPersonUuid()) + "'";
        if (status != null && status.length() > 0) {
            sql += " AND status='" + status + "'"; 
        }


        String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from (" + sql + ") as T) as JdoVirtual";
        int count = 0;
        Constraint jdoVirtualC = new Constraint("JdoVirtual");
        jdoVirtualC.addSQLCondition(sqlCount, null);
        JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
        if (jdoVirtual.getCount() != null) {
            count = jdoVirtual.getCount().intValue();
        }

        sql += "order by scheduledDateTime asc ";
        sql += " limit " + String.valueOf(Integer.parseInt(offset) - 1) + ", " + recnum;
        Constraint c1 = new Constraint("CommunicationFollowUp");
        c1.addSQLCondition(sql, null);
        List<CommunicationFollowUp> communicationFollowUps = consultService.selectCommunicationFollowUps(c1);

        SimpleDateFormat dateToStrFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
        List<String[]> tempList = new ArrayList<String[]>();
        for (CommunicationFollowUp followUp : communicationFollowUps) {
            Communication communication = (Communication) followUp.getBizData();
            String[] str = new String[8];
            str[0] = followUp.getUuid();
            str[1] = communication.getUuid();
            str[2] = followUp.getScheduledDateTime() == null ? "没有设定具体时间" : dateToStrFormat.format(followUp.getScheduledDateTime());
            str[3] = communication.getCustomer() == null ? "" : communication.getCustomer().getName();
            str[4] = getPersonContactInfo(communication.getCustomer());
            str[5] = communication.getCustomerDecision() == null ? "" : communication.getCustomerDecision();
            str[6] = Constants.COMMUNICATION_FOLLOW_UP_TYPES.get(followUp.getType());
            str[7] = followUp.getStatus();
            tempList.add(str);
        }
        List<Object> resultList = new ArrayList<Object>();
        resultList.add(tempList);
        resultList.add(count);
        setResponseText(resultList);
    }
    
    private String getPersonContactInfo(Person person) {
        if (person == null) {
            return "";
        }
        String contactInfo = "";
        boolean hasData = false;
        if (person.getCellPhone() != null && person.getCellPhone().length() > 0) {
            contactInfo = contactInfo.concat("手机:".concat(person.getCellPhone()));
            hasData = true;
        }
        if (person.getParentPhone() != null && person.getParentPhone().length() > 0) {
            if (hasData) {
                contactInfo = contactInfo.concat("<br/>家长电话:".concat(person.getParentPhone()));
            }else{
                contactInfo = contactInfo.concat("家长电话:".concat(person.getParentPhone()));
                hasData = true;
            }
        }
        if (person.getQq() != null && person.getQq().length() > 0) {
            if (hasData) {
                contactInfo = contactInfo.concat("<br/>QQ".concat(person.getQq()));
            }else{
                contactInfo = contactInfo.concat("QQ".concat(person.getQq()));
            }
        } 
        
        return contactInfo;
    }
}
