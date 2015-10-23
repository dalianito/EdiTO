package com.ito.edito.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.struts2.ServletActionContext;

import com.ito.edito.schema.Employee;
import com.ito.edito.schema.User;
import com.ito.edito.util.Carrier;
import com.ito.edito.util.Constants;
import com.ito.edito.util.CustomizedUserTransaction;
import com.ito.edito.util.DateConvert;
import com.opensymphony.xwork2.Action;

public class DefaultAction implements Action {

	private static final long serialVersionUID = 201009194352645515L;

	protected HttpServletRequest request = null;
	protected HttpServletResponse response = null;

	protected Carrier carrier = null;
	protected CustomizedUserTransaction ut = null;

	protected User USER = null;
	protected Employee EMPLOYEE = null;

	protected String resultCode = SUCCESS;
	
	protected boolean fullWidthViewContent = false;

	protected static long statVirtualUuid = 1L;

	static {
		ConvertUtils.register(new DateConvert(), java.util.Date.class);
	}

	public String execute() throws Exception {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		USER = (User) request.getSession().getAttribute(Constants.LOGIN_USER_KEY);
		EMPLOYEE = (Employee) request.getSession().getAttribute(Constants.LOGIN_EMPLOYEE_KEY);
		populate();
		ut = new CustomizedUserTransaction();
		ut.initUT();
		executeManualUT();
		printResult();

		return resultCode;
	}

	@SuppressWarnings("unchecked")
	private void populate() throws Exception {
		carrier = new Carrier();
		Map params = request.getParameterMap();
		BeanUtils.populate(carrier, params);
	}

	protected void executeManualUT() throws Exception {
		ut.begin();
		try {
			executeAutoUT();
			ut.commit();
		}
		catch (Exception ex) {
			ut.rollback();
			throw ex;
		}
	}

	protected void executeAutoUT() throws Exception {
	};

	protected void printResult() throws Exception {
	};
}
