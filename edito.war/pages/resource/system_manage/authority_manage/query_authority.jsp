<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>员工权限管理</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 720;
	execute();
});
function execute(){
	var personNo = $("#personNo").val();
	var name = $("#name").val();
	var genderUuid = $("#genderUuid").val();
	var educationUuid = $("#educationUuid").val();
	var departmentUuid = $("#departmentUuid").val();
	var campusUuid = $("#campusUuid").val();
	var sortField = $("#sortField option:selected").val();
	var data = {personNo:personNo,
				name:name,
				genderUuid:genderUuid,
				educationUuid:educationUuid,
				departmentUuid:departmentUuid,
				campusUuid:campusUuid,
				sortField:sortField,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/system/manage/authority/manage/query_employee.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/system/manage/authority/manage/query_employee.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function addData(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='60'>员工号</th><th width='60'>姓名</th><th width='60'>性别</th><th width='50'>学历</th><th width='90'>组织机构</th><th width='90'>校区</th><th width='90'>入职时间</th><th width='70'>有无帐户</th><th width='130'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][11]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += (dataStore[i][7]=="true" ? "<td align='center'><font color='red'>有</font></td>" : "<td align='center'>无</td>");
		buffer += "<td align='center'>";
		if(dataStore[i][7]=="true"){
//		    buffer += "<a href='javascript:editInstance(\""+dataStore[i][8]+"\",\"/https/resource/system/manage/authority/manage/manage_employee_role.html\")'>模块权限</a>&nbsp;";
		    buffer += "<a href='javascript:editInstance(\""+dataStore[i][8]+"\",\"/https/resource/system/manage/authority/manage/manage_approval_role.html\")'>审批权限</a>";
		}
		else{
//			buffer += "<a title='未创建用户，不能分配模块权限！'><font color='#888888'>模块权限</font></a>&nbsp;";
			buffer += "<a title='未创建用户，不能分配审批权限！'><font color='#888888'>审批权限</font></a>";
		}
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 权 限 管 理</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">员工号</th>
		<td width="140">
			<input id="personNo" size="11" />
		</td>
		<th width="100">姓名</th>
		<td width="140">
			<input id="name" size="11" />
		</td>
		<th width="100">性别</th>
		<td width="140">
			<label id="genderUuid" class="BaseTree" javaClassName="Gender" ></label>
		</td>
	</tr>
	<tr>
		<th width="100">学历</th>
		<td width="140">
			<label id="educationUuid" class="BaseTree" javaClassName="Education" ></label>
		</td>
		<th width="100">组织机构</th>
		<td width="140">
			<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
		</td>
		<th width="100">校区</th>
		<td width="140">
			<label id="campusUuid" class="BaseTree" javaClassName="Campus" ></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<div style="float:right">
排序：<select id="sortField" onchange="execute()">
		<option value="personNo" selected="selected">员工号</option>
		<option value="genderUuid">性别</option>
		<option value="departmentUuid">组织机构</option>
		<option value="campusUuid">校区</option>
	</select>
</div>
<br><br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
