package com.ito.edito.ejb.Consult;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.naming.NamingException;

import org.exolab.castor.jdo.PersistenceException;
import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.CommunicationFollowUp;
import com.ito.edito.schema.Consultant;
import com.ito.edito.schema.Form;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class ConsultServiceBean extends CastorDataManager implements ConsultServiceRemote {

    @SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public List<Communication> selectCommunicationsByCustomerUuid(String customerUuid) throws Exception, RemoteException {
        Constraint constraint = new Constraint("Communication");
        constraint.addCondition("customerUuid", customerUuid);
        constraint.addOrderCondition("startAt", "desc");
        List<Communication> communications = (List<Communication>) DataManagerStatic.getInstances(constraint);
        for (Communication communication : communications) {
            communication.setForm(getFormByCommunicationUuid(communication.getUuid()));
        }
        
        return communications;
    }
    

	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public String insertCommunication(Communication communication, String userName) throws Exception, RemoteException {
        String communicationUuid = DataManagerStatic.createInstance(communication, userName);
        Form form = communication.getForm();
        form.setBizDataUuid(communicationUuid, false);
        DataManagerStatic.createInstance(form, userName);
        
        List<CommunicationFollowUp> followUps = communication.getFollowUpsAsReference();
        for (CommunicationFollowUp followUp : followUps) {
            followUp.setBizDataUuid(communicationUuid, false);
            DataManagerStatic.createInstance(followUp, userName);
        }

        return communicationUuid;
    }
	
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public void updateCommunicationOnly(Communication communication, String userName) throws Exception, RemoteException {
	    DataManagerStatic.updateInstance(communication, userName);
	    if (communication.getForm() != null && communication.getForm().getUuid() != null) {
	        DataManagerStatic.updateInstance(communication.getForm(), userName);
	    }
    }
	
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public void updateCommunicationAndForm(Communication communication, String userName) throws Exception, RemoteException {
	    DataManagerStatic.updateInstance(communication, userName);
        Form form = communication.getForm();
        if (form.getBizDataUuid() == null) {
            form.setBizDataUuid(communication.getUuid());
        }

        DataManagerStatic.updateInstance(form, userName);
    }
	
	private Form getFormByCommunicationUuid(String uuid) throws RemoteException, PersistenceException, NamingException{
	    Constraint constraint = new Constraint("Form");
	    constraint.addCondition("bizDataUuid", uuid);
	    
	    return (Form) DataManagerStatic.getInstance(constraint);
	}


	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Communication selectCommunicationByUuid(String uuid) throws Exception, RemoteException {
	    Communication communication = (Communication) DataManagerStatic.getInstance(uuid);
	    Constraint constraint = new Constraint("Form");
	    constraint.addCondition("bizDataUuid", communication.getUuid());
	    
	    Form form = (Form) DataManagerStatic.getInstance(constraint);
	    communication.setForm(form);
	    return communication;
    }


    @SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public List<Communication> selectCommunications(Constraint constraint) throws Exception, RemoteException {
        List<Communication> communications = (List<Communication>) DataManagerStatic.getInstances(constraint);
        for (Communication communication : communications) {
            communication.setForm(getFormByCommunicationUuid(communication.getUuid()));
        }
        return communications;
    }


	@SuppressWarnings("unchecked")
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public List<CommunicationFollowUp> selectCommunicationFollowUps(
            Constraint constraint) throws Exception, RemoteException {
	    List<CommunicationFollowUp> followUps = (List<CommunicationFollowUp>) DataManagerStatic.getInstances(constraint);
	    for (CommunicationFollowUp followUp : followUps){
	        followUp.setBizData(selectCommunicationByUuid(followUp.getBizDataUuid()));
	    }
	    
	    return followUps;
    }


	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public CommunicationFollowUp selectCommunicationFollowUpByUuid(String uuid)
            throws Exception, RemoteException {
	    CommunicationFollowUp followUp = (CommunicationFollowUp) DataManagerStatic.getInstance(uuid);
	    followUp.setBizData(selectCommunicationByUuid(followUp.getBizDataUuid()));
	    return followUp;
    }


	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public void updateCommunicationFollowUp(
            CommunicationFollowUp communicationFollowUp, String userName)
            throws Exception, RemoteException {
	    DataManagerStatic.updateInstance(communicationFollowUp, userName);
    }


	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public List<Consultant> selectConsultants(Constraint constraint)
            throws Exception, RemoteException {
	    return (List<Consultant>) DataManagerStatic.getInstances(constraint);
    }


	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Consultant selectConsultantByUuid(String uuid) throws Exception,
            RemoteException {
	    return (Consultant) DataManagerStatic.getInstance(uuid);
    }


	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Consultant selectConsultant(Constraint constraint) throws Exception,
            RemoteException {
	    return (Consultant) DataManagerStatic.getInstance(constraint);
    }


	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public String insertConsultant(Consultant consultant, String userName)
            throws Exception, RemoteException {
	    return DataManagerStatic.createInstance(consultant, userName);
    }


	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public void updateConsultant(Consultant consultant, String userName)
            throws Exception, RemoteException {
	    DataManagerStatic.updateInstance(consultant, userName);
    }
	
}
