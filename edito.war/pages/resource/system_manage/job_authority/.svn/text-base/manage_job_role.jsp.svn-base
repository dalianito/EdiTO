<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>岗位权限管理</title>
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
		rolesDiv.html("该岗位没有权限！");
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
			href = "<a href='javascript:createJobRole(\""+ menu.uuid +"\")'>增加</a>";
		}
		if(divId=="jobRolesDiv"){
			href = "<a href='javascript:deleteJobRole(\""+ menu.uuid +"\")'>删除</a>";
		}
		var eleStr = "<div id='menu_"+menu.id+"'>"+prep+menu.sequence.replace(/\b(0+)/gi,"")+". "+menu.description+"&nbsp;&nbsp;"+href+"</div>";
		html+=eleStr;
		html = compMenuHtml(menu.childrens, html, prep, divId);
	}
	return html;
}
function createJobRole(id){
	var jobId = $("#jobUuid").val();
	var param = {};
	param["uuid"]=id;
	param["jobUuid"]=jobId;
	$.post(cp+"/ajaxs/resource/system/manage/job/authority/create_job_role.html",param,function(){
		var param2 = new Array()
		param2.push({name:"uuid",value:jobId});
		getJobRoles(param2);
	})
}
function deleteJobRole(id){
	var jobId = $("#jobUuid").val();
	if(jobId!=""){
		var param = {};
		param["uuid"]=id;
		param["jobUuid"]=jobId;
		$.post(cp+"/ajaxs/resource/system/manage/job/authority/delete_job_role.html",param,function(){
			var param2 = new Array()
			param2.push({name:"uuid",value:jobId});
			getJobRoles(param2);
		})
    }
}
function getJobRoles(param){
	param.push({name:"stationName",value:stationName});
	$.post(cp+"/ajaxs/resource/system/manage/job/authority/get_job_role.html",param,function(data){
		$("#allFuns").text("("+data["job"].description+")"+"所拥有的系统权限");
		fillRolesDiv(data["menus"], "jobRolesDiv");
	},"json")
}
function goBack(){
	if(confirm("注意：如果您做了修改，这些修改将被保存，您确认返回吗？")){
		location.href = cp+"/pages/resource/system/manage/job/authority/query_job_authority.html";
	}
}
var stationName;
function getRoles(station){
	stationName = station;
	getSystemRoles();
	var uuid = $("#jobUuid").val();
	var param = new Array();
	param.push({name:"uuid",value:uuid});
	getJobRoles(param);	
}
$(document).ready(function(){
	getRoles("resource");
});
</script>
<input type="hidden" id="jobUuid" value="<s:property value='#request.job.uuid' />" />
<div style="font-family:黑体;font-size:20px;">&nbsp;岗 位 权 限 管 理</div>
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
				<div id="jobRolesDiv"></div>
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
