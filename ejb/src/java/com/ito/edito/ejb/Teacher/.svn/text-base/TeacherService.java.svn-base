package com.ito.edito.ejb.Teacher;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.CurTeachingExpInfo;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Teacher_EJB的实现文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Teacher<br>
 * WorkExperienceInfo<br>
 * TeachingExperienceInfo<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

public interface TeacherService {
	/**
	 * <p>
	 * <b>创建教师</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * preTeachingExpInfo<br>
	 * curTeachingExpInfo<br>
	 * 
	 * @param teacher Teacher对象
	 * @param userName 执行者的账户名
	 * @return 创建的Teacher的uuid
	 */
	public String insertTeacher(Teacher teacher, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新教师</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * preTeachingExpInfo<br>
	 * curTeachingExpInfo<br>
	 * 
	 * @param teacher Teacher对象
	 * @param userName 执行者的账户名
	 */
	public void updateTeacher(Teacher teacher, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询教师(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Teacher中：<br>
	 * preTeachingExpInfo<br>
	 * curTeachingExpInfo<br>
	 * 
	 * @param uuid Teacher的uuid
	 * @return 查询到的Teacher
	 */
	public Teacher selectTeacherByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询教师</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Teacher中：<br>
	 * preTeachingExpInfo<br>
	 * curTeachingExpInfo<br>
	 * 
	 * @param constraint Teacher的约束条件
	 * @return 查询到的Teacher
	 */
	public Teacher selectTeacher(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询教师(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Teacher(list)中：<br>
	 * preTeachingExpInfo<br>
	 * curTeachingExpInfo<br>
	 * 
	 * @param constraint Teacher的约束条件
	 * @return 查询到的Teacher的list
	 */
	public List<Teacher> selectTeachers(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询过往授课经历(list)</b>
	 * 
	 * @param constraint PreTeachingExpInfo的约束条件
	 * @return 查询到的PreTeachingExpInfo的list
	 */
	public List<PreTeachingExpInfo> selectPreTeachingExpInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询当前授课经历(list)</b>
	 * 
	 * @param constraint CurTeachingExpInfo的约束条件
	 * @return 查询到的CurTeachingExpInfo的list
	 */
	public List<CurTeachingExpInfo> selectCurTeachingExpInfos(Constraint constraint) throws Exception, RemoteException;
}
