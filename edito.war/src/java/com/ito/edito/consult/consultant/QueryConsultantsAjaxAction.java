package com.ito.edito.consult.consultant;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Consultant;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryConsultantsAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {

        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
        StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

        String personNo = request.getParameter("personNo");
        String name = request.getParameter("name");

        String offset = request.getParameter("offset");
        String recnum = request.getParameter("recnum");

        String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Consultant C, Employee E, Person P ";
        String sqlSelect = "select C.* from Consultant C, Employee E, Person P ";
        String sqlCondition = "where C.employeeUuid = E.uuid and E.personUuid = P.uuid and C.ifUsing = true ";

        if (!(USER.getUuid().equals(Constants.ADMIN_USER_UUID))) {
            sqlCondition += "and P.uuid != '" + Constants.ADMIN_PERSON_UUID + "' ";
        }
        if (personNo != null && personNo.length() > 0) {
            sqlCondition += "and P.personNo = '" + personNo + "' ";
        }
        if (name != null && name.length() > 0) {
            sqlCondition += "and P.name like '%" + name + "%' ";
        }

        sqlCount += sqlCondition + ") as JdoVirtual";
        int count = 0;
        Constraint jdoVirtualC = new Constraint("JdoVirtual");

        jdoVirtualC.addSQLCondition(sqlCount, null);
        JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
        if (jdoVirtual.getCount() != null) {
            count = jdoVirtual.getCount().intValue();
        }

        sqlSelect += sqlCondition;
        sqlSelect += "order by personNo asc ";
        sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

        Constraint consultantC = new Constraint("Consultant");
        consultantC.addSQLCondition(sqlSelect, null);
        List<Consultant> list = consultService.selectConsultants(consultantC);
        List<String[]> tempList = new ArrayList<String[]>();
        for (int i = 0; i < list.size(); i++) {
            Consultant consultant = list.get(i);
            Person person = consultant.getEmployee().getPerson();

            String[] str = new String[9];
            str[0] = Integer.toString(Integer.parseInt(offset) + i);
            str[1] = person.getPersonNo();
            str[2] = person.getName();
            str[3] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
            str[4] = consultant.getEmployee().getDepartmentUuid() != null ? consultant.getEmployee().getDepartment().getDescription() : "";
            str[5] = consultant.getEmployee().getCampusUuid() != null ? consultant.getEmployee().getCampus().getDescription() : "";
            str[6] = consultant.getUuid();

            tempList.add(str);
        }

        List<Object> resultList = new ArrayList<Object>();
        resultList.add(tempList);
        resultList.add(count);
        setResponseText(resultList);
    }

}
