package com.ito.edito.ejb.Training;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.schema.ReceiverInfo;
import com.ito.edito.schema.TrainingPlan;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Training_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Training<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

public interface TrainingService {

	/**
	 * <p>
	 * <b>创建培训计划</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * receiverInfo<br>
	 * applyInfo<br>
	 * 
	 * @param trainingPlan TrainingPlan对象
	 * @param userName 执行者的账户名
	 * @return 创建的TrainingPlan的uuid
	 */
	public String insertTrainingPlan(TrainingPlan trainingPlan, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新培训计划</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * receiverInfo<br>
	 * applyInfoList<br>
	 * 
	 * @param trainingPlan TrainingPlan对象
	 * @param userName 执行者的账户名
	 */
	public void updateTrainingPlan(TrainingPlan trainingPlan, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询培训计划(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入TrainingPlan中：<br>
	 * receiverInfo<br>
	 * applyInfo<br>
	 * 
	 * @param uuid TrainingPlan的uuid
	 * @return 查询到的TrainingPlan
	 */
	public TrainingPlan selectTrainingPlanByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询培训计划</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入TrainingPlan中：<br>
	 * receiverInfo<br>
	 * applyInfoList<br>
	 * 
	 * @param constraint TrainingPlan的约束条件
	 * @return 查询到的TrainingPlan
	 */
	public TrainingPlan selectTrainingPlan(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询培训计划(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入TrainingPlan(list)中：<br>
	 * receiverInfo<br>
	 * applyInfoList<br>
	 * 
	 * @param constraint TrainingPlan的约束条件
	 * @return 查询到的TrainingPlan的list
	 */
	public List<TrainingPlan> selectTrainingPlans(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询接收者信息(list)</b>
	 * 
	 * @param constraint ReceiverInfo的约束条件
	 * @return 查询到的ReceiverInfo的list
	 */
	public List<ReceiverInfo> selectReceiverInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建申请信息</b>
	 * 
	 * @param applyInfo ApplyInfo对象
	 * @param userName 执行者的账户名
	 * @return 创建的ApplyInfo的uuid
	 */
	public String insertApplyInfo(ApplyInfo applyInfo, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新申请信息</b>
	 * 
	 * @param applyInfo ApplyInfo对象
	 * @param userName 执行者的账户名
	 */
	public void updateApplyInfo(ApplyInfo applyInfo, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除申请信息</b>
	 * 
	 * @param applyInfo ApplyInfo对象
	 * @param userName 执行者的账户名
	 */
	public void deleteApplyInfo(ApplyInfo applyInfo, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询申请信息(uuid)</b>
	 * 
	 * @param uuid ApplyInfo的uuid
	 * @return 查询到的ApplyInfo
	 */
	public ApplyInfo selectApplyInfoByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询申请信息</b>
	 * 
	 * @param constraint ApplyInfo的约束条件
	 * @return 查询到的ApplyInfo
	 */
	public ApplyInfo selectApplyInfo(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询申请信息(list)</b>
	 * 
	 * @param constraint ApplyInfo的约束条件
	 * @return 查询到的ApplyInfo的list
	 */
	public List<ApplyInfo> selectApplyInfos(Constraint constraint) throws Exception, RemoteException;

}
