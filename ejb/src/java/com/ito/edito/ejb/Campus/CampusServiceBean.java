package com.ito.edito.ejb.Campus;

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
import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Classroom;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.InterviewRecord;
import com.ito.edito.schema.LeaveType;
import com.ito.edito.schema.PosterInfo;
import com.ito.edito.schema.SelfAssess;
import com.ito.edito.schema.SelfAssessExamine;
import com.ito.edito.schema.WorkRecord;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Campus_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Campus<br>
 * WorkRecord<br>
 * InternetPublicity<br>
 * Classroom<br>
 * LeaveType<br>
 * SelfAssess<br>
 * InterviewRecord<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class CampusServiceBean extends CastorDataManager implements CampusServiceRemote {
	/**
	 * <b>创建校区信息</b>
	 * 
	 * @param campus Campus对象
	 * @param userName 执行者的账户名
	 * @return 创建的Campus的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertCampus(Campus campus, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(campus, userName);
	}

	/**
	 * <b>更新校区信息</b>
	 * 
	 * @param campus Campus对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateCampus(Campus campus, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(campus, userName);
	}

	/**
	 * <b>查询校区信息(uuid)</b>
	 * 
	 * @param uuid Campus的uuid
	 * @return 查询到的Campus
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Campus selectCampusByUuid(String uuid) throws Exception, RemoteException {
		return (Campus) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询校区信息</b>
	 * 
	 * @param constraint Campus的约束条件
	 * @return 查询到的Campus
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Campus selectCampus(Constraint constraint) throws Exception, RemoteException {
		return (Campus) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询校区信息(list)</b>
	 * 
	 * @param constraint Campus的约束条件
	 * @return 查询到的Campus的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Campus> selectCampuss(Constraint constraint) throws Exception, RemoteException {
		return (List<Campus>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建工作日志</b>
	 * 
	 * @param workRecord WorkRecord对象
	 * @param userName 执行者的账户名
	 * @return 创建的WorkRecord的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertWorkRecord(WorkRecord workRecord, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(workRecord, userName);
	}

	/**
	 * <b>更新工作日志</b>
	 * 
	 * @param workRecord WorkRecord对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateWorkRecord(WorkRecord workRecord, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(workRecord, userName);
	}

	/**
	 * <b>删除工作日志</b>
	 * 
	 * @param workRecord WorkRecord对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteWorkRecord(WorkRecord workRecord, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(workRecord, userName);
	}

	/**
	 * <b>查询工作日志(uuid)</b>
	 * 
	 * @param uuid WorkRecord的uuid
	 * @return 查询到的WorkRecord
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public WorkRecord selectWorkRecordByUuid(String uuid) throws Exception, RemoteException {
		return (WorkRecord) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询工作日志</b>
	 * 
	 * @param constraint WorkRecord的约束条件
	 * @return 查询到的WorkRecord
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public WorkRecord selectWorkRecord(Constraint constraint) throws Exception, RemoteException {
		return (WorkRecord) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询工作日志(list)</b>
	 * 
	 * @param constraint WorkRecord的约束条件
	 * @return 查询到的WorkRecord的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<WorkRecord> selectWorkRecords(Constraint constraint) throws Exception, RemoteException {
		return (List<WorkRecord>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建月度自评</b>
	 * 
	 * @param selfAssess SelfAssess对象
	 * @param userName 执行者的账户名
	 * @return 创建的SelfAssess的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertSelfAssess(SelfAssess selfAssess, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(selfAssess, userName);
	}

	/**
	 * <b>更新月度自评</b>
	 * 
	 * @param selfAssess SelfAssess对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateSelfAssess(SelfAssess selfAssess, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(selfAssess, userName);
	}

	/**
	 * <b>删除月度自评</b>
	 * 
	 * @param selfAssess SelfAssess对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteSelfAssess(SelfAssess selfAssess, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(selfAssess, userName);
	}

	/**
	 * <b>查询月度自评(uuid)</b>
	 * 
	 * @param uuid SelfAssess的uuid
	 * @return 查询到的SelfAssess
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public SelfAssess selectSelfAssessByUuid(String uuid) throws Exception, RemoteException {
		return (SelfAssess) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询月度自评</b>
	 * 
	 * @param constraint SelfAssess的约束条件
	 * @return 查询到的SelfAssess
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public SelfAssess selectSelfAssess(Constraint constraint) throws Exception, RemoteException {
		return (SelfAssess) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询月度自评(list)</b>
	 * 
	 * @param constraint SelfAssess的约束条件
	 * @return 查询到的SelfAssess的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<SelfAssess> selectSelfAssesss(Constraint constraint) throws Exception, RemoteException {
		return (List<SelfAssess>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建月度自评考核</b>
	 * 
	 * @param selfAssessExamine SelfAssessExamine对象
	 * @param userName 执行者的账户名
	 * @return 创建的SelfAssessExamine的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertSelfAssessExamine(SelfAssessExamine selfAssessExamine, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(selfAssessExamine, userName);
	}

	/**
	 * <b>更新月度自评考核</b>
	 * 
	 * @param selfAssessExamine SelfAssessExamine对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateSelfAssessExamine(SelfAssessExamine selfAssessExamine, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(selfAssessExamine, userName);
	}

	/**
	 * <b>删除月度自评考核</b>
	 * 
	 * @param selfAssessExamine SelfAssessExamine对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteSelfAssessExamine(SelfAssessExamine selfAssessExamine, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(selfAssessExamine, userName);
	}

	/**
	 * <b>查询月度自评考核(uuid)</b>
	 * 
	 * @param uuid SelfAssessExamine的uuid
	 * @return 查询到的SelfAssessExamine
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public SelfAssessExamine selectSelfAssessExamineByUuid(String uuid) throws Exception, RemoteException {
		return (SelfAssessExamine) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询月度自评考核</b>
	 * 
	 * @param constraint SelfAssessExamine的约束条件
	 * @return 查询到的SelfAssessExamine
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public SelfAssessExamine selectSelfAssessExamine(Constraint constraint) throws Exception, RemoteException {
		return (SelfAssessExamine) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询月度自评考核(list)</b>
	 * 
	 * @param constraint SelfAssessExamine的约束条件
	 * @return 查询到的SelfAssessExamine的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<SelfAssessExamine> selectSelfAssessExamines(Constraint constraint) throws Exception, RemoteException {
		return (List<SelfAssessExamine>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <p>
	 * <b>创建网络宣传</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * posterInfo<br>
	 * 
	 * @param internetPublicity InternetPublicity对象
	 * @param userName 执行者的账户名
	 * @return 创建的InternetPublicity的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertInternetPublicity(InternetPublicity internetPublicity, String userName) throws Exception, RemoteException {
		// 创建网络宣传
		String internetPublicityUuid = DataManagerStatic.createInstance(internetPublicity, userName);

		// 发帖信息
		List<PosterInfo> posterInfoList = internetPublicity.getPosterInfosAsReference();
		for (int i = 0; i < posterInfoList.size(); i++) {
			PosterInfo posterInfo = posterInfoList.get(i);
			posterInfo.setBizDataUuid(internetPublicityUuid, false);
			DataManagerStatic.createInstance(posterInfo, userName);
		}

		return internetPublicityUuid;
	}

	/**
	 * <p>
	 * <b>更新网络宣传</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * PosterInfo<br>
	 * 
	 * @param internetPublicity InternetPublicity对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateInternetPublicity(InternetPublicity internetPublicity, String userName) throws Exception, RemoteException {
		// 发帖信息
		List<PosterInfo> posterInfoList = internetPublicity.getPosterInfosAsReference();
		for (int i = 0; i < posterInfoList.size(); i++) {
			PosterInfo posterInfo = posterInfoList.get(i);
			if (posterInfo.getOperationStatus().equals("0")) {
				posterInfo.setBizDataUuid(internetPublicity.getUuid(), false);
				DataManagerStatic.createInstance(posterInfo, userName);
			}
			else if (posterInfo.getOperationStatus().equals("1")) {
				posterInfo.setBizDataUuid(internetPublicity.getUuid(), false);
				DataManagerStatic.updateInstance(posterInfo, userName);
			}
			else if (posterInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(posterInfo, userName);
			}
		}

		// 更新网络宣传
		DataManagerStatic.updateInstance(internetPublicity, userName);
	}

	/**
	 * <p>
	 * <b>查询网络宣传(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入InternetPublicity中：<br>
	 * posterInfo<br>
	 * 
	 * @param uuid InternetPublicity的uuid
	 * @return 查询到的InternetPublicity
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public InternetPublicity selectInternetPublicityByUuid(String uuid) throws Exception, RemoteException {
		// 查询网络宣传(uuid)
		InternetPublicity internetPublicity = (InternetPublicity) DataManagerStatic.getInstance(uuid);

		// 查询发帖信息
		Constraint posterInfo = new Constraint("PosterInfo");
		posterInfo.addCondition("bizDataUuid", internetPublicity.getUuid());
		internetPublicity.setPosterInfos((List<PosterInfo>) DataManagerStatic.getInstances(posterInfo));

		return internetPublicity;
	}

	/**
	 * <p>
	 * <b>查询网络宣传</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入InternetPublicity中：<br>
	 * posterInfo<br>
	 * 
	 * @param constraint InternetPublicity的约束条件
	 * @return 查询到的InternetPublicity
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public InternetPublicity selectInternetPublicity(Constraint constraint) throws Exception, RemoteException {
		// 查询网络宣传
		InternetPublicity internetPublicity = (InternetPublicity) DataManagerStatic.getInstance(constraint);

		if (internetPublicity != null) {
			// 查询发帖信息
			Constraint posterInfo = new Constraint("PosterInfo");
			posterInfo.addCondition("bizDataUuid", internetPublicity.getUuid());
			internetPublicity.setPosterInfos((List<PosterInfo>) DataManagerStatic.getInstances(posterInfo));
		}

		return internetPublicity;
	}

	/**
	 * <p>
	 * <b>查询网络宣传(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入InternetPublicity(list)中：<br>
	 * posterInfo<br>
	 * 
	 * @param constraint InternetPublicity的约束条件
	 * @return 查询到的InternetPublicity的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<InternetPublicity> selectInternetPublicitys(Constraint constraint) throws Exception, RemoteException {
		// 查询网络宣传(list)
		List<InternetPublicity> internetPublicityTemp = (List<InternetPublicity>) DataManagerStatic.getInstances(constraint);
		List<InternetPublicity> internetPublicitys = new ArrayList();
		for (int i = 0; i < internetPublicityTemp.size(); i++) {
			InternetPublicity internetPublicity = internetPublicityTemp.get(i);

			// 查询发帖信息
			Constraint posterInfo = new Constraint("PosterInfo");
			posterInfo.addCondition("bizDataUuid", internetPublicity.getUuid());
			internetPublicity.setPosterInfos((List<PosterInfo>) DataManagerStatic.getInstances(posterInfo));

			internetPublicitys.add(internetPublicity);
		}

		return internetPublicitys;
	}

	/**
	 * <b>查询过往宣传网站(list)</b>
	 * 
	 * @param constraint PosterInfo的约束条件
	 * @return 查询到的PosterInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PosterInfo> selectPosterInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<PosterInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建教室</b>
	 * 
	 * @param classroom Classroom对象
	 * @param userName 执行者的账户名
	 * @return 创建的Classroom的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertClassroom(Classroom classroom, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(classroom, userName);
	}

	/**
	 * <b>更新教室</b>
	 * 
	 * @param classroom Classroom对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateClassroom(Classroom classroom, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(classroom, userName);
	}

	/**
	 * <b>删除教室</b>
	 * 
	 * @param classroom Classroom对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteClassroom(Classroom classroom, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(classroom, userName);
	}

	/**
	 * <b>查询教室(uuid)</b>
	 * 
	 * @param uuid Classroom的uuid
	 * @return 查询到的Classroom
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Classroom selectClassroomByUuid(String uuid) throws Exception, RemoteException {
		return (Classroom) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询教室</b>
	 * 
	 * @param constraint Classroom的约束条件
	 * @return 查询到的Classroom
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Classroom selectClassroom(Constraint constraint) throws Exception, RemoteException {
		return (Classroom) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询教室(list)</b>
	 * 
	 * @param constraint Classroom的约束条件
	 * @return 查询到的Classroom的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Classroom> selectClassrooms(Constraint constraint) throws Exception, RemoteException {
		return (List<Classroom>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询请假类型(uuid)</b>
	 * 
	 * @param uuid LeaveType的uuid
	 * @return 查询到的LeaveType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public LeaveType selectLeaveTypeByUuid(String uuid) throws Exception, RemoteException {
		return (LeaveType) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>创建被面谈记录</b>
	 * 
	 * @param interviewRecord InterviewRecord对象
	 * @param userName 执行者的账户名
	 * @return 创建的InterviewRecord的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertInterviewRecord(InterviewRecord interviewRecord, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(interviewRecord, userName);
	}

	/**
	 * <b>更新被面谈记录</b>
	 * 
	 * @param interviewRecord InterviewRecord对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateInterviewRecord(InterviewRecord interviewRecord, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(interviewRecord, userName);

	}

	/**
	 * <b>查询被面谈记录(uuid)</b>
	 * 
	 * @param uuid InterviewRecord的uuid
	 * @return 查询到的InterviewRecord
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public InterviewRecord selectInterviewRecordByUuid(String uuid) throws Exception, RemoteException {
		return (InterviewRecord) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询被面谈记录</b>
	 * 
	 * @param constraint InterviewRecord的约束条件
	 * @return 查询到的InterviewRecord
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public InterviewRecord selectInterviewRecord(Constraint constraint) throws Exception, RemoteException {
		return (InterviewRecord) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询被面谈记录(list)</b>
	 * 
	 * @param constraint InterviewRecord的约束条件
	 * @return 查询到的InterviewRecord的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<InterviewRecord> selectInterviewRecords(Constraint constraint) throws Exception, RemoteException {
		return (List<InterviewRecord>) DataManagerStatic.getInstances(constraint);
	}
}
