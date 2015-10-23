<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>学生信息</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" /></form>
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
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {personNo:personNo,
				name:name,
				genderUuid:genderUuid,
				educationUuid:educationUuid,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/content/student/manage/student/info/query_student_info.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/student/manage/student/info/query_student_info.html",
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
	buffer += "<table width='600' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='130'>学生编号</th><th width='130'>学生姓名</th><th width='100'>性别</th><th width='110'>最高学历</th><th width='130'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>&nbsp;<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/content/student/manage/student/info/forward_view_student_info.html\",600,700)'>查看</a>&nbsp;&nbsp;&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][5]+"\",\"/https/content/student/manage/student/info/forward_edit_student_info.html\")'>编辑</a>&nbsp;";
//		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][5]+"\")'>删除</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">学生编号</th>
		<td width="140"><input id="personNo" size="11" /></td>
		<th width="100">学生姓名</th>
		<td width="140"><input id="name" size="11" /></td>
		<th width="100">性别</th>
		<td width="140"><label id="genderUuid" class="BaseTree" javaClassName="Gender"></label></td>
	</tr>
	<tr>
		<th width="100">最高学历</th>
		<td width="140" ><label id="educationUuid" class="BaseTree" javaClassName="Education"></label></td>
		<th width="100">出生日期</th>
		<td width="140" colspan="3"><input type="text" id="beginDate" class="datepicker" format="all"/>&nbsp;-&nbsp;<input type="text" id="endDate" class="datepicker" format="all"/></td>
	</tr>
</table>
<br><br><br><br>
<a href="#" onclick="execute()"> <img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/content/student/manage/student/info/create_student_info.html">
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br>
<br>
<div id="result" class="bigResultCon" style="width: 720px; margin-left: -10px"></div>
</body>
</html>
