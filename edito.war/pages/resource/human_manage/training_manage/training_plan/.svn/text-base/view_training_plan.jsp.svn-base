<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看培训计划</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>
<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_training_plan.gif"></p>
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
</table>
<br>
<table width="480" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">类型：</th>
		<td colspan="3">
			<s:if test="typeUuid=='10000000010160001001000000000010'">全部</s:if>
			<s:if test="typeUuid=='10000000010160001001000000000020'">组织机构</s:if>
			<s:if test="typeUuid=='10000000010160001001000000000030'">个人</s:if>
		</td>
	</tr>
	<s:if test="typeUuid=='10000000010160001001000000000020'">
		<tr>
			<th width="100">接受科室：</th>
			<td>
				<s:iterator value="#request.departments">
					<s:property value="description"/>
					<br>
				</s:iterator>
			</td>
		</tr>
	</s:if>
	<s:elseif test="typeUuid=='10000000010160001001000000000030'">
		<tr>
			<th width="100">接受人：</th>
			<td>
				<s:iterator value="#request.employees">
					<s:property value="person.name"/>
					<br>
				</s:iterator>
			</td>
		</tr>
	</s:elseif>
</table>
<br>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
