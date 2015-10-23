<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看班级</title>
	<link href="<%=request.getContextPath()%>/style/style_content.css" rel="stylesheet" type="text/css">
</head>
<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_class_info.gif"></p>
<s:iterator value="#request.arrangeClass">
<table width="720px" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th colspan="6">基本信息</th>
	</tr>
	<tr>
		<th width="130px">课程编号</th>
		<td width="150px"><s:property value="course.courseNo" />&nbsp;</td>
		<th width="130px">课程名</th>
		<td width="150px"><s:property value="course.courseName" />&nbsp;</td>
		<th width="130px">课程类别</th>
		<td width="150px"><s:property value="course.courseType.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>预计总课时</th>
		<td><s:property value="course.expectedHour" />&nbsp;课时</td>
		<th>预计总费用</th>
		<td colspan="3"><s:property value="course.expectedCost" />&nbsp;元</td>
	</tr>
	<tr>
		<th>适合学员</th>
		<td colspan="5"><s:property value="course.fitableStudent" />&nbsp;</td>
	</tr>
	<tr>
		<th>课程简介</th>
		<td colspan="5"><s:property value="course.courseDescription" />&nbsp;</td>
	</tr>
	<tr>
		<th>教学目标</th>
		<td colspan="5"><s:property value="course.teachingTarget" />&nbsp;</td>
	</tr>
	<tr>
		<th>授课内容</th>
		<td colspan="5"><s:property value="course.teachingContent" />&nbsp;</td>
	</tr>
	<tr>
		<th>课程特色</th>
		<td colspan="5"><s:property value="course.teachingFeature" />&nbsp;</td>
	</tr>
	<tr>
		<th>教材说明</th>
		<td colspan="5"><s:property value="course.relatedMaterials" />&nbsp;</td>
	</tr>
	<tr>
		<th>其他</th>
		<td colspan="5"><s:property value="course.notes" />&nbsp;</td>
	</tr>
	<tr>
		<th width="130px">班级名</th>
		<td width="150px"><s:property value="clsNo" />&nbsp;</td>
		<th width="130px">班型</th>
		<td width="150px"><s:property value="clsType.description" />&nbsp;</td>
		<th width="130px">校区</th>
		<td width="150px"><s:property value="campus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="5"><s:property value="notes" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="720px" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th colspan="6">上课信息</th>
		</tr>
		<tr>
			<th width="120px">实际总课时</th>
			<td width="120px"><s:property value="actualHour" />&nbsp;课时</td>
			<th width="120px">实际总费用</th>
			<td width="120px"><s:property value="actualCost" />&nbsp;元</td>
			<th width="120px">班级最大人数上限</th>
			<td width="120px"><s:property value="maxNoP" />&nbsp;人</td>
		</tr>
</table>
</s:iterator>
<br>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="720" colspan="6">上课时间、地点及授课教师信息</th>
	</tr>
	<tr>
		<th width="500px">时间信息</th>
		<th width="130px">教室信息</th>
		<th width="90px">教师信息</th>
	</tr>
	<s:iterator value="#request.timePositionTeacherInfoList">
		<tr>
			<td width="500px" style="text-align:center"><s:property value="arrangeClsTime.description" />&nbsp;</td>
			<td width="130px" style="text-align:center"><s:property value="arrangeRm.classroomName" />&nbsp;</td>
			<td width="90px" style="text-align:center"><s:property value="arrangeClsTeacher.employee.person.name" />&nbsp;</td>
		</tr>
	</s:iterator>
</table>

<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
