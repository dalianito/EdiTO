<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看全职教师</title>
	<link href="<%=request.getContextPath()%>/style/style_content.css" rel="stylesheet" type="text/css">
</head>
<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_full_time.gif"></p>
<s:iterator value="#request.teacher">
<input type="hidden" id="teacherUuid" value="#request.teacher.uudid" />
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">姓名：</th>
		<td width="120"><s:property value="employee.person.name" />&nbsp;</td>
		<th width="80">性别：</th>
		<td width="120"><s:property value="employee.person.gender.description" />&nbsp;</td>
		<th width="80">员工号：</th>
		<td width="120"><s:property value="employee.person.personNo" />&nbsp;</td>
	</tr>
	<tr>
		<th>出生日期：</th>
		<td><s:date name="employee.person.birthDate" format="yyyy-MM-dd" />&nbsp;</td>
		<th>民族：</th>
		<td><s:property value="employee.person.nationality.description" />&nbsp;</td>
		<th>国籍：</th>
		<td><s:property value="employee.person.country.description" />&nbsp;</td>
	</tr>
	<tr>	
		<th>身份证号：</th>
		<td colspan="3"><s:property value="employee.person.idNo" />&nbsp;</td>
		<th>学历：</th>
		<td><s:property value="employee.person.education.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>校区：</th>
		<td><s:property value="employee.campus.description" />&nbsp;</td>
		<th>岗位：</th>
		<td><s:property value="employee.job.description" />&nbsp;</td>
		<th>组织机构：</th>
		<td><s:property value="employee.department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>政治面貌：</th>
		<td><s:property value="employee.person.political.description" />&nbsp;</td>
		<th>手机：</th>
		<td><s:property value="employee.person.cellPhone" />&nbsp;</td>
		<th>工作电话：</th>
		<td><s:property value="employee.workPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th>电子邮件：</th>
		<td colspan="3"><s:property value="employee.person.email" />&nbsp;</td>
		<th>入职时间：</th>
		<td><s:date name="employee.fromDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	
	<tr>
		<th>简介：</th>
		<td colspan="5"><s:property value="employee.summary" />&nbsp;</td>
	</tr>
	<tr>
		<th>详细介绍：</th>
		<td colspan="5"><s:property value="employee.introduction" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">过往授课经历</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="120">工作单位</th>
		<th width="110">课程名称</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="180">任职时间</th>
	</tr>
	<s:iterator value="#request.preTeachingExpInfoList">
		<tr>
			<td width="40"><s:property value="sequence" />&nbsp;</td>
			<td width="120"><s:property value="unitName" />&nbsp;</td>
			<td width="110"><s:property value="className" />&nbsp;</td>
			<td width="70"><s:property value="reference" />&nbsp;</td>
			<td width="80"><s:property value="referencePhone" />&nbsp;</td>
			<td width="180"><s:date name="beginDate" format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name="endDate" format="yyyy-MM-dd" /></td>
		</tr>
	</s:iterator>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600">教授课程种类</th>
	</tr>
	<tr>
		<th width="600">课程名称</th>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;
			<s:iterator value="#request.courseCategoryTypes" status="rowstatus">
				<s:property value="description" />
			</s:iterator>
		</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">授课特色</th>
	</tr>
	<tr>
		<td style="height:84px;width:600px;word-break:break-all;vertical-align:top;padding-top:5px" colspan="6"><pre style="word-wrap:break-word"><s:property value="feature" />&nbsp;</pre></td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">备注</th>
	</tr>
	<tr>
		<td style="height:84px;width:600px;word-break:break-all;vertical-align:top;padding-top:5px" colspan="6"><pre style="word-wrap:break-word"><s:property value="notes" />&nbsp;</pre></td>
	</tr>
</table>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
