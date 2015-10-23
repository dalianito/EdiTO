package com.ito.edito.ejb.Apply;

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
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.ParticipatorInfo;
import com.ito.edito.schema.PreParticipatorInfo;
import com.ito.edito.schema.PropagandaMaterialInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.RegularApproval;
import com.ito.edito.schema.Relationship;
import com.ito.edito.schema.RegularApplication;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Apply_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Apply<br>
 * Recruitment<br>
 * Relationship<br>
 * Quit<br>
 * LeaveApplication<br>
 * PublicityApplication<br>
 * PreParticipatorInfo<br>
 * PropagandaMaterialInfo<br>
 * ParticipatorInfo<br>
 * RegularApplication<br>
 * RegularApproval<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class ApplyServiceBean extends CastorDataManager implements ApplyServiceRemote {
	/**
	 * <b>创建申请</b>
	 * 
	 * @param apply Apply对象
	 * @param userName 执行者的账户名
	 * @return 创建的Apply的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertApply(Apply apply, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(apply, userName);
	}

	/**
	 * <b>更新申请</b>
	 * 
	 * @param apply Apply对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateApply(Apply apply, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(apply, userName);
	}

	/**
	 * <b>删除申请</b>
	 * 
	 * @param apply Apply对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteApply(Apply apply, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(apply, userName);
	}

	/**
	 * <b>查询申请(uuid)</b>
	 * 
	 * @param uuid Apply的uuid
	 * @return 查询到的Apply
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Apply selectApplyByUuid(String uuid) throws Exception, RemoteException {
		return (Apply) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询申请</b>
	 * 
	 * @param constraint Apply的约束条件
	 * @return 查询到的Apply
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Apply selectApply(Constraint constraint) throws Exception, RemoteException {
		return (Apply) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询申请(list)</b>
	 * 
	 * @param constraint Apply的约束条件
	 * @return 查询到的Apply的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Apply> selectApplys(Constraint constraint) throws Exception, RemoteException {
		return (List<Apply>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建招聘申请</b>
	 * 
	 * @param recruitment Recruitment对象
	 * @param userName 执行者的账户名
	 * @return 创建的Recruitment的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertRecruitment(Recruitment recruitment, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(recruitment, userName);
	}

	/**
	 * <b>更新招聘申请</b>
	 * 
	 * @param recruitment Recruitment对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateRecruitment(Recruitment recruitment, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(recruitment, userName);
	}

	/**
	 * <b>删除招聘申请</b>
	 * 
	 * @param recruitment Recruitment对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteRecruitment(Recruitment recruitment, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(recruitment, userName);
	}

	/**
	 * <b>查询招聘申请(uuid)</b>
	 * 
	 * @param uuid Recruitment的uuid
	 * @return 查询到的Recruitment
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Recruitment selectRecruitmentByUuid(String uuid) throws Exception, RemoteException {
		return (Recruitment) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询招聘申请</b>
	 * 
	 * @param constraint Recruitment的约束条件
	 * @return 查询到的Recruitment
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Recruitment selectRecruitment(Constraint constraint) throws Exception, RemoteException {
		return (Recruitment) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询招聘申请(list)</b>
	 * 
	 * @param constraint Recruitment的约束条件
	 * @return 查询到的Recruitment的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Recruitment> selectRecruitments(Constraint constraint) throws Exception, RemoteException {
		return (List<Recruitment>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建关系调整申请</b>
	 * 
	 * @param relationship Relationship对象
	 * @param userName 执行者的账户名
	 * @return 创建的Relationship的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertRelationship(Relationship relationship, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(relationship, userName);
	}

	/**
	 * <b>更新关系调整申请</b>
	 * 
	 * @param relationship Relationship对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateRelationship(Relationship relationship, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(relationship, userName);
	}

	/**
	 * <b>删除关系调整申请</b>
	 * 
	 * @param relationship Relationship对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteRelationship(Relationship relationship, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(relationship, userName);
	}

	/**
	 * <b>查询关系调整申请(uuid)</b>
	 * 
	 * @param uuid Relationship的uuid
	 * @return 查询到的Relationship
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Relationship selectRelationshipByUuid(String uuid) throws Exception, RemoteException {
		return (Relationship) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询关系调整申请</b>
	 * 
	 * @param constraint Relationship的约束条件
	 * @return 查询到的Relationship
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Relationship selectRelationship(Constraint constraint) throws Exception, RemoteException {
		return (Relationship) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询关系调整申请(list)</b>
	 * 
	 * @param constraint Relationship的约束条件
	 * @return 查询到的Relationship的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Relationship> selectRelationships(Constraint constraint) throws Exception, RemoteException {
		return (List<Relationship>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建离职申请</b>
	 * 
	 * @param quit Quit对象
	 * @param userName 执行者的账户名
	 * @return 创建的Quit的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertQuit(Quit quit, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(quit, userName);
	}

	/**
	 * <b>更新离职申请</b>
	 * 
	 * @param quit Quit对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateQuit(Quit quit, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(quit, userName);
	}

	/**
	 * <b>删除离职申请</b>
	 * 
	 * @param quit Quit对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteQuit(Quit quit, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(quit, userName);
	}

	/**
	 * <b>查询离职申请(uuid)</b>
	 * 
	 * @param uuid Quit的uuid
	 * @return 查询到的Quit
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Quit selectQuitByUuid(String uuid) throws Exception, RemoteException {
		return (Quit) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询离职申请</b>
	 * 
	 * @param constraint Quit的约束条件
	 * @return 查询到的Quit
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Quit selectQuit(Constraint constraint) throws Exception, RemoteException {
		return (Quit) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询离职申请(list)</b>
	 * 
	 * @param constraint Quit的约束条件
	 * @return 查询到的Quit的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Quit> selectQuits(Constraint constraint) throws Exception, RemoteException {
		return (List<Quit>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建请假申请</b>
	 * 
	 * @param leaveApplication LeaveApplication对象
	 * @param userName 执行者的账户名
	 * @return 创建的LeaveApplication的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertLeaveApplication(LeaveApplication leaveApplication, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(leaveApplication, userName);
	}

	/**
	 * <b>更新请假申请</b>
	 * 
	 * @param leaveApplication Quit对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateLeaveApplication(LeaveApplication leaveApplication, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(leaveApplication, userName);
	}

	/**
	 * <b>删除请假申请</b>
	 * 
	 * @param leaveApplication LeaveApplication对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteLeaveApplication(LeaveApplication leaveApplication, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(leaveApplication, userName);
	}

	/**
	 * <b>查询请假申请(uuid)</b>
	 * 
	 * @param uuid LeaveApplication的uuid
	 * @return 查询到的LeaveApplication
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public LeaveApplication selectLeaveApplicationByUuid(String uuid) throws Exception, RemoteException {
		return (LeaveApplication) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询请假申请</b>
	 * 
	 * @param constraint LeaveApplication的约束条件
	 * @return 查询到的Quit
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public LeaveApplication selectLeaveApplication(Constraint constraint) throws Exception, RemoteException {
		return (LeaveApplication) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询请假申请(list)</b>
	 * 
	 * @param constraint LeaveApplication的约束条件
	 * @return 查询到的LeaveApplication的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<LeaveApplication> selectLeaveApplications(Constraint constraint) throws Exception, RemoteException {
		return (List<LeaveApplication>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建转正申请</b>
	 * 
	 * @param regularApplication RegularApplication对象
	 * @param userName 执行者的账户名
	 * @return 创建的RegularApplication的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertRegularApplication(RegularApplication regularApplication, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(regularApplication, userName);
	}

	/**
	 * <b>更新转正申请</b>
	 * 
	 * @param regularApplication RegularApplication对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateRegularApplication(RegularApplication regularApplication, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(regularApplication, userName);
	}

	/**
	 * <b>删除转正申请</b>
	 * 
	 * @param regularApplication RegularApplication对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteRegularApplication(RegularApplication regularApplication, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(regularApplication, userName);
	}

	/**
	 * <b>查询转正申请(uuid)</b>
	 * 
	 * @param uuid RegularApplication的uuid
	 * @return 查询到的RegularApplication
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public RegularApplication selectRegularApplicationByUuid(String uuid) throws Exception, RemoteException {
		return (RegularApplication) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询转正申请</b>
	 * 
	 * @param constraint RegularApplication的约束条件
	 * @return 查询到的RegularApplication
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public RegularApplication selectRegularApplication(Constraint constraint) throws Exception, RemoteException {
		return (RegularApplication) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询转正申请(list)</b>
	 * 
	 * @param constraint RegularApplication的约束条件
	 * @return 查询到的RegularApplication的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<RegularApplication> selectRegularApplications(Constraint constraint) throws Exception, RemoteException {
		return (List<RegularApplication>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建转正申请</b>
	 * 
	 * @param regularApproval RegularApproval对象
	 * @param userName 执行者的账户名
	 * @return 创建的regularApproval的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertRegularApproval(RegularApproval regularApproval, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(regularApproval, userName);
	}

	/**
	 * <b>更新转正申请</b>
	 * 
	 * @param regularApproval RegularApproval对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateRegularApproval(RegularApproval regularApproval, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(regularApproval, userName);
	}

	/**
	 * <b>删除转正申请审批信息</b>
	 * 
	 * @param regularApproval RegularApproval对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteRegularApproval(RegularApproval regularApproval, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(regularApproval, userName);
	}

	/**
	 * <b>查询转正申请审批信息(uuid)</b>
	 * 
	 * @param uuid RegularApproval的uuid
	 * @return 查询到的RegularApproval
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public RegularApproval selectRegularApprovalByUuid(String uuid) throws Exception, RemoteException {
		return (RegularApproval) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询转正申请的审批信息</b>
	 * 
	 * @param constraint RegularApproval的约束条件
	 * @return 查询到的RegularApproval
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public RegularApproval selectRegularApproval(Constraint constraint) throws Exception, RemoteException {
		return (RegularApproval) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询转正申请审批信息(list)</b>
	 * 
	 * @param constraint RegularApproval的约束条件
	 * @return 查询到的RegularApproval的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<RegularApproval> selectRegularApprovals(Constraint constraint) throws Exception, RemoteException {
		return (List<RegularApproval>) DataManagerStatic.getInstances(constraint);
	}
	
	/**
	 * <p>
	 * <b>创建市场活动申请</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * preParticipator<br>
	 * material<br>
	 * participator<br>
	 * 
	 * @param publicityApplication PublicityApplication对象
	 * @param userName 执行者的账户名
	 * @return 创建的PublicityApplication的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPublicityApplication(PublicityApplication publicityApplication, String userName) throws Exception, RemoteException {
		// 创建市场活动申请
		String publicityApplicationUuid = DataManagerStatic.createInstance(publicityApplication, userName);

		// 创建预参与人员信息
		List<PreParticipatorInfo> preParticipatorInfoList = publicityApplication.getPreParticipatorsAsReference();
		for (int i = 0; i < preParticipatorInfoList.size(); i++) {
			PreParticipatorInfo preParticipatorInfo = preParticipatorInfoList.get(i);
			preParticipatorInfo.setBizDataUuid(publicityApplicationUuid, false);
			DataManagerStatic.createInstance(preParticipatorInfo, userName);
		}

		// 创建宣传品信息
		List<PropagandaMaterialInfo> propagandaMaterialInfoList = publicityApplication.getMaterialsAsReference();
		for (int i = 0; i < propagandaMaterialInfoList.size(); i++) {
			PropagandaMaterialInfo propagandaMaterialInfo = propagandaMaterialInfoList.get(i);
			propagandaMaterialInfo.setBizDataUuid(publicityApplicationUuid, false);
			DataManagerStatic.createInstance(propagandaMaterialInfo, userName);
		}

		// 创建参与人员信息
		List<ParticipatorInfo> participatorList = publicityApplication.getParticipatorsAsReference();
		for (int i = 0; i < participatorList.size(); i++) {
			ParticipatorInfo participatorInfo = participatorList.get(i);
			participatorInfo.setBizDataUuid(publicityApplicationUuid, false);
			DataManagerStatic.createInstance(participatorInfo, userName);
		}

		return publicityApplicationUuid;
	}

	/**
	 * <p>
	 * <b>更新市场活动申请</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * preParticipator<br>
	 * material<br>
	 * participator<br>
	 * 
	 * @param publicityApplication PublicityApplication对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updatePublicityApplication(PublicityApplication publicityApplication, String userName) throws Exception, RemoteException {
		// 更新预参与人员信息
		List<PreParticipatorInfo> preParticipatorInfoList = publicityApplication.getPreParticipatorsAsReference();
		for (int i = 0; i < preParticipatorInfoList.size(); i++) {
			PreParticipatorInfo preParticipatorInfo = preParticipatorInfoList.get(i);
			if (preParticipatorInfo.getOperationStatus().equals("0")) {
				preParticipatorInfo.setBizDataUuid(publicityApplication.getUuid(), false);
				DataManagerStatic.createInstance(preParticipatorInfo, userName);
			}
			else if (preParticipatorInfo.getOperationStatus().equals("1")) {
				preParticipatorInfo.setBizDataUuid(publicityApplication.getUuid(), false);
				DataManagerStatic.updateInstance(preParticipatorInfo, userName);
			}
			else if (preParticipatorInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(preParticipatorInfo, userName);
			}
		}

		// 更新宣传品信息
		List<PropagandaMaterialInfo> propagandaMaterialInfoList = publicityApplication.getMaterialsAsReference();
		for (int i = 0; i < propagandaMaterialInfoList.size(); i++) {
			PropagandaMaterialInfo propagandaMaterialInfo = propagandaMaterialInfoList.get(i);
			if (propagandaMaterialInfo.getOperationStatus().equals("0")) {
				propagandaMaterialInfo.setBizDataUuid(publicityApplication.getUuid(), false);
				DataManagerStatic.createInstance(propagandaMaterialInfo, userName);
			}
			else if (propagandaMaterialInfo.getOperationStatus().equals("1")) {
				propagandaMaterialInfo.setBizDataUuid(publicityApplication.getUuid(), false);
				DataManagerStatic.updateInstance(propagandaMaterialInfo, userName);
			}
			else if (propagandaMaterialInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(propagandaMaterialInfo, userName);
			}
		}

		// 更新参与人员信息
		List<ParticipatorInfo> participatorList = publicityApplication.getParticipatorsAsReference();
		for (int i = 0; i < participatorList.size(); i++) {
			ParticipatorInfo participatorInfo = participatorList.get(i);
			if (participatorInfo.getOperationStatus().equals("0")) {
				participatorInfo.setBizDataUuid(publicityApplication.getUuid(), false);
				DataManagerStatic.createInstance(participatorInfo, userName);
			}
			else if (participatorInfo.getOperationStatus().equals("1")) {
				participatorInfo.setBizDataUuid(publicityApplication.getUuid(), false);
				DataManagerStatic.updateInstance(participatorInfo, userName);
			}
			else if (participatorInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(participatorInfo, userName);
			}
		}

		// 更新市场活动申请
		DataManagerStatic.updateInstance(publicityApplication, userName);
	}

	/**
	 * <p>
	 * <b>查询市场活动申请(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入PublicityApplication中：<br>
	 * preParticipator<br>
	 * material<br>
	 * participator<br>
	 * 
	 * @param uuid PublicityApplication的uuid
	 * @return 查询到的PublicityApplication
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PublicityApplication selectPublicityApplicationByUuid(String uuid) throws Exception, RemoteException {
		// 查询市场活动申请(uuid)
		PublicityApplication publicityApplication = (PublicityApplication) DataManagerStatic.getInstance(uuid);

		// 查询预参与人员信息
		Constraint preParticipatorInfo = new Constraint("PreParticipatorInfo");
		preParticipatorInfo.addCondition("bizDataUuid", uuid);
		publicityApplication.setPreParticipators((List<PreParticipatorInfo>) DataManagerStatic.getInstances(preParticipatorInfo));

		// 查询宣传品信息
		Constraint propagandaMaterialInfo = new Constraint("PropagandaMaterialInfo");
		propagandaMaterialInfo.addCondition("bizDataUuid", uuid);
		publicityApplication.setMaterials((List<PropagandaMaterialInfo>) DataManagerStatic.getInstances(propagandaMaterialInfo));

		// 查询参与人员信息
		Constraint participatorInfo = new Constraint("ParticipatorInfo");
		participatorInfo.addCondition("bizDataUuid", uuid);
		publicityApplication.setParticipators((List<ParticipatorInfo>) DataManagerStatic.getInstances(participatorInfo));

		return publicityApplication;
	}

	/**
	 * <p>
	 * <b>查询市场活动申请</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入PublicityApplication中：<br>
	 * preParticipator<br>
	 * material<br>
	 * participator<br>
	 * 
	 * @param constraint PublicityApplication的约束条件
	 * @return 查询到的PublicityApplication
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PublicityApplication selectPublicityApplication(Constraint constraint) throws Exception, RemoteException {
		// 查询市场活动申请
		PublicityApplication publicityApplication = (PublicityApplication) DataManagerStatic.getInstance(constraint);

		// 查询预参与人员信息
		Constraint preParticipatorInfo = new Constraint("PreParticipatorInfo");
		preParticipatorInfo.addCondition("bizDataUuid", publicityApplication.getUuid());
		publicityApplication.setPreParticipators((List<PreParticipatorInfo>) DataManagerStatic.getInstances(preParticipatorInfo));

		// 查询宣传品信息
		Constraint propagandaMaterialInfo = new Constraint("PropagandaMaterialInfo");
		propagandaMaterialInfo.addCondition("bizDataUuid", publicityApplication.getUuid());
		publicityApplication.setMaterials((List<PropagandaMaterialInfo>) DataManagerStatic.getInstances(propagandaMaterialInfo));

		// 查询参与人员信息
		Constraint participatorInfo = new Constraint("ParticipatorInfo");
		participatorInfo.addCondition("bizDataUuid", publicityApplication.getUuid());
		publicityApplication.setParticipators((List<ParticipatorInfo>) DataManagerStatic.getInstances(participatorInfo));

		return publicityApplication;
	}

	/**
	 * <p>
	 * <b>查询市场活动申请(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入PublicityApplication(list)中：<br>
	 * preParticipator<br>
	 * material<br>
	 * participator<br>
	 * 
	 * @param constraint PublicityApplication的约束条件
	 * @return 查询到的PublicityApplication的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PublicityApplication> selectPublicityApplications(Constraint constraint) throws Exception, RemoteException {
		// 查询市场活动申请(list)
		List<PublicityApplication> publicityApplicationsTemp = (List<PublicityApplication>) DataManagerStatic.getInstances(constraint);
		List<PublicityApplication> publicityApplications = new ArrayList();
		for (int i = 0; i < publicityApplicationsTemp.size(); i++) {
			PublicityApplication publicityApplication = publicityApplicationsTemp.get(i);

			// 查询预参与人员信息
			Constraint preParticipatorInfo = new Constraint("PreParticipatorInfo");
			preParticipatorInfo.addCondition("bizDataUuid", publicityApplication.getUuid());
			publicityApplication.setPreParticipators((List<PreParticipatorInfo>) DataManagerStatic.getInstances(preParticipatorInfo));

			// 查询宣传品信息
			Constraint propagandaMaterialInfo = new Constraint("PropagandaMaterialInfo");
			propagandaMaterialInfo.addCondition("bizDataUuid", publicityApplication.getUuid());
			publicityApplication.setMaterials((List<PropagandaMaterialInfo>) DataManagerStatic.getInstances(propagandaMaterialInfo));

			// 查询参与人员信息
			Constraint participatorInfo = new Constraint("ParticipatorInfo");
			participatorInfo.addCondition("bizDataUuid", publicityApplication.getUuid());
			publicityApplication.setParticipators((List<ParticipatorInfo>) DataManagerStatic.getInstances(participatorInfo));

			publicityApplications.add(publicityApplication);
		}

		return publicityApplications;
	}
}
