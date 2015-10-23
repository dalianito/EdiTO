package com.ito.edito.ejb.Attendance;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.Attendance;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Attendance_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Attendance<br>
 * 
 * @author <a href="mailto:lanka_li@ito.com.cn">Lanka Li</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class AttendanceServiceBean extends CastorDataManager implements AttendanceServiceRemote {
	/**
	 * <b>创建考勤</b>
	 * 
	 * @param attendance Attendance对象
	 * @param userName 执行者的账户名
	 * @return 创建的Attendance的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertAttendance(Attendance attendance, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(attendance, userName);
	}

	/**
	 * <b>更新考勤</b>
	 * 
	 * @param attendance Attendance对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateAttendance(Attendance attendance, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(attendance, userName);
	}

	/**
	 * <b>删除考勤</b>
	 * 
	 * @param attendance Attendance对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteAttendance(Attendance attendance, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(attendance, userName);
	}

	/**
	 * <b>查询考勤(uuid)</b>
	 * 
	 * @param uuid Attendance的uuid
	 * @return 查询到的Attendance
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Attendance selectAttendanceByUuid(String uuid) throws Exception, RemoteException {
		return (Attendance) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询考勤</b>
	 * 
	 * @param constraint Attendance的约束条件
	 * @return 查询到的Attendance
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Attendance selectAttendance(Constraint constraint) throws Exception, RemoteException {
		return (Attendance) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询考勤(list)</b>
	 * 
	 * @param constraint Attendance的约束条件
	 * @return 查询到的Attendance的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Attendance> selectAttendances(Constraint constraint) throws Exception, RemoteException {
		return (List<Attendance>) DataManagerStatic.getInstances(constraint);
	}
}
