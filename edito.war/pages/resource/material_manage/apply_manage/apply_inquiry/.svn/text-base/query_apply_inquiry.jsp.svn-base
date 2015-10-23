<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>申请查询</title>
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
	var applicant = $("#applicant").val();
	var statusTypeUuid = $("#statusTypeUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {applicant:applicant,
				statusTypeUuid:statusTypeUuid,
				beginDate:beginDate,
				endDate:endDate,
				flag:0,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/apply/manage/material/apply/query_inquiry.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/apply/manage/material/apply/query_inquiry.html",
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
	buffer += "<tr><th width='20'></th><th width='100'>申请人</th><th width='150'>申请时间</th><th width='100'>申请条目数</th><th width='100'>通过条目数</th><th width='100'>审核状态</th><th width='150'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/material/manage/apply/manage/material/apply/forward_view_apply.html\",600,700)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
		}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;申 请 查 询</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">申请人</th>
		<td width="110">
			<input id="applicant" name="applicant" size="11"/>
		</td>
		<th width="80">申请时间</th>
		<td width="260">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
		<th width="80">审核状态</th>
		<td width="110">
			<label id="statusTypeUuid" class="BaseTree" javaClassName="ExaminationState" ></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
