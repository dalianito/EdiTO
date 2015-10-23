<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
</head>

<body class="BodyView">
<script>
Validation.init("wechat/wechat_manage/wechat_verify_user.xml");

var mark = true;
function execute(elementId){
	if(mark){
		var fromUserName = '<%=request.getParameter("fromUserName")%>';
		if(fromUserName == "null"){
			fromUserName = $("#fromUserName").val();
		}
		if(fromUserName != ""){
			if(Validation.excuteValidate(elementId)){
				mark = false;

				var userName = $("#userName").val();
				var userPassword = $("#userPassword").val();
				var param = {userName:userName,userPassword:userPassword,fromUserName:fromUserName};
				$.post(cp+"/ajaxs/wechat/wechat/manage/verify_user.whtml", param, function(data){
					if(data == "success"){
						alert("账户关联成功！");
						WeixinJSBridge.call('closeWindow');
					}
					else if(data == "noUser"){
						alert("用户名密码错误，没有找到对应账户！");
					}
					else if(data == "verified"){
						var reflag = "verified";
						var param = {userName:userName,userPassword:userPassword,fromUserName:fromUserName,reflag:reflag};
						if(confirm("该账户已关联微信,是否继续？")){
							$.post(cp+"/ajaxs/wechat/wechat/manage/verify_user.whtml", param, function(d){
								if(d == "verified"){
									alert("该账户已关联微信，请勿重复操作！");
								}
								else {
									alert("账户关联成功！");
								}
								mark = true;
								WeixinJSBridge.call('closeWindow');
							});
						}
					}
					
					$("#userName").val("");
					$("#userPassword").val("");

					mark = true;
				});
			}
		}
		else {
			alert("页面异常，请重新访问！");
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<input type="hidden" id="pageTitle" value="关 联 帐 户" />
<br>
<input type="hidden" id="fromUserName" value="<s:property value='#request.fromUserName' />" />
<form id="formA">
<table style="width:100%;height:180px;text-align:center" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="100px">
			用户名：<input id="userName" name="userName" validate="true" style="width:50%" />&nbsp;<font color="#996633">*</font><br><br>
			密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" id="userPassword" name="userPassword" validate="true" style="width:50%" />&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<td height="80px">
			<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onClick="execute('formA')" />&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" />
		</td>
	</tr>
</table>
</form>
</body>
</html>
