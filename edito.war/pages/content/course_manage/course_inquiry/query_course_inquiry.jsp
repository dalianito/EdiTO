<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>查看课程</title>
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
	var courseNo = $("#courseNo").val();
	var courseName = $("#courseName").val();
	var courseTypeUuid = $("#courseTypeUuid").val()
	var data = {courseNo:courseNo,
				courseName:courseName,
				courseTypeUuid:courseTypeUuid,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/content/course/manage/course/inquiry/query_course_inquiry.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/course/manage/course/inquiry/query_course_inquiry.html",
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
	buffer += "<tr><th width='130'>课程编号</th><th width='190'>课程名</th><th width='130'>课程类别</th><th width='125'>操作</th></tr>";
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
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][4]+"\",\"\",\"/views/content/course/manage/course/inquiry/forward_view_course.html\",600,700)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][4]+"\",\"/https/content/course/manage/course/inquiry/forward_edit_course.html\")'>编辑</a>&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][4]+"\")'>删除</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/content/course/manage/course/inquiry/remove_course.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">课程编号</th>
		<td width="140">
			<input id="courseNo" size="11" />
		</td>
		<th width="100">课程名</th>
		<td width="140">
			<input id="courseName" size="11" />
		</td>
		<th width="100">课程类别</th>
		<td width="140">
			<label id="courseTypeUuid" class="BaseTree" javaClassName="CourseCategoryType" ></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/content/course/manage/course/generate/query_course_generate.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
