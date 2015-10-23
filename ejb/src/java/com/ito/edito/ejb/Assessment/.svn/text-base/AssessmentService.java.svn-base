package com.ito.edito.ejb.Assessment;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Assessment;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Assessment_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Assessment<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

public interface AssessmentService {
	/**
	 * <b>创建差错</b>
	 * 
	 * @param Assessment Assessment对象
	 * @param userName 执行者的账户名
	 * @return 创建的Assessment的uuid
	 */
	public String insertAssessment(Assessment Assessment, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新差错</b>
	 * 
	 * @param Assessment Assessment对象
	 * @param userName 执行者的账户名
	 */
	public void updateAssessment(Assessment Assessment, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除差错</b>
	 * 
	 * @param Assessment Assessment对象
	 * @param userName 执行者的账户名
	 */
	public void deleteAssessment(Assessment Assessment, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询差错(uuid)</b>
	 * 
	 * @param uuid Assessment的uuid
	 * @return 查询到的Assessment
	 */
	public Assessment selectAssessmentByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询差错</b>
	 * 
	 * @param constraint Assessment的约束条件
	 * @return 查询到的Assessment
	 */
	public Assessment selectAssessment(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询差错(list)</b>
	 * 
	 * @param constraint Assessment的约束条件
	 * @return 查询到的Assessment的list
	 */
	public List<Assessment> selectAssessments(Constraint constraint) throws Exception, RemoteException;

}
