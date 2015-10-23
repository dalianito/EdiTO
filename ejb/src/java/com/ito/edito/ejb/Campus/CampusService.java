package com.ito.edito.ejb.Campus;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Campus;
import com.ito.edito.schema.Classroom;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.InterviewRecord;
import com.ito.edito.schema.LeaveType;
import com.ito.edito.schema.PosterInfo;
import com.ito.edito.schema.SelfAssess;
import com.ito.edito.schema.SelfAssessExamine;
import com.ito.edito.schema.WorkRecord;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Campus_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Campus<br>
 * WorkRecord<br>
 * InternetPublicity<br>
 * Classroom<br>
 * LeaveType<br>
 * SelfAssess<br>
 * SelfAssessExamine<br>
 * InterviewRecord<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

public interface CampusService {
	/**
	 * <b>创建校区信息</b>
	 * 
	 * @param campus Campus对象
	 * @param userName 执行者的账户名
	 * @return 创建的Campus的uuid
	 */
	public String insertCampus(Campus campus, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新校区信息</b>
	 * 
	 * @param campus Campus对象
	 * @param userName 执行者的账户名
	 */
	public void updateCampus(Campus campus, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询校区信息(uuid)</b>
	 * 
	 * @param uuid Campus的uuid
	 * @return 查询到的Campus
	 */
	public Campus selectCampusByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询校区信息</b>
	 * 
	 * @param constraint Campus的约束条件
	 * @return 查询到的Campus
	 */
	public Campus selectCampus(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询校区信息(list)</b>
	 * 
	 * @param constraint Campus的约束条件
	 * @return 查询到的Campus的list
	 */
	public List<Campus> selectCampuss(Constraint constraint) throws Exception, RemoteException;
	
	/**
	 * <b>创建工作日志</b>
	 * 
	 * @param workRecord WorkRecord对象
	 * @param userName 执行者的账户名
	 * @return 创建的WorkRecord的uuid
	 */
	public String insertWorkRecord(WorkRecord workRecord, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新工作日志</b>
	 * 
	 * @param workRecord WorkRecord对象
	 * @param userName 执行者的账户名
	 */
	public void updateWorkRecord(WorkRecord workRecord, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除工作日志</b>
	 * 
	 * @param workRecord WorkRecord对象
	 * @param userName 执行者的账户名
	 */
	public void deleteWorkRecord(WorkRecord workRecord, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询工作日志(uuid)</b>
	 * 
	 * @param uuid WorkRecord的uuid
	 * @return 查询到的WorkRecord
	 */
	public WorkRecord selectWorkRecordByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询工作日志</b>
	 * 
	 * @param constraint WorkRecord的约束条件
	 * @return 查询到的WorkRecord
	 */
	public WorkRecord selectWorkRecord(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询工作日志(list)</b>
	 * 
	 * @param constraint WorkRecord的约束条件
	 * @return 查询到的WorkRecord的list
	 */
	public List<WorkRecord> selectWorkRecords(Constraint constraint) throws Exception, RemoteException;

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
	public String insertInternetPublicity(InternetPublicity internetPublicity, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新网络宣传</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * posterInfo<br>
	 * 
	 * @param internetPublicity InternetPublicity对象
	 * @param userName 执行者的账户名
	 */
	public void updateInternetPublicity(InternetPublicity internetPublicity, String userName) throws Exception, RemoteException;

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
	public InternetPublicity selectInternetPublicityByUuid(String uuid) throws Exception, RemoteException;

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
	public InternetPublicity selectInternetPublicity(Constraint constraint) throws Exception, RemoteException;

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
	public List<InternetPublicity> selectInternetPublicitys(Constraint constraint) throws Exception, RemoteException;
	
	/**
	 * <b>查询过往宣传网站(list)</b>
	 * 
	 * @param constraint PosterInfo的约束条件
	 * @return 查询到的PosterInfo的list
	 */
	public List<PosterInfo> selectPosterInfos(Constraint constraint) throws Exception, RemoteException;
	
	/**
	 * <b>创建教室</b>
	 * 
	 * @param classroom Classroom对象
	 * @param userName 执行者的账户名
	 * @return 创建的Classroom的uuid
	 */
	public String insertClassroom(Classroom classroom, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新教室</b>
	 * 
	 * @param classroom Classroom对象
	 * @param userName 执行者的账户名
	 */
	public void updateClassroom(Classroom classroom, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除教室</b>
	 * 
	 * @param classroom Classroom对象
	 * @param userName 执行者的账户名
	 */
	public void deleteClassroom(Classroom classroom, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询教室(uuid)</b>
	 * 
	 * @param uuid Classroom的uuid
	 * @return 查询到的Classroom
	 */
	public Classroom selectClassroomByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询教室</b>
	 * 
	 * @param constraint Classroom的约束条件
	 * @return 查询到的Classroom
	 */
	public Classroom selectClassroom(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询教室(list)</b>
	 * 
	 * @param constraint Classroom的约束条件
	 * @return 查询到的Classroom的list
	 */
	public List<Classroom> selectClassrooms(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询请假类型(uuid)</b>
	 * 
	 * @param uuid LeaveType的uuid
	 * @return 查询到的LeaveType
	 */
	public LeaveType selectLeaveTypeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>创建月度自评</b>
	 * 
	 * @param selfAssess SelfAssess对象
	 * @param userName 执行者的账户名
	 * @return 创建的SelfAssess的uuid
	 */
	public String insertSelfAssess(SelfAssess selfAssess, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新月度自评</b>
	 * 
	 * @param selfAssess SelfAssess对象
	 * @param userName 执行者的账户名
	 */
	public void updateSelfAssess(SelfAssess selfAssess, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除月度自评</b>
	 * 
	 * @param selfAssess SelfAssess对象
	 * @param userName 执行者的账户名
	 */
	public void deleteSelfAssess(SelfAssess selfAssess, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询月度自评(uuid)</b>
	 * 
	 * @param uuid SelfAssess的uuid
	 * @return 查询到的SelfAssess
	 */
	public SelfAssess selectSelfAssessByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询月度自评</b>
	 * 
	 * @param constraint SelfAssess的约束条件
	 * @return 查询到的SelfAssess
	 */
	public SelfAssess selectSelfAssess(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询月度自评(list)</b>
	 * 
	 * @param constraint SelfAssess的约束条件
	 * @return 查询到的SelfAssess的list
	 */
	public List<SelfAssess> selectSelfAssesss(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建月度自评考核</b>
	 * 
	 * @param selfAssessExamine SelfAssessExamine对象
	 * @param userName 执行者的账户名
	 * @return 创建的SelfAssessExamine的uuid
	 */
	public String insertSelfAssessExamine(SelfAssessExamine selfAssessExamine, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新月度自评考核</b>
	 * 
	 * @param selfAssessExamine SelfAssessExamine对象
	 * @param userName 执行者的账户名
	 */
	public void updateSelfAssessExamine(SelfAssessExamine selfAssessExamine, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除月度自评考核</b>
	 * 
	 * @param selfAssessExamine SelfAssessExamine对象
	 * @param userName 执行者的账户名
	 */
	public void deleteSelfAssessExamine(SelfAssessExamine selfAssessExamine, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询月度自评考核(uuid)</b>
	 * 
	 * @param uuid SelfAssessExamine的uuid
	 * @return 查询到的SelfAssessExamine
	 */
	public SelfAssessExamine selectSelfAssessExamineByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询月度自评考核</b>
	 * 
	 * @param constraint SelfAssessExamine的约束条件
	 * @return 查询到的SelfAssessExamine
	 */
	public SelfAssessExamine selectSelfAssessExamine(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询月度自评考核(list)</b>
	 * 
	 * @param constraint SelfAssessExamine的约束条件
	 * @return 查询到的SelfAssessExamine的list
	 */
	public List<SelfAssessExamine> selectSelfAssessExamines(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建被面谈记录</b>
	 * 
	 * @param interviewRecord InterviewRecord对象
	 * @param userName 执行者的账户名
	 * @return 创建的InterviewRecord的uuid
	 */
	public String insertInterviewRecord(InterviewRecord interviewRecord, String userName) throws Exception, RemoteException;

	/**
	 * <b>编辑被面谈记录</b>
	 * 
	 * @param interviewRecord InterviewRecord对象
	 * @param userName 面谈人的账户名
	 */
	public void updateInterviewRecord(InterviewRecord interviewRecord, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询被面谈记录(uuid)</b>
	 * 
	 * @param uuid InterviewRecord的uuid
	 * @return 查询到的InterviewRecord
	 */
	public InterviewRecord selectInterviewRecordByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询被面谈记录</b>
	 * 
	 * @param constraint InterviewRecord的约束条件
	 * @return 查询到的InterviewRecord
	 */
	public InterviewRecord selectInterviewRecord(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询被面谈记录(list)</b>
	 * 
	 * @param constraint InterviewRecord的约束条件
	 * @return 查询到的InterviewRecord的list
	 */
	public List<InterviewRecord> selectInterviewRecords(Constraint constraint) throws Exception, RemoteException;
}
