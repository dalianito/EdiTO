package com.ito.edito.ejb.BehaviourStandard;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.BehaviourStandard;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>BehaviourStandard_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * BehaviourStandard<br>
 * 
 * @author <a href="mailto:lanka_li@ito.com.cn">Lanka Li</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class BehaviourStandardServiceBean extends CastorDataManager implements BehaviourStandardServiceRemote {
	/**
	 * <b>创建行为规范</b>
	 * 
	 * @param behaviourStandard BehaviourStandard对象
	 * @param userName 执行者的账户名
	 * @return 创建的BehaviourStandard的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertBehaviourStandard(BehaviourStandard behaviourStandard, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(behaviourStandard, userName);
	}

	/**
	 * <b>更新行为规范</b>
	 * 
	 * @param behaviourStandard BehaviourStandard对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateBehaviourStandard(BehaviourStandard behaviourStandard, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(behaviourStandard, userName);
	}

	/**
	 * <b>删除行为规范</b>
	 * 
	 * @param behaviourStandard BehaviourStandard对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteBehaviourStandard(BehaviourStandard behaviourStandard, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(behaviourStandard, userName);
	}

	/**
	 * <b>查询行为规范(uuid)</b>
	 * 
	 * @param uuid BehaviourStandard的uuid
	 * @return 查询到的BehaviourStandard
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public BehaviourStandard selectBehaviourStandardByUuid(String uuid) throws Exception, RemoteException {
		return (BehaviourStandard) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询行为规范</b>
	 * 
	 * @param constraint BehaviourStandard的约束条件
	 * @return 查询到的BehaviourStandard
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public BehaviourStandard selectBehaviourStandard(Constraint constraint) throws Exception, RemoteException {
		return (BehaviourStandard) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询行为规范(list)</b>
	 * 
	 * @param constraint BehaviourStandard的约束条件
	 * @return 查询到的BehaviourStandard的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<BehaviourStandard> selectBehaviourStandards(Constraint constraint) throws Exception, RemoteException {
		return (List<BehaviourStandard>) DataManagerStatic.getInstances(constraint);
	}
}
