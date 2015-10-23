package com.ito.edito.ejb.DefaultOption;

import java.rmi.RemoteException;
import java.util.List;

import javax.naming.NamingException;

import org.exolab.castor.jdo.PersistenceException;

import com.ito.edito.schema.DefaultOption;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>DefaultOption_EJB的接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:yang_yu@edito.com.cn">Yang Yu</a>
 */

public interface DefaultOptionService {
    /**
     * @param defaultOption 新的默认选项
     * @param userName TODO
     * @return 生成的uuid
     * @throws NamingException 
     * @throws PersistenceException 
     * @throws RemoteException 
     */
    public String insertDefaultOption(DefaultOption defaultOption, String userName) throws Exception, RemoteException;
    
    /**
     * @param uuid 要修改的选项的uuid
     * @param description 要求改的选项的描述
     */
    public void updateDefaultOptionWithDescription(String uuid, String description);
	
	public void updateDefaultOption(DefaultOption defaultOption, String userName) throws Exception, RemoteException;
    
    /**
     * @param uuid 要得到的选项的uuid
     * @return DefaultOption 默认选线的详细信息
     * @throws NamingException 
     * @throws ClassNotFoundException 
     * @throws PersistenceException 
     * @throws RemoteException 
     */
    public DefaultOption getDefaultOptionByUuid(String uuid) throws Exception, RemoteException;
    
    public DefaultOption getDefaultOptionByEntityAndAttributeAndDescription(String entity, String attribute, String description) throws Exception, RemoteException;

    public List<DefaultOption> getActiveDefaultOptionsByEntity(String entity) throws Exception, RemoteException;
    
    public List<DefaultOption> getDefaultOptionsByConstraint(Constraint constraint) throws Exception, RemoteException;
}
