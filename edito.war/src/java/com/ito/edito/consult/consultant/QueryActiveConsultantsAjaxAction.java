package com.ito.edito.consult.consultant;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.Consultant;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryActiveConsultantsAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {

        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");

        Constraint constraint = new Constraint("Consultant");
        constraint.addCondition("ifUsing", true);
        List<Consultant> consultants = consultService.selectConsultants(constraint);

        List<ConsultantWrapper> result = new ArrayList<ConsultantWrapper>();
        for (Consultant consultant : consultants) {
            if (consultant.getEmployee().getPersonUuid().equals(USER.getPersonUuid())) {
                continue;
            }
            result.add(new ConsultantWrapper(consultant));
        }

        setResponseText(result);
    }
    
    private class ConsultantWrapper {
        private String uuid;
        private String personNo;
        private String name;
        
        public ConsultantWrapper(Consultant consultant){
            uuid = consultant.getEmployeeUuid();
            personNo = consultant.getEmployee().getPerson().getPersonNo();
            name = consultant.getEmployee().getPerson().getName();
        }
        
        public String getUuid() {
            return uuid;
        }
        public String getPersonNo() {
            return personNo;
        }
        public String getName() {
            return name;
        }
    }
}
