package com.ito.edito.ejb.DefaultOption;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.DefaultOption;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>DefaultOption_EJB的实现文件</b>
 * </p>
 * 
 * @author <a href="mailto:yang_yu@edito.com.cn">Yang Yu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class DefaultOptionServiceBean extends CastorDataManager implements DefaultOptionServiceRemote {

	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public String insertDefaultOption(DefaultOption defaultOption, String userName) throws Exception, RemoteException {
        return DataManagerStatic.createInstance(defaultOption, null);
    }

	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public void updateDefaultOptionWithDescription(String uuid, String description) {
        
    }

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public DefaultOption getDefaultOptionByUuid(String uuid) throws Exception, RemoteException {
        return (DefaultOption) DataManagerStatic.getInstance(uuid);
    }

	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public void updateDefaultOption(DefaultOption defaultOption, String userName)
            throws Exception, RemoteException {
        DataManagerStatic.updateInstance(defaultOption, userName);
    }

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public DefaultOption getDefaultOptionByEntityAndAttributeAndDescription(
            String entity, String attribute, String description)
            throws Exception, RemoteException {
        Constraint constraint = new Constraint("DefaultOption");
        constraint.addCondition("entity", entity);
        constraint.addCondition("attribute", attribute);
        constraint.addCondition("description", description);
        
        return (DefaultOption) DataManagerStatic.getInstance(constraint);
    }

    @SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
    public List<DefaultOption> getActiveDefaultOptionsByEntity(String entity) throws Exception,
            RemoteException {
        Constraint constraint = new Constraint("DefaultOption");
        constraint.addCondition("entity", entity);
        constraint.addCondition("ifUsing", true);
        
        return (List<DefaultOption>)DataManagerStatic.getInstances(constraint);
    }

	@SuppressWarnings("unchecked")
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public List<DefaultOption> getDefaultOptionsByConstraint(
            Constraint constraint) throws Exception, RemoteException {
	    return (List<DefaultOption>) DataManagerStatic.getInstances(constraint);
    }

}
