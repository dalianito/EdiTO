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
<table style="margin-top:20px" width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">过往教育经历</th>
	</tr>
	<tr>
		<th width="220">学校</th>
		<th width="140">学习内容</th>
		<th width="120">开始时间</th>
		<th width="120">结束时间</th>
	</tr>
	<s:iterator value="#request.educationExpInfoList">
		<tr>
			<td width="240" align="center"><s:property value="school" />&nbsp;</td>
			<td width="120" align="center"><s:property value="degree" />&nbsp;</td>
			<td width="120" align="center"><s:date name="beginDate" format="yyyy-MM-dd" />&nbsp;</td>
			<td width="120" align="center"><s:date name="beginDate" format="yyyy-MM-dd" />&nbsp;</td>
		</tr>
	</s:iterator>
</table>
<table style="margin-top:20px" width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
<tr>
	<th width="100">特殊专长</th>
	<td width="500" style="height:80px;width:500px;white-space:-moz-pre-wrap;vertical-align:top;padding-top:5px" colspan="5"><pre><s:property value='person.specialExpertise' /></pre>&nbsp;</td>
</tr>
<tr>
	<th width="100">外语及<br>熟练程度</th>
	<td width="500" style="height:80px;width:500px;white-space:-moz-pre-wrap;vertical-align:top;padding-top:5px" colspan="5"><pre><s:property value='person.foreignLanguageAndQualification' /></pre>&nbsp;</td>	
</tr>
<tr>
	<th width="110px">备注</th>
	<td width="500px" style="height:80px;width:500px;white-space:-moz-pre-wrap;vertical-align:top;padding-top:5px" colspan="5"><pre><s:property value='note' /></pre>&nbsp;</td>
</tr>
</table>
<table style="margin-top:20px" width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">所在班级信息</th>
	</tr>
	<tr>
		<th width="115">班级名</th>
		<th width="125">教授课程</th>
		<th width="105">班型</th>
		<th width="105">校区</th>
		<th width="105">班级状态</th>
	</tr>
	<s:iterator value="#request.classEnrollmentList">
		<tr>
			<td width="115" align="center"><s:property value="arrangeClass.clsNo" />&nbsp;</td>
			<td width="125" align="center"><s:property value="arrangeClass.course.courseName" />&nbsp;</td>
			<td width="105" align="center"><s:property value="arrangeClass.clsType.description" />&nbsp;</td>
			<td width="105" align="center"><s:property value="arrangeClass.campus.description" />&nbsp;</td>
			<td width="105" align="center"><s:property value="arrangeClass.classState.description" />&nbsp;</td>
		</tr>
	</s:iterator>
</table>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
</body>
</html>
