<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>教室管理</title>
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
	var classroomType = $("#classroomType").val();
	var data = {classroomType:classroomType,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/campus/manage/campus/resource/classroom/manage/query_classroom_manage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/campus/resource/classroom/manage/query_classroom_manage.html",
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
	buffer += "<table width='500' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='50'>门牌号</th><th width='100'>人数上限</th><th width='100'>教室类型</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][4]+"\",\"\",\"/views/resource/campus/manage/campus/resource/classroom/manage/forward_classroom_manage.html\",650,600)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][4]+"\", \"/https/resource/campus/manage/campus/resource/classroom/manage/forward_edit_classroom.html\")'>编辑</a>&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][4]+"\")'>删除</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/campus/manage/campus/resource/classroom/manage/remove_classroom.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;教 室 管 理</div>
<br><br><br>
<table align="left" width="200" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">教室类型</th>
		<td>
			<label id="classroomType" class="BaseTree" javaClassName="ClassroomType" ></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/campus/manage/campus/resource/classroom/manage/create_classroom_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
