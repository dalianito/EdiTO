<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看历史宣传</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
	<script>var cp = "<%=request.getContextPath()%>";</script>
	<STYLE type="text/css">
		pre {
			white-space: pre-wrap;
			white-space: -moz-pre-wrap;
			white-space: -pre-wrap;
			white-space: -o-pre-wrap;
			Word-wrap: break-word;
			}
	</STYLE>
</head>

<body class="BodyView" style="width:90%">
<script>

function openLink(url){
	window.open(url);
}

function goBack(){
	var employeeUuid = document.getElementById("employeeUuid").value;
	location.href = cp + "/whttps/wechat/common/work/wechat_network_propaganda.whtml_" + employeeUuid;
}
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_internetPublicity.gif"></p>
<input type="hidden" id="employeeUuid" value="<s:property value="#request.internetPublicity.recordUuid" />">
<s:iterator value="#request.internetPublicity">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="30%">记录人：</th>
		<td width="70%">
			<s:property value='record.person.name' />
		</td>
	</tr>
	<tr>
		<th width="30%">记录时间：</th>
		<td width="70%">
			<s:date name="recordTime" format="yyyy-MM-dd" />
		</td>
	</tr>
	<s:iterator value="posterInfos" status="rowList">
		<tr>
			<th align="center"><s:property value="#rowList.count" />&nbsp;</th>
			<td style="width:380px;word-break:break-all;"><a href="http://<s:property value="site" />"><s:property value="site" /></a>&nbsp;</td>
		</tr>
	</s:iterator>
	<tr>
		<th width="30%">备注：</th>
		<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px">	
			<pre style="word-wrap:break-word;width:90%;"><s:property value="notes" />&nbsp;</pre>
		</td>
	</tr>
	<tr>
		<th width="30%">审阅状态：</th>
		<td width="70%">
			<s:property value="reviewFlag.description" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th width="30%">评语：</th>
		<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
			<pre style="word-wrap:break-word;width:90%;"><s:property value="reviewComment" />&nbsp;</pre>
		</td>
	</tr>
	<tr>
		<th width="30%">审阅人：</th>
		<td width="70%">
			<s:property value="reviewEmployee.person.name" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th width="30%">审阅时间：</th>
		<td width="70%">
			<s:date name="reviewTime" format="yyyy-MM-dd HH:MM"/>&nbsp;<br>
		</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="goBack()" style="cursor:hand"></p>
<br>
</body>
</html>
