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
<input type="hidden" id="pageTitle" value="富 海 教 育" />
<br>
<table style="width:100%;height:180px;text-align:center" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="100px">
			<div style="color:red">对不起，您没有访问该模块的权限！</div>
		</td>
	</tr>
	<tr>
		<td height="80px">
			<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" style="cursor:hand">
		</td>
	</tr>
</table>
</body>
</html>
