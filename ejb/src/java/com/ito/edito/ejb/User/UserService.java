package com.ito.edito.ejb.User;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.ApprovalAuthority;
import com.ito.edito.schema.ApprovalAuthorityType;
import com.ito.edito.schema.Authority;
import com.ito.edito.schema.Candidates;
import com.ito.edito.schema.Department;
import com.ito.edito.schema.EducateInfo;
import com.ito.edito.schema.EducationExpInfo;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.Job;
import com.ito.edito.schema.JobAuthority;
import com.ito.edito.schema.Menu;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.RelatedFile;
import com.ito.edito.schema.Student;
import com.ito.edito.schema.User;
import com.ito.edito.schema.WorkExperienceInfo;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>User_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Person<br>
 * Employee<br>
 * Student<br>
 * RelatedFile<br>
 * Department<br>
 * Menu<br>
 * User<br>
 * Authority<br>
 * Candidates<br>
 * WorkExperienceInfo<br>
 * EducateInfo<br>
 * ApprovalAuthorityType<br>
 * ApprovalAuthority<br>
 * Job<br>
 * JobAuthority<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

public interface UserService {
	/**
	 * <b>创建人员</b>
	 * 
	 * @param person Person对象
	 * @param userName 执行者的账户名
	 * @return 创建的Person的uuid
	 */
	public String insertPerson(Person person, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新人员</b>
	 * 
	 * @param person Person对象
	 * @param userName 执行者的账户名
	 */
	public void updatePerson(Person person, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询人员(uuid)</b>
	 * 
	 * @param uuid Person的uuid
	 * @return 查询到的Person
	 */
	public Person selectPersonByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询人员</b>
	 * 
	 * @param constraint Person的约束条件
	 * @return 查询到的Person
	 */
	public Person selectPerson(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询人员(list)</b>
	 * 
	 * @param constraint Person的约束条件
	 * @return 查询到的Person的list
	 */
	public List<Person> selectPersons(Constraint constraint) throws Exception, RemoteException;
	
	/**
	 * <b>查询过往教育经历(list)</b>
	 * 
	 * @param constraint EducationExpInfo的约束条件
	 * @return 查询到的EducationExpInfo的list
	 */
	public List<EducationExpInfo> selectEducationExpInfos(Constraint constraint) throws Exception, RemoteException;
	
	/**
	 * <b>创建员工</b>
	 * 
	 * @param employee Employee对象
	 * @param userName 执行者的账户名
	 * @return 创建的Employee的uuid
	 */
	public String insertEmployee(Employee employee, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新员工</b>
	 * 
	 * @param employee Employee对象
	 * @param userName 执行者的账户名
	 */
	public void updateEmployee(Employee employee, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询员工(uuid)</b>
	 * 
	 * @param uuid Employee的uuid
	 * @return 查询到的Employee
	 */
	public Employee selectEmployeeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询员工</b>
	 * 
	 * @param constraint Employee的约束条件
	 * @return 查询到的Employee
	 */
	public Employee selectEmployee(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询员工(list)</b>
	 * 
	 * @param constraint Employee的约束条件
	 * @return 查询到的Employee的list
	 */
	public List<Employee> selectEmployees(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建学员</b>
	 * 
	 * @param student Student对象
	 * @param userName 执行者的账户名
	 * @return 创建的Student的uuid
	 */
	public String insertStudent(Student student, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新学员</b>
	 * 
	 * @param student Student对象
	 * @param userName 执行者的账户名
	 */
	public void updateStudent(Student student, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询学员(uuid)</b>
	 * 
	 * @param uuid Student的uuid
	 * @return 查询到的Student
	 */
	public Student selectStudentByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询学员</b>
	 * 
	 * @param constraint Student的约束条件
	 * @return 查询到的Student
	 */
	public Student selectStudent(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询学员(list)</b>
	 * 
	 * @param constraint Student的约束条件
	 * @return 查询到的Student的list
	 */
	public List<Student> selectStudents(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建相关文件</b>
	 * 
	 * @param relatedFile RelatedFile对象
	 * @param userName 执行者的账户名
	 * @return 创建的RelatedFile的uuid
	 */
	public String insertRelatedFile(RelatedFile relatedFile, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除相关文件</b>
	 * 
	 * @param relatedFile RelatedFile对象
	 * @param userName 执行者的账户名
	 */
	public void deleteRelatedFile(RelatedFile relatedFile, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询相关文件(uuid)</b>
	 * 
	 * @param uuid RelatedFile的uuid
	 * @return 查询到的RelatedFile
	 */
	public RelatedFile selectRelatedFileByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询相关文件(list)</b>
	 * 
	 * @param constraint RelatedFile的约束条件
	 * @return 查询到的RelatedFile的list
	 */
	public List<RelatedFile> selectRelatedFiles(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建组织机构</b>
	 * 
	 * @param department Department对象
	 * @param userName 执行者的账户名
	 * @return 创建的Department的uuid
	 */
	public String insertDepartment(Department department, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新组织机构</b>
	 * 
	 * @param department Department对象
	 * @param userName 执行者的账户名
	 */
	public void updateDepartment(Department department, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询组织机构(uuid)</b>
	 * 
	 * @param uuid Department的uuid
	 * @return 查询到的Department
	 */
	public Department selectDepartmentByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询组织机构</b>
	 * 
	 * @param constraint Department的约束条件
	 * @return 查询到的Department
	 */
	public Department selectDepartment(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询组织机构(list)</b>
	 * 
	 * @param constraint Department的约束条件
	 * @return 查询到的Department的list
	 */
	public List<Department> selectDepartments(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建岗位</b>
	 * 
	 * @param job Job对象
	 * @param userName 执行者的账户名
	 * @return 创建的Job的uuid
	 */
	public String insertJob(Job job, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新岗位</b>
	 * 
	 * @param job Job对象
	 * @param userName 执行者的账户名
	 */
	public void updateJob(Job job, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询岗位(uuid)</b>
	 * 
	 * @param uuid Job的uuid
	 * @return 查询到的Job
	 */
	public Job selectJobByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询岗位</b>
	 * 
	 * @param constraint Job的约束条件
	 * @return 查询到的Job
	 */
	public Job selectJob(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询岗位(list)</b>
	 * 
	 * @param constraint Job的约束条件
	 * @return 查询到的Job的list
	 */
	public List<Job> selectJobs(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询功能菜单(uuid)</b>
	 * 
	 * @param uuid Menu的uuid
	 * @return 查询到的Menu
	 */
	public Menu selectMenuByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询功能菜单</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @return 查询到的Menu
	 */
	public Menu selectMenu(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询功能菜单(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @return 查询到的Menu的list
	 */
	public List<Menu> selectMenus(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询功能菜单及所有子节点(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @return 查询到的Menu及其所有子节点的list
	 */
	public List<Menu> selectAllMenus(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询某用户功能菜单及所有子节点(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @param userUuid 某用户的uuid
	 * @return 查询到的某用户的Menu及其所有子节点的list
	 */
	public List<Menu> selectMenus(Constraint constraint, String userUuid) throws Exception, RemoteException;

	/**
	 * <b>创建用户</b>
	 * 
	 * @param user User对象
	 * @param userName 执行者的账户名
	 * @return 创建的User的uuid
	 */
	public String insertUser(User user, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新用户</b>
	 * 
	 * @param user User对象
	 * @param userName 执行者的账户名
	 */
	public void updateUser(User user, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询用户(uuid)</b>
	 * 
	 * @param uuid User的uuid
	 * @return 查询到的User
	 */
	public User selectUserByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询用户</b>
	 * 
	 * @param constraint User的约束条件
	 * @return 查询到的User
	 */
	public User selectUser(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询用户(list)</b>
	 * 
	 * @param constraint User的约束条件
	 * @return 查询到的User的list
	 */
	public List<User> selectUsers(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>递归创建系统角色</b>
	 * 
	 * @param menuUuid 创建权限对应的功能菜单uuid
	 * @param userUuid 创建权限对应的用户uuid
	 * @param userName 执行者的账户名
	 */
	public void insertAuthority(String menuUuid, String userUuid, String userName) throws Exception, RemoteException;

	/**
	 * <b>创建系统角色</b>
	 * 
	 * @param authority Authority对象
	 * @param userName 执行者的账户名
	 */
	public String insertAuthority(Authority authority, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除系统角色</b>
	 * 
	 * @param authority Authority对象
	 * @param userName 执行者的账户名
	 */
	public void deleteAuthority(Authority authority, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询系统角色(uuid)</b>
	 * 
	 * @param uuid Authority的uuid
	 * @return 查询到的Authority
	 */
	public Authority selectAuthorityByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询系统角色</b>
	 * 
	 * @param constraint Authority的约束条件
	 * @return 查询到的Authority
	 */
	public Authority selectAuthority(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询系统角色(list)</b>
	 * 
	 * @param constraint Authority的约束条件
	 * @return 查询到的Authority的list
	 */
	public List<Authority> selectAuthoritys(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询系统角色子节点</b>
	 * 
	 * @param menuParentUuid Menu的uuid
	 * @param userUuid User的uuid
	 * @param userName 执行者的账户名
	 */
	public List<Authority> selectAuthorityChildren(String menuParentUuid, String userUuid, String userName, List<Authority> authoritys) throws Exception, RemoteException;

	/**
	 * <b>递归查询欲删除系统角色</b>
	 * 
	 * @param menuUuid 删除权限对应的功能菜单uuid
	 * @param userUuid 删除权限对应的用户uuid
	 * @param userName 执行者的账户名
	 * @return 查询到的Authority的list
	 */
	public List<Authority> selectAuthorityDeleted(String menuUuid, String userUuid, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>创建应聘</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * workExperienceInfo<br>
	 * educateInfoList<br>
	 * 
	 * @param candidates Candidates对象
	 * @param userName 执行者的账户名
	 * @return 创建的Candidates的uuid
	 */
	public String insertCandidates(Candidates candidates, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新应聘</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * workExperienceInfo<br>
	 * educateInfoList<br>
	 * 
	 * @param candidates Candidates对象
	 * @param userName 执行者的账户名
	 */
	public void updateCandidates(Candidates candidates, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询应聘(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Candidates中：<br>
	 * workExperienceInfo<br>
	 * educateInfoList<br>
	 * 
	 * @param uuid Candidates的uuid
	 * @return 查询到的Candidates
	 */
	public Candidates selectCandidatesByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询应聘</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Candidates中：<br>
	 * workExperienceInfo<br>
	 * educateInfoList<br>
	 * 
	 * @param constraint Candidates的约束条件
	 * @return 查询到的Candidates
	 */
	public Candidates selectCandidates(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询应聘(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Candidates(list)中：<br>
	 * workExperienceInfo<br>
	 * educateInfoList<br>
	 * 
	 * @param constraint Candidates的约束条件
	 * @return 查询到的Candidates的list
	 */
	public List<Candidates> selectCandidatess(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询工作经历(list)</b>
	 * 
	 * @param constraint WorkExperienceInfo的约束条件
	 * @return 查询到的WorkExperienceInfo的list
	 */
	public List<WorkExperienceInfo> selectWorkExperienceInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询教育背景(list)</b>
	 * 
	 * @param constraint EducateInfo的约束条件
	 * @return 查询到的EducateInfo的list
	 */
	public List<EducateInfo> selectEducateInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询审批权限类型(list)</b>
	 * 
	 * @param constraint ApprovalAuthorityType的约束条件
	 * @return 查询到的ApprovalAuthorityType的list
	 */
	public List<ApprovalAuthorityType> selectApprovalAuthorityTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建审批权限</b>
	 * 
	 * @param approvalAuthority ApprovalAuthority对象
	 * @param userName 执行者的账户名
	 * @return 创建的User的uuid
	 */
	public String insertApprovalAuthority(ApprovalAuthority approvalAuthority, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除审批权限</b>
	 * 
	 * @param approvalAuthority ApprovalAuthority对象
	 * @param userName 执行者的账户名
	 */
	public void deleteApprovalAuthority(ApprovalAuthority approvalAuthority, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询审批权限</b>
	 * 
	 * @param constraint ApprovalAuthority的约束条件
	 * @return 查询到的ApprovalAuthority
	 */
	public ApprovalAuthority selectApprovalAuthority(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询审批权限(list)</b>
	 * 
	 * @param constraint ApprovalAuthority的约束条件
	 * @return 查询到的ApprovalAuthority的list
	 */
	public List<ApprovalAuthority> selectApprovalAuthoritys(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询某岗位功能菜单及所有子节点(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @param jobUuid 某岗位的uuid
	 * @return 查询到的某岗位的Menu及其所有子节点的list
	 */
	public List<Menu> selectJobMenus(Constraint constraint, String jobUuid) throws Exception, RemoteException;

	/**
	 * <b>递归创建岗位系统角色</b>
	 * 
	 * @param menuUuid 创建权限对应的功能菜单uuid
	 * @param jobUuid 创建权限对应的岗位uuid
	 * @param userName 执行者的账户名
	 */
	public void insertJobAuthority(String menuUuid, String jobUuid, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除岗位系统角色</b>
	 * 
	 * @param jobAuthority JobAuthority对象
	 * @param userName 执行者的账户名
	 */
	public void deleteJobAuthority(JobAuthority jobAuthority, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询岗位系统角色(uuid)</b>
	 * 
	 * @param uuid JobAuthority的uuid
	 * @return 查询到的JobAuthority
	 */
	public JobAuthority selectJobAuthorityByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询岗位系统角色</b>
	 * 
	 * @param constraint JobAuthority的约束条件
	 * @return 查询到的JobAuthority
	 */
	public JobAuthority selectJobAuthority(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询岗位系统角色(list)</b>
	 * 
	 * @param constraint JobAuthority的约束条件
	 * @return 查询到的JobAuthority的list
	 */
	public List<JobAuthority> selectJobAuthoritys(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询岗位系统角色子节点</b>
	 * 
	 * @param menuParentUuid Menu的uuid
	 * @param jobUuid User的uuid
	 * @param userName 执行者的账户名
	 */
	public List<JobAuthority> selectJobAuthorityChildren(String menuParentUuid, String jobUuid, String userName, List<JobAuthority> jobAuthoritys) throws Exception, RemoteException;

	/**
	 * <b>递归查询欲删除岗位系统角色</b>
	 * 
	 * @param menuUuid 删除权限对应的功能菜单uuid
	 * @param jobUuid 删除权限对应的岗位uuid
	 * @param userName 执行者的账户名
	 * @return 查询到的JobAuthority的list
	 */
	public List<JobAuthority> selectJobAuthorityDeleted(String menuUuid, String jobUuid, String userName) throws Exception, RemoteException;
}
