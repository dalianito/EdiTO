<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看个人培训总结</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_employee_summary.gif"></p>
<s:iterator value="#request.applyInfo">
<table width="480" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">申请人：</th>
		<td><s:property value="applicant.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">课程设置：</th>
		<td colspan="3"><s:property value="curriculum" />&nbsp;</td>
	</tr>
	<tr>
		<th>教学效果：</th>
		<td colspan="3"><s:property value="effect" />&nbsp;</td>
	</tr>
	<tr>
		<th>实际情况：</th>
		<td colspan="3"><s:property value="situation" />&nbsp;</td>
	</tr>
	<tr>
		<th>建议：</th>
		<td colspan="3"><s:property value="suggest" />&nbsp;</td>
	</tr>
</table>
<br>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
