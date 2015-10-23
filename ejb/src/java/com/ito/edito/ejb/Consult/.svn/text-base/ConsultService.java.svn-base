package com.ito.edito.ejb.Consult;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Communication;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.edito.schema.Consultant;
import com.ito.fai.idp.core.Constraint;

public interface ConsultService {

    public List<Communication> selectCommunications(Constraint constraint) throws Exception, RemoteException;
    
    public List<Communication> selectCommunicationsByCustomerUuid(String customerUuid) throws Exception, RemoteException;
    
    public Communication selectCommunicationByUuid(String uuid) throws Exception, RemoteException;
    
    public String insertCommunication(Communication communication, String userName) throws Exception, RemoteException;

    public void updateCommunicationOnly(Communication communication, String userName) throws Exception, RemoteException;

    public void updateCommunicationAndForm(Communication communication, String userName) throws Exception, RemoteException;
    
    public List<CommunicationFollowUp> selectCommunicationFollowUps(Constraint constraint) throws Exception, RemoteException;
    
    public CommunicationFollowUp selectCommunicationFollowUpByUuid(String uuid) throws Exception, RemoteException;
    
    public void updateCommunicationFollowUp(CommunicationFollowUp communicationFollowUp, String userName) throws Exception, RemoteException;
    
    
    
    
    /* Consultant */
    public List<Consultant> selectConsultants(Constraint constraint) throws Exception, RemoteException;
    
    public Consultant selectConsultantByUuid(String uuid) throws Exception, RemoteException;
    
    public Consultant selectConsultant(Constraint constraint) throws Exception, RemoteException;
    
    public String insertConsultant(Consultant consultant, String userName) throws Exception, RemoteException;
    
    public void updateConsultant(Consultant consultant, String userName) throws Exception, RemoteException;
}
