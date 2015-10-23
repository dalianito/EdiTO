package com.ito.edito.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;

import com.ito.edito.ejb.User.UserService;
import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.ServiceConfiguration;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class WechatUtil {
	/**
	 * 验证请求来源于微信
	 * 
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @return true/false
	 */
	@SuppressWarnings("unchecked")
	public static boolean checkSignature(String signature, String timestamp, String nonce) {
		List<String> list = new ArrayList<String>();
		list.add(Constants.WECHAT_TOKEN);
		list.add(timestamp);
		list.add(nonce);
		Collections.sort(list, new SpellComparator());
		String tempString = "";
		for (int i = 0; i < list.size(); i++) {
			tempString += list.get(i);
		}

		// sha1 加密
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(tempString.getBytes("UTF-8"));
			byte[] result = md.digest();

			StringBuffer sb = new StringBuffer();

			for (byte b : result) {
				int i = b & 0xff;
				if (i < 0xf) {
					sb.append(0);
				}
				sb.append(Integer.toHexString(i));
			}
			tempString = sb.toString();
		}
		catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return false;
		}
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}

		// 加密后的字符串tempString与 signature 做比较
		if (tempString.equals(signature)) {
			return true;
		}
		else {
			return false;
		}
	}

	/**
	 * 获取access_token
	 * 
	 * @return accessTokenStr 当前的access_token字段
	 * @throws Exception
	 */
	public static String getNewAccessToken() {
		try {
			String getAccessTokenUrl = Constants.WECHAT_ACCESS_TOKEN_URL.replace("APPID", Constants.WECHAT_APP_ID).replace("APPSECRET", Constants.WECHAT_APP_SECRET);
			URL url = new URL(getAccessTokenUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.connect();
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			String line = reader.readLine();
			line = line.replace("{", "").replace("}", "").replaceAll("\"", "");
			String[] result = line.split(",");
			HashMap<String, String> resultMap = new HashMap<String, String>();
			for (int i = 0; i < result.length; i++) {
				String resultStr = result[i];
				int index = resultStr.indexOf(":");
				String key = resultStr.substring(0, index);
				String value = resultStr.substring(index + 1);
				resultMap.put(key, value);
			}

			String accessTokenStr = resultMap.get("access_token");
			connection.disconnect();

			return accessTokenStr;
		}
		catch (Exception e) {
			e.printStackTrace();
			return Constants.WECHAT_ERROR;
		}
	}

	/**
	 * 网页授权获取用户基本信息
	 * 
	 * @param code 授权获取的code
	 * @return resultMap { "access_token":"ACCESS_TOKEN", "expires_in":7200,
	 *         "refresh_token":"REFRESH_TOKEN", "openid":"OPENID",
	 *         "scope":"SCOPE", "unionid":"UNIONID" }
	 * @throws Exception
	 */
	public static HashMap<String, String> getNewAccessTokenOauth2(String code) throws Exception {
		try {
			String getAccessTokenUrl = Constants.WECHAT_ACCESS_TOKEN_OAUTH2_URL.replace("APPID", Constants.WECHAT_APP_ID).replace("SECRET", Constants.WECHAT_APP_SECRET).replace("CODE", code);
			URL url = new URL(getAccessTokenUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.connect();
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			String line = reader.readLine();
			line = line.replace("{", "").replace("}", "").replaceAll("\"", "");
			String[] result = line.split(",");
			HashMap<String, String> resultMap = new HashMap<String, String>();
		
			for (int i = 0; i < result.length; i++) {
				String resultStr = result[i];
				int index = resultStr.indexOf(":");
				if (index != -1) {
					String key = resultStr.substring(0, index);
					String value = resultStr.substring(index + 1);
					resultMap.put(key, value);
				}
			
			}
			return resultMap;
			
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("internet connect error...");
			return null;
		}
	}

	/**
	 * 被动回复文本消息
	 * 
	 * @param response HttpServletResponse
	 * @param fromUserName 回复者
	 * @param toUserName 接收者(openid)
	 * @param content 回复内容
	 * @throws Exception
	 */
	public static void sendResponseTextAuto(HttpServletResponse response, String fromUserName, String toUserName, String content) throws Exception {
		Element rootElement = new Element("xml");
		rootElement.addContent(new Element("ToUserName").setText(toUserName));
		rootElement.addContent(new Element("FromUserName").setText(fromUserName));
		rootElement.addContent(new Element("CreateTime").setText(String.valueOf(new Date().getTime())));
		rootElement.addContent(new Element("MsgType").setText("text"));
		rootElement.addContent(new Element("Content").setText(content));

		Document document = new Document(rootElement);
		XMLOutputter XMLOutputter = new XMLOutputter();

		response.getWriter().write(XMLOutputter.outputString(document));
	}

	/**
	 * 主动回复文本消息
	 * 
	 * @param toUserName 接收者(openid)
	 * @param content 回复内容
	 * @return resultMap { "errcode":“ERRCODE”, "errmsg":"ERRMSG" }
	 * @throws Exception
	 */
	public static HashMap<String, String> sendResponseTextManual(String toUserName, String content) throws Exception {
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		ServiceConfiguration configuration = wechatService.selectServiceConfigurationByUuid(Constants.WECHAT_ACCESS_TOKEN_UUID);
		String accessTokenStr = configuration.getContent();

		if (!accessTokenStr.equals(Constants.WECHAT_ERROR)) {
			try {
				String postMessageUrl = Constants.WECHAT_POST_MESSAGE_URL.replace("ACCESS_TOKEN", accessTokenStr);
				URL url = new URL(postMessageUrl);
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setDoOutput(true);
				connection.setDoInput(true);
				connection.setRequestMethod("POST");
				connection.setUseCaches(false);
				connection.setInstanceFollowRedirects(true);
				connection.setRequestProperty("Content-Type", "application/json");
				connection.connect();
				OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
				String postContent = "{\"touser\":\"" + toUserName + "\",\"msgtype\":\"text\",\"text\":{\"content\":\"" + content + "\"}}";
				out.append(postContent);
				out.flush();
				out.close();

				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = reader.readLine();
				line = line.replace("{", "").replace("}", "").replaceAll("\"", "");
				String[] result = line.split(",");
				HashMap<String, String> resultMap = new HashMap<String, String>();
				for (int i = 0; i < result.length; i++) {
					String resultStr = result[i];
					int index = resultStr.indexOf(":");
					String key = resultStr.substring(0, index);
					String value = resultStr.substring(index + 1);
					resultMap.put(key, value);
				}
				reader.close();
				connection.disconnect();

				return resultMap;
			}
			catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		else {
			return null;
		}
	}

	/**
	 * 初始化微信菜单
	 * 
	 * @param wechatMenuFile 微信菜单配置文件
	 * @return resultMap { "errcode":“ERRCODE”, "errmsg":"ERRMSG" }
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static HashMap<String, String> createWeChatMenu(String wechatMenuFile) {
		System.out.println("InitializeConfig createWeChatMenu method start:......");

		try {
			String domainPath = ConstantFactory.getConstant("path.domain.url");

			Document document = new SAXBuilder().build(new File(wechatMenuFile));
			Element rootElement = document.getRootElement();
			List buttonList = rootElement.getChildren("button");

			String menuContent = "{\"button\":[";
			for (int i = 0; i < buttonList.size(); i++) {
				Element button = (Element) buttonList.get(i);
				String buttonType = button.getAttributeValue("type");
				String buttonName = button.getAttributeValue("name");

				if (buttonType.equals("parent")) {
					List subButtonList = button.getChildren();

					menuContent += "{\"name\":\"" + buttonName + "\",\"sub_button\":[";
					for (int j = 0; j < subButtonList.size(); j++) {
						Element subButton = (Element) subButtonList.get(j);
						String subButtonType = subButton.getAttributeValue("type");
						String subButtonName = subButton.getAttributeValue("name");
						if (subButtonType.equals("view")) {
							String subButtonUrl = domainPath + subButton.getAttributeValue("url");
							String fullUrl = Constants.SCOPE_SNSAPI_BASE_URL.replace("APPID", Constants.WECHAT_APP_ID).replace("REDIRECT_URI", subButtonUrl);
							menuContent += "{\"type\":\"view\",\"name\":\"" + subButtonName + "\",\"url\":\"" + fullUrl + "\"}";
						}
						else if (subButtonType.equals("click")) {
							String AutoMessage = "AutoMessage";
							menuContent += "{\"type\":\"click\",\"name\":\"" + subButtonName + "\",\"key\":\"" + AutoMessage + "\"}";
						}

						if (j < subButtonList.size() - 1) {
							menuContent += ",";
						}
					}
					menuContent += "]}";
				}
				else if (buttonType.equals("view")) {
					String buttonUrl = domainPath + button.getAttributeValue("url");
					String fullUrl = Constants.SCOPE_SNSAPI_BASE_URL.replace("APPID", Constants.WECHAT_APP_ID).replace("REDIRECT_URI", buttonUrl);
					menuContent += "{\"type\":\"view\",\"name\":\"" + buttonName + "\",\"url\":\"" + fullUrl + "\"}";
				}
				else if (buttonType.equals("click")) {
					String AutoMessage = "AccountManagement";
					menuContent += "{\"type\":\"click\",\"name\":\"" + buttonName + "\",\"key\":\"" + AutoMessage + "\"}";
				}
				if (i < buttonList.size() - 1) {
					menuContent += ",";
				}
			}
			menuContent += "]}";

			WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
			ServiceConfiguration configuration = wechatService.selectServiceConfigurationByUuid(Constants.WECHAT_ACCESS_TOKEN_UUID);
			String accessTokenStr = configuration.getContent();

			if (!accessTokenStr.equals(Constants.WECHAT_ERROR)) {
				String sendMenuUrl = Constants.WECHAT_MENU_CREATE_URL.replace("ACCESS_TOKEN", accessTokenStr);
				URL url = new URL(sendMenuUrl);
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setDoOutput(true);
				connection.setDoInput(true);
				connection.setRequestMethod("POST");
				connection.setUseCaches(false);
				connection.setInstanceFollowRedirects(true);
				connection.setRequestProperty("Content-Type", "application/json");
				connection.connect();
				OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
				out.append(menuContent);
				out.flush();
				out.close();

				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = reader.readLine();
				line = line.replace("{", "").replace("}", "").replaceAll("\"", "");
				String[] result = line.split(",");
				HashMap<String, String> resultMap = new HashMap<String, String>();
				for (int i = 0; i < result.length; i++) {
					String resultStr = result[i];
					int index = resultStr.indexOf(":");
					if (resultStr.length() > 0) {
						String key = resultStr.substring(0, index);
						String value = resultStr.substring(index + 1);
						resultMap.put(key, value);
					}
				}
				connection.disconnect();
				reader.close();

				System.out.println("InitializeConfig createWeChatMenu method stop:......");
				return resultMap;
			}
			else {
				System.out.println("failure in getting access_token");
				return null;
			}
		}
		catch (Exception e) {
			System.out.println("failure in loading createWeChatMenu method");
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 删除微信菜单
	 * 
	 * @return resultMap { "errcode":“ERRCODE”, "errmsg":"ERRMSG" }
	 * @throws Exception
	 */
	public static HashMap<String, String> deleteWeChatMenu() {
		System.out.println("InitializeConfig deleteWeChatMenu method start:......");

		try {
			WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
			ServiceConfiguration configuration = wechatService.selectServiceConfigurationByUuid(Constants.WECHAT_ACCESS_TOKEN_UUID);
			String accessTokenStr = configuration.getContent();

			if (!accessTokenStr.equals(Constants.WECHAT_ERROR)) {
				String sendMenuUrl = Constants.WECHAT_MENU_DELETE_URL.replace("ACCESS_TOKEN", accessTokenStr);
				URL url = new URL(sendMenuUrl);
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.connect();

				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = reader.readLine();
				line = line.replace("{", "").replace("}", "").replaceAll("\"", "");
				String[] result = line.split(",");
				HashMap<String, String> resultMap = new HashMap<String, String>();
				for (int i = 0; i < result.length; i++) {
					String resultStr = result[i];
					int index = resultStr.indexOf(":");
					String key = resultStr.substring(0, index);
					String value = resultStr.substring(index + 1);
					resultMap.put(key, value);
				}
				connection.disconnect();
				reader.close();

				System.out.println("InitializeConfig deleteWeChatMenu method stop:......");
				return resultMap;
			}
			else {
				System.out.println("failure in getting access_token");
				return null;
			}
		}
		catch (Exception e) {
			System.out.println("failure in loading deleteWeChatMenu method");
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 获取员工信息
	 * 
	 * @return Employee
	 * @throws Exception
	 */
	public static Employee getEmployeeMessage(String openId) throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		Constraint c = new Constraint("Employee");
		c.addCondition("openId", openId);
		c.addCondition("ifUsing", true);
		c.addCondition("openId", null, Constraint.UNEQUAL);
		Employee employee = userService.selectEmployee(c);
		return employee;
	}

	/**
	 * 发送模板消息
	 * 
	 * @return resultMap { "errcode":“ERRCODE”, "errmsg":"ERRMSG" }
	 * @throws Exception
	 */

	public static HashMap<String, String> sendModelMessage(String openId, String data) throws Exception {

		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		ServiceConfiguration configuration = wechatService.selectServiceConfigurationByUuid(Constants.WECHAT_ACCESS_TOKEN_UUID);
		String accessTokenStr = configuration.getContent();

		if (!accessTokenStr.equals(Constants.WECHAT_ERROR)) {
			try {
				String postMessageUrl = Constants.WECHAT_SEND_MODEL_MESSAGE_URL.replace("ACCESS_TOKEN", accessTokenStr);
				URL url = new URL(postMessageUrl);
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setDoOutput(true);
				connection.setDoInput(true);
				connection.setRequestMethod("POST");
				connection.setUseCaches(false);
				connection.setInstanceFollowRedirects(true);
				connection.setRequestProperty("Content-Type", "application/json");
				connection.connect();
				OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
				String postContent = "{\"touser\":\"" + openId + "\"," + data + "}";
				out.append(postContent);
				out.flush();
				out.close();

				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = reader.readLine();
				line = line.replace("{", "").replace("}", "").replaceAll("\"", "");
				String[] result = line.split(",");
				HashMap<String, String> resultMap = new HashMap<String, String>();
				for (int i = 0; i < result.length; i++) {
					String resultStr = result[i];
					int index = resultStr.indexOf(":");
					String key = resultStr.substring(0, index);
					String value = resultStr.substring(index + 1);
					resultMap.put(key, value);
				}
				reader.close();
				connection.disconnect();

				return resultMap;
			}
			catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		else {
			return null;
		}

	}

}

@SuppressWarnings("unchecked")
class SpellComparator implements Comparator {
	public int compare(Object o1, Object o2) {
		try {
			String s1 = new String(o1.toString().getBytes("GB2312"), "ISO-8859-1");
			String s2 = new String(o2.toString().getBytes("GB2312"), "ISO-8859-1");
			return s1.compareTo(s2);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
