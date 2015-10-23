package com.ito.edito.ejb.BehaviourStandard;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.BehaviourStandard;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>BehaviourStandard_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * BehaviourStandard<br>
 * 
 * @author <a href="mailto:lanka_li@ito.com.cn">Lanka Li</a>
 */

public interface BehaviourStandardService {
	/**
	 * <b>创建行为规范</b>
	 * 
	 * @param behaviourStandard BehaviourStandard对象
	 * @param userName 执行者的账户名
	 * @return 创建的BehaviourStandard的uuid
	 */
	public String insertBehaviourStandard(BehaviourStandard behaviourStandard, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新行为规范</b>
	 * 
	 * @param behaviourStandard BehaviourStandard对象
	 * @param userName 执行者的账户名
	 */
	public void updateBehaviourStandard(BehaviourStandard behaviourStandard, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询行为规范(uuid)</b>
	 * 
	 * @param uuid BehaviourStandard的uuid
	 * @return 查询到的BehaviourStandard
	 */
	public BehaviourStandard selectBehaviourStandardByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>删除行为规范</b>
	 * 
	 * @param behaviourStandard BehaviourStandard对象
	 * @param userName 执行者的账户名
	 */
	public void deleteBehaviourStandard(BehaviourStandard behaviourStandard, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询行为规范</b>
	 * 
	 * @param constraint BehaviourStandard的约束条件
	 * @return 查询到的BehaviourStandard
	 */
	public BehaviourStandard selectBehaviourStandard(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询行为规范(list)</b>
	 * 
	 * @param constraint BehaviourStandard的约束条件
	 * @return 查询到的BehaviourStandard的list
	 */
	public List<BehaviourStandard> selectBehaviourStandards(Constraint constraint) throws Exception, RemoteException;
}
