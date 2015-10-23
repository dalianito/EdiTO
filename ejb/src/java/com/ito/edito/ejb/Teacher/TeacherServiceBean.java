package com.ito.edito.ejb.Teacher;

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
import com.ito.edito.schema.CurTeachingExpInfo;
import com.ito.edito.schema.PreTeachingExpInfo;
import com.ito.edito.schema.Teacher;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Teacher_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Teacher<br>
 * PreTeachingExpInfo<br>
 * CurTeachingExpInfo<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class TeacherServiceBean extends CastorDataManager implements TeacherServiceRemote {
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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertTeacher(Teacher teacher, String userName) throws Exception, RemoteException {
		// 创建教师
		String teacherUuid = DataManagerStatic.createInstance(teacher, userName);

		// 创建过往授课经历
		List<PreTeachingExpInfo> preTeachingExpInfoList = teacher.getPreTeachingExpInfosAsReference();
		for (int i = 0; i < preTeachingExpInfoList.size(); i++) {
			PreTeachingExpInfo preTeachingExpInfo = preTeachingExpInfoList.get(i);
			preTeachingExpInfo.setBizDataUuid(teacherUuid, false);
			DataManagerStatic.createInstance(preTeachingExpInfo, userName);
		}

		// 创建当前当前授课经历
		List<CurTeachingExpInfo> curTeachingExpInfoList = teacher.getCurTeachingExpInfosAsReference();
		for (int i = 0; i < curTeachingExpInfoList.size(); i++) {
			CurTeachingExpInfo curTeachingExpInfo = curTeachingExpInfoList.get(i);
			curTeachingExpInfo.setBizDataUuid(teacherUuid, false);
			DataManagerStatic.createInstance(curTeachingExpInfo, userName);
		}

		return teacherUuid;
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateTeacher(Teacher teacher, String userName) throws Exception, RemoteException {
		// 更新过往授课经历
		List<PreTeachingExpInfo> preTeachingExpInfoList = teacher.getPreTeachingExpInfosAsReference();
		for (int i = 0; i < preTeachingExpInfoList.size(); i++) {
			PreTeachingExpInfo preTeachingExpInfo = preTeachingExpInfoList.get(i);
			if (preTeachingExpInfo.getOperationStatus().equals("0")) {
				preTeachingExpInfo.setBizDataUuid(teacher.getUuid(), false);
				DataManagerStatic.createInstance(preTeachingExpInfo, userName);
			}
			else if (preTeachingExpInfo.getOperationStatus().equals("1")) {
				preTeachingExpInfo.setBizDataUuid(teacher.getUuid(), false);
				DataManagerStatic.updateInstance(preTeachingExpInfo, userName);
			}
			else if (preTeachingExpInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(preTeachingExpInfo, userName);
			}
		}

		// 更新当前授课经历
		List<CurTeachingExpInfo> curTeachingExpInfoList = teacher.getCurTeachingExpInfosAsReference();
		for (int i = 0; i < curTeachingExpInfoList.size(); i++) {
			CurTeachingExpInfo curTeachingExpInfo = curTeachingExpInfoList.get(i);
			if (curTeachingExpInfo.getOperationStatus().equals("0")) {
				curTeachingExpInfo.setBizDataUuid(teacher.getUuid(), false);
				DataManagerStatic.createInstance(curTeachingExpInfo, userName);
			}
			else if (curTeachingExpInfo.getOperationStatus().equals("1")) {
				curTeachingExpInfo.setBizDataUuid(teacher.getUuid(), false);
				DataManagerStatic.updateInstance(curTeachingExpInfo, userName);
			}
			else if (curTeachingExpInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(curTeachingExpInfo, userName);
			}
		}

		// 更新教师
		DataManagerStatic.updateInstance(teacher, userName);
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Teacher selectTeacherByUuid(String uuid) throws Exception, RemoteException {
		// 查询教师(uuid)
		Teacher teacher = (Teacher) DataManagerStatic.getInstance(uuid);

		// 查询过往授课经历
		Constraint preTeachingExpInfo = new Constraint("PreTeachingExpInfo");
		preTeachingExpInfo.addCondition("bizDataUuid", teacher.getUuid());
		teacher.setPreTeachingExpInfos((List<PreTeachingExpInfo>) DataManagerStatic.getInstances(preTeachingExpInfo));

		// 查询当前授课经历
		Constraint curTeachingExpInfo = new Constraint("CurTeachingExpInfo");
		curTeachingExpInfo.addCondition("bizDataUuid", teacher.getUuid());
		teacher.setCurTeachingExpInfos((List<CurTeachingExpInfo>) DataManagerStatic.getInstances(curTeachingExpInfo));

		return teacher;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Teacher selectTeacher(Constraint constraint) throws Exception, RemoteException {
		// 查询教师
		Teacher teacher = (Teacher) DataManagerStatic.getInstance(constraint);

		if (teacher != null) {
			// 查询过往授课经历
			Constraint preTeachingExpInfo = new Constraint("PreTeachingExpInfo");
			preTeachingExpInfo.addCondition("bizDataUuid", teacher.getUuid());
			teacher.setPreTeachingExpInfos((List<PreTeachingExpInfo>) DataManagerStatic.getInstances(preTeachingExpInfo));

			// 查询当前授课经历
			Constraint curTeachingExpInfo = new Constraint("CurTeachingExpInfo");
			curTeachingExpInfo.addCondition("bizDataUuid", teacher.getUuid());
			teacher.setCurTeachingExpInfos((List<CurTeachingExpInfo>) DataManagerStatic.getInstances(curTeachingExpInfo));
		}

		return teacher;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Teacher> selectTeachers(Constraint constraint) throws Exception, RemoteException {
		// 查询教师(list)
		List<Teacher> teacherTemp = (List<Teacher>) DataManagerStatic.getInstances(constraint);
		List<Teacher> teachers = new ArrayList();
		for (int i = 0; i < teacherTemp.size(); i++) {
			Teacher teacher = teacherTemp.get(i);

			// 查询过往授课经历
			Constraint preTeachingExpInfo = new Constraint("PreTeachingExpInfo");
			preTeachingExpInfo.addCondition("bizDataUuid", teacher.getUuid());
			teacher.setPreTeachingExpInfos((List<PreTeachingExpInfo>) DataManagerStatic.getInstances(preTeachingExpInfo));

			// 查询当前授课经历
			Constraint curTeachingExpInfo = new Constraint("CurTeachingExpInfo");
			curTeachingExpInfo.addCondition("bizDataUuid", teacher.getUuid());
			teacher.setCurTeachingExpInfos((List<CurTeachingExpInfo>) DataManagerStatic.getInstances(curTeachingExpInfo));

			teachers.add(teacher);
		}

		return teachers;
	}

	/**
	 * <b>查询过往授课经历(list)</b>
	 * 
	 * @param constraint PreTeachingExpInfo的约束条件
	 * @return 查询到的PreTeachingExpInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PreTeachingExpInfo> selectPreTeachingExpInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<PreTeachingExpInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询当前授课经历(list)</b>
	 * 
	 * @param constraint CurTeachingExpInfo的约束条件
	 * @return 查询到的CurTeachingExpInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<CurTeachingExpInfo> selectCurTeachingExpInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<CurTeachingExpInfo>) DataManagerStatic.getInstances(constraint);
	}
}
