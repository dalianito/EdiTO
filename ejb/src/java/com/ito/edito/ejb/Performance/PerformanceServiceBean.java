package com.ito.edito.ejb.Performance;

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
import com.ito.edito.schema.EmployeePerfType;
import com.ito.edito.schema.EmployeePerformance;
import com.ito.edito.schema.JobPerfType;
import com.ito.edito.schema.PerfAdmin;
import com.ito.edito.schema.PerfAttendance;
import com.ito.edito.schema.PerfBehaviour;
import com.ito.edito.schema.PerfChildren;
import com.ito.edito.schema.PerfDriver;
import com.ito.edito.schema.PerfFacility;
import com.ito.edito.schema.PerfFinancial;
import com.ito.edito.schema.PerfIncharge;
import com.ito.edito.schema.PerfLession;
import com.ito.edito.schema.PerfLongTerm;
import com.ito.edito.schema.PerfMaterial;
import com.ito.edito.schema.PerfObtain;
import com.ito.edito.schema.PerfOther;
import com.ito.edito.schema.PerfPropaganda;
import com.ito.edito.schema.PerfReception;
import com.ito.edito.schema.PerfRecruit;
import com.ito.edito.schema.PerfSecurityClean;
import com.ito.edito.schema.PerfShortTerm;
import com.ito.edito.schema.PerfTeaching;
import com.ito.edito.schema.PerformanceType;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Performance_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * PerformanceType<br>
 * EmployeePerfType<br>
 * EmployeePerformance<br>
 * PerfAttendance<br>
 * PerfBehaviour<br>
 * PerfReception<br>
 * PerfFacility<br>
 * PerfMaterial<br>
 * PerfFinancial<br>
 * PerfLession<br>
 * PerfTeaching<br>
 * PerfChildren<br>
 * PerfLongTerm<br>
 * PerfShortTerm<br>
 * PerfObtain<br>
 * PerfRecruit<br>
 * PerfPropaganda<br>
 * PerfAdmin<br>
 * PerfIncharge<br>
 * PerfDriver<br>
 * PerfSecurityClean<br>
 * PerfOther<br>
 * JobPerfType<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class PerformanceServiceBean extends CastorDataManager implements PerformanceServiceRemote {
	/**
	 * <b>查询绩效类型(uuid)</b>
	 * 
	 * @param uuid PerformanceType的uuid
	 * @return 查询到的PerformanceType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerformanceType selectPerformanceTypeByUuid(String uuid) throws Exception, RemoteException {
		return (PerformanceType) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询绩效类型</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @return 查询到的PerformanceType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerformanceType selectPerformanceType(Constraint constraint) throws Exception, RemoteException {
		return (PerformanceType) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询绩效类型(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @return 查询到的PerformanceType的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PerformanceType> selectPerformanceTypes(Constraint constraint) throws Exception, RemoteException {
		return (List<PerformanceType>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询绩效类型及所有子节点(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @return 查询到的PerformanceType及其所有子节点的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PerformanceType> selectAllPerformanceTypes(Constraint constraint) throws Exception, RemoteException {
		List<PerformanceType> performanceTypesTemp = (List<PerformanceType>) DataManagerStatic.getInstances(constraint);
		List<PerformanceType> performanceTypes = new ArrayList();
		for (int i = 0; i < performanceTypesTemp.size(); i++) {
			PerformanceType performanceType = (PerformanceType) performanceTypesTemp.get(i);
			selectPerformanceTypesChildren(performanceType, null, null);
			performanceTypes.add(performanceType);
		}
		return performanceTypes;
	}

	/**
	 * <b>查询某员工绩效类型及所有子节点(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @param employeeUuid 某员工的uuid
	 * @return 查询到的某员工的PerformanceType及其所有子节点的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PerformanceType> selectPerformanceTypes(Constraint constraint, String employeeUuid) throws Exception, RemoteException {
		// 查询指定员工所具有的权限
		Constraint employeePerfType = new Constraint("EmployeePerfType");
		employeePerfType.addCondition("employeeUuid", employeeUuid);
		List<EmployeePerfType> employeePerfTypeList = selectEmployeePerfTypes(employeePerfType);
		List<String> performanceTypeUuidList = new ArrayList<String>();
		for (int i = 0; i < employeePerfTypeList.size(); i++) {
			performanceTypeUuidList.add(employeePerfTypeList.get(i).getTypeUuid());
		}
		if (performanceTypeUuidList.size() == 0) {
			// 该员工没有权限
			return new ArrayList<PerformanceType>();
		}
		constraint.addCondition("uuid", performanceTypeUuidList, Constraint.IN_LIST);

		// 查询绩效类型(list)
		List<PerformanceType> performanceTypesTemp = (List<PerformanceType>) DataManagerStatic.getInstances(constraint);
		List<PerformanceType> performanceTypes = new ArrayList();
		for (int i = 0; i < performanceTypesTemp.size(); i++) {
			PerformanceType performanceType = (PerformanceType) performanceTypesTemp.get(i);
			selectPerformanceTypesChildren(performanceType, performanceTypeUuidList, employeeUuid);
			performanceTypes.add(performanceType);
		}

		return performanceTypes;
	}

	// 查询绩效类型子节点(list)
	@SuppressWarnings("unchecked")
	private void selectPerformanceTypesChildren(PerformanceType performanceType, List<String> performanceTypeUuidList, String employeeUuid) throws Exception {
		Constraint performanceTypeChildren = new Constraint("PerformanceType");
		if (employeeUuid != null) {
			performanceTypeChildren.addCondition("uuid", performanceTypeUuidList, Constraint.IN_LIST);
		}
		performanceTypeChildren.addCondition("parentUuid", performanceType.getUuid());
		performanceTypeChildren.addOrderCondition("sequence", "asc");
		List<PerformanceType> performanceTypeChildrenTemp = (List<PerformanceType>) DataManagerStatic.getInstances(performanceTypeChildren);
		ArrayList performanceTypesChildren = new ArrayList();
		int i;
		int size = performanceTypeChildrenTemp.size();
		for (i = 0; i < size; i++) {
			PerformanceType performanceTypeChild = (PerformanceType) performanceTypeChildrenTemp.get(i);
			selectPerformanceTypesChildren(performanceTypeChild, performanceTypeUuidList, employeeUuid);
			performanceTypesChildren.add(performanceTypeChild);
		}
		performanceType.setChild(String.valueOf(size));
		performanceType.setChildrens(performanceTypesChildren);
	}

	/**
	 * <b>递归创建员工绩效类型</b>
	 * 
	 * @param performanceTypeUuid 创建绩效对应的绩效类型uuid
	 * @param employeeUuid 创建绩效对应的员工uuid
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void insertEmployeePerfType(String performanceTypeUuid, String employeeUuid, String userName) throws Exception, RemoteException {
		Constraint c = new Constraint("EmployeePerfType");
		c.addCondition("typeUuid", performanceTypeUuid);
		c.addCondition("employeeUuid", employeeUuid);
		EmployeePerfType employeePerfType = selectEmployeePerfType(c);
		if (employeePerfType == null) {
			employeePerfType = new EmployeePerfType();
			employeePerfType.setTypeUuid(performanceTypeUuid, false);
			employeePerfType.setEmployeeUuid(employeeUuid, false);
			DataManagerStatic.createInstance(employeePerfType, userName);
		}
		PerformanceType performanceType = selectPerformanceTypeByUuid(performanceTypeUuid);
		String performanceTypeParentUuid = performanceType.getParentUuid();
		if (performanceTypeParentUuid != null) {
			insertEmployeePerfType(performanceTypeParentUuid, employeeUuid, userName);
		}
	}

	/**
	 * <b>创建员工绩效类型</b>
	 * 
	 * @param employeePerfType EmployeePerfType对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public String insertEmployeePerfType(EmployeePerfType employeePerfType, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(employeePerfType, userName);
	}

	/**
	 * <b>删除员工绩效类型</b>
	 * 
	 * @param employeePerfType EmployeePerfType对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void deleteEmployeePerfType(EmployeePerfType employeePerfType, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(employeePerfType, userName);
	}

	/**
	 * <b>查询员工绩效类型(uuid)</b>
	 * 
	 * @param uuid EmployeePerfType的uuid
	 * @return 查询到的EmployeePerfType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public EmployeePerfType selectEmployeePerfTypeByUuid(String uuid) throws Exception, RemoteException {
		return (EmployeePerfType) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询员工绩效类型</b>
	 * 
	 * @param constraint EmployeePerfType的约束条件
	 * @return 查询到的EmployeePerfType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public EmployeePerfType selectEmployeePerfType(Constraint constraint) throws Exception, RemoteException {
		return (EmployeePerfType) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询员工绩效类型(list)</b>
	 * 
	 * @param constraint EmployeePerfType的约束条件
	 * @return 查询到的EmployeePerfType的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<EmployeePerfType> selectEmployeePerfTypes(Constraint constraint) throws Exception, RemoteException {
		return (List<EmployeePerfType>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询员工绩效类型子节点</b>
	 * 
	 * @param uuid PerformanceType的uuid
	 * @param employeeUuid 员工的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<EmployeePerfType> selectEmployeePerfTypeChildren(String uuid, String employeeUuid, List<EmployeePerfType> employeePerfTypes) throws Exception, RemoteException {
		if (employeePerfTypes == null) {
			employeePerfTypes = new ArrayList<EmployeePerfType>();
		}
		Constraint c1 = new Constraint("PerformanceType");
		c1.addCondition("parentUuid", uuid);

		Constraint employeePerfTypeC = new Constraint("EmployeePerfType");
		if (employeeUuid != null)
			employeePerfTypeC.addCondition("employeeUuid", employeeUuid);

		List<EmployeePerfType> employeePerfTypeList = selectEmployeePerfTypes(employeePerfTypeC);
		List<String> performanceTypeUuidList = new ArrayList<String>();
		for (int i = 0; i < employeePerfTypeList.size(); i++) {
			performanceTypeUuidList.add(employeePerfTypeList.get(i).getTypeUuid());
		}

		if (performanceTypeUuidList.size() == 0) {
			// 该员工没有绩效类型
			return employeePerfTypes;
		}
		if (employeeUuid != null) {
			c1.addCondition("uuid", performanceTypeUuidList, Constraint.IN_LIST);
		}

		// 查询绩效类型(list)
		List<PerformanceType> performanceTypesTemp = (List<PerformanceType>) selectPerformanceTypes(c1, null);

		for (int i = 0; i < performanceTypesTemp.size(); i++) {
			PerformanceType performanceType = (PerformanceType) performanceTypesTemp.get(i);
			Constraint employeePerfTypeC2 = new Constraint("EmployeePerfType");
			employeePerfTypeC2.addCondition("typeUuid", performanceType.getUuid());
			employeePerfTypeC2.addCondition("employeeUuid", employeeUuid);
			EmployeePerfType employeePerfType = (EmployeePerfType) DataManagerStatic.getInstance(employeePerfTypeC2);
			employeePerfTypes.add(employeePerfType);
			selectEmployeePerfTypeChildren(performanceType.getUuid(), employeeUuid, employeePerfTypes);
		}

		return employeePerfTypes;
	}

	/**
	 * <b>递归查询欲删除员工绩效类型</b>
	 * 
	 * @param uuid 删除绩效对应的绩效类型uuid
	 * @param employeeUuid 删除绩效对应的员工uuid
	 * @return 查询到的EmployeePerfType的list
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<EmployeePerfType> selectEmployeePerfTypeDeleted(String uuid, String employeeUuid) throws Exception, RemoteException {
		List<EmployeePerfType> employeePerfTypeList = new ArrayList<EmployeePerfType>();

		// 查询员工绩效类型
		Constraint c = new Constraint("EmployeePerfType");
		c.addCondition("typeUuid", uuid);
		c.addCondition("employeeUuid", employeeUuid);
		EmployeePerfType employeePerfType = selectEmployeePerfType(c);
		employeePerfTypeList.add(employeePerfType);

		// 递归查询绩效子类型
		selectChildrenEmployeePerfType(employeePerfTypeList, uuid, employeeUuid);

		// 递归查询无子节点的绩效父类型
		PerformanceType performanceType = selectPerformanceTypeByUuid(uuid);
		selectParentsEmployeePerfType(employeePerfTypeList, performanceType.getParentUuid(), employeeUuid);

		return employeePerfTypeList;
	}

	// 递归查询绩效子类型
	private void selectChildrenEmployeePerfType(List<EmployeePerfType> employeePerfTypeList, String performanceTypeParentUuid, String employeeUuid) throws Exception, RemoteException {
		Constraint performanceTypeC = new Constraint("PerformanceType");
		performanceTypeC.addCondition("parentUuid", performanceTypeParentUuid);
		List<PerformanceType> performanceTypeList = selectPerformanceTypes(performanceTypeC);
		for (int i = 0; i < performanceTypeList.size(); i++) {
			PerformanceType performanceType = performanceTypeList.get(i);

			// 查询绩效子类型
			Constraint employeePerfTypeC = new Constraint("EmployeePerfType");
			employeePerfTypeC.addCondition("employeeUuid", employeeUuid);
			employeePerfTypeC.addCondition("typeUuid", performanceType.getUuid());
			EmployeePerfType employeePerfType = selectEmployeePerfType(employeePerfTypeC);
			if (employeePerfType != null) {
				employeePerfTypeList.add(employeePerfType);
			}

			// 递归调用
			selectChildrenEmployeePerfType(employeePerfTypeList, performanceType.getUuid(), employeeUuid);
		}
	}

	// 递归查询无子节点的绩效父类型
	private void selectParentsEmployeePerfType(List<EmployeePerfType> employeePerfTypeList, String performanceTypeParentUuid, String employeeUuid) throws Exception, RemoteException {
		if (performanceTypeParentUuid != null) {
			Constraint performanceTypeC = new Constraint("PerformanceType");
			performanceTypeC.addCondition("parentUuid", performanceTypeParentUuid);
			List<PerformanceType> performanceTypeList = selectPerformanceTypes(performanceTypeC);
			List<String> uuidList = new ArrayList<String>();
			for (int i = 0; i < performanceTypeList.size(); i++) {
				PerformanceType performanceType = performanceTypeList.get(i);
				uuidList.add(performanceType.getUuid());
			}

			if (uuidList.size() > 0) {
				Constraint employeePerfTypeC = new Constraint("EmployeePerfType");
				employeePerfTypeC.addCondition("employeeUuid", employeeUuid);
				employeePerfTypeC.addCondition("typeUuid", uuidList, Constraint.IN_LIST);
				List<EmployeePerfType> authList = selectEmployeePerfTypes(employeePerfTypeC);
				if (authList.size() == 1) {
					Constraint employeePerfTypeParentC = new Constraint("EmployeePerfType");
					employeePerfTypeParentC.addCondition("employeeUuid", employeeUuid);
					employeePerfTypeParentC.addCondition("typeUuid", performanceTypeParentUuid);
					EmployeePerfType employeePerfType = selectEmployeePerfType(employeePerfTypeParentC);
					employeePerfTypeList.add(employeePerfType);

					PerformanceType performanceTypeParent = selectPerformanceTypeByUuid(performanceTypeParentUuid);
					selectParentsEmployeePerfType(employeePerfTypeList, performanceTypeParent.getParentUuid(), employeeUuid);
				}
			}
		}
	}

	/**
	 * <b>创建员工绩效</b>
	 * 
	 * @param employeePerformance EmployeePerformance对象
	 * @param userName 执行者的账户名
	 * @return 创建的EmployeePerformance的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertEmployeePerformance(EmployeePerformance employeePerformance, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(employeePerformance, userName);
	}

	/**
	 * <b>更新员工绩效</b>
	 * 
	 * @param employeePerformance EmployeePerformance对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateEmployeePerformance(EmployeePerformance employeePerformance, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(employeePerformance, userName);
	}

	/**
	 * <b>查询员工绩效(uuid)</b>
	 * 
	 * @param uuid EmployeePerformance的uuid
	 * @return 查询到的EmployeePerformance
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public EmployeePerformance selectEmployeePerformanceByUuid(String uuid) throws Exception, RemoteException {
		return (EmployeePerformance) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询员工绩效</b>
	 * 
	 * @param constraint EmployeePerformance的约束条件
	 * @return 查询到的EmployeePerformance
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public EmployeePerformance selectEmployeePerformance(Constraint constraint) throws Exception, RemoteException {
		return (EmployeePerformance) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询员工绩效(list)</b>
	 * 
	 * @param constraint EmployeePerformance的约束条件
	 * @return 查询到的EmployeePerformance的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<EmployeePerformance> selectEmployeePerformances(Constraint constraint) throws Exception, RemoteException {
		return (List<EmployeePerformance>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建绩效考勤</b>
	 * 
	 * @param perfAttendance PerfAttendance对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfAttendance的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfAttendance(PerfAttendance perfAttendance, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfAttendance, userName);
	}

	/**
	 * <b>更新绩效考勤</b>
	 * 
	 * @param perfAttendance PerfAttendance对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updatePerfAttendance(PerfAttendance perfAttendance, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(perfAttendance, userName);
	}

	/**
	 * <b>查询绩效考勤(uuid)</b>
	 * 
	 * @param uuid PerfAttendance的uuid
	 * @return 查询到的PerfAttendance
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfAttendance selectPerfAttendanceByUuid(String uuid) throws Exception, RemoteException {
		return (PerfAttendance) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询绩效考勤</b>
	 * 
	 * @param constraint PerfAttendance的约束条件
	 * @return 查询到的PerfAttendance
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfAttendance selectPerfAttendance(Constraint constraint) throws Exception, RemoteException {
		return (PerfAttendance) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询绩效考勤(list)</b>
	 * 
	 * @param constraint PerfAttendance的约束条件
	 * @return 查询到的PerfAttendance的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PerfAttendance> selectPerfAttendances(Constraint constraint) throws Exception, RemoteException {
		return (List<PerfAttendance>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建绩效行为规范</b>
	 * 
	 * @param perfBehaviour PerfBehaviour对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfBehaviour的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfBehaviour(PerfBehaviour perfBehaviour, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfBehaviour, userName);
	}

	/**
	 * <b>更新绩效行为规范</b>
	 * 
	 * @param perfBehaviour PerfBehaviour对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updatePerfBehaviour(PerfBehaviour perfBehaviour, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(perfBehaviour, userName);
	}

	/**
	 * <b>查询绩效行为规范(uuid)</b>
	 * 
	 * @param uuid PerfBehaviour的uuid
	 * @return 查询到的PerfBehaviour
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfBehaviour selectPerfBehaviourByUuid(String uuid) throws Exception, RemoteException {
		return (PerfBehaviour) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询绩效行为规范</b>
	 * 
	 * @param constraint PerfBehaviour的约束条件
	 * @return 查询到的PerfBehaviour
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfBehaviour selectPerfBehaviour(Constraint constraint) throws Exception, RemoteException {
		return (PerfBehaviour) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询绩效行为规范(list)</b>
	 * 
	 * @param constraint PerfBehaviour的约束条件
	 * @return 查询到的PerfBehaviour的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PerfBehaviour> selectPerfBehaviours(Constraint constraint) throws Exception, RemoteException {
		return (List<PerfBehaviour>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建绩效接待管理</b>
	 * 
	 * @param perfReception PerfReception对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfReception的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfReception(PerfReception perfReception, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfReception, userName);
	}

	/**
	 * <b>查询绩效接待管理</b>
	 * 
	 * @param constraint PerfReception的约束条件
	 * @return 查询到的PerfReception
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfReception selectPerfReception(Constraint constraint) throws Exception, RemoteException {
		return (PerfReception) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效设施管理</b>
	 * 
	 * @param perfFacility PerfFacility对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfFacility的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfFacility(PerfFacility perfFacility, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfFacility, userName);
	}

	/**
	 * <b>查询绩效设施管理</b>
	 * 
	 * @param constraint PerfFacility的约束条件
	 * @return 查询到的PerfFacility
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfFacility selectPerfFacility(Constraint constraint) throws Exception, RemoteException {
		return (PerfFacility) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效物资管理</b>
	 * 
	 * @param perfMaterial PerfMaterial对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfMaterial的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfMaterial(PerfMaterial perfMaterial, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfMaterial, userName);
	}

	/**
	 * <b>查询绩效物资管理</b>
	 * 
	 * @param constraint PerfMaterial的约束条件
	 * @return 查询到的PerfMaterial
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfMaterial selectPerfMaterial(Constraint constraint) throws Exception, RemoteException {
		return (PerfMaterial) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效财务管理</b>
	 * 
	 * @param perfFinancial PerfFinancial对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfFinancial的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfFinancial(PerfFinancial perfFinancial, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfFinancial, userName);
	}

	/**
	 * <b>查询绩效财务管理</b>
	 * 
	 * @param constraint PerfFinancial的约束条件
	 * @return 查询到的PerfFinancial
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfFinancial selectPerfFinancial(Constraint constraint) throws Exception, RemoteException {
		return (PerfFinancial) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效课时统计</b>
	 * 
	 * @param perfLession PerfLession对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfLession的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfLession(PerfLession perfLession, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfLession, userName);
	}

	/**
	 * <b>查询绩效课时统计</b>
	 * 
	 * @param constraint PerfLession的约束条件
	 * @return 查询到的PerfLession
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfLession selectPerfLession(Constraint constraint) throws Exception, RemoteException {
		return (PerfLession) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效教学达成</b>
	 * 
	 * @param perfTeaching PerfTeaching对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfTeaching的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfTeaching(PerfTeaching perfTeaching, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfTeaching, userName);
	}

	/**
	 * <b>查询绩效教学达成</b>
	 * 
	 * @param constraint PerfTeaching的约束条件
	 * @return 查询到的PerfTeaching
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfTeaching selectPerfTeaching(Constraint constraint) throws Exception, RemoteException {
		return (PerfTeaching) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效少儿部门考核</b>
	 * 
	 * @param perfChildren PerfChildren对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfChildren的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfChildren(PerfChildren perfChildren, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfChildren, userName);
	}

	/**
	 * <b>查询绩效少儿部门考核</b>
	 * 
	 * @param constraint PerfChildren的约束条件
	 * @return 查询到的PerfChildren
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfChildren selectPerfChildren(Constraint constraint) throws Exception, RemoteException {
		return (PerfChildren) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效长期班学员及班级管理</b>
	 * 
	 * @param perfLongTerm PerfLongTerm对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfLongTerm的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfLongTerm(PerfLongTerm perfLongTerm, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfLongTerm, userName);
	}

	/**
	 * <b>查询绩效长期班学员及班级管理</b>
	 * 
	 * @param constraint PerfLongTerm的约束条件
	 * @return 查询到的PerfLongTerm
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfLongTerm selectPerfLongTerm(Constraint constraint) throws Exception, RemoteException {
		return (PerfLongTerm) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效短期班班主任及教务管理</b>
	 * 
	 * @param perfShortTerm PerfShortTerm对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfShortTerm的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfShortTerm(PerfShortTerm perfShortTerm, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfShortTerm, userName);
	}

	/**
	 * <b>查询绩效短期班班主任及教务管理</b>
	 * 
	 * @param constraint PerfShortTerm的约束条件
	 * @return 查询到的PerfShortTerm
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfShortTerm selectPerfShortTerm(Constraint constraint) throws Exception, RemoteException {
		return (PerfShortTerm) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效就业管理</b>
	 * 
	 * @param perfObtain PerfObtain对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfObtain的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfObtain(PerfObtain perfObtain, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfObtain, userName);
	}

	/**
	 * <b>查询绩效就业管理</b>
	 * 
	 * @param constraint PerfObtain的约束条件
	 * @return 查询到的PerfObtain
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfObtain selectPerfObtain(Constraint constraint) throws Exception, RemoteException {
		return (PerfObtain) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效招生任务</b>
	 * 
	 * @param perfRecruit PerfRecruit对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfRecruit的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfRecruit(PerfRecruit perfRecruit, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfRecruit, userName);
	}

	/**
	 * <b>查询绩效招生任务</b>
	 * 
	 * @param constraint PerfRecruit的约束条件
	 * @return 查询到的PerfRecruit
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfRecruit selectPerfRecruit(Constraint constraint) throws Exception, RemoteException {
		return (PerfRecruit) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效市场宣传</b>
	 * 
	 * @param perfPropaganda PerfPropaganda对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfPropaganda的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfPropaganda(PerfPropaganda perfPropaganda, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfPropaganda, userName);
	}

	/**
	 * <b>查询绩效市场宣传</b>
	 * 
	 * @param constraint PerfPropaganda的约束条件
	 * @return 查询到的PerfPropaganda
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfPropaganda selectPerfPropaganda(Constraint constraint) throws Exception, RemoteException {
		return (PerfPropaganda) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效行政管理</b>
	 * 
	 * @param perfAdmin PerfAdmin对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfAdmin的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfAdmin(PerfAdmin perfAdmin, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfAdmin, userName);
	}

	/**
	 * <b>查询绩效行政管理</b>
	 * 
	 * @param constraint PerfAdmin的约束条件
	 * @return 查询到的PerfAdmin
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfAdmin selectPerfAdmin(Constraint constraint) throws Exception, RemoteException {
		return (PerfAdmin) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效分校及部门负责人</b>
	 * 
	 * @param perfIncharge PerfIncharge对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfIncharge的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfIncharge(PerfIncharge perfIncharge, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfIncharge, userName);
	}

	/**
	 * <b>查询绩效分校及部门负责人</b>
	 * 
	 * @param constraint PerfIncharge的约束条件
	 * @return 查询到的PerfIncharge
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfIncharge selectPerfIncharge(Constraint constraint) throws Exception, RemoteException {
		return (PerfIncharge) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效司机及总务</b>
	 * 
	 * @param perfDriver PerfDriver对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfDriver的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfDriver(PerfDriver perfDriver, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfDriver, userName);
	}

	/**
	 * <b>查询绩效司机及总务</b>
	 * 
	 * @param constraint PerfDriver的约束条件
	 * @return 查询到的PerfDriver
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfDriver selectPerfDriver(Constraint constraint) throws Exception, RemoteException {
		return (PerfDriver) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效保洁保安</b>
	 * 
	 * @param perfSecurityClean PerfSecurityClean对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfSecurityClean的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfSecurityClean(PerfSecurityClean perfSecurityClean, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfSecurityClean, userName);
	}

	/**
	 * <b>查询绩效保洁保安</b>
	 * 
	 * @param constraint PerfSecurityClean的约束条件
	 * @return 查询到的PerfSecurityClean
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfSecurityClean selectPerfSecurityClean(Constraint constraint) throws Exception, RemoteException {
		return (PerfSecurityClean) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>创建绩效其他</b>
	 * 
	 * @param perfOther PerfOther对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfOther的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerfOther(PerfOther perfOther, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(perfOther, userName);
	}

	/**
	 * <b>查询绩效其他</b>
	 * 
	 * @param constraint PerfOther的约束条件
	 * @return 查询到的PerfOther
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public PerfOther selectPerfOther(Constraint constraint) throws Exception, RemoteException {
		return (PerfOther) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询绩效公共方法</b>
	 * 
	 * @param constraint 绩效的约束条件
	 * @return 查询到的绩效
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Object selectPerformance(Constraint constraint) throws Exception, RemoteException {
		return DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询某岗位绩效类型及所有子节点(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @param jobUuid 某岗位的uuid
	 * @return 查询到的某岗位的PerformanceType及其所有子节点的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<PerformanceType> selectJobPerformanceTypes(Constraint constraint, String jobUuid) throws Exception, RemoteException {
		// 查询指定岗位所具有的权限
		Constraint jobPerfType = new Constraint("JobPerfType");
		jobPerfType.addCondition("jobUuid", jobUuid);
		List<JobPerfType> jobPerfTypeList = selectJobPerfTypes(jobPerfType);
		List<String> performanceTypeUuidList = new ArrayList<String>();
		for (int i = 0; i < jobPerfTypeList.size(); i++) {
			performanceTypeUuidList.add(jobPerfTypeList.get(i).getTypeUuid());
		}
		if (performanceTypeUuidList.size() == 0) {
			// 该岗位没有权限
			return new ArrayList<PerformanceType>();
		}
		constraint.addCondition("uuid", performanceTypeUuidList, Constraint.IN_LIST);

		// 查询绩效类型(list)
		List<PerformanceType> performanceTypesTemp = (List<PerformanceType>) DataManagerStatic.getInstances(constraint);
		List<PerformanceType> performanceTypes = new ArrayList();
		for (int i = 0; i < performanceTypesTemp.size(); i++) {
			PerformanceType performanceType = (PerformanceType) performanceTypesTemp.get(i);
			selectPerformanceTypesChildren(performanceType, performanceTypeUuidList, jobUuid);
			performanceTypes.add(performanceType);
		}

		return performanceTypes;
	}

	/**
	 * <b>递归创建岗位绩效类型</b>
	 * 
	 * @param performanceTypeUuid 创建绩效对应的绩效类型uuid
	 * @param jobUuid 创建绩效对应的岗位uuid
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void insertJobPerfType(String performanceTypeUuid, String jobUuid, String userName) throws Exception, RemoteException {
		Constraint c = new Constraint("JobPerfType");
		c.addCondition("typeUuid", performanceTypeUuid);
		c.addCondition("jobUuid", jobUuid);
		JobPerfType jobPerfType = selectJobPerfType(c);
		if (jobPerfType == null) {
			jobPerfType = new JobPerfType();
			jobPerfType.setTypeUuid(performanceTypeUuid, false);
			jobPerfType.setJobUuid(jobUuid, false);
			DataManagerStatic.createInstance(jobPerfType, userName);
		}
		PerformanceType performanceType = selectPerformanceTypeByUuid(performanceTypeUuid);
		String performanceTypeParentUuid = performanceType.getParentUuid();
		if (performanceTypeParentUuid != null) {
			insertJobPerfType(performanceTypeParentUuid, jobUuid, userName);
		}
	}

	/**
	 * <b>删除岗位绩效类型</b>
	 * 
	 * @param jobPerfType JobPerfType对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void deleteJobPerfType(JobPerfType jobPerfType, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(jobPerfType, userName);
	}

	/**
	 * <b>查询岗位绩效类型(uuid)</b>
	 * 
	 * @param uuid JobPerfType的uuid
	 * @return 查询到的JobPerfType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public JobPerfType selectJobPerfTypeByUuid(String uuid) throws Exception, RemoteException {
		return (JobPerfType) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询岗位绩效类型</b>
	 * 
	 * @param constraint JobPerfType的约束条件
	 * @return 查询到的JobPerfType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public JobPerfType selectJobPerfType(Constraint constraint) throws Exception, RemoteException {
		return (JobPerfType) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询岗位绩效类型(list)</b>
	 * 
	 * @param constraint JobPerfType的约束条件
	 * @return 查询到的JobPerfType的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<JobPerfType> selectJobPerfTypes(Constraint constraint) throws Exception, RemoteException {
		return (List<JobPerfType>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询岗位绩效类型子节点</b>
	 * 
	 * @param uuid PerformanceType的uuid
	 * @param jobUuid 岗位的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<JobPerfType> selectJobPerfTypeChildren(String uuid, String jobUuid, List<JobPerfType> jobPerfTypes) throws Exception, RemoteException {
		if (jobPerfTypes == null) {
			jobPerfTypes = new ArrayList<JobPerfType>();
		}
		Constraint c1 = new Constraint("PerformanceType");
		c1.addCondition("parentUuid", uuid);

		Constraint jobPerfTypeC = new Constraint("JobPerfType");
		if (jobUuid != null)
			jobPerfTypeC.addCondition("jobUuid", jobUuid);

		List<JobPerfType> jobPerfTypeList = selectJobPerfTypes(jobPerfTypeC);
		List<String> performanceTypeUuidList = new ArrayList<String>();
		for (int i = 0; i < jobPerfTypeList.size(); i++) {
			performanceTypeUuidList.add(jobPerfTypeList.get(i).getTypeUuid());
		}

		if (performanceTypeUuidList.size() == 0) {
			// 该岗位没有绩效类型
			return jobPerfTypes;
		}
		if (jobUuid != null) {
			c1.addCondition("uuid", performanceTypeUuidList, Constraint.IN_LIST);
		}

		// 查询绩效类型(list)
		List<PerformanceType> performanceTypesTemp = (List<PerformanceType>) selectPerformanceTypes(c1, null);

		for (int i = 0; i < performanceTypesTemp.size(); i++) {
			PerformanceType performanceType = (PerformanceType) performanceTypesTemp.get(i);
			Constraint jobPerfTypeC2 = new Constraint("JobPerfType");
			jobPerfTypeC2.addCondition("typeUuid", performanceType.getUuid());
			jobPerfTypeC2.addCondition("jobUuid", jobUuid);
			JobPerfType jobPerfType = (JobPerfType) DataManagerStatic.getInstance(jobPerfTypeC2);
			jobPerfTypes.add(jobPerfType);
			selectJobPerfTypeChildren(performanceType.getUuid(), jobUuid, jobPerfTypes);
		}

		return jobPerfTypes;
	}

	/**
	 * <b>递归查询欲删除岗位绩效类型</b>
	 * 
	 * @param uuid 删除绩效对应的绩效类型uuid
	 * @param jobUuid 删除绩效对应的岗位uuid
	 * @return 查询到的JobPerfType的list
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<JobPerfType> selectJobPerfTypeDeleted(String uuid, String jobUuid) throws Exception, RemoteException {
		List<JobPerfType> jobPerfTypeList = new ArrayList<JobPerfType>();

		// 查询岗位绩效类型
		Constraint c = new Constraint("JobPerfType");
		c.addCondition("typeUuid", uuid);
		c.addCondition("jobUuid", jobUuid);
		JobPerfType jobPerfType = selectJobPerfType(c);
		jobPerfTypeList.add(jobPerfType);

		// 递归查询绩效子类型
		selectChildrenJobPerfType(jobPerfTypeList, uuid, jobUuid);

		// 递归查询无子节点的绩效父类型
		PerformanceType performanceType = selectPerformanceTypeByUuid(uuid);
		selectParentsJobPerfType(jobPerfTypeList, performanceType.getParentUuid(), jobUuid);

		return jobPerfTypeList;
	}

	// 递归查询绩效子类型
	private void selectChildrenJobPerfType(List<JobPerfType> jobPerfTypeList, String performanceTypeParentUuid, String jobUuid) throws Exception, RemoteException {
		Constraint performanceTypeC = new Constraint("PerformanceType");
		performanceTypeC.addCondition("parentUuid", performanceTypeParentUuid);
		List<PerformanceType> performanceTypeList = selectPerformanceTypes(performanceTypeC);
		for (int i = 0; i < performanceTypeList.size(); i++) {
			PerformanceType performanceType = performanceTypeList.get(i);

			// 查询绩效子类型
			Constraint jobPerfTypeC = new Constraint("JobPerfType");
			jobPerfTypeC.addCondition("jobUuid", jobUuid);
			jobPerfTypeC.addCondition("typeUuid", performanceType.getUuid());
			JobPerfType jobPerfType = selectJobPerfType(jobPerfTypeC);
			if (jobPerfType != null) {
				jobPerfTypeList.add(jobPerfType);
			}

			// 递归调用
			selectChildrenJobPerfType(jobPerfTypeList, performanceType.getUuid(), jobUuid);
		}
	}

	// 递归查询无子节点的绩效父类型
	private void selectParentsJobPerfType(List<JobPerfType> jobPerfTypeList, String performanceTypeParentUuid, String jobUuid) throws Exception, RemoteException {
		if (performanceTypeParentUuid != null) {
			Constraint performanceTypeC = new Constraint("PerformanceType");
			performanceTypeC.addCondition("parentUuid", performanceTypeParentUuid);
			List<PerformanceType> performanceTypeList = selectPerformanceTypes(performanceTypeC);
			List<String> uuidList = new ArrayList<String>();
			for (int i = 0; i < performanceTypeList.size(); i++) {
				PerformanceType performanceType = performanceTypeList.get(i);
				uuidList.add(performanceType.getUuid());
			}

			if (uuidList.size() > 0) {
				Constraint jobPerfTypeC = new Constraint("JobPerfType");
				jobPerfTypeC.addCondition("jobUuid", jobUuid);
				jobPerfTypeC.addCondition("typeUuid", uuidList, Constraint.IN_LIST);
				List<JobPerfType> authList = selectJobPerfTypes(jobPerfTypeC);
				if (authList.size() == 1) {
					Constraint jobPerfTypeParentC = new Constraint("JobPerfType");
					jobPerfTypeParentC.addCondition("jobUuid", jobUuid);
					jobPerfTypeParentC.addCondition("typeUuid", performanceTypeParentUuid);
					JobPerfType jobPerfType = selectJobPerfType(jobPerfTypeParentC);
					jobPerfTypeList.add(jobPerfType);

					PerformanceType performanceTypeParent = selectPerformanceTypeByUuid(performanceTypeParentUuid);
					selectParentsJobPerfType(jobPerfTypeList, performanceTypeParent.getParentUuid(), jobUuid);
				}
			}
		}
	}
}
