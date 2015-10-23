<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看学生信息</title>
	<link href="<%=request.getContextPath()%>/style/style_content.css" rel="stylesheet" type="text/css">
	<STYLE type="text/css">
		pre {
			white-space: pre-wrap; 
			white-space: -moz-pre-wrap; 
			white-space: -pre-wrap; 
			white-space: -o-pre-wrap; 
			Word-wrap: break-word; 
			}
	</STYLE>
</head>
<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_studentmessage.gif"></p>
<s:iterator value="#request.student">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">学生编号</th>
		<td width="100"><s:property value='studentID' />&nbsp;</td>
		<th width="100">学生姓名</th>
		<td width="100"><s:property value='person.name' />&nbsp;</td>
		<th width="100">性别</th>
		<td width="100"><s:property value='person.gender.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">出生日期</th>
		<td width="100"><s:date name='person.birthDate' format='yyyy-MM-dd' />&nbsp;</td>
		<th width="100">民族</th>
		<td width="100"><s:property value='person.nationality.description' />&nbsp;</td>
		<th width="100">婚否</th>
		<td width="100"><s:property value='person.marriage.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">最高学历</th>
		<td width="100"><s:property value='person.education.description' />&nbsp;</td>
		<th width="100">家长姓名</th>
		<td width="100"><s:property value='person.parentName' />&nbsp;</td>
		<th width="100">家长电话</th>
		<td width="100"><s:property value='person.parentPhone' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">政治面貌</th>
		<td width="100"><s:property value="person.political.description" />&nbsp;</td>
		<th width="100" >身份证号</th>
		<td width="300" colspan="3" ><s:property value='person.idNo' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">电话</th>
		<td width="100"><s:property value='person.cellPhone' />&nbsp;</td>
		<th width="100" >身份证住址</th>
		<td width="300" colspan="3" ><s:property value='person.address' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">QQ</th>
		<td width="100"><s:property value='person.qq' />&nbsp;</td>
		<th width="100" >实际居住住址</th>
		<td width="300" colspan="3" ><s:property value='person.realAddress' />&nbsp;</td>
	</tr>
</table>
<s:iterator value="#request.classEnrollment">
<h3>曾经上课信息</h3>
<table style="margin-top:20px" width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th colspan='6' align='center'>班级信息</th>
	</tr>
	<tr>
		<th width='100'>班级名</th>
		<td width='100'><s:property value="arrangeClass.clsNo" />&nbsp;</td>
		<th width='100'>班级类型</th>
		<td width='100'><s:property value="arrangeClass.clsType.description" />&nbsp;</td>
		<th width='100'>课程编号</th>
		<td width='100'><s:property value="arrangeClass.course.courseNo" />&nbsp;</td>
	</tr>
	<tr>
		<th width='100'>课程名</th>
		<td width='100'><s:property value="arrangeClass.course.courseName" />&nbsp;</td>
		<th width='100'>课程类别</th>
		<td width='100'><s:property value="arrangeClass.course.courseType.description" />&nbsp;</td>
		<th width='100'>校区</th>
		<td width='100'><s:property value="arrangeClass.campus.description" />&nbsp;</td>
	</tr>
</table>
<table style="margin-top:20px" width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">上课时间、地点及授课教师信息</th>
	</tr>
	<s:iterator value="#request.timePositionTeacherInfoList">
		<tr>
			<td width="400px" style="text-align:center"><s:property value="arrangeClsTime.description" />&nbsp;</td>
			<td width="100px" style="text-align:center"><s:property value="arrangeRm.classroomName" />&nbsp;</td>
			<td width="100px" style="text-align:center"><s:property value="arrangeClsTeacher.employee.person.name" />&nbsp;</td>
		</tr>
	</s:iterator>
</table>
<table style="margin-top:20px" width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th colspan="6" align="center">费用信息</th>
		</tr>
		<s:if test="#request.classEnrollment.tuition != null">
			<tr>
				<th width="100">应收取费用</th>
				<td width="100" >
					<s:property value="tuition.preDiscountAmount" />&nbsp;
				</td>
				<th width="100">折扣后总费用</th>
				<td width="100">
					<s:property value="tuition.actualTotalAmount" />&nbsp;
				</td>
				<th width="100">此次收取费用</th>
				<td width="100">
					<s:property value="tuition.amountPaid" />&nbsp;
				</td>
			</tr>
			<tr>
				<th width="100">退班原因</th>
				<td width="100" >
					<s:property value="quitReason" />&nbsp;
				</td>
				<th width="100">备注</th>
				<td colspan="3" >
					<s:property value="remark" />&nbsp;
				</td>
			</tr>
		</s:if>
		<s:else>
			<tr>
				<th width="100">收费状态 </th>
				<td width="500" >
					免费重听
				</td>
			</tr>
		</s:else>
</table>
</s:iterator>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
</body>
</html>
