package com.ito.edito.consult.consultant;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.schema.Consultant;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateConsultantAjaxAction extends AjaxAction {

    public void executeManualUT() throws Exception {
        ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");

        Consultant consultant = (Consultant) carrier.fetchInstance("Consultant");
        consultant.setIfUsing(true);
        
        Constraint constraint = new Constraint("Consultant");
        constraint.addCondition("employeeUuid", consultant.getEmployeeUuid());
        
        Consultant existingConsultant = consultService.selectConsultant(constraint);
        if (existingConsultant != null){
            System.out.println("Employee is already a consultant!");
            
            if (existingConsultant.getIfUsing()) {
                return;
            }
            
            existingConsultant.setIfUsing(true);
        }

        ut.begin();
        try {
            if (existingConsultant != null){
                consultService.updateConsultant(existingConsultant, USER.getAccount());
            } else {
                consultService.insertConsultant(consultant, USER.getAccount());
            }
            ut.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
            ut.rollback();
        }
    }
}
