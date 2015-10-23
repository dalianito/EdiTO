<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>离职员工管理</title>
</head>

<body>
<form id="form" name="form" method="post"><input type="hidden"
	name="uuid" /> <input type="hidden" name="resultCode" /></form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 720;
	execute();
});
function execute(){
	var name = $("#name").val();
	var genderUuid = $("#genderUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var departmentUuid = $("#departmentUuid").val();
	var campusUuid = $("#campusUuid").val();
	var sortField = $("#sortField option:selected").val();
	var data = {name:name,
				genderUuid:genderUuid,
				departmentUuid:departmentUuid,
				campusUuid:campusUuid,
				beginDate:beginDate,
				endDate:endDate,
				sortField:sortField,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/human/manage/left/manage/query_left.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/human/manage/left/manage/query_left.html",
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
	buffer += "<tr><th width='20'></th><th width='60'>员工号</th><th width='60'>姓名</th><th width='50'>性别</th><th width='50'>学历</th><th width='90'>组织机构</th><th width='95'>校区</th><th width='105'>入职时间</th><th width='100'>离职时间</th><th width='90'>操作</th></tr>";
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
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][10]+"\",\"\",\"/views/resource/human/manage/employee/manage/forward_view_employee.html\",520,620)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][8]+"\")'>删除</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/left/manage/remove_left.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family: 黑体; font-size: 20px;">&nbsp;离 职 员 工 管 理</div>
<br>
<br>
<br>
<table align="left" width="720" border="0" cellpadding="0"
	cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">姓名</th>
		<td width="140"><input id="name" size="11" /></td>
		<th width="100">性别</th>
		<td width="140"><label id="genderUuid" class="BaseTree"
			javaClassName="Gender"></label></td>
		<th width="100">组织机构</th>
		<td width="140"><label id="departmentUuid" class="BaseTree"
			javaClassName="Department"></label></td>
	</tr>
	<tr>
		<th width="100">校区</th>
		<td width="140"><label id="campusUuid" class="BaseTree"
			javaClassName="Campus"></label></td>
		<th width="100">离职时间</th>
		<td width="360" colspan="3"><label type="text" id="beginDate"
			class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label
			type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br>
<br>
<br>
<br>
<br>
<a href="#" onclick="execute()"> <img
	src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<div style="display: inline; margin-left: 498px">排序：<select
	id="sortField" onchange="execute()">
	<option value="personNo" selected="selected">员工号</option>
	<option value="genderUuid">性别</option>
	<option value="departmentUuid">组织机构</option>
	<option value="campusUuid">校区</option>
</select></div>
<br>
<br>
<div id="result" class="bigResultCon"
	style="width: 720px; margin-left: -10px"></div>
</body>
</html>
