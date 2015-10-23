package com.ito.edito.ejb.Wechat;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.ServiceConfiguration;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Wechat_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * ServiceConfiguration<br>
 * WechatNotificiationMessage<br>
 * 
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class WechatServiceBean extends CastorDataManager implements WechatServiceRemote {
	/**
	 * <b>创建微信配置</b>
	 * 
	 * @param ServiceConfiguration ServiceConfiguration对象
	 * @param userName 执行者的账户名
	 * @return 创建的ServiceConfiguration的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertServiceConfiguration(ServiceConfiguration serviceConfiguration, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(serviceConfiguration, userName);
	}

	/**
	 * <b>更新微信配置</b>
	 * 
	 * @param serviceConfiguration ServiceConfiguration对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateServiceConfiguration(ServiceConfiguration serviceConfiguration, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(serviceConfiguration, userName);
	}

	/**
	 * <b>查询微信配置(uuid)</b>
	 * 
	 * @param uuid ServiceConfiguration的uuid
	 * @return 查询到的ServiceConfiguration
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ServiceConfiguration selectServiceConfigurationByUuid(String uuid) throws Exception, RemoteException {
		return (ServiceConfiguration) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询微信配置</b>
	 * 
	 * @param constraint ServiceConfiguration的约束条件
	 * @return 查询到的ServiceConfiguration
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ServiceConfiguration selectServiceConfiguration(Constraint constraint) throws Exception, RemoteException {
		return (ServiceConfiguration) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询微信配置(list)</b>
	 * 
	 * @param constraint ServiceConfiguration的约束条件
	 * @return 查询到的ServiceConfiguration的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ServiceConfiguration> selectServiceConfigurations(Constraint constraint) throws Exception, RemoteException {
		return (List<ServiceConfiguration>) DataManagerStatic.getInstances(constraint);
	}

	
	/**
	 * <b>创建微信通知</b>
	 * 
	 * @param wechatNotificiationMessage WechatNotificiationMessage对象
	 * @param userName 执行者的账户名
	 * @return 创建的WechatNotificiationMessage的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertWechatNotificiationMessage(WechatNotificiationMessage wechatNotificiationMessage, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(wechatNotificiationMessage, userName);
	}

	/**
	 * <b>更新微信通知</b>
	 * 
	 * @param wechatNotificiationMessage WechatNotificiationMessage对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateWechatNotificiationMessage(WechatNotificiationMessage wechatNotificiationMessage, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(wechatNotificiationMessage, userName);
	}

	/**
	 * <b>查询微信通知(uuid)</b>
	 * 
	 * @param uuid WechatNotificiationMessage的uuid
	 * @return 查询到的WechatNotificiationMessage
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public WechatNotificiationMessage selectWechatNotificiationMessageByUuid(String uuid) throws Exception, RemoteException {
		return (WechatNotificiationMessage) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询微信配置</b>
	 * 
	 * @param constraint WechatNotificiationMessage的约束条件
	 * @return 查询到的WechatNotificiationMessage
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public WechatNotificiationMessage selectWechatNotificiationMessage(Constraint constraint) throws Exception, RemoteException {
		return (WechatNotificiationMessage) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询微信通知(list)</b>
	 * 
	 * @param constraint WechatNotificiationMessage的约束条件
	 * @return 查询到的WechatNotificiationMessage的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<WechatNotificiationMessage> selectWechatNotificiationMessages(Constraint constraint) throws Exception, RemoteException {
		return (List<WechatNotificiationMessage>) DataManagerStatic.getInstances(constraint);
	}
			
}
