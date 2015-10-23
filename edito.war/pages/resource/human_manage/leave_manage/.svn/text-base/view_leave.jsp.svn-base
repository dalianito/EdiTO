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
		<td width="150" colspan="3"><s:property value='leaveType.description' />&nbsp;</td>
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
		<td width="450" colspan="3"><s:property value='days' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">申请日期：</th>
		<td width="450" colspan="3"><s:date name='apply.applicationTime' format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<td width="600" colspan="4"><br></td>
	</tr>
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
		<td width="150"><s:property value="apply.checkStateOne.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeOne" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
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
		<td width="150"><s:property value="apply.checkStateTwo.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeTwo" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
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
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">员工号：</th>
		<td width="450"><s:property value="apply.applicant.person.personNo" />&nbsp;</td>
	</tr>
	<tr>
		<th>姓名：</th>
		<td><s:property value="apply.applicant.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>性别：</th>
		<td><s:property value="apply.applicant.person.gender.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>出生日期：</th>
		<td><s:date name="apply.applicant.person.birthDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th>民族：</th>
		<td><s:property value="apply.applicant.person.nationality.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>国籍：</th>
		<td><s:property value="apply.applicant.person.country.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>身份证号：</th>
		<td><s:property value="apply.applicant.person.idNo" />&nbsp;</td>
	</tr>
	<tr>
		<th>学历：</th>
		<td><s:property value="apply.applicant.person.education.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>校区：</th>
		<td><s:property value="apply.applicant.campus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>岗位：</th>
		<td><s:property value="apply.applicant.job.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>组织机构：</th>
		<td><s:property value="apply.applicant.department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>政治面貌：</th>
		<td><s:property value="apply.applicant.person.political.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>手机：</th>
		<td><s:property value="apply.applicant.person.cellPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th>办公电话：</th>
		<td><s:property value="apply.applicant.workPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th>电子邮件：</th>
		<td><s:property value="apply.applicant.person.email" />&nbsp;</td>
	</tr>
	<tr>
		<th>入职时间：</th>
		<td><s:date name="apply.applicant.fromDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th>简介：</th>
		<td><s:property value="apply.applicant.summary" />&nbsp;</td>
	</tr>
	<tr>
		<th>详细介绍：</th>
		<td><s:property value="apply.applicant.introduction" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
