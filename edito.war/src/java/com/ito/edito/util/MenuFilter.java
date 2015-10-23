package com.ito.edito.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.rmi.PortableRemoteObject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ito.edito.ejb.User.UserServiceRemote;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.JobAuthority;
import com.ito.edito.schema.Menu;
import com.ito.edito.schema.User;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.log.ITOLogger;
import com.ito.fai.log.LogFactory;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class MenuFilter implements Filter {
	protected static ITOLogger log = LogFactory.getLogger(Constants.LOG_WEB);

	private static String CONTEXT_PATH;
	private static String STATIONNAME;
	private static final String HTTPS_PATH = "/https";
	private static final String UPLOAD_URL = "UPLOAD_URL";

	private static final String OPENED = "1";
	private static final String CLOSED = "0";
	private static final String FOCUS_Y = "1";
	private static final String FOCUS_N = "0";

	private static final String ROOT_KEY = "root";
	public static final String USER_MENU_KEY = "menuMap";
	private static final String USER_AUTH_KEY = "authMap";

	private static final int AUTH_N = 0;
	private static final int AUTH_Y = 1;
	private static final int URI_NULL = 2;

	private static final int INDEX_URI_KEY = 1;
	private static final int NONE_URI_KEY = 2;
	private static final int REJECT_URI_KEY = 3;
	private static final int INVALID_URI_KEY = 4;
	private static final int ORTHER_URI_KEY = 5;

	private static final String RESOURCE_INDEX_URI = "/pages/resource/index.html";
	private static final String CONTENT_INDEX_URI = "/pages/content/index.html";
	private static final String NONE_URI = "/util/none.html";
	private static final String REJECT_URI = "/util/reject.html";
	private static final String INVALID_URI = "/util/invalid.html";

	private HttpServletRequest req = null;
	private HttpSession session = null;
	private HttpServletResponse res = null;
	private CustomizedUserTransaction ut = null;
	private UserServiceRemote userService = null;

	public void init(FilterConfig filterConfig) {
		ServletContext sc = filterConfig.getServletContext();
		CONTEXT_PATH = sc.getContextPath();
	}

	@SuppressWarnings("unchecked")
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		req = (HttpServletRequest) request;
		res = (HttpServletResponse) response;
		session = req.getSession();
		session.setAttribute(UPLOAD_URL, ConstantFactory.getConstant("path.upload.resource.url"));

		String uri = req.getRequestURI();
		String[] path = uri.split("/");
		if (path[2] != null) {
			STATIONNAME = path[2];
		}

		System.out.println("uri:" + uri);

		boolean isInvalid = false;

		try {
			Object obj = JndiFactory.lookup("userService");
			userService = (UserServiceRemote) PortableRemoteObject.narrow(obj, UserServiceRemote.class);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		String account = req.getRemoteUser();
		User user = null;
		Employee employee = null;
		ut = new CustomizedUserTransaction();
		ut.initUT();
		if (account == null) {
			throw new NullPointerException("account is null!");
		}
		else {
			user = (User) session.getAttribute(Constants.LOGIN_USER_KEY);
			if (user == null) {
				Constraint userCon = new Constraint("User");
				userCon.addCondition("account", account);
				userCon.addCondition("ifUsing", true);
				try {
					ut.begin();
					user = userService.selectUser(userCon);
					ut.commit();
				}
				catch (Exception ex) {
					ex.printStackTrace();
					ut.rollback();
				}
				session.setAttribute(Constants.LOGIN_USER_KEY, user);

				Constraint employeeCon = new Constraint("Employee");
				employeeCon.addCondition("personUuid", user.getPersonUuid());
				employeeCon.addCondition("ifUsing", true);
				try {
					ut.begin();
					employee = userService.selectEmployee(employeeCon);
					ut.commit();
				}
				catch (Exception ex) {
					ex.printStackTrace();
					ut.rollback();
				}
				session.setAttribute(Constants.LOGIN_EMPLOYEE_KEY, employee);

				/*
				Student student = null;
				Constraint studentCon = new Constraint("Student");
				studentCon.addCondition("personUuid", user.getPersonUuid());
				try {
					ut.begin();
					student = userService.selectStudent(studentCon);
					ut.commit();
				}
				catch (Exception ex) {
					ex.printStackTrace();
					ut.rollback();
				}
				session.setAttribute(Constants.LOGIN_STUDENT_KEY, student);
				*/
			}
			else {
				employee = (Employee) session.getAttribute("Constants.LOGIN_EMPLOYEE_KEY");
				if (employee == null) {
					Constraint employeeCon = new Constraint("Employee");
					employeeCon.addCondition("personUuid", user.getPersonUuid());
					employeeCon.addCondition("ifUsing", true);
					try {
						ut.begin();
						employee = userService.selectEmployee(employeeCon);
						ut.commit();
					}
					catch (Exception ex) {
						ex.printStackTrace();
						ut.rollback();
					}
					session.setAttribute(Constants.LOGIN_EMPLOYEE_KEY, employee);
				}

				/*
				Student student = (Student) session.getAttribute(Constants.LOGIN_STUDENT_KEY);
				if (student == null) {
					Constraint studentCon = new Constraint("Student");
					studentCon.addCondition("personUuid", user.getPersonUuid());
					try {
						ut.begin();
						student = userService.selectStudent(studentCon);
						ut.commit();
					}
					catch (Exception ex) {
						ex.printStackTrace();
						ut.rollback();
					}
					session.setAttribute(Constants.LOGIN_STUDENT_KEY, student);
				}
				*/
			}
		}

		HashMap<String, JobAuthority> authMap = (HashMap<String, JobAuthority>) session.getAttribute(USER_AUTH_KEY);
		if (authMap == null) {
			isInvalid = true;
			String jobUuid = employee.getJobUuid();
			authMap = loadUserAuthorities(jobUuid);
			session.setAttribute(USER_AUTH_KEY, authMap);
		}

		HashMap<String, Menu> menuMap = (HashMap<String, Menu>) session.getAttribute(USER_MENU_KEY);
		if (menuMap == null) {
			isInvalid = true;
			menuMap = new HashMap<String, Menu>();
			List<Menu> list = loadUserMenus(authMap, menuMap, null);
			session.setAttribute(ROOT_KEY, list);
			session.setAttribute(USER_MENU_KEY, menuMap);
			initMenuOpenedStatus(menuMap);
		}

		boolean redirect = false;
		int type = validateURI(uri);
		switch (type) {
		case INDEX_URI_KEY:
			if (!menuMap.isEmpty()) {// 访问首页，用户拥有权限，定位到首个菜单页
				String link = getFirstMenu(ROOT_KEY);
				System.out.println("link:" + link);
				res.sendRedirect(CONTEXT_PATH + link);
				redirect = true;
			}
			break;
		case ORTHER_URI_KEY:
			if (uri.startsWith(CONTEXT_PATH)) {
				uri = uri.substring(CONTEXT_PATH.length());
			}
			if (uri.startsWith(HTTPS_PATH)) {
				if (isInvalid) {
					res.sendRedirect(CONTEXT_PATH + "/pages/" + STATIONNAME + INVALID_URI);
					redirect = true;
					initMenuFocusStatus(menuMap);
				}
				break;
			}
			Menu menu = getMenuByURI(uri);
			int f = validateMenu(menu, menuMap);
			switch (f) {
			case AUTH_N:
				res.sendRedirect(CONTEXT_PATH + "/pages/" + STATIONNAME + REJECT_URI);
				redirect = true;
				initMenuFocusStatus(menuMap);
				break;
			case AUTH_Y:
				initMenuFocusStatus(menuMap);
				setMenuStatus(menu, menuMap);
				break;
			case URI_NULL:
				res.sendRedirect(CONTEXT_PATH + "/pages/" + STATIONNAME + NONE_URI);
				redirect = true;
				break;
			default:
				break;
			}
			break;
		default:// REJECT_URI_KEY and NONE_URI_KEY
			break;
		}
		if (!redirect) {
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
	}

	/**
	 * 获取用户所有权限的函数
	 * 
	 * @return 用户所拥有的所有权限
	 */
	private HashMap<String, JobAuthority> loadUserAuthorities(String jobUuid) {
		HashMap<String, JobAuthority> authMap = new HashMap<String, JobAuthority>();
		Constraint authoritiesCon = new Constraint("JobAuthority");
		authoritiesCon.addCondition("jobUuid", jobUuid);
		try {
			ut.begin();
			List<JobAuthority> list = userService.selectJobAuthoritys(authoritiesCon);
			ut.commit();
			for (int i = 0; i < list.size(); i++) {
				JobAuthority jobAuthorities = list.get(i);
				String menuUuid = jobAuthorities.getMenuUuid();
				authMap.put(menuUuid, jobAuthorities);
			}
		}
		catch (Exception ex) {
			ut.rollback();
			log.warn("get all authorities by user's uuid:" + jobUuid + "error", ex);
		}
		return authMap;
	}

	/**
	 * 按照层次关系来初始化菜单
	 */
	private List<Menu> loadUserMenus(HashMap<String, JobAuthority> authMap, HashMap<String, Menu> menuMap, String pUuid) {
		List<Menu> list = getAscChildMenusByParent(pUuid);
		for (int i = 0; i < list.size(); i++) {
			Menu menu = list.get(i);
			String menuUuid = menu.getUuid();
			if (!authMap.containsKey(menuUuid)) {// 没有该项权限
				list.remove(i);
				i--;
			}
			else {// 具有该项权限
				List<Menu> menus = loadUserMenus(authMap, menuMap, menuUuid);
				menu.setChild(String.valueOf(menus.size()));
				if (menus.size() > 0) {
					Menu m = menus.get(0);
					menu.setLink(m.getLink());
				}
				menuMap.put(menuUuid, menu);
			}
		}
		if (list.size() > 0 && pUuid != null) {// 有子菜单
			session.setAttribute(pUuid, list);
		}
		return list;
	}

	/**
	 * 取得指定菜单的所有子菜单,并按照某一字段进行升序排列
	 */
	private List<Menu> getAscChildMenusByParent(String pUuid) {
		List<Menu> list = null;
		List<Object> valueList = new ArrayList<Object>();
		valueList.add(pUuid);
		Constraint menuCon = new Constraint("Menu");
		StringBuffer buffer = new StringBuffer();
		buffer.append("SELECT * FROM Menu WHERE parentUuid ");
		buffer.append(null == pUuid ? "is" : "=");
		buffer.append(" $1 ORDER BY CAST(sequence AS SIGNED) ASC");
		menuCon.addSQLCondition(buffer.toString(), valueList);
		try {
			ut.begin();
			list = userService.selectMenus(menuCon);
			ut.commit();
		}
		catch (Exception ex) {
			ut.rollback();
			log.warn("get child menus by parent's uuid:" + pUuid + "error", ex);
		}
		return list;
	}

	/**
	 * 初始用户拥有权限对应之菜单的状态为未激活
	 */
	private void initMenuFocusStatus(HashMap<String, Menu> menuMap) {
		Iterator<Menu> menus = menuMap.values().iterator();
		while (menus.hasNext()) {
			Menu menu = menus.next();
			menu.setFocus(FOCUS_N);
		}
	}

	/**
	 * 初始用户拥有权限对应之菜单的状态为关闭
	 */
	private void initMenuOpenedStatus(HashMap<String, Menu> menuMap) {
		Iterator<Menu> menus = menuMap.values().iterator();
		while (menus.hasNext()) {
			Menu menu = menus.next();
			menu.setOpened(CLOSED);
		}
	}

	/**
	 * 检验被访问URI的类别
	 */
	private int validateURI(String uri) {
		if (uri.equals(CONTEXT_PATH + RESOURCE_INDEX_URI) || uri.equals(CONTEXT_PATH + CONTENT_INDEX_URI)) {
			return INDEX_URI_KEY;
		}
		else if (uri.indexOf(NONE_URI) != -1) {
			return NONE_URI_KEY;
		}
		else if (uri.indexOf(REJECT_URI) != -1) {
			return REJECT_URI_KEY;
		}
		else if (uri.indexOf(INVALID_URI) != -1) {
			return INVALID_URI_KEY;
		}
		else {
			return ORTHER_URI_KEY;
		}
	}

	/**
	 * 从数据库中获取与指定URI相对应的菜单
	 */
	private Menu getMenuByURI(String uri) {
		Constraint menuCon = new Constraint("Menu");
		menuCon.addCondition("link", uri);
		Menu menu = null;
		try {
			ut.begin();
			menu = userService.selectMenu(menuCon);
			ut.commit();
		}
		catch (Exception ex) {
			ut.rollback();
			ex.printStackTrace();
			log.warn("get menu by URI:" + uri + "error", ex);
		}
		return menu;
	}

	/**
	 * 检验用户访问的URI是否合法的Menu以及是否有访问该链接的权限
	 */
	private int validateMenu(Menu menu, HashMap<String, Menu> menuMap) {
		if (menu != null) {
			if (!menuMap.isEmpty()) {// 登陆用户的权限非空
				if (menuMap.containsKey(menu.getUuid())) {// 登陆用户拥有菜单对应的权限
					// 定位到访问的页面
					return AUTH_Y;
				}
				else {// 登陆用户不具有菜单对应的权限
					// 定位到某一通知页面，告知没有此项权限
					return AUTH_N;
				}
			}
			else {// 登陆用户无任何权限
				// 应该定位到某一通知页面，告知没有此项权限
				return AUTH_N;
			}
		}
		else {
			return URI_NULL;
		}
	}

	/**
	 * 设置用户点击的菜单为激活状态
	 */
	private void setMenuStatus(Menu menu, HashMap<String, Menu> menuMap) {
		String menuUuid = menu.getUuid();
		Menu m = menuMap.get(menuUuid);
		m.setFocus(FOCUS_Y);
		m.setOpened(OPENED);
		if (menu.getParent() != null) {
			setMenuStatus(menu.getParent(), menuMap);
		}
	}

	/**
	 * 获取用户的第一个菜单项
	 */
	@SuppressWarnings("unchecked")
	private String getFirstMenu(String key) {
		String uri = null;
		List<Menu> menus = (List<Menu>) session.getAttribute(key);
		for (int i = 0; i < menus.size(); i++) {
			Menu menu = menus.get(i);
			if (menu.getStationName().equals(STATIONNAME)) {
				if (!menu.getChild().equals("0")) {
					uri = getFirstMenu(menu.getUuid());
				}
				else {
					uri = menu.getLink();
				}
				break;
			}
		}
		return uri;
	}
}
