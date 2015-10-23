<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
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
<body class="BodyView" style="width:90%" >
<script>
function goBack(){
	var employeeUuid = document.getElementById("employeeUuid").value;
	location.href = cp + "/whttps/wechat/approval/work/wechat_query_review.whtml_" + employeeUuid;
}
</script>

<input type="hidden" id="pageTitle" value="工 作 日 志" />
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_workRecord.gif"></p>
<input type="hidden" id="employeeUuid" value="<s:property value="#request.workRecord.reviewEmployeeUuid" />">
<table style="width:100%" cellspacing="0" cellpadding="0" border="0" class="InfoShowPanel" >
	<tr>
		<th width="30%">今日工作<br>总结</th>
		<td width="70%" style="word-break:break-all;vertical-align:top;padding-top:5px;height:110px" >
			<pre style="word-wrap:break-word;width:90%;"><s:property value="#request.workRecord.summary"/>&nbsp;</pre>
		</td>
	</tr>
	<tr>
		<th width="30%">明日工作<br>计划</th>
		<td width="70%" style="word-break:break-all;vertical-align:top;padding-top:5px;height:110px" >
			<pre style="word-wrap:break-word;width:90%;"><s:property value="#request.workRecord.schedule" />&nbsp;</pre>
		</td>
	</tr>
	<tr>
		<th width="30%">今日工作<br>感受</th>
		<td width="70%" style="word-break:break-all;vertical-align:top;padding-top:5px;height:110px" >
			<pre style="word-wrap:break-word;width:90%;"><s:property value="#request.workRecord.share" />&nbsp;</pre>
		</td>
	</tr>
	<tr>
		<th width="30%">评语</th>
		<td width="70%" style="word-break:break-all;vertical-align:top;padding-top:5px" >
			<pre style="word-wrap:break-word;width:90%;"><s:property value="#request.workRecord.reviewComment" /></pre>
		</td>
	</tr>
	<tr>
		<th width="30%">审阅人</th>
		<td width="70%"><s:property value="#request.workRecord.reviewEmployee.person.name" /></td>
	</tr>
	<tr>
		<th width="30%">审阅时间</th>
		<td width="70%"><s:date name="#request.workRecord.reviewTime" format="yyyy-MM-dd" /></td>
	</tr>
</table>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="goBack()" style="cursor:hand"></p>
</body>
</html>
