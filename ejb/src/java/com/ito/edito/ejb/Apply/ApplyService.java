package com.ito.edito.ejb.Apply;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Apply;
import com.ito.edito.schema.LeaveApplication;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.Quit;
import com.ito.edito.schema.Recruitment;
import com.ito.edito.schema.RegularApproval;
import com.ito.edito.schema.Relationship;
import com.ito.edito.schema.RegularApplication;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Apply_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
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

public interface ApplyService {
	/**
	 * <b>创建申请</b>
	 * 
	 * @param apply Apply对象
	 * @param userName 执行者的账户名
	 * @return 创建的Mistake的uuid
	 */
	public String insertApply(Apply apply, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新申请</b>
	 * 
	 * @param apply Apply对象
	 * @param userName 执行者的账户名
	 */
	public void updateApply(Apply apply, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除申请</b>
	 * 
	 * @param apply Apply对象
	 * @param userName 执行者的账户名
	 */
	public void deleteApply(Apply apply, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询申请(uuid)</b>
	 * 
	 * @param uuid Apply的uuid
	 * @return 查询到的Apply
	 */
	public Apply selectApplyByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询申请</b>
	 * 
	 * @param constraint Apply的约束条件
	 * @return 查询到的Apply
	 */
	public Apply selectApply(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询申请(list)</b>
	 * 
	 * @param constraint Apply的约束条件
	 * @return 查询到的Apply的list
	 */
	public List<Apply> selectApplys(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建招聘申请</b>
	 * 
	 * @param recruitment Recruitment对象
	 * @param userName 执行者的账户名
	 * @return 创建的Recruitment的uuid
	 */
	public String insertRecruitment(Recruitment recruitment, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新招聘申请</b>
	 * 
	 * @param recruitment Recruitment对象
	 * @param userName 执行者的账户名
	 */
	public void updateRecruitment(Recruitment recruitment, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除招聘申请</b>
	 * 
	 * @param recruitment Recruitment对象
	 * @param userName 执行者的账户名
	 */
	public void deleteRecruitment(Recruitment recruitment, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询招聘申请(uuid)</b>
	 * 
	 * @param uuid Recruitment的uuid
	 * @return 查询到的Recruitment
	 */
	public Recruitment selectRecruitmentByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询招聘申请</b>
	 * 
	 * @param constraint Recruitment的约束条件
	 * @return 查询到的Recruitment
	 */
	public Recruitment selectRecruitment(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询招聘申请(list)</b>
	 * 
	 * @param constraint Recruitment的约束条件
	 * @return 查询到的Recruitment的list
	 */
	public List<Recruitment> selectRecruitments(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建关系调整申请</b>
	 * 
	 * @param relationship Relationship对象
	 * @param userName 执行者的账户名
	 * @return 创建的Relationship的uuid
	 */
	public String insertRelationship(Relationship relationship, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新关系调整申请</b>
	 * 
	 * @param relationship Relationship对象
	 * @param userName 执行者的账户名
	 */
	public void updateRelationship(Relationship relationship, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除关系调整申请</b>
	 * 
	 * @param relationship Relationship对象
	 * @param userName 执行者的账户名
	 */
	public void deleteRelationship(Relationship relationship, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询关系调整申请(uuid)</b>
	 * 
	 * @param uuid Relationship的uuid
	 * @return 查询到的Relationship
	 */
	public Relationship selectRelationshipByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询关系调整申请</b>
	 * 
	 * @param constraint Relationship的约束条件
	 * @return 查询到的Relationship
	 */
	public Relationship selectRelationship(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询关系调整申请(list)</b>
	 * 
	 * @param constraint Relationship的约束条件
	 * @return 查询到的Relationship的list
	 */
	public List<Relationship> selectRelationships(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建离职申请</b>
	 * 
	 * @param quit Quit对象
	 * @param userName 执行者的账户名
	 * @return 创建的Quit的uuid
	 */
	public String insertQuit(Quit quit, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新离职申请</b>
	 * 
	 * @param quit Quit对象
	 * @param userName 执行者的账户名
	 */
	public void updateQuit(Quit quit, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除离职申请</b>
	 * 
	 * @param quit Quit对象
	 * @param userName 执行者的账户名
	 */
	public void deleteQuit(Quit quit, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询离职申请(uuid)</b>
	 * 
	 * @param uuid Quit的uuid
	 * @return 查询到的Quit
	 */
	public Quit selectQuitByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询离职申请</b>
	 * 
	 * @param constraint Quit的约束条件
	 * @return 查询到的Quit
	 */
	public Quit selectQuit(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询离职申请(list)</b>
	 * 
	 * @param constraint Quit的约束条件
	 * @return 查询到的Quit的list
	 */
	public List<Quit> selectQuits(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建请假申请</b>
	 * 
	 * @param leaveApplication LeaveApplication对象
	 * @param userName 执行者的账户名
	 * @return 创建的LeaveApplication的uuid
	 */
	public String insertLeaveApplication(LeaveApplication leaveApplication, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新请假申请</b>
	 * 
	 * @param leaveApplication Quit对象
	 * @param userName 执行者的账户名
	 */
	public void updateLeaveApplication(LeaveApplication leaveApplication, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除请假申请</b>
	 * 
	 * @param leaveApplication LeaveApplication对象
	 * @param userName 执行者的账户名
	 */
	public void deleteLeaveApplication(LeaveApplication leaveApplication, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询请假申请(uuid)</b>
	 * 
	 * @param uuid LeaveApplication的uuid
	 * @return 查询到的LeaveApplication
	 */
	public LeaveApplication selectLeaveApplicationByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询请假申请</b>
	 * 
	 * @param constraint LeaveApplication的约束条件
	 * @return 查询到的Quit
	 */
	public LeaveApplication selectLeaveApplication(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询请假申请(list)</b>
	 * 
	 * @param constraint LeaveApplication的约束条件
	 * @return 查询到的LeaveApplication的list
	 */
	public List<LeaveApplication> selectLeaveApplications(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建转正申请</b>
	 * 
	 * @param regularApplication RegularApplication对象
	 * @param userName 执行者的账户名
	 * @return 创建的RegularApplication的uuid
	 */
	public String insertRegularApplication(RegularApplication regularApplication, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新转正申请</b>
	 * 
	 * @param regularApplication RegularApplication对象
	 * @param userName 执行者的账户名
	 */
	public void updateRegularApplication(RegularApplication regularApplication, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除转正申请</b>
	 * 
	 * @param regularApplication RegularApplication对象
	 * @param userName 执行者的账户名
	 */
	public void deleteRegularApplication(RegularApplication regularApplication, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询转正申请(uuid)</b>
	 * 
	 * @param uuid RegularApplication的uuid
	 * @return 查询到的RegularApplication
	 */
	public RegularApplication selectRegularApplicationByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询转正申请</b>
	 * 
	 * @param constraint RegularApplication的约束条件
	 * @return 查询到的RegularApplication
	 */
	public RegularApplication selectRegularApplication(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询转正申请(list)</b>
	 * 
	 * @param constraint RegularApplication的约束条件
	 * @return 查询到的RegularApplication的list
	 */
	public List<RegularApplication> selectRegularApplications(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建转正申请的审批信息</b>
	 * 
	 * @param regularApproval RegularApproval对象
	 * @param userName 执行者的账户名
	 * @return 创建的RegularApproval的uuid
	 */
	public String insertRegularApproval(RegularApproval regularApproval, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新转正申请的审批信息</b>
	 * 
	 * @param regularApproval RegularApproval对象
	 * @param userName 执行者的账户名
	 */
	public void updateRegularApproval(RegularApproval regularApproval, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除转正申请的审批信息</b>
	 * 
	 * @param regularApproval RegularApproval对象
	 * @param userName 执行者的账户名
	 */
	public void deleteRegularApproval(RegularApproval regularApproval, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询转正申请的审批信息(uuid)</b>
	 * 
	 * @param uuid RegularApproval的uuid
	 * @return 查询到的RegularApproval
	 */
	public RegularApproval selectRegularApprovalByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询转正申请的审批信息</b>
	 * 
	 * @param constraint RegularApproval的约束条件
	 * @return 查询到的RegularApproval
	 */
	public RegularApproval selectRegularApproval(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询转正申请的审批信息(list)</b>
	 * 
	 * @param constraint RegularApproval的约束条件
	 * @return 查询到的RegularApproval的list
	 */
	public List<RegularApproval> selectRegularApprovals(Constraint constraint) throws Exception, RemoteException;
	
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
	public String insertPublicityApplication(PublicityApplication publicityApplication, String userName) throws Exception, RemoteException;

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
	public void updatePublicityApplication(PublicityApplication publicityApplication, String userName) throws Exception, RemoteException;

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
	public PublicityApplication selectPublicityApplicationByUuid(String uuid) throws Exception, RemoteException;

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
	public PublicityApplication selectPublicityApplication(Constraint constraint) throws Exception, RemoteException;

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
	public List<PublicityApplication> selectPublicityApplications(Constraint constraint) throws Exception, RemoteException;
}
