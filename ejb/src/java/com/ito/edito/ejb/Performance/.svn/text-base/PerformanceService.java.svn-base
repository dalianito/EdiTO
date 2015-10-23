package com.ito.edito.ejb.Performance;

import java.rmi.RemoteException;
import java.util.List;

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
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Performance_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
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

public interface PerformanceService {
	/**
	 * <b>查询绩效类型(uuid)</b>
	 * 
	 * @param uuid PerformanceType的uuid
	 * @return 查询到的PerformanceType
	 */
	public PerformanceType selectPerformanceTypeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询绩效类型</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @return 查询到的PerformanceType
	 */
	public PerformanceType selectPerformanceType(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询绩效类型(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @return 查询到的PerformanceType的list
	 */
	public List<PerformanceType> selectPerformanceTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询绩效类型及所有子节点(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @return 查询到的PerformanceType及其所有子节点的list
	 */
	public List<PerformanceType> selectAllPerformanceTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询某员工绩效类型及所有子节点(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @param employeeUuid 某员工的uuid
	 * @return 查询到的某员工的PerformanceType及其所有子节点的list
	 */
	public List<PerformanceType> selectPerformanceTypes(Constraint constraint, String employeeUuid) throws Exception, RemoteException;

	/**
	 * <b>递归创建员工绩效类型</b>
	 * 
	 * @param performanceTypeUuid 创建绩效对应的绩效类型uuid
	 * @param employeeUuid 创建绩效对应的员工uuid
	 * @param userName 执行者的账户名
	 */
	public void insertEmployeePerfType(String performanceTypeUuid, String employeeUuid, String userName) throws Exception, RemoteException;

	/**
	 * <b>创建员工绩效类型</b>
	 * 
	 * @param employeePerfType EmployeePerfType对象
	 * @param userName 执行者的账户名
	 */
	public String insertEmployeePerfType(EmployeePerfType employeePerfType, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除员工绩效类型</b>
	 * 
	 * @param employeePerfType EmployeePerfType对象
	 * @param userName 执行者的账户名
	 */
	public void deleteEmployeePerfType(EmployeePerfType employeePerfType, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效类型(uuid)</b>
	 * 
	 * @param uuid EmployeePerfType的uuid
	 * @return 查询到的EmployeePerfType
	 */
	public EmployeePerfType selectEmployeePerfTypeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效类型</b>
	 * 
	 * @param constraint EmployeePerfType的约束条件
	 * @return 查询到的EmployeePerfType
	 */
	public EmployeePerfType selectEmployeePerfType(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效类型(list)</b>
	 * 
	 * @param constraint EmployeePerfType的约束条件
	 * @return 查询到的EmployeePerfType的list
	 */
	public List<EmployeePerfType> selectEmployeePerfTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效类型子节点</b>
	 * 
	 * @param uuid PerformanceType的uuid
	 * @param employeeUuid 员工的uuid
	 */
	public List<EmployeePerfType> selectEmployeePerfTypeChildren(String uuid, String employeeUuid, List<EmployeePerfType> employeePerfTypes) throws Exception, RemoteException;

	/**
	 * <b>递归查询欲删除员工绩效类型</b>
	 * 
	 * @param uuid 删除绩效对应的绩效类型uuid
	 * @param employeeUuid 删除绩效对应的员工uuid
	 * @return 查询到的EmployeePerfType的list
	 */
	public List<EmployeePerfType> selectEmployeePerfTypeDeleted(String uuid, String employeeUuid) throws Exception, RemoteException;

	/**
	 * <b>创建员工绩效</b>
	 * 
	 * @param employeePerformance EmployeePerformance对象
	 * @param userName 执行者的账户名
	 * @return 创建的EmployeePerformance的uuid
	 */
	public String insertEmployeePerformance(EmployeePerformance employeePerformance, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新员工绩效</b>
	 * 
	 * @param employeePerformance EmployeePerformance对象
	 * @param userName 执行者的账户名
	 */
	public void updateEmployeePerformance(EmployeePerformance employeePerformance, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效(uuid)</b>
	 * 
	 * @param uuid EmployeePerformance的uuid
	 * @return 查询到的EmployeePerformance
	 */
	public EmployeePerformance selectEmployeePerformanceByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效</b>
	 * 
	 * @param constraint EmployeePerformance的约束条件
	 * @return 查询到的EmployeePerformance
	 */
	public EmployeePerformance selectEmployeePerformance(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询员工绩效(list)</b>
	 * 
	 * @param constraint EmployeePerformance的约束条件
	 * @return 查询到的EmployeePerformance的list
	 */
	public List<EmployeePerformance> selectEmployeePerformances(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效考勤</b>
	 * 
	 * @param perfAttendance PerfAttendance对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfAttendance的uuid
	 */
	public String insertPerfAttendance(PerfAttendance perfAttendance, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新绩效考勤</b>
	 * 
	 * @param perfAttendance PerfAttendance对象
	 * @param userName 执行者的账户名
	 */
	public void updatePerfAttendance(PerfAttendance perfAttendance, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效考勤(uuid)</b>
	 * 
	 * @param uuid PerfAttendance的uuid
	 * @return 查询到的PerfAttendance
	 */
	public PerfAttendance selectPerfAttendanceByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询绩效考勤</b>
	 * 
	 * @param constraint PerfAttendance的约束条件
	 * @return 查询到的PerfAttendance
	 */
	public PerfAttendance selectPerfAttendance(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询绩效考勤(list)</b>
	 * 
	 * @param constraint PerfAttendance的约束条件
	 * @return 查询到的PerfAttendance的list
	 */
	public List<PerfAttendance> selectPerfAttendances(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效行为规范</b>
	 * 
	 * @param perfBehaviour PerfBehaviour对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfBehaviour的uuid
	 */
	public String insertPerfBehaviour(PerfBehaviour perfBehaviour, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新绩效行为规范</b>
	 * 
	 * @param perfBehaviour PerfBehaviour对象
	 * @param userName 执行者的账户名
	 */
	public void updatePerfBehaviour(PerfBehaviour perfBehaviour, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效行为规范(uuid)</b>
	 * 
	 * @param uuid PerfBehaviour的uuid
	 * @return 查询到的PerfBehaviour
	 */
	public PerfBehaviour selectPerfBehaviourByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询绩效行为规范</b>
	 * 
	 * @param constraint PerfBehaviour的约束条件
	 * @return 查询到的PerfBehaviour
	 */
	public PerfBehaviour selectPerfBehaviour(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询绩效行为规范(list)</b>
	 * 
	 * @param constraint PerfBehaviour的约束条件
	 * @return 查询到的PerfBehaviour的list
	 */
	public List<PerfBehaviour> selectPerfBehaviours(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效接待管理</b>
	 * 
	 * @param perfReception PerfReception对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfReception的uuid
	 */
	public String insertPerfReception(PerfReception perfReception, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效接待管理</b>
	 * 
	 * @param constraint PerfReception的约束条件
	 * @return 查询到的PerfReception
	 */
	public PerfReception selectPerfReception(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效设施管理</b>
	 * 
	 * @param perfFacility PerfFacility对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfFacility的uuid
	 */
	public String insertPerfFacility(PerfFacility perfFacility, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效设施管理</b>
	 * 
	 * @param constraint PerfFacility的约束条件
	 * @return 查询到的PerfFacility
	 */
	public PerfFacility selectPerfFacility(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效物资管理</b>
	 * 
	 * @param perfMaterial PerfMaterial对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfMaterial的uuid
	 */
	public String insertPerfMaterial(PerfMaterial perfMaterial, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效物资管理</b>
	 * 
	 * @param constraint PerfMaterial的约束条件
	 * @return 查询到的PerfMaterial
	 */
	public PerfMaterial selectPerfMaterial(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效财务管理</b>
	 * 
	 * @param perfFinancial PerfFinancial对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfFinancial的uuid
	 */
	public String insertPerfFinancial(PerfFinancial perfFinancial, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效财务管理</b>
	 * 
	 * @param constraint PerfFinancial的约束条件
	 * @return 查询到的PerfFinancial
	 */
	public PerfFinancial selectPerfFinancial(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效课时统计</b>
	 * 
	 * @param perfLession PerfLession对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfLession的uuid
	 */
	public String insertPerfLession(PerfLession perfLession, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效课时统计</b>
	 * 
	 * @param constraint PerfLession的约束条件
	 * @return 查询到的PerfLession
	 */
	public PerfLession selectPerfLession(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效教学达成</b>
	 * 
	 * @param perfTeaching PerfTeaching对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfTeaching的uuid
	 */
	public String insertPerfTeaching(PerfTeaching perfTeaching, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效教学达成</b>
	 * 
	 * @param constraint PerfTeaching的约束条件
	 * @return 查询到的PerfTeaching
	 */
	public PerfTeaching selectPerfTeaching(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效少儿部门考核</b>
	 * 
	 * @param perfChildren PerfChildren对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfChildren的uuid
	 */
	public String insertPerfChildren(PerfChildren perfChildren, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效少儿部门考核</b>
	 * 
	 * @param constraint PerfChildren的约束条件
	 * @return 查询到的PerfChildren
	 */
	public PerfChildren selectPerfChildren(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效长期班学员及班级管理</b>
	 * 
	 * @param perfLongTerm PerfLongTerm对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfLongTerm的uuid
	 */
	public String insertPerfLongTerm(PerfLongTerm perfLongTerm, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效长期班学员及班级管理</b>
	 * 
	 * @param constraint PerfLongTerm的约束条件
	 * @return 查询到的PerfLongTerm
	 */
	public PerfLongTerm selectPerfLongTerm(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效短期班班主任及教务管理</b>
	 * 
	 * @param perfShortTerm PerfShortTerm对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfShortTerm的uuid
	 */
	public String insertPerfShortTerm(PerfShortTerm perfShortTerm, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效短期班班主任及教务管理</b>
	 * 
	 * @param constraint PerfShortTerm的约束条件
	 * @return 查询到的PerfShortTerm
	 */
	public PerfShortTerm selectPerfShortTerm(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效就业管理</b>
	 * 
	 * @param perfObtain PerfObtain对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfObtain的uuid
	 */
	public String insertPerfObtain(PerfObtain perfObtain, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效就业管理</b>
	 * 
	 * @param constraint PerfObtain的约束条件
	 * @return 查询到的PerfObtain
	 */
	public PerfObtain selectPerfObtain(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效招生任务</b>
	 * 
	 * @param perfRecruit PerfRecruit对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfRecruit的uuid
	 */
	public String insertPerfRecruit(PerfRecruit perfRecruit, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效招生任务</b>
	 * 
	 * @param constraint PerfRecruit的约束条件
	 * @return 查询到的PerfRecruit
	 */
	public PerfRecruit selectPerfRecruit(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效市场宣传</b>
	 * 
	 * @param perfPropaganda PerfPropaganda对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfPropaganda的uuid
	 */
	public String insertPerfPropaganda(PerfPropaganda perfPropaganda, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效市场宣传</b>
	 * 
	 * @param constraint PerfPropaganda的约束条件
	 * @return 查询到的PerfPropaganda
	 */
	public PerfPropaganda selectPerfPropaganda(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效行政管理</b>
	 * 
	 * @param perfAdmin PerfAdmin对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfAdmin的uuid
	 */
	public String insertPerfAdmin(PerfAdmin perfAdmin, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效行政管理</b>
	 * 
	 * @param constraint PerfAdmin的约束条件
	 * @return 查询到的PerfAdmin
	 */
	public PerfAdmin selectPerfAdmin(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效分校及部门负责人</b>
	 * 
	 * @param perfIncharge PerfIncharge对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfIncharge的uuid
	 */
	public String insertPerfIncharge(PerfIncharge perfIncharge, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效分校及部门负责人</b>
	 * 
	 * @param constraint PerfIncharge的约束条件
	 * @return 查询到的PerfIncharge
	 */
	public PerfIncharge selectPerfIncharge(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效司机及总务</b>
	 * 
	 * @param perfDriver PerfDriver对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfDriver的uuid
	 */
	public String insertPerfDriver(PerfDriver perfDriver, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效司机及总务</b>
	 * 
	 * @param constraint PerfDriver的约束条件
	 * @return 查询到的PerfDriver
	 */
	public PerfDriver selectPerfDriver(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效保洁保安</b>
	 * 
	 * @param perfSecurityClean PerfSecurityClean对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfSecurityClean的uuid
	 */
	public String insertPerfSecurityClean(PerfSecurityClean perfSecurityClean, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效保洁保安</b>
	 * 
	 * @param constraint PerfSecurityClean的约束条件
	 * @return 查询到的PerfSecurityClean
	 */
	public PerfSecurityClean selectPerfSecurityClean(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建绩效其他</b>
	 * 
	 * @param perfOther PerfOther对象
	 * @param userName 执行者的账户名
	 * @return 创建的PerfOther的uuid
	 */
	public String insertPerfOther(PerfOther perfOther, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询绩效其他</b>
	 * 
	 * @param constraint PerfOther的约束条件
	 * @return 查询到的PerfOther
	 */
	public PerfOther selectPerfOther(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询绩效公共方法</b>
	 * 
	 * @param constraint 绩效的约束条件
	 * @return 查询到的绩效
	 */
	public Object selectPerformance(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询某岗位绩效类型及所有子节点(list)</b>
	 * 
	 * @param constraint PerformanceType的约束条件
	 * @param jobUuid 某岗位的uuid
	 * @return 查询到的某岗位的PerformanceType及其所有子节点的list
	 */
	public List<PerformanceType> selectJobPerformanceTypes(Constraint constraint, String jobUuid) throws Exception, RemoteException;

	/**
	 * <b>递归创建岗位绩效类型</b>
	 * 
	 * @param performanceTypeUuid 创建绩效对应的绩效类型uuid
	 * @param jobUuid 创建绩效对应的岗位uuid
	 * @param userName 执行者的账户名
	 */
	public void insertJobPerfType(String performanceTypeUuid, String jobUuid, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除岗位绩效类型</b>
	 * 
	 * @param jobPerfType JobPerfType对象
	 * @param userName 执行者的账户名
	 */
	public void deleteJobPerfType(JobPerfType jobPerfType, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询岗位绩效类型(uuid)</b>
	 * 
	 * @param uuid JobPerfType的uuid
	 * @return 查询到的JobPerfType
	 */
	public JobPerfType selectJobPerfTypeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询岗位绩效类型</b>
	 * 
	 * @param constraint JobPerfType的约束条件
	 * @return 查询到的JobPerfType
	 */
	public JobPerfType selectJobPerfType(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询岗位绩效类型(list)</b>
	 * 
	 * @param constraint JobPerfType的约束条件
	 * @return 查询到的JobPerfType的list
	 */
	public List<JobPerfType> selectJobPerfTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询岗位绩效类型子节点</b>
	 * 
	 * @param uuid PerformanceType的uuid
	 * @param jobUuid 岗位的uuid
	 */
	public List<JobPerfType> selectJobPerfTypeChildren(String uuid, String jobUuid, List<JobPerfType> jobPerfTypes) throws Exception, RemoteException;

	/**
	 * <b>递归查询欲删除岗位绩效类型</b>
	 * 
	 * @param uuid 删除绩效对应的绩效类型uuid
	 * @param jobUuid 删除绩效对应的岗位uuid
	 * @return 查询到的JobPerfType的list
	 */
	public List<JobPerfType> selectJobPerfTypeDeleted(String uuid, String jobUuid) throws Exception, RemoteException;
}
