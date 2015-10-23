package com.ito.edito.consult.communication;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class ConsultStudentAction extends DefaultAction {
    
    private List<Campus> availableCampuses;
    
    private List<DefaultOption> consultMannerOptions;
    private List<DefaultOption> consultSourceOptions;
    private List<DefaultOption> studentRefuseReasonOptions;
    private List<DefaultOption> studentConsideringReasonOptions;
    private String typeUuid = Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID;

    public void executeManualUT() throws Exception {
        initializeOptions();
    }

    private void initializeOptions() throws Exception{
        CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
        Constraint constraint = new Constraint("Campus");
        constraint.addCondition("ifUsing", true);
        availableCampuses = campusService.selectCampuss(constraint);
        
        setDefaultOptions();
    }
    
    private void setDefaultOptions() throws Exception {
        consultMannerOptions = new ArrayList<DefaultOption>();
        consultSourceOptions = new ArrayList<DefaultOption>();
        studentRefuseReasonOptions = new ArrayList<DefaultOption>();
        studentConsideringReasonOptions = new ArrayList<DefaultOption>();

        DefaultOptionService defaultOptionService = (DefaultOptionService) JndiFactory.lookup("defaultOptionService");
        List<DefaultOption> activeDefaultOptions = defaultOptionService.getActiveDefaultOptionsByEntity(Constants.DEFAULT_OPTION_ENTITY_CONSULT);
        for (DefaultOption defaultOption : activeDefaultOptions) {
            if (defaultOption.getAttribute().equals(Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_MANNER)) {
                consultMannerOptions.add(defaultOption);
            } else if (defaultOption.getAttribute().equals(Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_SOURCE)) {
                consultSourceOptions.add(defaultOption);
            } else if (defaultOption.getAttribute().equals(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_CONSIDERING_REASON)) {
                studentConsideringReasonOptions.add(defaultOption);
            } else if (defaultOption.getAttribute().equals(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_REFUSE_REASON)) {
                studentRefuseReasonOptions.add(defaultOption);
            }
        }
    }

    public List<Campus> getAvailableCampuses() {
        return availableCampuses;
    }
        
    public List<DefaultOption> getConsultMannerOptions() {
        return consultMannerOptions;
    }

    public List<DefaultOption> getConsultSourceOptions() {
        return consultSourceOptions;
    }

    public List<DefaultOption> getStudentRefuseReasonOptions() {
        return studentRefuseReasonOptions;
    }

    public List<DefaultOption> getStudentConsideringReasonOptions() {
        return studentConsideringReasonOptions;
    }
    
    public String getTypeUuid(){
        return typeUuid;
    }
}
