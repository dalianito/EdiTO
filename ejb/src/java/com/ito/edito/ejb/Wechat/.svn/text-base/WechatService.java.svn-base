package com.ito.edito.ejb.Wechat;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.ServiceConfiguration;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Wechat_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * ServiceConfiguration<br>
 * WechatNotificiationMessage<br>
 */

public interface WechatService {
	/**
	 * <b>创建微信配置</b>
	 * 
	 * @param serviceConfiguration ServiceConfiguration对象
	 * @param userName 执行者的账户名
	 * @return 创建的ServiceConfiguration的uuid
	 */
	public String insertServiceConfiguration(ServiceConfiguration serviceConfiguration, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新微信配置</b>
	 * 
	 * @param serviceConfiguration ServiceConfiguration对象
	 * @param userName 执行者的账户名
	 */
	public void updateServiceConfiguration(ServiceConfiguration serviceConfiguration, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询创建微信配置(uuid)</b>
	 * 
	 * @param uuid ServiceConfiguration的uuid
	 * @return 查询到的ServiceConfiguration
	 */
	public ServiceConfiguration selectServiceConfigurationByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询创建微信配置</b>
	 * 
	 * @param constraint ServiceConfiguration的约束条件
	 * @return 查询到的ServiceConfiguration
	 */
	public ServiceConfiguration selectServiceConfiguration(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询创建微信配置(list)</b>
	 * 
	 * @param constraint ServiceConfiguration的约束条件
	 * @return 查询到的ServiceConfiguration的list
	 */
	public List<ServiceConfiguration> selectServiceConfigurations(Constraint constraint) throws Exception, RemoteException;

	
	/**
	 * <b>创建微信通知</b>
	 * 
	 * @param wechatNotificiationMessage WechatNotificiationMessage对象
	 * @param userName 执行者的账户名
	 * @return 创建的WechatNotificiationMessage的uuid
	 */
	public String insertWechatNotificiationMessage(WechatNotificiationMessage wechatNotificiationMessage, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新微信通知</b>
	 * 
	 * @param wechatNotificiationMessage WechatNotificiationMessage对象
	 * @param userName 执行者的账户名
	 */
	public void updateWechatNotificiationMessage(WechatNotificiationMessage wechatNotificiationMessage, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询创建微信通知(uuid)</b>
	 * 
	 * @param uuid WechatNotificiationMessage的uuid
	 * @return 查询到的WechatNotificiationMessage
	 */
	public WechatNotificiationMessage selectWechatNotificiationMessageByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询创建微信通知</b>
	 * 
	 * @param constraint WechatNotificiationMessage的约束条件
	 * @return 查询到的WechatNotificiationMessage
	 */
	public WechatNotificiationMessage selectWechatNotificiationMessage(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询创建微信通知(list)</b>
	 * 
	 * @param constraint WechatNotificiationMessage的约束条件
	 * @return 查询到的WechatNotificiationMessage的list
	 */
	public List<WechatNotificiationMessage> selectWechatNotificiationMessages(Constraint constraint) throws Exception, RemoteException;
}
