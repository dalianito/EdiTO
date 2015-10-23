<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看员工差错</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<s:iterator value="#request.mistake">
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_mistake.gif"></p>
<table width="380" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">标题：</th>
		<td width="280"><s:property value='title' />&nbsp;</td>
	</tr>
	<tr>
		<th>内容：</th>
		<td><s:property value='content' />&nbsp;</td>
	</tr>
	<tr>
		<th>记录人：</th>
		<td><s:property value="recorder.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>记录时间：</th>
		<td><s:date name="recordTime" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
