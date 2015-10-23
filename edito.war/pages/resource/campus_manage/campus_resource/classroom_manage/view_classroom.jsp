<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看教室</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_classroom.gif"></p>
<s:iterator value="#request.classroom">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">门牌号：</th>
		<td width="150"><s:property value='doorplate' />&nbsp;</td>
		<th width="100">人数上限：</th>
		<td width="150"><s:property value='address' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">教室类型：</th>
		<td width="150"><s:property value='classroomType.description' />&nbsp;</td>
		<th width="100">所在校区：</th>
		<td width="150"><s:property value='campus.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">位置：</th>
		<td width="400" colspan="3"><s:property value='address' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">备注：</th>
		<td width="400" colspan="3"><s:property value='remarks' />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
