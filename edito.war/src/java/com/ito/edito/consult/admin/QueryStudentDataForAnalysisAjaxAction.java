package com.ito.edito.consult.admin;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.Consultant;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.util.Constants;
import com.ito.edito.util.DateUtil;
import com.ito.edito.util.FlotPieChart;
import com.ito.edito.util.FlotPieChartData;
import com.ito.edito.util.FormWrapper;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryStudentDataForAnalysisAjaxAction extends AjaxAction {

    ResponseWrapper responseWrapper;
    Map<String, Consultant> activeConsultants;
    List<Communication> communications;

    public void executeManualUT() throws Exception {
        responseWrapper = new ResponseWrapper();

        setCommunications();
        setConsultMannerData();
        setConsultSourceData();
        setInterestedCampusData();

        setResponseText(responseWrapper);

    }

    private void setCommunications() throws Exception {

        Constraint constraint = new Constraint("Communication");
        constraint.addCondition("completeAt", DateUtil.getStartDateTime(),
          Constraint.RTE);
        constraint.addCondition("completeAt", DateUtil.getEndDateTime(), Constraint.LTE);
        constraint.addCondition("typeUuid", Constants.DEFAULT_OPTION_CONSULT_COMMUNICATION_TYPE_CONSULTATION_UUID);
        ConsultService consultService = (ConsultService) JndiFactory
                .lookup("consultService");
        communications = consultService.selectCommunications(constraint);
    }

    private void setConsultMannerData() throws RemoteException, Exception {

        Map<String, Integer> consultMannerCnts = new HashMap<String, Integer>();
        for (Communication comm : communications) {
            FormWrapper form = new FormWrapper(comm.getForm().getData());
            for (String uuid : form.getUuidListForKey("consultMannerUuid",
                    "consultMannerOtherDescription")) {
                if (!consultMannerCnts.containsKey(uuid)) {
                    consultMannerCnts.put(uuid, 1);
                } else {
                    consultMannerCnts
                            .put(uuid, 1 + consultMannerCnts.get(uuid));
                }
            }
        }

        if (consultMannerCnts.isEmpty()) {
            responseWrapper.setConsultManner(new FlotPieChart());
            return;
        }

        FlotPieChart consultMannerFlotDatas = new FlotPieChart();
        for (DefaultOption option : getDefaultOptions(consultMannerCnts.keySet())) {
            FlotPieChartData data = new FlotPieChartData();
            data.setLabel(option.getDescription());
            data.setData(consultMannerCnts.get(option.getUuid()));
            consultMannerFlotDatas.addData(data);
        }

        responseWrapper.setConsultManner(consultMannerFlotDatas);
    }

    private void setConsultSourceData() throws Exception {
        Map<String, Integer> consultSourceCnts = new HashMap<String, Integer>();
        for (Communication comm : communications) {
            FormWrapper form = new FormWrapper(comm.getForm().getData());
            for (String uuid : form.getUuidListForKey("consultSourceUuid",
                    "consultSourceOtherDescription")) {
                if (!consultSourceCnts.containsKey(uuid)) {
                    consultSourceCnts.put(uuid, 1);
                } else {
                    consultSourceCnts
                            .put(uuid, 1 + consultSourceCnts.get(uuid));
                }
            }
        }

        if (consultSourceCnts.isEmpty()) {
            responseWrapper.setConsultSource(new FlotPieChart());
            return;
        }

        FlotPieChart consultSourceFlotDatas = new FlotPieChart();
        for (DefaultOption option : getDefaultOptions(consultSourceCnts.keySet())) {
            FlotPieChartData data = new FlotPieChartData();
            data.setLabel(option.getDescription());
            data.setData(consultSourceCnts.get(option.getUuid()));
            consultSourceFlotDatas.addData(data);
        }

        responseWrapper.setConsultSource(consultSourceFlotDatas);
    }
    
    private void setInterestedCampusData() throws RemoteException, Exception{
        Map<String, Integer> interestedCampusCnts = new HashMap<String, Integer>();
        for (Communication comm : communications) {
            FormWrapper form = new FormWrapper(comm.getForm().getData());
            for (String uuid : form.getUuidListForKey("interestedCampuses")) {
                if (!interestedCampusCnts.containsKey(uuid)) {
                    interestedCampusCnts.put(uuid, 1);
                } else {
                    interestedCampusCnts
                            .put(uuid, 1 + interestedCampusCnts.get(uuid));
                }
            }
        } 
        
        if (interestedCampusCnts.isEmpty()) {
            responseWrapper.setConsultSource(new FlotPieChart());
            return;
        }
        
        FlotPieChart interestedCampusDatas = new FlotPieChart();
        for (Campus campus : getCampuses(interestedCampusCnts.keySet())) {
            FlotPieChartData data = new FlotPieChartData();
            data.setLabel(campus.getDescription());
            data.setData(interestedCampusCnts.get(campus.getUuid()));
            interestedCampusDatas.addData(data);
        }

        responseWrapper.setInterestedCampus(interestedCampusDatas);
    }
    
    private List<Campus> getCampuses(Set<String> uuids) throws RemoteException, Exception {
        List<String> dbUuids = new ArrayList<String>();
        dbUuids.addAll(uuids);
        CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

        Constraint constraint = new Constraint("Campus");
        constraint.addCondition("uuid", dbUuids, Constraint.IN_LIST);
        return campusService.selectCampuss(constraint);
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

    private class ResponseWrapper {
        private FlotPieChart consultManner;
        private FlotPieChart consultSource;
        private FlotPieChart interestedCampus;

        public FlotPieChart getConsultManner() {
            return consultManner;
        }

        public void setConsultManner(FlotPieChart consultManner) {
            this.consultManner = consultManner;
        }

        public FlotPieChart getConsultSource() {
            return consultSource;
        }

        public void setConsultSource(FlotPieChart consultSource) {
            this.consultSource = consultSource;
        }

        public FlotPieChart getInterestedCampus() {
            return interestedCampus;
        }

        public void setInterestedCampus(FlotPieChart interestedCampus) {
            this.interestedCampus = interestedCampus;
        }

    }
}
