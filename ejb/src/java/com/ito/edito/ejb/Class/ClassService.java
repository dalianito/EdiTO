package com.ito.edito.ejb.Class;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ArrangeClassTime;
import com.ito.edito.schema.ArrangeClassTimeInfo;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.ClassManagement;
import com.ito.edito.schema.Course;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.schema.Room;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.edito.schema.Tuition;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Class_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * CourseCategoryType<br>
 * ClassManagement<br>
 * Room<br>
 * ArrangeClass<br>
 * StudentAttendance<br>
 * 
 * @author <a href="mailto:Water_wu@ito.com.cn">Water wu</a>
 */

public interface ClassService {
	/**
	 * <b>创建课程类别</b>
	 * 
	 * @param courseCategoryType CourseCategoryType对象
	 * @param userName 执行者的账户名
	 * @return 创建的CourseCategoryType的uuid
	 */
	public String insertCourseCategoryType(CourseCategoryType courseCategoryType, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新课程类别</b>
	 * 
	 * @param courseCategoryType CourseCategoryType对象
	 * @param userName 执行者的账户名
	 */
	public void updateCourseCategoryType(CourseCategoryType courseCategoryType, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询课程类别(uuid)</b>
	 * 
	 * @param uuid CourseCategoryType的uuid
	 * @return 查询到的CourseCategoryType
	 */
	public CourseCategoryType selectCourseCategoryTypeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询课程类别</b>
	 * 
	 * @param constraint CourseCategoryType的约束条件
	 * @return 查询到的CourseCategoryType
	 */
	public CourseCategoryType selectCourseCategoryType(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询课程类别(list)</b>
	 * 
	 * @param constraint CourseCategoryType的约束条件
	 * @return 查询到的CourseCategoryType的list
	 */
	public List<CourseCategoryType> selectCourseCategoryTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建班型类别</b>
	 * 
	 * @param classManagement ClassManagement对象
	 * @return 创建的ClassManagement的uuid
	 * @param userName 执行者的账户名
	 */
	public String insertClassManagement(ClassManagement classManagement, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新班型类别</b>
	 * 
	 * @param classManagement ClassManagement对象
	 * @param userName 执行者的账户名
	 */
	public void updateClassManagement(ClassManagement classManagement, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询班型类别(uuid)</b>
	 * 
	 * @param uuid ClassManagement的uuid
	 * @return 查询到的ClassManagement
	 */
	public ClassManagement selectClassManagementByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询班型类别</b>
	 * 
	 * @param constraint ClassManagement的约束条件
	 * @return 查询到的ClassManagement
	 */
	public ClassManagement selectClassManagement(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询班型类别(list)</b>
	 * 
	 * @param constraint ClassManagement的约束条件
	 * @return 查询到的ClassManagement的list
	 */
	public List<ClassManagement> selectClassManagements(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建课程</b>
	 * 
	 * @param course Course对象
	 * @return 创建的Course的uuid
	 * @param userName 执行者的账户名
	 */
	public String insertCourse(Course course, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新课程</b>
	 * 
	 * @param course Course对象
	 * @param userName 执行者的账户名
	 */
	public void updateCourse(Course course, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询课程(uuid)</b>
	 * 
	 * @param uuid Course的uuid
	 * @return 查询到的Course
	 */
	public Course selectCourseByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询课程</b>
	 * 
	 * @param constraint Course的约束条件
	 * @return 查询到的Course
	 */
	public Course selectCourse(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询课程(list)</b>
	 * 
	 * @param constraint Course的约束条件
	 * @return 查询到的Course的list
	 */
	public List<Course> selectCourses(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建教室</b>
	 * 
	 * @param Room Room对象
	 * @param userName 执行者的账户名
	 * @return 创建的Room的uuid
	 */
	public String insertRoom(Room room, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新教室</b>
	 * 
	 * @param room Room对象
	 * @param userName 执行者的账户名
	 */
	public void updateRoom(Room room, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除教室</b>
	 * 
	 * @param room Room对象
	 * @param userName 执行者的账户名
	 */
	public void deleteRoom(Room room, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询教室(uuid)</b>
	 * 
	 * @param uuid Room的uuid
	 * @return 查询到的Room
	 */
	public Room selectRoomByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询教室</b>
	 * 
	 * @param constraint Room的约束条件
	 * @return 查询到的Room
	 */
	public Room selectRoom(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询教室(list)</b>
	 * 
	 * @param constraint Room的约束条件
	 * @return 查询到的Room的list
	 */
	public List<Room> selectRooms(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>创建排课信息</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param arrangeClass ArrangeClass对象
	 * @param userName 执行者的账户名
	 * @return 创建的ArrangeClass的uuid
	 */
	public String insertArrangeClass(ArrangeClass arrangeClass, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新排课信息</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param arrangeClass ArrangeClass对象
	 * @param userName 执行者的账户名
	 */
	public void updateArrangeClass(ArrangeClass arrangeClass, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询排课信息(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClass中：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param uuid ArrangeClass的uuid
	 * @return 查询到的ArrangeClass
	 */
	public ArrangeClass selectArrangeClassByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询排课信息</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClass中：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param constraint ArrangeClass的约束条件
	 * @return 查询到的ArrangeClass
	 */
	public ArrangeClass selectArrangeClass(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询排课信息(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClass(list)中：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param constraint ArrangeClass的约束条件
	 * @return 查询到的ArrangeClass的list
	 */
	public List<ArrangeClass> selectArrangeClasses(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询(排课)时间地点信息(list)</b>
	 * 
	 * @param constraint timePositionTeacherInfo的约束条件
	 * @return 查询到的timePositionTeacherInfo的list
	 */
	public List<TimePositionTeacherInfo> selectTimePositionTeacherInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>创建排课时间</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * arrangeClassTimeInfo<br>
	 * 
	 * @param arrangeClassTime ArrangeClassTime对象
	 * @param userName 执行者的账户名
	 * @return 创建的ArrangeClassTime的uuid
	 */
	public String insertArrangeClassTime(ArrangeClassTime arrangeClassTime, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新排课时间</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * arrangeClassTimeInfo<br>
	 * 
	 * @param arrangeClassTime ArrangeClassTime对象
	 * @param userName 执行者的账户名
	 */
	public void updateArrangeClassTime(ArrangeClassTime arrangeClassTime, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询排课时间(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClassTime中：<br>
	 * arrangeClassTimeInfo<br>
	 * 
	 * @param uuid ArrangeClassTime的uuid
	 * @return 查询到的ArrangeClassTime
	 */
	public ArrangeClassTime selectArrangeClassTimeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询排课时间</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClassTime中：<br>
	 * arrangeClassTimeInfo<br>
	 * 
	 * @param constraint ArrangeClassTime的约束条件
	 * @return 查询到的ArrangeClassTime
	 */
	public ArrangeClassTime selectArrangeClassTime(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询排课时间(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClassTime(list)中：<br>
	 * arrangeClassTimeInfo<br>
	 * 
	 * @param constraint ArrangeClassTime的约束条件
	 * @return 查询到的ArrangeClassTime的list
	 */
	public List<ArrangeClassTime> selectArrangeClassTimes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询(排课)时间地点信息(list)</b>
	 * 
	 * @param constraint arrangeClassTimeInfo的约束条件
	 * @return 查询到的arrangeClassTimeInfo的list
	 */
	public List<ArrangeClassTimeInfo> selectArrangeClassTimeInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建费用</b>
	 * 
	 * @param tuition Tuition对象
	 * @return 创建的Tuition的uuid
	 * @param userName 执行者的账户名
	 */
	public String insertTuition(Tuition tuition, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新费用</b>
	 * 
	 * @param tuition Tuition对象
	 * @param userName 执行者的账户名
	 */
	public void updateTuition(Tuition tuition, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询费用(uuid)</b>
	 * 
	 * @param uuid Tuition的uuid
	 * @return 查询到的Tuition
	 */
	public Tuition selectTuitionByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询费用</b>
	 * 
	 * @param constraint Tuition的约束条件
	 * @return 查询到的Tuition
	 */
	public Tuition selectTuition(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询费用(list)</b>
	 * 
	 * @param constraint Tuition的约束条件
	 * @return 查询到的Tuition的list
	 */
	public List<Tuition> selectTuitions(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建报名</b>
	 * 
	 * @param classEnrollment ClassEnrollment对象
	 * @param userName 执行者的账户名
	 * @return 创建的ClassEnrollment的uuid
	 */
	public String insertClassEnrollment(ClassEnrollment classEnrollment, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新报名</b>
	 * 
	 * @param classEnrollment ClassEnrollment对象
	 * @param userName 执行者的账户名
	 */
	public void updateClassEnrollment(ClassEnrollment classEnrollment, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除报名</b>
	 * 
	 * @param classEnrollment ClassEnrollment对象
	 * @param userName 执行者的账户名
	 */
	public void deleteClassEnrollment(ClassEnrollment classEnrollment, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询报名(uuid)</b>
	 * 
	 * @param uuid ClassEnrollment的uuid
	 * @return 查询到的ClassEnrollment
	 */
	public ClassEnrollment selectClassEnrollmentByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询报名</b>
	 * 
	 * @param constraint ClassEnrollment的约束条件
	 * @return 查询到的ClassEnrollment
	 */
	public ClassEnrollment selectClassEnrollment(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询报名(list)</b>
	 * 
	 * @param constraint ClassEnrollment的约束条件
	 * @return 查询到的ClassEnrollment的list
	 */
	public List<ClassEnrollment> selectClassEnrollments(Constraint constraint) throws Exception, RemoteException;

}
