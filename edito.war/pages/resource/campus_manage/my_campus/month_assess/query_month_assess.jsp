<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>月度考核</title>
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
	var selfAssesstypeUuid = $("#selfAssesstypeUuid").val();
	var assessStateUuid = $("#assessStateUuid").val();
	var name = $("#name").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {name:name,
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
	buffer += "<tr><th width='20'></th><th width='90'>自评表类型</th><th width='110'>员工姓名</th><th width='80'>自评时间</th><th width='110'>组织机构</th><th width='105'>岗位</th><th width='70'>是否考核</th><th>操作</th></tr>";
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
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/campus/manage/my/campus/month/assess/forward_view_month_Assess.html\",700,750)'>查看</a>&nbsp;";

		if(dataStore[i][6] == "是") {
			buffer += "<a title='领导已经评估，不能重复评估！'><font color='#888888'>评估</font></a>";
		}
		else {
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][7]+"\",\"/https/resource/campus/manage/my/campus/month/assess/edit_month_assess.html\")'>评估</a>";
		}
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
<div style="font-family:黑体;font-size:20px;">&nbsp;月 度 考 核</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">员工姓名</th>
		<td width="120">
			<input type="text" id="name" size="11" />
		</td>
		<th width="80">自评表类型</th>
		<td width="120">
			<label type="text" id="selfAssesstypeUuid" class="BaseTree" javaClassName="SelfAssessType"></label>
		</td>
		<th width="80">是否考核</th>
		<td width="120">
			<label type="text" id="assessStateUuid" class="BaseTree" javaClassName="AssessState"></label>
		</td>
	</tr>
	<tr>
		<th width="80">自评时间</th>
		<td colspan="5" width="240">
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
