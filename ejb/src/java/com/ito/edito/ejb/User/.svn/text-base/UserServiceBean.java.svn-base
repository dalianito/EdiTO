package com.ito.edito.ejb.User;

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
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>User_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
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

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class UserServiceBean extends CastorDataManager implements UserServiceRemote {
	/**
	 * <b>创建人员</b> 方法中还包含对下列字段关联表进行创建：<br>
	 * educationExpInfo<br>
	 * 
	 * @param person Person对象
	 * @param userName 执行者的账户名
	 * @return 创建的Person的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertPerson(Person person, String userName) throws Exception, RemoteException {
		// 创建学员信息
		String personUuid = DataManagerStatic.createInstance(person, userName);

		// 创建过往教育经历
		List<EducationExpInfo> educationExpInfofoList = person.getEducationExpInfosAsReference();
		for (int i = 0; i < educationExpInfofoList.size(); i++) {
			EducationExpInfo educationExpInfo = educationExpInfofoList.get(i);
			educationExpInfo.setBizDataUuid(personUuid, false);
			DataManagerStatic.createInstance(educationExpInfo, userName);
		}

		return personUuid;
	}

	/**
	 * <b>更新人员</b> 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * educationExpInfo<br>
	 * 
	 * @param person Person对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updatePerson(Person person, String userName) throws Exception, RemoteException {
		// 更新过往授课经历
		List<EducationExpInfo> educationExpInfoList = person.getEducationExpInfosAsReference();
		for (int i = 0; i < educationExpInfoList.size(); i++) {
			EducationExpInfo educationExpInfo = educationExpInfoList.get(i);
			if (educationExpInfo.getOperationStatus().equals("0")) {
				educationExpInfo.setBizDataUuid(person.getUuid(), false);
				DataManagerStatic.createInstance(educationExpInfo, userName);
			}
			else if (educationExpInfo.getOperationStatus().equals("1")) {
				educationExpInfo.setBizDataUuid(person.getUuid(), false);
				DataManagerStatic.updateInstance(educationExpInfo, userName);
			}
			else if (educationExpInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(educationExpInfo, userName);
			}
		}

		// 更新学员信息
		DataManagerStatic.updateInstance(person, userName);
	}

	/**
	 * <b>查询人员(uuid)</b> 方法中还包含对下列字段关联表进行查询，并放入Person中：<br>
	 * educationExpInfo<br>
	 * 
	 * @param uuid Person的uuid
	 * @return 查询到的Person
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Person selectPersonByUuid(String uuid) throws Exception, RemoteException {
		// 查询学员信息(uuid)
		Person person = (Person) DataManagerStatic.getInstance(uuid);

		// 查询过往教育经历
		Constraint educationExpInfo = new Constraint("EducationExpInfo");
		educationExpInfo.addCondition("bizDataUuid", person.getUuid());
		person.setEducationExpInfos((List<EducationExpInfo>) DataManagerStatic.getInstances(educationExpInfo));

		return person;
	}

	/**
	 * <b>查询人员</b> 方法中还包含对下列字段关联表进行查询，并放入Person中：<br>
	 * educationExpInfo<br>
	 * 
	 * @param constraint Person的约束条件
	 * @return 查询到的Person
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Person selectPerson(Constraint constraint) throws Exception, RemoteException {
		// 查询学员信息
		Person person = (Person) DataManagerStatic.getInstance(constraint);

		if (person != null) {
			// 查询过往授课经历
			Constraint educationExpInfo = new Constraint("EducationExpInfo");
			educationExpInfo.addCondition("bizDataUuid", person.getUuid());
			person.setEducationExpInfos((List<EducationExpInfo>) DataManagerStatic.getInstances(educationExpInfo));
		}

		return person;
	}

	/**
	 * <b>查询人员(list)</b> 方法中还包含对下列字段关联表进行查询，并放入Person(List)中：<br>
	 * educationExpInfo<br>
	 * 
	 * @param constraint Person的约束条件
	 * @return 查询到的Person的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Person> selectPersons(Constraint constraint) throws Exception, RemoteException {
		// 查询学员信息(list)
		List<Person> personTemp = (List<Person>) DataManagerStatic.getInstances(constraint);
		List<Person> persons = new ArrayList();
		for (int i = 0; i < personTemp.size(); i++) {
			Person person = personTemp.get(i);

			// 查询过往教育经历
			Constraint educationExpInfo = new Constraint("EducationExpInfo");
			educationExpInfo.addCondition("bizDataUuid", person.getUuid());
			person.setEducationExpInfos((List<EducationExpInfo>) DataManagerStatic.getInstances(educationExpInfo));

			persons.add(person);
		}

		return persons;
	}

	/**
	 * <b>查询过往教育经历(list)</b>
	 * 
	 * @param constraint EducationExpInfo的约束条件
	 * @return 查询到的EducationExpInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<EducationExpInfo> selectEducationExpInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<EducationExpInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建员工</b>
	 * 
	 * @param employee Employee对象
	 * @param userName 执行者的账户名
	 * @return 创建的Employee的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertEmployee(Employee employee, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(employee, userName);
	}

	/**
	 * <b>更新员工</b>
	 * 
	 * @param employee Employee对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateEmployee(Employee employee, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(employee, userName);
	}

	/**
	 * <b>查询员工(uuid)</b>
	 * 
	 * @param uuid Employee的uuid
	 * @return 查询到的Employee
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Employee selectEmployeeByUuid(String uuid) throws Exception, RemoteException {
		return (Employee) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询员工</b>
	 * 
	 * @param constraint Employee的约束条件
	 * @return 查询到的Employee
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Employee selectEmployee(Constraint constraint) throws Exception, RemoteException {
		return (Employee) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询员工(list)</b>
	 * 
	 * @param constraint Employee的约束条件
	 * @return 查询到的Employee的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Employee> selectEmployees(Constraint constraint) throws Exception, RemoteException {
		return (List<Employee>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建学员</b>
	 * 
	 * @param student Student对象
	 * @param userName 执行者的账户名
	 * @return 创建的Student的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertStudent(Student student, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(student, userName);
	}

	/**
	 * <b>更新学员</b>
	 * 
	 * @param student Student对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateStudent(Student student, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(student, userName);
	}

	/**
	 * <b>查询学员(uuid)</b>
	 * 
	 * @param uuid Student的uuid
	 * @return 查询到的Student
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Student selectStudentByUuid(String uuid) throws Exception, RemoteException {
		return (Student) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询学员</b>
	 * 
	 * @param constraint Student的约束条件
	 * @return 查询到的Student
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Student selectStudent(Constraint constraint) throws Exception, RemoteException {
		return (Student) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询学员(list)</b>
	 * 
	 * @param constraint Student的约束条件
	 * @return 查询到的Student的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Student> selectStudents(Constraint constraint) throws Exception, RemoteException {
		return (List<Student>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建相关文件</b>
	 * 
	 * @param relatedFile RelatedFile对象
	 * @param userName 执行者的账户名
	 * @return 创建的RelatedFile的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertRelatedFile(RelatedFile relatedFile, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(relatedFile, userName);
	}

	/**
	 * <b>删除相关文件</b>
	 * 
	 * @param relatedFile RelatedFile对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteRelatedFile(RelatedFile relatedFile, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(relatedFile, userName);
	}

	/**
	 * <b>查询相关文件(uuid)</b>
	 * 
	 * @param uuid RelatedFile的uuid
	 * @return 查询到的RelatedFile
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public RelatedFile selectRelatedFileByUuid(String uuid) throws Exception, RemoteException {
		return (RelatedFile) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询相关文件(list)</b>
	 * 
	 * @param constraint RelatedFile的约束条件
	 * @return 查询到的RelatedFile的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<RelatedFile> selectRelatedFiles(Constraint constraint) throws Exception, RemoteException {
		return (List<RelatedFile>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建组织机构</b>
	 * 
	 * @param department Department对象
	 * @param userName 执行者的账户名
	 * @return 创建的Department的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertDepartment(Department department, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(department, userName);
	}

	/**
	 * <b>更新组织机构</b>
	 * 
	 * @param department Department对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateDepartment(Department department, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(department, userName);
	}

	/**
	 * <b>查询组织机构(uuid)</b>
	 * 
	 * @param uuid Department的uuid
	 * @return 查询到的Department
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Department selectDepartmentByUuid(String uuid) throws Exception, RemoteException {
		return (Department) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询组织机构</b>
	 * 
	 * @param constraint Department的约束条件
	 * @return 查询到的Department
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Department selectDepartment(Constraint constraint) throws Exception, RemoteException {
		return (Department) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询组织机构(list)</b>
	 * 
	 * @param constraint Department的约束条件
	 * @return 查询到的Department的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Department> selectDepartments(Constraint constraint) throws Exception, RemoteException {
		return (List<Department>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建岗位</b>
	 * 
	 * @param job Job对象
	 * @param userName 执行者的账户名
	 * @return 创建的Job的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertJob(Job job, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(job, userName);
	}

	/**
	 * <b>更新岗位</b>
	 * 
	 * @param job Job对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateJob(Job job, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(job, userName);
	}

	/**
	 * <b>查询岗位(uuid)</b>
	 * 
	 * @param uuid Job的uuid
	 * @return 查询到的Job
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Job selectJobByUuid(String uuid) throws Exception, RemoteException {
		return (Job) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询岗位</b>
	 * 
	 * @param constraint Job的约束条件
	 * @return 查询到的Job
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Job selectJob(Constraint constraint) throws Exception, RemoteException {
		return (Job) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询岗位(list)</b>
	 * 
	 * @param constraint Job的约束条件
	 * @return 查询到的Job的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Job> selectJobs(Constraint constraint) throws Exception, RemoteException {
		return (List<Job>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询功能菜单(uuid)</b>
	 * 
	 * @param uuid Menu的uuid
	 * @return 查询到的Menu
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Menu selectMenuByUuid(String uuid) throws Exception, RemoteException {
		return (Menu) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询功能菜单</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @return 查询到的Menu
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Menu selectMenu(Constraint constraint) throws Exception, RemoteException {
		return (Menu) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询功能菜单(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @return 查询到的Menu的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Menu> selectMenus(Constraint constraint) throws Exception, RemoteException {
		return (List<Menu>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询功能菜单及所有子节点(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @return 查询到的Menu及其所有子节点的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Menu> selectAllMenus(Constraint constraint) throws Exception, RemoteException {
		List<Menu> menusTemp = (List<Menu>) DataManagerStatic.getInstances(constraint);
		List<Menu> menus = new ArrayList();
		for (int i = 0; i < menusTemp.size(); i++) {
			Menu menu = (Menu) menusTemp.get(i);
			selectMenusChildren(menu, null, null);
			menus.add(menu);
		}
		return menus;
	}

	/**
	 * <b>查询某用户功能菜单及所有子节点(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @param userUuid 某用户的uuid
	 * @return 查询到的某用户的Menu及其所有子节点的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Menu> selectMenus(Constraint constraint, String userUuid) throws Exception, RemoteException {
		// 查询指定用户所具有的权限
		Constraint authority = new Constraint("Authority");
		authority.addCondition("userUuid", userUuid);
		List<Authority> authorityList = selectAuthoritys(authority);
		List<String> menuUuidList = new ArrayList<String>();
		for (int i = 0; i < authorityList.size(); i++) {
			menuUuidList.add(authorityList.get(i).getMenuUuid());
		}
		if (menuUuidList.size() == 0) {
			// 该User没有权限
			return new ArrayList();
		}
		constraint.addCondition("uuid", menuUuidList, Constraint.IN_LIST);

		// 查询功能菜单(list)
		List<Menu> menusTemp = (List<Menu>) DataManagerStatic.getInstances(constraint);
		List<Menu> menus = new ArrayList();
		for (int i = 0; i < menusTemp.size(); i++) {
			Menu menu = (Menu) menusTemp.get(i);
			selectMenusChildren(menu, menuUuidList, userUuid);
			menus.add(menu);
		}
		return menus;
	}

	// 查询功能菜单子节点(list)
	@SuppressWarnings("unchecked")
	private void selectMenusChildren(Menu menu, List<String> menuUuidList, String userUuid) throws Exception {
		Constraint menuChildren = new Constraint("Menu");
		if (userUuid != null) {
			menuChildren.addCondition("uuid", menuUuidList, Constraint.IN_LIST);
		}
		menuChildren.addCondition("parentUuid", menu.getUuid());
		menuChildren.addOrderCondition("sequence", "asc");
		List<Menu> menuChildrenTemp = (List<Menu>) DataManagerStatic.getInstances(menuChildren);
		ArrayList menusChildren = new ArrayList();
		int i;
		int size = menuChildrenTemp.size();
		for (i = 0; i < size; i++) {
			Menu menuChild = (Menu) menuChildrenTemp.get(i);
			selectMenusChildren(menuChild, menuUuidList, userUuid);
			menusChildren.add(menuChild);
		}
		menu.setChild(String.valueOf(size));
		menu.setChildrens(menusChildren);
	}

	/**
	 * <b>创建用户</b>
	 * 
	 * @param user User对象
	 * @param userName 执行者的账户名
	 * @return 创建的User的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertUser(User user, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(user, userName);
	}

	/**
	 * <b>更新用户</b>
	 * 
	 * @param user User对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateUser(User user, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(user, userName);
	}

	/**
	 * <b>查询用户(uuid)</b>
	 * 
	 * @param uuid User的uuid
	 * @return 查询到的User
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public User selectUserByUuid(String uuid) throws Exception, RemoteException {
		return (User) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询用户</b>
	 * 
	 * @param constraint User的约束条件
	 * @return 查询到的User
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public User selectUser(Constraint constraint) throws Exception, RemoteException {
		return (User) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询用户(list)</b>
	 * 
	 * @param constraint User的约束条件
	 * @return 查询到的User的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<User> selectUsers(Constraint constraint) throws Exception, RemoteException {
		return (List<User>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>递归创建系统角色</b>
	 * 
	 * @param menuUuid 创建权限对应的功能菜单uuid
	 * @param userUuid 创建权限对应的用户uuid
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void insertAuthority(String menuUuid, String userUuid, String userName) throws Exception, RemoteException {
		Constraint c = new Constraint("Authority");
		c.addCondition("menuUuid", menuUuid);
		c.addCondition("userUuid", userUuid);
		Authority authority = selectAuthority(c);
		if (authority == null) {
			authority = new Authority();
			authority.setMenuUuid(menuUuid, false);
			authority.setUserUuid(userUuid, false);
			DataManagerStatic.createInstance(authority, userName);
		}
		Menu menu = selectMenuByUuid(menuUuid);
		String menuParentUuid = menu.getParentUuid();
		if (menuParentUuid != null) {
			insertAuthority(menuParentUuid, userUuid, userName);
		}
	}

	/**
	 * <b>创建系统角色</b>
	 * 
	 * @param authority Authority对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public String insertAuthority(Authority authority, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(authority, userName);
	}

	/**
	 * <b>删除系统角色</b>
	 * 
	 * @param authority Authority对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void deleteAuthority(Authority authority, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(authority, userName);
	}

	/**
	 * <b>查询系统角色(uuid)</b>
	 * 
	 * @param uuid Authority的uuid
	 * @return 查询到的Authority
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Authority selectAuthorityByUuid(String uuid) throws Exception, RemoteException {
		return (Authority) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询系统角色</b>
	 * 
	 * @param constraint Authority的约束条件
	 * @return 查询到的Authority
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Authority selectAuthority(Constraint constraint) throws Exception, RemoteException {
		return (Authority) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询系统角色(list)</b>
	 * 
	 * @param constraint Authority的约束条件
	 * @return 查询到的Authority的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Authority> selectAuthoritys(Constraint constraint) throws Exception, RemoteException {
		return (List<Authority>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询系统角色子节点</b>
	 * 
	 * @param menuParentUuid Menu的uuid
	 * @param userUuid User的uuid
	 * @param userName 执行者的账户名
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Authority> selectAuthorityChildren(String menuParentUuid, String userUuid, String userName, List<Authority> authoritys) throws Exception, RemoteException {
		if (authoritys == null) {
			authoritys = new ArrayList();
		}
		Constraint c1 = new Constraint("Menu");
		c1.addCondition("parentUuid", menuParentUuid);

		Constraint authorityC = new Constraint("Authority");
		if (userUuid != null)
			authorityC.addCondition("userUuid", userUuid);

		List<Authority> authorityList = selectAuthoritys(authorityC);
		List<String> menuUuidList = new ArrayList<String>();
		for (int i = 0; i < authorityList.size(); i++) {
			menuUuidList.add(authorityList.get(i).getMenuUuid());
		}

		if (menuUuidList.size() == 0) {
			// 该User没有权限
			return authoritys;
		}
		if (userUuid != null) {
			c1.addCondition("uuid", menuUuidList, Constraint.IN_LIST);
		}

		// 查询功能菜单(list)
		List<Menu> menusTemp = (List<Menu>) selectMenus(c1, null);

		for (int i = 0; i < menusTemp.size(); i++) {
			Menu menu = (Menu) menusTemp.get(i);
			Constraint authorityC2 = new Constraint("Authority");
			authorityC2.addCondition("menuUuid", menu.getUuid());
			authorityC2.addCondition("userUuid", userUuid);
			Authority authority = (Authority) DataManagerStatic.getInstance(authorityC2);
			authoritys.add(authority);
			selectAuthorityChildren(menu.getUuid(), userUuid, userName, authoritys);
		}
		return authoritys;
	}

	/**
	 * <b>递归查询欲删除系统角色</b>
	 * 
	 * @param menuUuid 删除权限对应的功能菜单uuid
	 * @param userUuid 删除权限对应的用户uuid
	 * @param userName 执行者的账户名
	 * @return 查询到的Authority的list
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Authority> selectAuthorityDeleted(String menuUuid, String userUuid, String userName) throws Exception, RemoteException {
		List<Authority> authorityList = new ArrayList<Authority>();

		// 查询系统角色
		Constraint c = new Constraint("Authority");
		c.addCondition("menuUuid", menuUuid);
		c.addCondition("userUuid", userUuid);
		Authority authority = selectAuthority(c);
		authorityList.add(authority);

		// 递归查询系统子角色
		selectChildrenAuthority(authorityList, menuUuid, userUuid, userName);

		// 递归查询无子节点的系统父角色
		Menu menu = selectMenuByUuid(menuUuid);
		selectParentsAuthority(authorityList, menu.getParentUuid(), userUuid, userName);

		return authorityList;
	}

	// 递归查询系统子角色
	private void selectChildrenAuthority(List<Authority> authorityList, String menuParentUuid, String userUuid, String userName) throws Exception, RemoteException {
		Constraint menuC = new Constraint("Menu");
		menuC.addCondition("parentUuid", menuParentUuid);
		List<Menu> menuList = selectMenus(menuC);
		for (int i = 0; i < menuList.size(); i++) {
			Menu menu = menuList.get(i);

			// 查询系统子角色
			Constraint authorityC = new Constraint("Authority");
			authorityC.addCondition("userUuid", userUuid);
			authorityC.addCondition("menuUuid", menu.getUuid());
			Authority authority = selectAuthority(authorityC);
			if (authority != null) {
				authorityList.add(authority);
			}

			// 递归调用
			selectChildrenAuthority(authorityList, menu.getUuid(), userUuid, userName);
		}
	}

	// 递归查询无子节点的系统父角色
	private void selectParentsAuthority(List<Authority> authorityList, String menuParentUuid, String userUuid, String userName) throws Exception, RemoteException {
		if (menuParentUuid != null) {
			Constraint menuC = new Constraint("Menu");
			menuC.addCondition("parentUuid", menuParentUuid);
			List<Menu> menuList = selectMenus(menuC);
			List<String> uuidList = new ArrayList<String>();
			for (int i = 0; i < menuList.size(); i++) {
				Menu menu = menuList.get(i);
				uuidList.add(menu.getUuid());
			}

			if (uuidList.size() > 0) {
				Constraint authorityC = new Constraint("Authority");
				authorityC.addCondition("userUuid", userUuid);
				authorityC.addCondition("menuUuid", uuidList, Constraint.IN_LIST);
				List<Authority> authList = selectAuthoritys(authorityC);
				if (authList.size() == 1) {
					Constraint authorityParentC = new Constraint("Authority");
					authorityParentC.addCondition("userUuid", userUuid);
					authorityParentC.addCondition("menuUuid", menuParentUuid);
					Authority authority = selectAuthority(authorityParentC);
					authorityList.add(authority);

					Menu menuParent = selectMenuByUuid(menuParentUuid);
					selectParentsAuthority(authorityList, menuParent.getParentUuid(), userUuid, userName);
				}
			}
		}
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertCandidates(Candidates candidates, String userName) throws Exception, RemoteException {
		// 创建应聘
		String candidatesUuid = DataManagerStatic.createInstance(candidates, userName);

		// 工作经验信息
		List<WorkExperienceInfo> workExperienceInfoList = candidates.getWorkExperienceInfosAsReference();
		for (int i = 0; i < workExperienceInfoList.size(); i++) {
			WorkExperienceInfo workExperienceInfo = workExperienceInfoList.get(i);
			workExperienceInfo.setBizDataUuid(candidatesUuid, false);
			DataManagerStatic.createInstance(workExperienceInfo, userName);
		}

		// 教育背景信息
		List<EducateInfo> educateInfoList = candidates.getEducateInfosAsReference();
		for (int i = 0; i < educateInfoList.size(); i++) {
			EducateInfo educateInfo = educateInfoList.get(i);
			educateInfo.setBizDataUuid(candidatesUuid, false);
			DataManagerStatic.createInstance(educateInfo, userName);
		}

		return candidatesUuid;
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateCandidates(Candidates candidates, String userName) throws Exception, RemoteException {
		// 工作经验信息
		List<WorkExperienceInfo> workExperienceInfoList = candidates.getWorkExperienceInfosAsReference();
		for (int i = 0; i < workExperienceInfoList.size(); i++) {
			WorkExperienceInfo workExperienceInfo = workExperienceInfoList.get(i);
			if (workExperienceInfo.getOperationStatus().equals("0")) {
				workExperienceInfo.setBizDataUuid(candidates.getUuid(), false);
				DataManagerStatic.createInstance(workExperienceInfo, userName);
			}
			else if (workExperienceInfo.getOperationStatus().equals("1")) {
				workExperienceInfo.setBizDataUuid(candidates.getUuid(), false);
				DataManagerStatic.updateInstance(workExperienceInfo, userName);
			}
			else if (workExperienceInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(workExperienceInfo, userName);
			}
		}

		// 教育背景信息
		List<EducateInfo> educateInfoList = candidates.getEducateInfosAsReference();
		for (int i = 0; i < educateInfoList.size(); i++) {
			EducateInfo educateInfo = educateInfoList.get(i);
			if (educateInfo.getOperationStatus().equals("0")) {
				educateInfo.setBizDataUuid(candidates.getUuid(), false);
				DataManagerStatic.createInstance(educateInfo, userName);
			}
			else if (educateInfo.getOperationStatus().equals("1")) {
				educateInfo.setBizDataUuid(candidates.getUuid(), false);
				DataManagerStatic.updateInstance(educateInfo, userName);
			}
			else if (educateInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(educateInfo, userName);
			}
		}

		// 更新应聘
		DataManagerStatic.updateInstance(candidates, userName);
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Candidates selectCandidatesByUuid(String uuid) throws Exception, RemoteException {
		// 查询应聘(uuid)
		Candidates candidates = (Candidates) DataManagerStatic.getInstance(uuid);

		// 查询工作经历
		Constraint workExperienceInfo = new Constraint("WorkExperienceInfo");
		workExperienceInfo.addCondition("bizDataUuid", candidates.getUuid());
		candidates.setWorkExperienceInfos((List<WorkExperienceInfo>) DataManagerStatic.getInstances(workExperienceInfo));
		// 查询教育背景
		Constraint educateInfo = new Constraint("EducateInfo");
		educateInfo.addCondition("bizDataUuid", candidates.getUuid());
		candidates.setEducateInfos((List<EducateInfo>) DataManagerStatic.getInstances(educateInfo));

		return candidates;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Candidates selectCandidates(Constraint constraint) throws Exception, RemoteException {
		// 查询应聘
		Candidates candidates = (Candidates) DataManagerStatic.getInstance(constraint);

		if (candidates != null) {
			// 查询工作经历
			Constraint workExperienceInfo = new Constraint("WorkExperienceInfo");
			workExperienceInfo.addCondition("bizDataUuid", candidates.getUuid());
			candidates.setWorkExperienceInfos((List<WorkExperienceInfo>) DataManagerStatic.getInstances(workExperienceInfo));

			// 查询教育背景
			Constraint educateInfo = new Constraint("EducateInfo");
			educateInfo.addCondition("bizDataUuid", candidates.getUuid());
			candidates.setEducateInfos((List<EducateInfo>) DataManagerStatic.getInstances(educateInfo));
		}

		return candidates;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Candidates> selectCandidatess(Constraint constraint) throws Exception, RemoteException {
		// 查询手术(list)
		List<Candidates> candidatesTemp = (List<Candidates>) DataManagerStatic.getInstances(constraint);
		List<Candidates> candidatess = new ArrayList();
		for (int i = 0; i < candidatesTemp.size(); i++) {
			Candidates candidates = candidatesTemp.get(i);

			// 查询工作经历
			Constraint workExperienceInfo = new Constraint("WorkExperienceInfo");
			workExperienceInfo.addCondition("bizDataUuid", candidates.getUuid());
			candidates.setWorkExperienceInfos((List<WorkExperienceInfo>) DataManagerStatic.getInstances(workExperienceInfo));

			// 查询教育背景
			Constraint educateInfo = new Constraint("EducateInfo");
			educateInfo.addCondition("bizDataUuid", candidates.getUuid());
			candidates.setEducateInfos((List<EducateInfo>) DataManagerStatic.getInstances(educateInfo));

			candidatess.add(candidates);
		}

		return candidatess;
	}

	/**
	 * <b>查询工作经历(list)</b>
	 * 
	 * @param constraint WorkExperienceInfo的约束条件
	 * @return 查询到的WorkExperienceInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<WorkExperienceInfo> selectWorkExperienceInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<WorkExperienceInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询教育背景(list)</b>
	 * 
	 * @param constraint EducateInfo的约束条件
	 * @return 查询到的EducateInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<EducateInfo> selectEducateInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<EducateInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询审批权限类型(list)</b>
	 * 
	 * @param constraint ApprovalAuthorityType的约束条件
	 * @return 查询到的ApprovalAuthorityType的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ApprovalAuthorityType> selectApprovalAuthorityTypes(Constraint constraint) throws Exception, RemoteException {
		return (List<ApprovalAuthorityType>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建审批权限</b>
	 * 
	 * @param approvalAuthority ApprovalAuthority对象
	 * @param userName 执行者的账户名
	 * @return 创建的User的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertApprovalAuthority(ApprovalAuthority approvalAuthority, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(approvalAuthority, userName);
	}

	/**
	 * <b>删除审批权限</b>
	 * 
	 * @param approvalAuthority ApprovalAuthority对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteApprovalAuthority(ApprovalAuthority approvalAuthority, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(approvalAuthority, userName);
	}

	/**
	 * <b>查询审批权限</b>
	 * 
	 * @param constraint ApprovalAuthority的约束条件
	 * @return 查询到的ApprovalAuthority
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ApprovalAuthority selectApprovalAuthority(Constraint constraint) throws Exception, RemoteException {
		return (ApprovalAuthority) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询审批权限(list)</b>
	 * 
	 * @param constraint ApprovalAuthority的约束条件
	 * @return 查询到的ApprovalAuthority的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ApprovalAuthority> selectApprovalAuthoritys(Constraint constraint) throws Exception, RemoteException {
		return (List<ApprovalAuthority>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询某岗位功能菜单及所有子节点(list)</b>
	 * 
	 * @param constraint Menu的约束条件
	 * @param jobUuid 某岗位的uuid
	 * @return 查询到的某岗位的Menu及其所有子节点的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Menu> selectJobMenus(Constraint constraint, String jobUuid) throws Exception, RemoteException {
		// 查询指定岗位所具有的权限
		Constraint jobAuthority = new Constraint("JobAuthority");
		jobAuthority.addCondition("jobUuid", jobUuid);
		List<JobAuthority> jobAuthorityList = selectJobAuthoritys(jobAuthority);
		List<String> menuUuidList = new ArrayList<String>();
		for (int i = 0; i < jobAuthorityList.size(); i++) {
			menuUuidList.add(jobAuthorityList.get(i).getMenuUuid());
		}
		if (menuUuidList.size() == 0) {
			// 该Job没有权限
			return new ArrayList();
		}
		constraint.addCondition("uuid", menuUuidList, Constraint.IN_LIST);

		// 查询功能菜单(list)
		List<Menu> menusTemp = (List<Menu>) DataManagerStatic.getInstances(constraint);
		List<Menu> menus = new ArrayList();
		for (int i = 0; i < menusTemp.size(); i++) {
			Menu menu = (Menu) menusTemp.get(i);
			selectMenusChildren(menu, menuUuidList, jobUuid);
			menus.add(menu);
		}
		return menus;
	}

	/**
	 * <b>递归创建岗位系统角色</b>
	 * 
	 * @param menuUuid 创建权限对应的功能菜单uuid
	 * @param jobUuid 创建权限对应的岗位uuid
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void insertJobAuthority(String menuUuid, String jobUuid, String userName) throws Exception, RemoteException {
		Constraint c = new Constraint("JobAuthority");
		c.addCondition("menuUuid", menuUuid);
		c.addCondition("jobUuid", jobUuid);
		JobAuthority jobAuthority = selectJobAuthority(c);
		if (jobAuthority == null) {
			jobAuthority = new JobAuthority();
			jobAuthority.setMenuUuid(menuUuid, false);
			jobAuthority.setJobUuid(jobUuid, false);
			DataManagerStatic.createInstance(jobAuthority, userName);
		}
		Menu menu = selectMenuByUuid(menuUuid);
		String menuParentUuid = menu.getParentUuid();
		if (menuParentUuid != null) {
			insertJobAuthority(menuParentUuid, jobUuid, userName);
		}
	}

	/**
	 * <b>删除岗位系统角色</b>
	 * 
	 * @param jobAuthority JobAuthority对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void deleteJobAuthority(JobAuthority jobAuthority, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(jobAuthority, userName);
	}

	/**
	 * <b>查询岗位系统角色(uuid)</b>
	 * 
	 * @param uuid JobAuthority的uuid
	 * @return 查询到的JobAuthority
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public JobAuthority selectJobAuthorityByUuid(String uuid) throws Exception, RemoteException {
		return (JobAuthority) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询岗位系统角色</b>
	 * 
	 * @param constraint JobAuthority的约束条件
	 * @return 查询到的JobAuthority
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public JobAuthority selectJobAuthority(Constraint constraint) throws Exception, RemoteException {
		return (JobAuthority) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询岗位系统角色(list)</b>
	 * 
	 * @param constraint JobAuthority的约束条件
	 * @return 查询到的JobAuthority的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<JobAuthority> selectJobAuthoritys(Constraint constraint) throws Exception, RemoteException {
		return (List<JobAuthority>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>查询岗位系统角色子节点</b>
	 * 
	 * @param menuParentUuid Menu的uuid
	 * @param jobUuid User的uuid
	 * @param userName 执行者的账户名
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<JobAuthority> selectJobAuthorityChildren(String menuParentUuid, String jobUuid, String userName, List<JobAuthority> jobAuthoritys) throws Exception, RemoteException {
		if (jobAuthoritys == null) {
			jobAuthoritys = new ArrayList();
		}
		Constraint c1 = new Constraint("Menu");
		c1.addCondition("parentUuid", menuParentUuid);

		Constraint jobAuthorityC = new Constraint("JobAuthority");
		if (jobUuid != null)
			jobAuthorityC.addCondition("jobUuid", jobUuid);

		List<JobAuthority> jobAuthorityList = selectJobAuthoritys(jobAuthorityC);
		List<String> menuUuidList = new ArrayList<String>();
		for (int i = 0; i < jobAuthorityList.size(); i++) {
			menuUuidList.add(jobAuthorityList.get(i).getMenuUuid());
		}

		if (menuUuidList.size() == 0) {
			// 该Job没有权限
			return jobAuthoritys;
		}
		if (jobUuid != null) {
			c1.addCondition("uuid", menuUuidList, Constraint.IN_LIST);
		}

		// 查询功能菜单(list)
		List<Menu> menusTemp = (List<Menu>) selectMenus(c1, null);

		for (int i = 0; i < menusTemp.size(); i++) {
			Menu menu = (Menu) menusTemp.get(i);
			Constraint jobAuthorityC2 = new Constraint("JobAuthority");
			jobAuthorityC2.addCondition("menuUuid", menu.getUuid());
			jobAuthorityC2.addCondition("jobUuid", jobUuid);
			JobAuthority jobAuthority = (JobAuthority) DataManagerStatic.getInstance(jobAuthorityC2);
			jobAuthoritys.add(jobAuthority);
			selectJobAuthorityChildren(menu.getUuid(), jobUuid, userName, jobAuthoritys);
		}
		return jobAuthoritys;
	}

	/**
	 * <b>递归查询欲删除岗位系统角色</b>
	 * 
	 * @param menuUuid 删除权限对应的功能菜单uuid
	 * @param jobUuid 删除权限对应的岗位uuid
	 * @param userName 执行者的账户名
	 * @return 查询到的JobAuthority的list
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<JobAuthority> selectJobAuthorityDeleted(String menuUuid, String jobUuid, String userName) throws Exception, RemoteException {
		List<JobAuthority> jobAuthorityList = new ArrayList<JobAuthority>();

		// 查询岗位系统角色
		Constraint c = new Constraint("JobAuthority");
		c.addCondition("menuUuid", menuUuid);
		c.addCondition("jobUuid", jobUuid);
		JobAuthority jobAuthority = selectJobAuthority(c);
		jobAuthorityList.add(jobAuthority);

		// 递归查询岗位系统子角色
		selectChildrenJobAuthority(jobAuthorityList, menuUuid, jobUuid, userName);

		// 递归查询无子节点的岗位系统父角色
		Menu menu = selectMenuByUuid(menuUuid);
		selectParentsJobAuthority(jobAuthorityList, menu.getParentUuid(), jobUuid, userName);

		return jobAuthorityList;
	}

	// 递归查询岗位系统子角色
	private void selectChildrenJobAuthority(List<JobAuthority> jobAuthorityList, String menuParentUuid, String jobUuid, String userName) throws Exception, RemoteException {
		Constraint menuC = new Constraint("Menu");
		menuC.addCondition("parentUuid", menuParentUuid);
		List<Menu> menuList = selectMenus(menuC);
		for (int i = 0; i < menuList.size(); i++) {
			Menu menu = menuList.get(i);

			// 查询岗位系统子角色
			Constraint jobAuthorityC = new Constraint("JobAuthority");
			jobAuthorityC.addCondition("jobUuid", jobUuid);
			jobAuthorityC.addCondition("menuUuid", menu.getUuid());
			JobAuthority jobAuthority = selectJobAuthority(jobAuthorityC);
			if (jobAuthority != null) {
				jobAuthorityList.add(jobAuthority);
			}

			// 递归调用
			selectChildrenJobAuthority(jobAuthorityList, menu.getUuid(), jobUuid, userName);
		}
	}

	// 递归查询无子节点的岗位系统父角色
	private void selectParentsJobAuthority(List<JobAuthority> jobAuthorityList, String menuParentUuid, String jobUuid, String userName) throws Exception, RemoteException {
		if (menuParentUuid != null) {
			Constraint menuC = new Constraint("Menu");
			menuC.addCondition("parentUuid", menuParentUuid);
			List<Menu> menuList = selectMenus(menuC);
			List<String> uuidList = new ArrayList<String>();
			for (int i = 0; i < menuList.size(); i++) {
				Menu menu = menuList.get(i);
				uuidList.add(menu.getUuid());
			}

			if (uuidList.size() > 0) {
				Constraint jobAuthorityC = new Constraint("JobAuthority");
				jobAuthorityC.addCondition("jobUuid", jobUuid);
				jobAuthorityC.addCondition("menuUuid", uuidList, Constraint.IN_LIST);
				List<JobAuthority> authList = selectJobAuthoritys(jobAuthorityC);
				if (authList.size() == 1) {
					Constraint jobAuthorityParentC = new Constraint("JobAuthority");
					jobAuthorityParentC.addCondition("jobUuid", jobUuid);
					jobAuthorityParentC.addCondition("menuUuid", menuParentUuid);
					JobAuthority jobAuthority = selectJobAuthority(jobAuthorityParentC);
					jobAuthorityList.add(jobAuthority);

					Menu menuParent = selectMenuByUuid(menuParentUuid);
					selectParentsJobAuthority(jobAuthorityList, menuParent.getParentUuid(), jobUuid, userName);
				}
			}
		}
	}
}
