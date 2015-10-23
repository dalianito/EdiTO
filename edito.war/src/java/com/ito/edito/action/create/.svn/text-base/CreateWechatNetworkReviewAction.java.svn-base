package com.ito.edito.action.create;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.ejb.Wechat.WechatService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.schema.PosterInfo;
import com.ito.edito.schema.User;
import com.ito.edito.schema.WechatNotificiationMessage;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class CreateWechatNetworkReviewAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		WechatService wechatService = (WechatService) JndiFactory.lookup("wechatService");
		
		String reviewEmployeeUuid = request.getParameter("reviewEmployeeUuid");
		String reviewComment = request.getParameter("reviewComment");
		String uuid = request.getParameter("uuid");

		InternetPublicity internetPublicity = campusService.selectInternetPublicityByUuid(uuid);
		internetPublicity.setReviewEmployeeUuid(reviewEmployeeUuid);
		internetPublicity.setReviewComment(reviewComment);
		internetPublicity.setReviewTime(new Date());
		internetPublicity.setReviewFlagUuid(Constants.REVIEWD_FLAG);

		List<PosterInfo> posterInfoList = new ArrayList<PosterInfo>();
		internetPublicity.setPosterInfos(posterInfoList);

		Employee employee = userService.selectEmployeeByUuid(reviewEmployeeUuid);
		Constraint c = new Constraint("User");
		c.addCondition("personUuid", employee.getPersonUuid());
		c.addCondition("ifUsing", true);
		User user = userService.selectUser(c);

		ut.begin();
		try {
			WechatNotificiationMessage message = new WechatNotificiationMessage();
			Employee e = userService.selectEmployeeByUuid(internetPublicity.getRecordUuid());
			message.setSubject("SenderInternetPublicity");
			message.setReceiverOpenId(e.getOpenId());
			message.setCreate_at(new Date());
			message.setIfUsing(true);
			message.setIfShow(true);
			String senderdata = "\"first\": {\"value\":\"您提交的网络宣传已经被审阅！\",\"color\":\"#173177\"},";
			String reviewC = reviewComment != null ? reviewComment.replaceAll("[\\n]", "") : "";
			senderdata += "\"keynote1\": {\"value\":\"" + employee.getPerson().getName() + "\",\"color\":\"#173177\"},";
			senderdata += "\"keynote2\": {\"value\":\"" + reviewC + "\",\"color\":\"#173177\"},";
			senderdata += "\"keynote3\": {\"value\":\"" + Constants.DATE_FORMAT_YMDHM.format(internetPublicity.getReviewTime()) + "\",\"color\":\"#173177\"},";
			senderdata += "\"remark\": {\"value\":\"请查看 \",\"color\":\"#173177\"}";
			String senderip = ConstantFactory.getConstant("path.domain.url");
			String senderhttp = senderip + "/whttps/wechat/common/work/wechat_network_propaganda.whtml_" + e.getUuid();
			String sendercontent = "\"template_id\":\"yFfyiJmq6HcrZUUAyFQeI37_PPLn44EaqtHBA9sY-ng\",\"url\":\"" + senderhttp + "\",\"topclolr\":\"#FF0000\",\"data\":{" + senderdata + "}";
			message.setContent(sendercontent);
			message.setStatus("waiting");
			
			wechatService.insertWechatNotificiationMessage(message, user.getAccount());
			campusService.updateInternetPublicity(internetPublicity, Constants.WECHAT_USER + user.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
		
	}
}
