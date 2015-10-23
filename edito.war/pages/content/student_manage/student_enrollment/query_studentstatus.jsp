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
	currentResultTableDivWidth = 860;
	execute();
});
function execute(){
	var mark = '<%=request.getParameter("mark")%>';
	var personNo = $("#personNo").val();
	var name = $("#name").val();
	var campusUuid = $("#campusUuid").val();
	var classTypeUuid = $("#classTypeUuid").val();
	var clsNo = $("#clsNo").val();
	var courseName = $("#courseName").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {mark:mark,
				personNo:personNo,
				name:name,
				campusUuid:campusUuid,
				classTypeUuid:classTypeUuid,
				clsNo:clsNo,
				courseName:courseName,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/content/student/manage/student/enrollment/query_studentstatus.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/student/manage/student/enrollment/query_studentstatus.html",
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
	buffer += "<table width='860' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='100'>学生编号</th><th width='120'>学生姓名</th><th width='90'>性别</th><th width='120'>校区</th><th width='120'>班级名</th><th width='120'>课程名</th><th width='100'>班级类型</th><th width='90'>操作</th></tr>";
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
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		if(dataStore[i][9] == "enrollment"){
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][8]+"\",\"\",\"/views/content/student/manage/student/enrollment/forward_view_student_status.html\",600,700)'>查看</a>";
		}
		else {
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][8]+"\",\"\",\"/views/content/student/manage/student/quit/forward_view_student_status.html\",600,700)'>查看</a>";
		}
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function goback(){
	var mark = '<%=request.getParameter("mark")%>';
	if(mark == "enrollment"){
		location.href = cp + "/pages/content/student/manage/student/enrollment/query_enrollment.html" ;
	}
	else{
		location.href = cp + "/pages/content/student/manage/student/quit/query_quit.html" ;
	}

}
</script>
<table align="left" width="860" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">学生编号</th>
		<td width="120"><input id="personNo" size="12" /></td>
		<th width="100">学生姓名</th>
		<td width="120"><input id="name" size="12" /></td>
		<th width="100">班级类型</th>
		<td width="120" ><label id="classTypeUuid" class="BaseTree" javaClassName="ClassManagement"></label></td>
		<th width="100">校区</th>
		<td width="100"><label id="campusUuid" class="BaseTree" javaClassName="Campus"></label></td>
	</tr>
	<tr>
		<th width="100">班级名</th>
		<td width="120" ><input id="clsNo" size="12" /></td>
		<th width="100">课程名</th>
		<td width="120" ><input type="text" id="courseName" size="12"/></td>
		<th width="100">出生日期</th>
		<td width="100" colspan="3"><input type="text" id="beginDate" class="datepicker" format="all"/>&nbsp;-&nbsp;<input type="text" id="endDate" class="datepicker" format="all"/></td>
	</tr>
</table>
<br><br><br><br>
<a href="#" onclick="execute()"><img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" onclick="goback()"><img src="<%=request.getContextPath()%>/images/button/b_back2.gif" /></a>
<br>
<br>
<div id="result" class="bigResultCon" style="width: 720px; margin-left: -10px"></div>
</body>
</html>
