package com.ito.edito.ejb.Training;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.ApplyInfo;
import com.ito.edito.schema.ReceiverInfo;
import com.ito.edito.schema.TrainingPlan;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Training_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Training<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class TrainingServiceBean extends CastorDataManager implements TrainingServiceRemote {

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertTrainingPlan(TrainingPlan trainingPlan, String userName) throws Exception, RemoteException {
		// 创建培训计划
		String trainingPlanUuid = DataManagerStatic.createInstance(trainingPlan, userName);

		// 接受者信息
		List<ReceiverInfo> receiverInfoList = trainingPlan.getReceiverInfosAsReference();
		for (int i = 0; i < receiverInfoList.size(); i++) {
			ReceiverInfo receiverInfo = receiverInfoList.get(i);
			receiverInfo.setBizDataUuid(trainingPlanUuid, false);
			DataManagerStatic.createInstance(receiverInfo, userName);
		}

		// 申请信息信息
		List<ApplyInfo> applyInfoList = trainingPlan.getApplyInfosAsReference();
		for (int i = 0; i < applyInfoList.size(); i++) {
			ApplyInfo applyInfo = applyInfoList.get(i);
			applyInfo.setBizDataUuid(trainingPlanUuid, false);
			DataManagerStatic.createInstance(applyInfo, userName);
		}

		return trainingPlanUuid;
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateTrainingPlan(TrainingPlan trainingPlan, String userName) throws Exception, RemoteException {
		// 接受者信息
		List<ReceiverInfo> receiverInfoList = trainingPlan.getReceiverInfosAsReference();
		for (int i = 0; i < receiverInfoList.size(); i++) {
			ReceiverInfo receiverInfo = receiverInfoList.get(i);
			if (receiverInfo.getOperationStatus().equals("0")) {
				receiverInfo.setBizDataUuid(trainingPlan.getUuid(), false);
				DataManagerStatic.createInstance(receiverInfo, userName);
			}
			else if (receiverInfo.getOperationStatus().equals("1")) {
				receiverInfo.setBizDataUuid(trainingPlan.getUuid(), false);
				DataManagerStatic.updateInstance(receiverInfo, userName);
			}
			else if (receiverInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(receiverInfo, userName);
			}
		}

		// 申请信息信息
		List<ApplyInfo> applyInfoList = trainingPlan.getApplyInfosAsReference();
		for (int i = 0; i < applyInfoList.size(); i++) {
			ApplyInfo applyInfo = applyInfoList.get(i);
			if (applyInfo.getOperationStatus().equals("0")) {
				applyInfo.setBizDataUuid(trainingPlan.getUuid(), false);
				DataManagerStatic.createInstance(applyInfo, userName);
			}
			else if (applyInfo.getOperationStatus().equals("1")) {
				applyInfo.setBizDataUuid(trainingPlan.getUuid(), false);
				DataManagerStatic.updateInstance(applyInfo, userName);
			}
			else if (applyInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(applyInfo, userName);
			}
		}

		// 更新培训计划
		DataManagerStatic.updateInstance(trainingPlan, userName);
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public TrainingPlan selectTrainingPlanByUuid(String uuid) throws Exception, RemoteException {
		// 查询培训计划(uuid)
		TrainingPlan trainingPlan = (TrainingPlan) DataManagerStatic.getInstance(uuid);

		// 查询工作经历
		Constraint receiverInfo = new Constraint("ReceiverInfo");
		receiverInfo.addCondition("bizDataUuid", trainingPlan.getUuid());
		trainingPlan.setReceiverInfos((List<ReceiverInfo>) DataManagerStatic.getInstances(receiverInfo));
		// 查询申请信息
		Constraint applyInfo = new Constraint("ApplyInfo");
		applyInfo.addCondition("bizDataUuid", trainingPlan.getUuid());
		trainingPlan.setApplyInfos((List<ApplyInfo>) DataManagerStatic.getInstances(applyInfo));

		return trainingPlan;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public TrainingPlan selectTrainingPlan(Constraint constraint) throws Exception, RemoteException {
		// 查询培训计划
		TrainingPlan trainingPlan = (TrainingPlan) DataManagerStatic.getInstance(constraint);

		if (trainingPlan != null) {
			// 查询工作经历
			Constraint receiverInfo = new Constraint("ReceiverInfo");
			receiverInfo.addCondition("bizDataUuid", trainingPlan.getUuid());
			trainingPlan.setReceiverInfos((List<ReceiverInfo>) DataManagerStatic.getInstances(receiverInfo));

			// 查询申请信息
			Constraint applyInfo = new Constraint("ApplyInfo");
			applyInfo.addCondition("bizDataUuid", trainingPlan.getUuid());
			trainingPlan.setApplyInfos((List<ApplyInfo>) DataManagerStatic.getInstances(applyInfo));
		}

		return trainingPlan;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<TrainingPlan> selectTrainingPlans(Constraint constraint) throws Exception, RemoteException {
		// 查询手术(list)
		List<TrainingPlan> trainingPlanTemp = (List<TrainingPlan>) DataManagerStatic.getInstances(constraint);
		List<TrainingPlan> trainingPlans = new ArrayList();
		for (int i = 0; i < trainingPlanTemp.size(); i++) {
			TrainingPlan trainingPlan = trainingPlanTemp.get(i);

			// 查询工作经历
			Constraint receiverInfo = new Constraint("ReceiverInfo");
			receiverInfo.addCondition("bizDataUuid", trainingPlan.getUuid());
			trainingPlan.setReceiverInfos((List<ReceiverInfo>) DataManagerStatic.getInstances(receiverInfo));

			// 查询申请信息
			Constraint applyInfo = new Constraint("ApplyInfo");
			applyInfo.addCondition("bizDataUuid", trainingPlan.getUuid());
			trainingPlan.setApplyInfos((List<ApplyInfo>) DataManagerStatic.getInstances(applyInfo));

			trainingPlans.add(trainingPlan);
		}

		return trainingPlans;
	}

	/**
	 * <b>查询接收者信息(list)</b>
	 * 
	 * @param constraint ReceiverInfo的约束条件
	 * @return 查询到的ReceiverInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ReceiverInfo> selectReceiverInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<ReceiverInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建申请信息</b>
	 * 
	 * @param applyInfo ApplyInfo对象
	 * @param userName 执行者的账户名
	 * @return 创建的ApplyInfo的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertApplyInfo(ApplyInfo applyInfo, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(applyInfo, userName);
	}

	/**
	 * <b>更新申请信息</b>
	 * 
	 * @param applyInfo ApplyInfo对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateApplyInfo(ApplyInfo applyInfo, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(applyInfo, userName);
	}

	/**
	 * <b>删除申请信息</b>
	 * 
	 * @param applyInfo ApplyInfo对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteApplyInfo(ApplyInfo applyInfo, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(applyInfo, userName);
	}

	/**
	 * <b>查询申请信息(uuid)</b>
	 * 
	 * @param uuid ApplyInfo的uuid
	 * @return 查询到的ApplyInfo
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ApplyInfo selectApplyInfoByUuid(String uuid) throws Exception, RemoteException {
		return (ApplyInfo) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询申请信息</b>
	 * 
	 * @param constraint ApplyInfo的约束条件
	 * @return 查询到的ApplyInfo
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ApplyInfo selectApplyInfo(Constraint constraint) throws Exception, RemoteException {
		return (ApplyInfo) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询申请信息(list)</b>
	 * 
	 * @param constraint ApplyInfo的约束条件
	 * @return 查询到的ApplyInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ApplyInfo> selectApplyInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<ApplyInfo>) DataManagerStatic.getInstances(constraint);
	}
}
