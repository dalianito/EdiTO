package com.ito.edito.ejb.Attendance;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Attendance;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Attendance_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Attendance<br>
 * 
 * @author <a href="mailto:lanka_li@ito.com.cn">Lanka Li</a>
 */

public interface AttendanceService {
	/**
	 * <b>创建考勤</b>
	 * 
	 * @param attendance Attendance对象
	 * @param userName 执行者的账户名
	 * @return 创建的Attendance的uuid
	 */
	public String insertAttendance(Attendance attendance, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新考勤</b>
	 * 
	 * @param attendance Attendance对象
	 * @param userName 执行者的账户名
	 */
	public void updateAttendance(Attendance attendance, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除考勤</b>
	 * 
	 * @param attendance Attendance对象
	 * @param userName 执行者的账户名
	 */
	public void deleteAttendance(Attendance attendance, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询考勤(uuid)</b>
	 * 
	 * @param uuid Attendance的uuid
	 * @return 查询到的Attendance
	 */
	public Attendance selectAttendanceByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询考勤</b>
	 * 
	 * @param constraint Attendance的约束条件
	 * @return 查询到的Attendance
	 */
	public Attendance selectAttendance(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询考勤(list)</b>
	 * 
	 * @param constraint Attendance的约束条件
	 * @return 查询到的Attendance的list
	 */
	public List<Attendance> selectAttendances(Constraint constraint) throws Exception, RemoteException;
}
