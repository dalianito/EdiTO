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
	<title>查看请假申请</title>
	<script>var cp = "<%=request.getContextPath()%>";</script>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView" style="width:90%">
<script>
function goBack(){
	var employeeUuid = document.getElementById("employeeUuid").value;
	location.href = cp + "/whttps/wechat/approval/work/wechat_leave_approval.whtml_" + employeeUuid;
}
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_leaveApplication.gif"></p>
<input type="hidden" id="employeeUuid" value="<s:property value="#request.employeeUuid" />">
<s:iterator value="#request.leaveApplication">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="22%">申请人:</th>
		<td width="28%"><s:property value="apply.applicant.person.name" /></td>
		<th width="22%">组织机构:</th>
		<td width="28%"><s:property value='department.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="22%">请假类别:</th>
		<td width="78%" colspan="3"><s:property value='leaveType.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="22%">请假事由:</th>
		<td width="78%" colspan="3"><s:property value='leaveReason' />&nbsp;</td>
	</tr>
	<tr>
		<th width="22%">开始时间:</th>
		<td width="28%"><s:date name='fromDt' format="yyyy-MM-dd" />&nbsp;</td>
		<th width="22%">结束时间:</th>
		<td width="28%"><s:date name='toDt' format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th width="22%">请假天数：</th>
		<td width="78%" colspan="3"><s:property value="days" />&nbsp;</td>
	</tr>
	<tr>
		<th width="22%">备注：</th>
		<td width="78%" colspan="3">
			<!-- 
			<font color="red"><s:property value="leaveType.notes" escape="false" /></font>&nbsp;
			 -->
		</td>
	</tr>
	<tr>
		<th width="23%">申请时间：</th>
		<td width="78%" colspan="3"><s:date name="apply.applicationTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<s:if test="apply.checkerOneUuid != null">
		<tr>
			<th width="22%">主管领导:</th>
			<td width="78%" colspan="3"><s:property value="apply.checkerOne.person.name" />&nbsp;</td>
		</tr>
		<tr>
			<th width="22%">相关意见:</th>
			<td width="78%" colspan="3"><s:property value="apply.notesOne" />&nbsp;</td>
		</tr>
		<tr>
			<th width="22%">审批结果:</th>
			<td width="20%"><s:property value="apply.checkStateOne.description" />&nbsp;</td>
			<th width="22%">审批时间:</th>
			<td width="36%"><s:date name="apply.checkTimeOne" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
		</tr>
	</s:if>
	<s:if test="apply.checkerTwoUuid != null">
		<tr>
			<th width="22%">分校校长:</th>
			<td width="78%" colspan="3"><s:property value="apply.checkerTwo.person.name" />&nbsp;</td>
		</tr>
		<tr>
			<th width="22%">相关意见:</th>
			<td width="78%" colspan="3"><s:property value="apply.notesTwo" />&nbsp;</td>
		</tr>
		<tr>
			<th width="22%">审批结果:</th>
			<td width="20%"><s:property value="apply.checkStateTwo.description" />&nbsp;</td>
			<th width="22%">审批时间:</th>
			<td width="36%"><s:date name="apply.checkTimeTwo" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
		</tr>
	</s:if>
	<s:if test="apply.checkerThreeUuid != null">
		<tr>
			<th width="22%">校长:</th>
			<td width="78%" colspan="3"><s:property value="apply.checkerThree.person.name" />&nbsp;</td>
		</tr>
		<tr>
			<th width="22%">相关意见:</th>
			<td width="78%" colspan="3"><s:property value="apply.notesThree" />&nbsp;</td>
		</tr>
		<tr>
			<th width="22%">审批结果:</th>
			<td width="20%"><s:property value="apply.checkStateThree.description" />&nbsp;</td>
			<th width="22%">审批时间:</th>
			<td width="36%"><s:date name="apply.checkTimeThree" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
		</tr>
	</s:if>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="goBack()" style="cursor:hand"></p>
<br>
</body>
</html>
