<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>查看班级</title>
</head>

<body>
<form id="form" name="form" method="post">
	<input type="hidden" name="uuid" />
	<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 940;
	execute();
});
function execute(){
	var courseNo = $("#courseNo").val();
	var clsTeacher = $("#clsTeacher").val();
	var clsNo = $("#clsNo").val();
	var arrangeClsTypeUuid = $("#arrangeClsTypeUuid").val();
	var campusUuid = $("#campusUuid").val();
	var courseCategoryTypeUuid = $("#courseCategoryTypeUuid").val();
	var classStateUuid = $("#classStateUuid").val();
	var clsName = $("#clsName").val();
	var data = {clsNo:clsNo,
				clsTeacher:clsTeacher,
				courseNo:courseNo,
				arrangeClsTypeUuid:arrangeClsTypeUuid,
				campusUuid:campusUuid,
				courseCategoryTypeUuid:courseCategoryTypeUuid,
				classStateUuid:classStateUuid,
				clsName:clsName,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/content/class/manage/query/class/query_class.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/content/class/manage/query/class/query_class.html",
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
	buffer += "<table width='940' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color' >";
	buffer += "<tr><th width='100'>班级名</th><th width='90'>课程编号</th><th width='120'>教授课程</th><th width='90'>班型</th><th width='100'>校区</th><th width='95'>课程类别</th><th width='85'>开课状态</th><th width='130'>已报名人数（最大）</th><th width='75'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][8]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][10]+"人("+dataStore[i][9]+"人)</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][1]+"\",\"\",\"/views/content/class/manage/view/class/view_class_info.html\",700,750)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][1]+"\",\""+dataStore[i][10]+"\")'>删除</a>";
		buffer += "</td>";
		buffer += "</tr>";
	} 
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid, numOfP){
	if(numOfP == 0) {
		if(confirm("确认删除？")){
			$.post(cp+"/ajaxs/content/class/manage/class/query/remove_class.html",{uuid:uuid},function(){
				execute();
			})
		}
	}
	else {
		alert("本班已有学生报名，无法删除！");
	}
}
</script>
<table align="left" width="940" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">班级名</th>
		<td width="120"><input id="clsNo" size="12" /></td>
		<th width="100">班型</th>
		<td width="120"><label id="arrangeClsTypeUuid" class="BaseTree" javaClassName="ClassManagement"></label></td>
		<th width="100">校区</th>
		<td width="120"><label id="campusUuid" class="BaseTree" javaClassName="Campus"></label></td>
		<th width="100">开课状态</th>
		<td width="120"><label id="classStateUuid" class="BaseTree" javaClassName="ClassState"></label></td>
	</tr>
	<tr>
		<th width="100">课程编号</th>
		<td width="120"><input id="courseNo" size="12" ></td>
		<th width="100">教授课程</th>
		<td width="120"><input id="clsName" size="12" ></td>
		<th width="100">授课教师</th>
		<td width="120"><input id="clsTeacher" size="12" ></td>
		<th width="100">课程类别</th>	
		<td width="120"><label id="courseCategoryTypeUuid" class="BaseTree" javaClassName="CourseCategoryType"></label></td>
	</tr>
</table>
<br><br><br><br>
<a href="#" onclick="execute()"> <img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br>
<br>
<div id="result" class="bigResultCon" style="width: 940px; margin-left: -10px"></div>
</body>
</html>
