<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看员工信息</title>
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_employee.gif"></p>
<s:iterator value="#request.employee">
<script>
$(document).ready(function(){
	getRoles("resource");
	getRoles("content");
});
function getRoles(stationName){
	var cp = "<%=request.getContextPath()%>";
	var param = {uuid:"<s:property value='personUuid' />",stationName:stationName};
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/get_employee_role.html",param,function(data){
		if(data["person"]==null){
			fillRolesDiv(data, stationName);
		}
		else{
			fillRolesDiv(data["menus"], stationName);
		}
	},"json");
}
function fillRolesDiv(result, stationName){
	var rolesDiv = $("#employeeRolesDiv_"+stationName);
	var htmlStr = "";
	var prep = "&nbsp;&nbsp;";
	if(result=="1"){
		rolesDiv.html("该用户没有系统权限！");
	}
	else if(result=="2"){
		rolesDiv.html("还没有为此医生建立系统帐户！");
	}
	else{
		htmlStr = compMenuHtml(result, htmlStr, prep);
		rolesDiv.html(htmlStr+"<br>");
	}
}
function compMenuHtml(menus, html, prep){
	prep+="&nbsp;&nbsp;";
	for(var i=0;i<menus.length;i++){
		var menu = menus[i];
		var eleStr = "<div id='menu_"+menu.id+"'>"+prep+menu.sequence.replace(/\b(0+)/gi,"")+". "+menu.description+"&nbsp;&nbsp;</div>";
		html+=eleStr;
		html = compMenuHtml(menu.childrens, html, prep);
	}
	return html;
}
</script>
<table width="380" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">员工号：</th>
		<td width="280"><s:property value="person.personNo" />&nbsp;</td>
	</tr>
	<tr>
		<th>姓名：</th>
		<td><s:property value="person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>性别：</th>
		<td><s:property value="person.gender.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>出生日期：</th>
		<td><s:date name="person.birthDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th>民族：</th>
		<td><s:property value="person.nationality.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>国籍：</th>
		<td><s:property value="person.country.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>身份证号：</th>
		<td><s:property value="person.idNo" />&nbsp;</td>
	</tr>
	<tr>
		<th>学历：</th>
		<td><s:property value="person.education.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>校区：</th>
		<td><s:property value="campus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>岗位：</th>
		<td><s:property value="job.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>组织机构：</th>
		<td><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>政治面貌：</th>
		<td><s:property value="person.political.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>手机：</th>
		<td><s:property value="person.cellPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th>工作电话：</th>
		<td><s:property value="workPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th>电子邮件：</th>
		<td><s:property value="person.email" />&nbsp;</td>
	</tr>
	<tr>
		<th>入职时间：</th>
		<td><s:date name="fromDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th>简介：</th>
		<td><s:property value="summary" />&nbsp;</td>
	</tr>
	<tr>
		<th>详细介绍：</th>
		<td><s:property value="introduction" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
