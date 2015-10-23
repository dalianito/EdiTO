<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>模块权限管理</title>
</head>
<body>

<script>
function getSystemRoles(){
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/get_system_role.html",{stationName:stationName},function(data){
		fillRolesDiv(data, "systemRolesDiv");
	},"json")
}
function fillRolesDiv(result, divId){
	var rolesDiv = $("#"+divId);
	var htmlStr = "";
	var prep = "&nbsp;&nbsp;";
	if(result=="1"){
		rolesDiv.html("该用户没有权限！");
	}
	else{
		htmlStr = compMenuHtml(result, htmlStr, prep, divId);
		rolesDiv.html(htmlStr);
	}
}
function compMenuHtml(menus, html, prep, divId){
	prep+="&nbsp;&nbsp;";
	for(var i=0;i<menus.length;i++){
		var menu = menus[i];
		var href = "";

		if (menu.child==0&&divId=="systemRolesDiv"){
			href = "<a href='javascript:createEmployeeRole(\""+ menu.uuid +"\")'>增加</a>";
		}
		if(divId=="employeeRolesDiv"){
			href = "<a href='javascript:deleteEmployeeRole(\""+ menu.uuid +"\")'>删除</a>";
		}
		var eleStr = "<div id='menu_"+menu.id+"'>"+prep+menu.sequence.replace(/\b(0+)/gi,"")+". "+menu.description+"&nbsp;&nbsp;"+href+"</div>";
		html+=eleStr;
		html = compMenuHtml(menu.childrens, html, prep, divId);
	}
	return html;
}
function createEmployeeRole(id){
	var personId = $("#personUuid").val();
	var param = {};
	param["uuid"]=id;
	param["personUuid"]=personId;
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/create_employee_role.html",param,function(){
		var param2 = new Array()
		param2.push({name:"uuid",value:personId});
		getEmployeeRoles(param2);
	})
}
function deleteEmployeeRole(id){
	var personId = $("#personUuid").val();
	if(personId!=""){
		var param = {};
		param["uuid"]=id;
		param["personUuid"]=personId;
		$.post(cp+"/ajaxs/resource/system/manage/authority/manage/delete_employee_role.html",param,function(){
			var param2 = new Array()
			param2.push({name:"uuid",value:personId});
			getEmployeeRoles(param2);
		})
    }
}
function getEmployeeRoles(param){
	param.push({name:"stationName",value:stationName});
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/get_employee_role.html",param,function(data){
		$("#allFuns").text("("+data["person"].name+")"+"所拥有的系统权限");
		fillRolesDiv(data["menus"], "employeeRolesDiv");
	},"json")
}
function goBack(){
	if(confirm("注意：如果您做了修改，这些修改将被保存，您确认返回吗？")){
		location.href = cp+"/pages/resource/system/manage/authority/manage/query_authority.html";
	}
}
var stationName;
function getRoles(station){
	stationName = station;
	getSystemRoles();
	var uuid = $("#personUuid").val();
	var param = new Array();
	param.push({name:"uuid",value:uuid});
	getEmployeeRoles(param);	
}
$(document).ready(function(){
	getRoles("resource");
});
</script>
<input type="hidden" id="personUuid" value="<s:property value='#request.person.uuid' />" />
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 权 限 管 理</div>
<br><br><br>
<font color="red">注意：权限修改后，需要重新登录才能生效！</font>
<br><br>
<input type="radio" name="stationName" onclick="getRoles('resource')" checked />内部资源管理平台&nbsp;&nbsp;<input type="radio" name="stationName" onclick="getRoles('content')" />教学内容配置平台
<br>
<table>
	<tr>
		<td style="vertical-align:top">
		<table width="370" border="0" cellpadding="0" cellspacing="0"
			class="InputPanel">
			<tr>
				<th>本系统的所有权限</th>
			</tr>
			<tr>
				<td>
				<div id="systemRolesDiv"></div>
				</td>
			</tr>
		</table>
		</td>
		<td style="vertical-align:top">
		<table width="370" border="0" cellpadding="0" cellspacing="0"
			class="InputPanel">
			<tr>
				<th>
				<div id="allFuns">所拥有的系统权限</div>
				</th>
			</tr>
			<tr>
				<td>
				<div id="employeeRolesDiv"></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
<a href="javascript:goBack()" >
<img src="<%=request.getContextPath()%>/images/button/b_back.gif" /></a>
</body>
</html>
