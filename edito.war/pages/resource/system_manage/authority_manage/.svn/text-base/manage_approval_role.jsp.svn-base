<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>审批权限管理</title>
</head>
<body>

<script>
function getSystemRoles(){
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/get_approval_role.html",{},function(data){
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
	for(var i=0;i<menus.length;i++){
		var menu = menus[i];
		var href = "";

		var prepChild = "";
		if(menu.ifHasChild==1){
			var eleStr = "<div>"+prep+menu.sequence.replace(/\b(0+)/gi,"")+". "+menu.description+"&nbsp;&nbsp;"+href+"</div>";
			html+=eleStr;
		}
		else if (menu.ifHasChild==0&&divId=="systemRolesDiv"){
			prepChild = "&nbsp;&nbsp;";
			href = "<a id='add_"+menu.uuid+"' href='javascript:createEmployeeRole(\""+ menu.uuid +"\")'>增加</a>";
			var eleStr = "<div>"+prep+prepChild+menu.sequence.replace(/\b(0+)/gi,"")+". "+menu.description+"&nbsp;&nbsp;"+href+"</div>";
			html+=eleStr;
		}
		if(divId=="employeeRolesDiv"){
			href = "<a id='del_"+menu.uuid+"' href='javascript:deleteEmployeeRole(\""+ menu.uuid +"\")'>删除</a>";
			$("a[id^='add_"+menu.uuid.substring(0, 27)+"']").css("display", "none");
			var eleStr = "<div>"+prep+menu.fullSequence+". "+menu.description+"&nbsp;&nbsp;"+href+"</div>";
			html+=eleStr;
		}
	}
	return html;
}
function createEmployeeRole(id){
	$("a[id^='add_"+id.substring(0, 27)+"']").css("display", "none");
	var personId = $("#personUuid").val();
	var param = {};
	param["uuid"]=id;
	param["personUuid"]=personId;
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/create_employee_approval_role.html",param,function(){
		var param2 = new Array()
		param2.push({name:"uuid",value:personId});
		getEmployeeRoles(param2);
	})
}
function deleteEmployeeRole(id){
	$("a[id^='add_"+id.substring(0, 27)+"']").css("display", "inline");
	var personId = $("#personUuid").val();
	if(personId!=""){
		var param = {};
		param["uuid"]=id;
		param["personUuid"]=personId;
		$.post(cp+"/ajaxs/resource/system/manage/authority/manage/delete_employee_approval_role.html",param,function(){
			var param2 = new Array()
			param2.push({name:"uuid",value:personId});
			getEmployeeRoles(param2);
		})
    }
}
function getEmployeeRoles(param){
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/get_employee_approval_role.html",param,function(data){
		$("#allFuns").text("("+data["person"].name+")"+"所拥有的系统权限");
		fillRolesDiv(data["menus"], "employeeRolesDiv");
	},"json")
}
function goBack(){
	if(confirm("注意：如果您做了修改，这些修改将被保存，您确认返回吗？")){
		location.href = cp+"/pages/resource/system/manage/authority/manage/query_authority.html";
	}
}
$(document).ready(function(){
	getSystemRoles();
	var uuid = $("#personUuid").val();
	var param = new Array();
	param.push({name:"uuid",value:uuid});
	getEmployeeRoles(param);	
});
</script>
<input type="hidden" id="personUuid" value="<s:property value='#request.person.uuid' />" />
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 权 限 管 理</div>
<br><br><br>
<font color="red">注意：同一用户在同一大项中只能拥有一个子权限！</font>
<br><br>
<table>
	<tr>
		<td style="vertical-align:top">
		<table width="370" border="0" cellpadding="0" cellspacing="0"
			class="InputPanel">
			<tr>
				<th>本系统的所有审批权限</th>
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
				<div id="allFuns">所拥有的审批权限</div>
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
