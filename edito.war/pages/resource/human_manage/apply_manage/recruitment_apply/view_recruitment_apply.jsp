<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看人员需求申请</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_recruitment.gif"></p>
<s:iterator value="#request.recruitment">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">需求部门：</th>
		<td width="450" colspan="3"><s:property value='department.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">现有人数：</th>
		<td width="150"><s:property value='existingNo' />人&nbsp;</td>
		<th width="150">预算人数：</th>
		<td width="150"><s:property value='budgetNo' />人&nbsp;</td>
	</tr>
	<tr>
		<th width="150">职位名称：</th>
		<td width="150"><s:property value='position' />&nbsp;</td>
		<th width="150">需求人数：</th>
		<td width="150"><s:property value='demandNo' />人&nbsp;</td>
	</tr>
	<tr>
		<th width="150">级别：</th>
		<td width="450" colspan="3"><s:property value='rank.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">直接上级：</th>
		<td width="150"><s:property value='leader.person.name' />&nbsp;</td>
		<th width="150">直接下级：</th>
		<td width="150"><s:property value='subordinate.person.name' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">下属人数：</th>
		<td width="150"><s:property value='subordinatesNo' />人&nbsp;</td>
		<th width="150">其他：</th>
		<td width="150"><s:property value='other.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">试用期最低工资：</th>
		<td width="150"><s:property value='probationLow' />元&nbsp;</td>
		<th width="150">试用期最高工资：</th>
		<td width="150"><s:property value='probationHigh' />元&nbsp;</td>
	</tr>
	<tr>
		<th width="150">转正最低工资：</th>
		<td width="150"><s:property value='positiveLow' />元&nbsp;</td>
		<th width="150">转正最高工资：</th>
		<td width="150"><s:property value='positiveHigh' />元&nbsp;</td>
	</tr>
	<tr>
		<th width="150">其他福利待遇：</th>
		<td width="450" colspan="3"><s:property value='welfare' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">工作职责：</th>
		<td width="450" colspan="3"><s:property value='duty' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">性别：</th>
		<td width="450" colspan="3"><s:property value='gender.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">最小年龄：</th>
		<td width="150"><s:property value='ageLow' />岁&nbsp;</td>
		<th width="150">最大年龄：</th>
		<td width="150"><s:property value='ageHigh' />岁&nbsp;</td>
	</tr>
	<tr>
		<th width="150">学历：</th>
		<td width="150"><s:property value='education.description' />&nbsp;</td>
		<th width="150">主修专业：</th>
		<td width="150"><s:property value='major' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">专业技术：</th>
		<td width="450" colspan="3"><s:property value='professional' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">管理能力：</th>
		<td width="450" colspan="3"><s:property value='managementAbility' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">工作背景：</th>
		<td width="450" colspan="3"><s:property value='background' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">其他技术：</th>
		<td width="450" colspan="3"><s:property value='otherTechnology' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">希望几周内到岗：</th>
		<td width="150"><s:property value='weeks' />周&nbsp;</td>
		<th width="150">希望到岗日期：</th>
		<td width="150"><s:date name='specificTime' format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">申请人：</th>
		<td width="150">
			<s:property value="apply.applicant.person.name" />
		</td>
		<th width="150">申请时间：</th>
		<td width="150"><s:date name='apply.applicationTime' format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">部门处长：</th>
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
		<th width="150">人力资源处处长：</th>
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
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
