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
<SCRIPT type="text/javascript">

function execute(){
	var fromUserName = '<%=request.getParameter("fromUserName")%>';
	var param = {fromUserName:fromUserName};
	if(confirm("确认执行？")){
		$.post(cp+"/ajaxs/wechat/wechat/manage/unverify_user.whtml", param,function(data){
			if(data == "success"){
				alert("取消成功！");	
				WeixinJSBridge.call('closeWindow');
			}
			else if(data == "noEmployee"){
				alert("该微信号并没用进行过认证，无法取消认证");
			}
		});
	}
}
</SCRIPT>
<input type="hidden" id="pageTitle" value="富 海 教 育" />
<input type="hidden" id="fromUserName" value="<s:property value='#request.fromUserName' />" />
<br>
<table style="width:100%;height:180px;text-align:center" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="100px">
			<div style="color:red">是否要执行取消认证！</div>
		</td>
	</tr>
	<tr>
		<td height="80px">
			<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onClick="execute()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" style="cursor:hand">
		</td>
	</tr>
</table>
</body>
</html>
