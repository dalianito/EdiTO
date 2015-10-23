<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>兼职教师</title>
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
		url: cp+"/ajaxs/content/teacher/manage/part/time/query_part_time.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/teacher/manage/part/time/query_part_time.html",
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
	buffer += "<tr><th width='65'>姓名</th><th width='100'>校区</th><th width='130'>工作单位</th><th width='70'>职务</th><th width='110' >操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][9]+"\",\"\",\"/views/content/teacher/manage/part/time/forward_view_part_time.html\",600,700)'>查看</a>&nbsp;";
		if(dataStore[i][10] == "暂离") {
			buffer += "<a title='已暂离，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='已暂离，不能重复暂离！'><font color='#888888'>暂离</font></a>";
		}
		else {
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][9]+"\",\"/https/content/teacher/manage/part/time/forward_edit_part_time.html\")'>编辑</a>&nbsp;";
			buffer += "<a href='javascript:tempDepartureInstance(\""+dataStore[i][9]+"\")'>暂离</a>";
		}
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function tempDepartureInstance(uuid){
	if(confirm("确认暂离？")){
		$.post(cp+"/https/content/teacher/manage/part/time/temp_departure_part_time.html",{uuid:uuid},function(){
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
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/content/teacher/manage/part/time/create_part_time.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
