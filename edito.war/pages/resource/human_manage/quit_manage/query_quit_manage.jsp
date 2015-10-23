<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>员工离职管理</title>
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
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/human/manage/quit/manage/query_quit_manage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/human/manage/quit/manage/query_quit_manage.html",
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
	buffer += "<tr><th width='20'></th><th width='150'>姓名</th><th width='170'>组织机构</th><th width='230'>离职时间</th><th width='170'>离职类别</th><th width='150'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>";
		if(dataStore[i][7]=="0"){
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/human/manage/relation/manage/forward_view_relation.html\",600,700)'>查看</a>&nbsp;";
			buffer += "<a href='javascript:quitInstance(\""+dataStore[i][6]+"\")'>离职</a>&nbsp;&nbsp;";
		}	
		else{
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/human/manage/relation/manage/forward_view_relation.html\",600,700)'>查看</a>&nbsp;";
			buffer += "<a title='审核未结束，不能离职！'><font color='#888888'>离职</font></a>&nbsp;&nbsp;";
		}	
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function quitInstance(uuid){
	if(confirm("确认离职？")){
		$.post(cp+"/ajaxs/resource/human/manage/quit/manage/employee_turnover.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 离 职 管 理</div>
<br><br><br>
<table align="left" width="360" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">申请时间</th>
		<td width="270">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
