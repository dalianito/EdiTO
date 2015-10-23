package com.ito.edito.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.ito.edito.ejb.User.UserService;
import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class WechatFilter implements Filter {

	private static String toUserName;
	private static String fromUserName;
	private static String msgType;
	private static String content;
	private static CustomizedUserTransaction ut;
	private static String domainPath;
	private static String status;
	private static String msgID;

	public void init(FilterConfig filterConfig) {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		domainPath = ConstantFactory.getConstant("path.domain.url");

		if (req.getParameter("echostr") != null) {
			response.getWriter().write(req.getParameter("echostr"));
		}
		else {
			try {
				Document document = new SAXBuilder().build(req.getReader());
				Element rootElement = document.getRootElement();
				toUserName = rootElement.getChildText("ToUserName");
				fromUserName = rootElement.getChildText("FromUserName");
				msgType = rootElement.getChildText("MsgType");
				status = rootElement.getChildText("Status");
				msgID = rootElement.getChildText("MsgID");
				if (msgID != null) {
					WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
					Constraint c = new Constraint("WechatNotificiationMessage");
					c.addCondition("wechatMsgId", msgID);
					WechatNotificiationMessage message = wechatService.selectWechatNotificiationMessage(c);

					if (status.equals("success") || status.equals("failed:user block")) {
						message.setIfUsing(false);
					}
					else {
						message.setStatus("waiting");
						message.setIfUsing(true);
					}
					message.setStatus(status);
					ut = new CustomizedUserTransaction();
					ut.initUT();
					ut.begin();
					try {
						wechatService.updateWechatNotificiationMessage(message, "wechat");
						ut.commit();
					}
					catch (Exception e) {
						// TODO: handle exception
						ut.rollback();
					}
				}

				if (msgType.equals("event")) {
					String eventType = rootElement.getChildText("Event");
					if (eventType.equals("subscribe")) {
						StringBuffer contentBuffer = new StringBuffer();
						contentBuffer.append("系统消息：\n");
						contentBuffer.append("欢迎您关注【富海教育】内部微信公众平台！\n");
						contentBuffer.append("\n");
						contentBuffer.append("请您点击<a href=\"" + domainPath + Constants.WECHAT_VERIFY_USER_URL + "_" + fromUserName + "\">【此处】</a>进行微信认证。\n");
						content = contentBuffer.toString();

						WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
					}
					else if (eventType.equals("unsubscribe")) {
						UserService userService = (UserService) JndiFactory.lookup("userService");

						ut = new CustomizedUserTransaction();
						ut.initUT();

						Constraint c = new Constraint("Employee");
						c.addCondition("openId", fromUserName);
						Employee employee = userService.selectEmployee(c);

						if (employee != null) {
							employee.setOpenId(null);

							ut.begin();
							try {
								userService.updateEmployee(employee, Constants.WECHAT_USER);
								ut.commit();
							}
							catch (Exception e) {
								e.printStackTrace();
								ut.rollback();
							}
						}
					}
					else if (eventType.equals("CLICK")) {
						String eventKey = rootElement.getChildText("EventKey");
						if (eventKey.equals("AutoMessage")) {
							StringBuffer contentBuffer = new StringBuffer();
							contentBuffer.append("系统消息：\n");
							contentBuffer.append("欢迎您访问【富海教育】内部微信公众平台！\n");
							contentBuffer.append("\n");
							contentBuffer.append("回复数字：1 \n");
							contentBuffer.append("查看账户员工信息  \n");
							contentBuffer.append("\n");
							contentBuffer.append("使用平台具体功能，请点击下方菜单。\n");
							content = contentBuffer.toString();

							WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
						}
						else if (eventKey.equals("AccountManagement")) {
							Employee employee = WechatUtil.getEmployeeMessage(fromUserName);
							if (employee == null) {
								StringBuffer contentBuffer = new StringBuffer();
								contentBuffer.append("系统消息：\n");
								contentBuffer.append("欢迎您关注【富海教育】内部微信公众平台！\n");
								contentBuffer.append("\n");
								contentBuffer.append("请您点击<a href=\"" + domainPath + Constants.WECHAT_VERIFY_USER_URL + "_" + fromUserName + "\">【此处】</a>进行微信认证。\n");
								content = contentBuffer.toString();

								WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
							}
							else {
								StringBuffer contentBuffer = new StringBuffer();
								contentBuffer.append("系统消息：\n");
								contentBuffer.append("员工个人信息！\n");
								contentBuffer.append("\n");
								contentBuffer.append("员工号：" + employee.getPerson().getPersonNo() + "\n");
								contentBuffer.append("姓名：" + employee.getPerson().getName() + "\n");
								contentBuffer.append("校区：" + employee.getCampus().getDescription() + "\n");
								contentBuffer.append("组织机构：" + employee.getDepartment().getDescription() + "\n");
								contentBuffer.append("岗位：" + employee.getJob().getDescription() + "\n");
								contentBuffer.append("\n");
								contentBuffer.append("请您点击<a href=\"" + domainPath + Constants.WECHAT_Un_VERIFY_USER_URL + "_" + fromUserName + "\">【此处】</a>取消微信认证。\n");
								content = contentBuffer.toString();
								WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
							}
						}
					}
				}
				else {
					if (msgType.equals("text")) {
						String eventType = rootElement.getChildText("Content");
						if (eventType.equals(null)) {
							Employee employee = WechatUtil.getEmployeeMessage(fromUserName);
							if (employee == null) {
								StringBuffer contentBuffer = new StringBuffer();
								contentBuffer.append("系统消息：\n");
								contentBuffer.append("欢迎您关注【富海教育】内部微信公众平台！\n");
								contentBuffer.append("\n");
								contentBuffer.append("请您点击<a href=\"" + domainPath + Constants.WECHAT_VERIFY_USER_URL + "_" + fromUserName + "\">【此处】</a>进行微信认证。\n");
								content = contentBuffer.toString();

								WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
							}
							else {
								StringBuffer contentBuffer = new StringBuffer();
								contentBuffer.append("系统消息：\n");
								contentBuffer.append("员工个人信息！\n");
								contentBuffer.append("\n");
								contentBuffer.append("员工号：" + employee.getPerson().getPersonNo() + "\n");
								contentBuffer.append("姓名：" + employee.getPerson().getName() + "\n");
								contentBuffer.append("校区：" + employee.getCampus().getDescription() + "\n");
								contentBuffer.append("组织机构：" + employee.getDepartment().getDescription() + "\n");
								contentBuffer.append("岗位：" + employee.getJob().getDescription() + "\n");
								contentBuffer.append("\n");
								contentBuffer.append("请您点击<a href=\"" + domainPath + Constants.WECHAT_Un_VERIFY_USER_URL + "_" + fromUserName + "\">【此处】</a>取消微信认证。\n");
								content = contentBuffer.toString();
								WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
							}
						}
						else {
							StringBuffer contentBuffer = new StringBuffer();
							contentBuffer.append("系统消息：\n");
							contentBuffer.append("欢迎您访问【富海教育】内部微信公众平台！\n");
							contentBuffer.append("\n");
							contentBuffer.append("查看平台具体功能，请点击下方菜单。\n");
							content = contentBuffer.toString();

							WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
						}
					}
					else {
						StringBuffer contentBuffer = new StringBuffer();
						contentBuffer.append("系统消息：\n");
						contentBuffer.append("欢迎您访问【富海教育】内部微信公众平台！\n");
						contentBuffer.append("\n");
						contentBuffer.append("查看平台具体功能，请点击下方菜单。\n");
						content = contentBuffer.toString();

						WechatUtil.sendResponseTextAuto(res, toUserName, fromUserName, content);
					}
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void destroy() {
	}
}
