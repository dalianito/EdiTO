package com.ito.edito.ejb.Class;

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
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Class_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * CourseCategoryType<br>
 * ClassManagement<br>
 * Room<br>
 * 
 * @author <a href="mailto:Water_wu@ito.com.cn">Water wu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class ClassServiceBean extends CastorDataManager implements ClassServiceRemote {
	/**
	 * <b>创建课程类别</b>
	 * 
	 * @param courseCategoryType CourseCategoryType对象
	 * @param userName 执行者的账户名
	 * @return 创建的CourseCategoryType的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertCourseCategoryType(CourseCategoryType courseCategoryType, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(courseCategoryType, userName);
	}

	/**
	 * <b>更新课程类别</b>
	 * 
	 * @param courseCategoryType CourseCategoryType对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateCourseCategoryType(CourseCategoryType courseCategoryType, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(courseCategoryType, userName);
	}

	/**
	 * <b>查询课程类别(uuid)</b>
	 * 
	 * @param uuid CourseCategoryType的uuid
	 * @return 查询到的CourseCategoryType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public CourseCategoryType selectCourseCategoryTypeByUuid(String uuid) throws Exception, RemoteException {
		try {
			return (CourseCategoryType) DataManagerStatic.getInstance(uuid);
		}
		catch (ClassCastException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * <b>查询课程类别</b>
	 * 
	 * @param constraint CourseCategoryType的约束条件
	 * @return 查询到的CourseCategoryType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public CourseCategoryType selectCourseCategoryType(Constraint constraint) throws Exception, RemoteException {
		return (CourseCategoryType) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询课程类别(list)</b>
	 * 
	 * @param constraint CourseCategoryType的约束条件
	 * @return 查询到的CourseCategoryType的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<CourseCategoryType> selectCourseCategoryTypes(Constraint constraint) throws Exception, RemoteException {
		return (List<CourseCategoryType>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建班型类别</b>
	 * 
	 * @param classManagement ClassManagement对象
	 * @param userName 执行者的账户名
	 * @return 创建的ClassManagement的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertClassManagement(ClassManagement classManagement, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(classManagement, userName);
	}

	/**
	 * <b>更新班型类别</b>
	 * 
	 * @param classManagement ClassManagement对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateClassManagement(ClassManagement classManagement, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(classManagement, userName);
	}

	/**
	 * <b>查询班型类别</b>
	 * 
	 * @param constraint ClassManagement的约束条件
	 * @return 查询到的ClassManagement
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ClassManagement selectClassManagement(Constraint constraint) throws Exception, RemoteException {
		return (ClassManagement) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询班型类别(uuid)</b>
	 * 
	 * @param uuid ClassManagement的uuid
	 * @return 查询到的ClassManagement
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ClassManagement selectClassManagementByUuid(String uuid) throws Exception, RemoteException {
		return (ClassManagement) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询班型类别(list)</b>
	 * 
	 * @param constraint ClassManagement的约束条件
	 * @return 查询到的ClassManagement的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ClassManagement> selectClassManagements(Constraint constraint) throws Exception, RemoteException {
		return (List<ClassManagement>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建课程</b>
	 * 
	 * @param course Course对象
	 * @param userName 执行者的账户名
	 * @return 创建的Course的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertCourse(Course course, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(course, userName);
	}

	/**
	 * <b>更新课程</b>
	 * 
	 * @param course Course对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateCourse(Course course, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(course, userName);
	}

	/**
	 * <b>查询课程</b>
	 * 
	 * @param constraint Course的约束条件
	 * @return 查询到的Course
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Course selectCourse(Constraint constraint) throws Exception, RemoteException {
		return (Course) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询课程(uuid)</b>
	 * 
	 * @param uuid Course的uuid
	 * @return 查询到的Course
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Course selectCourseByUuid(String uuid) throws Exception, RemoteException {
		return (Course) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询课程(list)</b>
	 * 
	 * @param constraint Course的约束条件
	 * @return 查询到的Course的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Course> selectCourses(Constraint constraint) throws Exception, RemoteException {
		return (List<Course>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建教室</b>
	 * 
	 * @param room Room对象
	 * @param userName 执行者的账户名
	 * @return 创建的Room的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertRoom(Room room, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(room, userName);
	}

	/**
	 * <b>更新教室</b>
	 * 
	 * @param room Room对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateRoom(Room room, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(room, userName);
	}

	/**
	 * <b>删除教室</b>
	 * 
	 * @param room Room对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteRoom(Room room, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(room, userName);
	}

	/**
	 * <b>查询教室(uuid)</b>
	 * 
	 * @param uuid Room的uuid
	 * @return 查询到的Room
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Room selectRoomByUuid(String uuid) throws Exception, RemoteException {
		return (Room) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询教室</b>
	 * 
	 * @param constraint Room的约束条件
	 * @return 查询到的Room
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Room selectRoom(Constraint constraint) throws Exception, RemoteException {
		return (Room) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询教室(list)</b>
	 * 
	 * @param constraint Room的约束条件
	 * @return 查询到的Room的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Room> selectRooms(Constraint constraint) throws Exception, RemoteException {
		return (List<Room>) DataManagerStatic.getInstances(constraint);
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertArrangeClass(ArrangeClass arrangeClass, String userName) throws Exception, RemoteException {
		// 创建排课信息
		String arrangeClassUuid = DataManagerStatic.createInstance(arrangeClass, userName);

		// 创建时间地点信息
		List<TimePositionTeacherInfo> timePositionTeacherInfoList = arrangeClass.getTimePositionTeacherInfosAsReference();
		for (int i = 0; i < timePositionTeacherInfoList.size(); i++) {
			TimePositionTeacherInfo timePositionTeacherInfo = timePositionTeacherInfoList.get(i);
			timePositionTeacherInfo.setBizDataUuid(arrangeClassUuid, false);
			DataManagerStatic.createInstance(timePositionTeacherInfo, userName);
		}

		return arrangeClassUuid;
	}

	/**
	 * <p>
	 * <b>更新排课信息</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * timePositionInfo<br>
	 * 
	 * @param arrangeClass ArrangeClass对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateArrangeClass(ArrangeClass arrangeClass, String userName) throws Exception, RemoteException {
		// 更新时间地点信息
		List<TimePositionTeacherInfo> timePositionTeacherInfoList = arrangeClass.getTimePositionTeacherInfosAsReference();
		for (int i = 0; i < timePositionTeacherInfoList.size(); i++) {
			TimePositionTeacherInfo timePositionTeacherInfo = timePositionTeacherInfoList.get(i);
			if (timePositionTeacherInfo.getOperationStatus().equals("0")) {
				timePositionTeacherInfo.setBizDataUuid(arrangeClass.getUuid(), false);
				DataManagerStatic.createInstance(timePositionTeacherInfo, userName);
			}
			else if (timePositionTeacherInfo.getOperationStatus().equals("1")) {
				timePositionTeacherInfo.setBizDataUuid(arrangeClass.getUuid(), false);
				DataManagerStatic.updateInstance(timePositionTeacherInfo, userName);
			}
			else if (timePositionTeacherInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(timePositionTeacherInfo, userName);
			}
		}

		// 更新排课
		DataManagerStatic.updateInstance(arrangeClass, userName);
	}

	/**
	 * <p>
	 * <b>查询排课(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClass中：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param uuid ArrangeClass的uuid
	 * @return 查询到的ArrangeClass
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ArrangeClass selectArrangeClassByUuid(String uuid) throws Exception, RemoteException {
		// 查询排课信息(uuid)
		ArrangeClass arrangeClass = (ArrangeClass) DataManagerStatic.getInstance(uuid);

		// 查询时间地点信息
		Constraint timePositionTeacherInfo = new Constraint("TimePositionTeacherInfo");
		timePositionTeacherInfo.addCondition("bizDataUuid", arrangeClass.getUuid());
		arrangeClass.setTimePositionTeacherInfos((List<TimePositionTeacherInfo>) DataManagerStatic.getInstances(timePositionTeacherInfo));

		return arrangeClass;
	}

	/**
	 * <p>
	 * <b>查询排课</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClass中：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param constraint ArrangeClass的约束条件
	 * @return 查询到的ArrangeClass
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ArrangeClass selectArrangeClass(Constraint constraint) throws Exception, RemoteException {
		// 查询排课
		ArrangeClass arrangeClass = (ArrangeClass) DataManagerStatic.getInstance(constraint);

		if (arrangeClass != null) {
			// 查询时间地点信息
			Constraint timePositionTeacherInfo = new Constraint("TimePositionTeacherInfo");
			timePositionTeacherInfo.addCondition("bizDataUuid", arrangeClass.getUuid());
			arrangeClass.setTimePositionTeacherInfos((List<TimePositionTeacherInfo>) DataManagerStatic.getInstances(timePositionTeacherInfo));

		}

		return arrangeClass;
	}

	/**
	 * <p>
	 * <b>查询排课(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入ArrangeClass(list)中：<br>
	 * timePositionTeacherInfo<br>
	 * 
	 * @param constraint ArrangeClass的约束条件
	 * @return 查询到的ArrangeClass的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ArrangeClass> selectArrangeClasses(Constraint constraint) throws Exception, RemoteException {
		// 查询排课(list)
		List<ArrangeClass> arrangeClassTemp = (List<ArrangeClass>) DataManagerStatic.getInstances(constraint);
		List<ArrangeClass> arrangeClasses = new ArrayList();
		for (int i = 0; i < arrangeClassTemp.size(); i++) {
			ArrangeClass arrangeClass = arrangeClassTemp.get(i);

			// 查询时间地点信息
			Constraint timePositionTeacherInfo = new Constraint("TimePositionTeacherInfo");
			timePositionTeacherInfo.addCondition("bizDataUuid", arrangeClass.getUuid());
			arrangeClass.setTimePositionTeacherInfos((List<TimePositionTeacherInfo>) DataManagerStatic.getInstances(timePositionTeacherInfo));

			arrangeClasses.add(arrangeClass);
		}

		return arrangeClasses;
	}

	/**
	 * <b>查询（排课）时间地点(list)</b>
	 * 
	 * @param constraint TimePositionTeacherInfo的约束条件
	 * @return 查询到的TimePositionTeacherInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<TimePositionTeacherInfo> selectTimePositionTeacherInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<TimePositionTeacherInfo>) DataManagerStatic.getInstances(constraint);
	}

	// ///////////////////////////////////////////////////////////////////////////
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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertArrangeClassTime(ArrangeClassTime arrangeClassTime, String userName) throws Exception, RemoteException {
		// 创建排课时间
		String arrangeClassTimeUuid = DataManagerStatic.createInstance(arrangeClassTime, userName);

		// 创建排课时间信息
		List<ArrangeClassTimeInfo> arrangeClassTimeInfoList = arrangeClassTime.getArrangeClassTimeInfosAsReference();
		for (int i = 0; i < arrangeClassTimeInfoList.size(); i++) {
			ArrangeClassTimeInfo arrangeClassTimeInfo = arrangeClassTimeInfoList.get(i);
			arrangeClassTimeInfo.setBizDataUuid(arrangeClassTimeUuid, false);
			DataManagerStatic.createInstance(arrangeClassTimeInfo, userName);
		}

		return arrangeClassTimeUuid;
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateArrangeClassTime(ArrangeClassTime arrangeClassTime, String userName) throws Exception, RemoteException {
		// 更新时间信息
		List<ArrangeClassTimeInfo> arrangeClassTimeInfoList = arrangeClassTime.getArrangeClassTimeInfosAsReference();
		for (int i = 0; i < arrangeClassTimeInfoList.size(); i++) {
			ArrangeClassTimeInfo arrangeClassTimeInfo = arrangeClassTimeInfoList.get(i);
			if (arrangeClassTimeInfo.getOperationStatus().equals("0")) {
				arrangeClassTimeInfo.setBizDataUuid(arrangeClassTime.getUuid(), false);
				DataManagerStatic.createInstance(arrangeClassTimeInfo, userName);
			}
			else if (arrangeClassTimeInfo.getOperationStatus().equals("1")) {
				arrangeClassTimeInfo.setBizDataUuid(arrangeClassTime.getUuid(), false);
				DataManagerStatic.updateInstance(arrangeClassTimeInfo, userName);
			}
			else if (arrangeClassTimeInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(arrangeClassTimeInfo, userName);
			}
		}

		// 更新排课时间
		DataManagerStatic.updateInstance(arrangeClassTime, userName);
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ArrangeClassTime selectArrangeClassTimeByUuid(String uuid) throws Exception, RemoteException {
		// 查询排课时间(uuid)
		ArrangeClassTime arrangeClassTime = (ArrangeClassTime) DataManagerStatic.getInstance(uuid);

		// 查询排课时间信息
		Constraint arrangeClassTimeInfo = new Constraint("ArrangeClassTimeInfo");
		arrangeClassTimeInfo.addCondition("bizDataUuid", arrangeClassTime.getUuid());
		arrangeClassTime.setArrangeClassTimeInfos((List<ArrangeClassTimeInfo>) DataManagerStatic.getInstances(arrangeClassTimeInfo));

		return arrangeClassTime;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ArrangeClassTime selectArrangeClassTime(Constraint constraint) throws Exception, RemoteException {
		// 查询排课时间
		ArrangeClassTime arrangeClassTime = (ArrangeClassTime) DataManagerStatic.getInstance(constraint);

		if (arrangeClassTime != null) {
			// 查询时间信息
			Constraint arrangeClassTimeInfo = new Constraint("ArrangeClassTimeInfo");
			arrangeClassTimeInfo.addCondition("bizDataUuid", arrangeClassTime.getUuid());
			arrangeClassTime.setArrangeClassTimeInfos((List<ArrangeClassTimeInfo>) DataManagerStatic.getInstances(arrangeClassTimeInfo));

		}

		return arrangeClassTime;
	}

	/**
	 * <p>
	 * <b>查询排课时间(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入arrangeClassTime(list)中：<br>
	 * arrangeClassTimeInfo<br>
	 * 
	 * @param constraint arrangeClassTime的约束条件
	 * @return 查询到的arrangeClassTime的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ArrangeClassTime> selectArrangeClassTimes(Constraint constraint) throws Exception, RemoteException {
		// 查询排课时间(list)
		List<ArrangeClassTime> arrangeClassTimeTemp = (List<ArrangeClassTime>) DataManagerStatic.getInstances(constraint);
		List<ArrangeClassTime> arrangeClassTimes = new ArrayList();
		for (int i = 0; i < arrangeClassTimeTemp.size(); i++) {
			ArrangeClassTime arrangeClassTime = arrangeClassTimeTemp.get(i);

			// 查询时间地点信息
			Constraint arrangeClassTimeInfo = new Constraint("ArrangeClassTimeInfo");
			arrangeClassTimeInfo.addCondition("bizDataUuid", arrangeClassTime.getUuid());
			arrangeClassTime.setArrangeClassTimeInfos((List<ArrangeClassTimeInfo>) DataManagerStatic.getInstances(arrangeClassTimeInfo));

			arrangeClassTimes.add(arrangeClassTime);
		}

		return arrangeClassTimes;
	}

	/**
	 * <b>查询（排课）时间(list)</b>
	 * 
	 * @param constraint ArrangeClassTimeInfo的约束条件
	 * @return 查询到的ArrangeClassTimeInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ArrangeClassTimeInfo> selectArrangeClassTimeInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<ArrangeClassTimeInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建费用</b>
	 * 
	 * @param tuition Tuition对象
	 * @param userName 执行者的账户名
	 * @return 创建的tuition的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertTuition(Tuition tuition, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(tuition, userName);
	}

	/**
	 * <b>更新费用</b>
	 * 
	 * @param tuition Tuition对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateTuition(Tuition tuition, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(tuition, userName);
	}

	/**
	 * <b>查询费用</b>
	 * 
	 * @param constraint Tuition的约束条件
	 * @return 查询到的Tuition
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Tuition selectTuition(Constraint constraint) throws Exception, RemoteException {
		return (Tuition) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询费用(uuid)</b>
	 * 
	 * @param uuid Tuition的uuid
	 * @return 查询到的Tuition
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Tuition selectTuitionByUuid(String uuid) throws Exception, RemoteException {
		return (Tuition) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询费用(list)</b>
	 * 
	 * @param constraint Tuition的约束条件
	 * @return 查询到的Tuition的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Tuition> selectTuitions(Constraint constraint) throws Exception, RemoteException {
		return (List<Tuition>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建报名</b>
	 * 
	 * @param classEnrollment ClassEnrollment对象
	 * @param userName 执行者的账户名
	 * @return 创建的ClassEnrollment的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertClassEnrollment(ClassEnrollment classEnrollment, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(classEnrollment, userName);
	}

	/**
	 * <b>更新报名</b>
	 * 
	 * @param classEnrollment ClassEnrollment对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateClassEnrollment(ClassEnrollment classEnrollment, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(classEnrollment, userName);
	}

	/**
	 * <b>删除报名</b>
	 * 
	 * @param classEnrollment ClassEnrollment对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteClassEnrollment(ClassEnrollment classEnrollment, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(classEnrollment, userName);
	}

	/**
	 * <b>查询报名(uuid)</b>
	 * 
	 * @param uuid ClassEnrollment的uuid
	 * @return 查询到的ClassEnrollment
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ClassEnrollment selectClassEnrollmentByUuid(String uuid) throws Exception, RemoteException {
		return (ClassEnrollment) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询报名</b>
	 * 
	 * @param constraint ClassEnrollment的约束条件
	 * @return 查询到的ClassEnrollment
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ClassEnrollment selectClassEnrollment(Constraint constraint) throws Exception, RemoteException {
		return (ClassEnrollment) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询报名(list)</b>
	 * 
	 * @param constraint ClassEnrollment的约束条件
	 * @return 查询到的ClassEnrollment的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ClassEnrollment> selectClassEnrollments(Constraint constraint) throws Exception, RemoteException {
		return (List<ClassEnrollment>) DataManagerStatic.getInstances(constraint);
	}

}
