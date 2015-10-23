<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>教室资源管理</title>
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
	var campusUuid = $("#campusUuid").val();
	var numberOf = $("#numberOf").val();
	var classroomName = $("#classroomName").val();
	var sortField = $("#sortField option:selected").val();
	var data = {
			    campusUuid:campusUuid,
			    numberOf:numberOf,
			    classroomName:classroomName,
				offset:1,
				recnum:24
				};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/content/resources/manage/class/manage/query_classroom_manage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/resources/manage/class/manage/query_classroom_manage.html",
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
	buffer += "<tr><th width='100'>教室名</th><th width='130'>容纳人数</th><th width='130'>校区</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"人</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][4]+"\",\"\",\"/views/content/resources/manage/class/manage/forward_classroom_manage.html\",520,780)'>查看</a>&nbsp;&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][4]+"\",\"/https/content/resources/manage/class/manage/forward_edit_classroom.html\")'>编辑</a>&nbsp;&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][4]+"\")'>删除</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/content/resources/manage/class/manage/remove_classroom.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">校区</th>
		<td width="140"><label id="campusUuid" class="BaseTree" javaClassName="Campus"></label></td>
		<th width="100">容纳人数</th>
		<td width="140"><input id="numberOf" size="11" /></td>
		<th width="100">教室名</th>
		<td width="140"><input id="classroomName" size="11" /></td>
	</tr>
</table>
<br>
<br>
<br>
<br>
<a href="#" onclick="execute()"> <img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/content/resources/manage/class/manage/create_class_manage.html">
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br>
<br>
<div id="result" class="bigResultCon" style="width: 720px; margin-left: -10px"></div>
</body>
</html>
