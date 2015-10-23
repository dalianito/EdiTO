<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>教师离岗查看</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 740;
	execute();
});
function execute(){
	var name = $("#name").val();
	var genderUuid = $("#genderUuid").val();
	var campusUuid = $("#campusUuid").val()
	var sortField = $("#sortField option:selected").val();
	var data = {name:name,
				genderUuid:genderUuid,
				campusUuid:campusUuid,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/content/teacher/manage/post/teacher/query_post_teacher.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/teacher/manage/post/teacher/query_post_teacher.html",
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
	buffer += "<table width='550' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='55'>姓名</th><th width='95'>校区</th><th width='75'>在职状态</th><th width='85' >操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][11]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][9]+"\",\"\",\"/views/content/teacher/manage/post/teacher/forward_view_teacher.html\",600,700)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:returnJobInstance(\""+dataStore[i][9]+"\")'>复职</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function returnJobInstance(uuid){
	if(confirm("确认复职？")){
		$.post(cp+"/https/content/teacher/manage/post/teacher/return_job_post_teacher.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<table align="left" width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">姓名</th>
		<td width="150">
			<input id="name" size="11" />
		</td>
		<th width="100">校区</th>
		<td width="150">
			<label id="campusUuid" class="BaseTree" javaClassName="Campus" ></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
