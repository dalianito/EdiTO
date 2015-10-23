<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>月度自评</title>
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
	var name="myself";
	var selfAssesstypeUuid = $("#selfAssesstypeUuid").val();
	var assessStateUuid = $("#assessStateUuid").val();
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
	buffer += "<tr><th width='20'></th><th width='90'>自评表类型</th><th width='80'>自评时间</th><th width='110'>组织机构</th><th width='105'>岗位</th><th width='110'>校区</th><th width='70'>是否考核</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		if(dataStore[i][8] == "月度自评")
		{
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/campus/manage/my/campus/self/assess/forward_view_Assess.html\",600,700)'>查看</a>&nbsp;";
		}
		else {
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/campus/manage/my/campus/self/assess/forward_view_probation.html\",600,700)'>查看</a>&nbsp;";
		}
		
		if(dataStore[i][6] == "是") {
			buffer += "<a title='领导已经评估，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='领导已经评估，不能删除！'><font color='#888888'>删除</font></a>";
		}
		else {
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][7]+"\",\"/https/resource/campus/manage/my/campus/self/assess/edit_employee_assess.html\")'>编辑</a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][7]+"\")'>删除</a>";
		}
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/campus/manage/my/campus/self/assess/remove_self_assess.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;月 度 自 评</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">自评表类型</th>
		<td width="120">
			<label type="text" id="selfAssesstypeUuid" class="BaseTree" javaClassName="SelfAssessType"></label>
		</td>
		<th width="80">是否考核</th>
		<td width="120">
			<label type="text" id="assessStateUuid" class="BaseTree" javaClassName="AssessState"></label>
		</td>
		<th width="80">自评时间</th>
		<td width="240">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/campus/manage/my/campus/self/assess/create_employee_assess.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
