<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看培训规划</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>
<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_training_program.gif"></p>
<s:iterator value="#request.trainingPlan">
<table width="480" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">培训主题：</th>
		<td><s:property value="title" />&nbsp;</td>
		<th width="100">讲师：</th>
		<td><s:property value="lecturer.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>培训日期：</th>
		<td><s:date name="trainingTime" format="yyyy-MM-dd" />&nbsp;</td>
		<th>组织机构：</th>
		<td><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>审核状态：</th>
		<td><s:property value="state.description" />&nbsp;</td>
		<th>发布人：</th>
		<td><s:property value="publisher.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>面向类型：</th>
		<td colspan="3"><s:property value="type.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>内容：</th>
		<td colspan="3"><s:property value="content" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="480" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<s:iterator value="#request.applyInfo">
		<s:if test="curriculum!=null">
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
		</s:if>
	</s:iterator>
</table>
<br>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
