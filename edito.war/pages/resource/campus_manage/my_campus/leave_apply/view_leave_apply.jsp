<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看请假申请</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_leaveApplication.gif"></p>
<s:iterator value="#request.leaveApplication">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">申请人：</th>
		<td width="150"><s:property value="apply.applicant.person.name" /></td>
		<th width="150">组织机构：</th>
		<td width="150"><s:property value='department.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">请假类别：</th>
		<td width="450" colspan="3"><s:property value='leaveType.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">请假事由：</th>
		<td width="450" colspan="3"><s:property value='leaveReason' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">开始时间：</th>
		<td width="150"><s:date name='fromDt' format="yyyy-MM-dd" />&nbsp;</td>
		<th width="150">结束时间：</th>
		<td width="150"><s:date name='toDt' format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">请假天数：</th>
		<td width="450" colspan="3"><s:property value="days" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">备注：</th>
		<td width="450" colspan="3"><font color="red"><s:property value="leaveType.notes" escape="false" /></font>&nbsp;</td>
	</tr>
	<tr>
		<th width="150">申请时间：</th>
		<td width="450" colspan="3"><s:date name="apply.applicationTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">主管领导：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerOne.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesOne" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="160"><s:property value="apply.checkStateOne.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="160"><s:date name="apply.checkTimeOne" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">分校校长：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerTwo.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesTwo" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="160"><s:property value="apply.checkStateTwo.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="160"><s:date name="apply.checkTimeTwo" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">校长：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerThree.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesThree" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="150"><s:property value="apply.checkStateThree.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeThree" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
