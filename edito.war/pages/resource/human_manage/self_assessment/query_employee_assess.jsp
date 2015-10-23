<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>员工自评管理</title>
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
	var name = $("#name").val();
	var campusUuid = $("#campusUuid").val();
	var departmentUuid = $("#departmentUuid").val();
	var jobUuid = $("#jobUuid").val();
	var selfAssesstypeUuid = $("#selfAssesstypeUuid").val();
	var assessStateUuid = $("#assessStateUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {name:name,
				campusUuid:campusUuid,
				departmentUuid:departmentUuid,
				jobUuid:jobUuid,
				selfAssesstypeUuid:selfAssesstypeUuid,
				assessStateUuid:assessStateUuid,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/campus/manage/my/campus/self/assess/query_employee_assess.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/my/campus/self/assess/query_employee_assess.html",
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
	buffer += "<tr><th width='20'></th><th width='90'>自评表类型</th><th width='65'>员工姓名</th><th width='97'>组织机构</th><th width='97'>校区</th><th width='88'>岗位</th><th width='80'>自评时间</th><th width='55'>评估人</th><th width='80'>评估时间</th><th width='65'>是否评估</th><th width='35'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][10]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][11]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/campus/manage/my/campus/month/assess/forward_view_month_Assess.html\",700,750)'>查看</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/employee/manage/remove_employee.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 自 评 管 理</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="85">员工姓名</th>
		<td width="100">
			<input type="text" id="name" style="width:80px" />
		</td>
		<th width="80">校区</th>
		<td width="100">
			<label type="text" id="campusUuid" class="BaseTree" javaClassName="Campus"></label>
		</td>
		<th width="80">组织机构</th>
		<td width="100">
			<label type="text" id="departmentUuid" class="BaseTree" javaClassName="Department"></label>
		</td>
		<th width="80">岗位</th>
		<td width="100">
			<label type="text" id="jobUuid" class="BaseTree" javaClassName="Job"></label>
		</td>
	</tr>
	<tr>
		<th width="80">自评表类型</th>
		<td width="100">
			<label type="text" id="selfAssesstypeUuid" class="BaseTree" javaClassName="SelfAssessType"></label>
		</td>
		<th width="80">是否评估</th>
		<td width="100">
			<label type="text" id="assessStateUuid" class="BaseTree" javaClassName="AssessState"></label>
		</td>
		<th width="80">自评时间</th>
		<td colspan="3" width="280">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
