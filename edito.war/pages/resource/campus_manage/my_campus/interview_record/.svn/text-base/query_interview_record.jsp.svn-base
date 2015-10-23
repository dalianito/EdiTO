<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>面谈记录</title>
</head>

<body>
<form id="form" name="form" method="post"><input type="hidden"
	name="uuid" /> <input type="hidden" name="resultCode" /></form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 720;
	execute();
});
function execute(){
	var pageMark = "campus";
	var interviewee = $("#interviewee").val();
	var intervieweecampusUuid = $("#intervieweecampusUuid").val();
	var intervieweedepartmentUuid = $("#intervieweedepartmentUuid").val();
	var intervieweejobUuid = $("#intervieweejobUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var sortField = $("#sortField option:selected").val();
	var data = {
			    pageMark:pageMark,
				interviewee:interviewee,
				intervieweecampusUuid:intervieweecampusUuid,
				intervieweedepartmentUuid:intervieweedepartmentUuid,
				intervieweejobUuid:intervieweejobUuid,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24
				};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/campus/manage/my/campus/interview/record/query_interview_record.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/my/campus/interview/record/query_interview_record.html",
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
	buffer += "<tr><th width='20'></th><th width='100'>被面谈人</th><th width='130'>校区</th><th width='130'>组织机构</th><th width='130'>岗位</th><th width='110'>面谈日期</th><th width='100'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][8]+"</td>";	
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";	
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][10]+"\",\"\",\"/views/resource/campus/manage/my/campus/interview/record/forward_view_interviewrecord.html\",520,780)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][10]+"\",\"/https/resource/campus/manage/my/campus/interview/record/forward_edit_interviewrecord.html\")'>编辑</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family: 黑体; font-size: 20px;">&nbsp;面 谈 记 录</div>
<br>
<br>
<br>
<input type="hidden" name="instance(Employee).uuid" />
<input type="hidden" name="instance(Employee).timeStamp" />
<table align="left" width="720" border="0" cellpadding="0"
	cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">被面谈人</th>
		<td width="140"><input id="interviewee" size="11" /></td>
		<th width="100">校区</th>
		<td width="140"><label id="intervieweecampusUuid" class="BaseTree"
			javaClassName="Campus"></label></td>
		<th width="100">组织机构</th>
		<td width="140"><label id="intervieweedepartmentUuid" class="BaseTree"
			javaClassName="Department"></label></td>
	</tr>
	<tr>
		<th width="100">岗位</th>
		<td width="140"><label id="intervieweejobUuid" class="BaseTree"
			javaClassName="Job"></label></td>
		<th width="100">面谈日期</th>
		<td colspan="3"><label type="text" id="beginDate"
			class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label
			type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br>
<br>
<br>
<br>
<br>
<a href="#" onclick="execute()"> <img
	src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a
	href="<%=request.getContextPath()%>/https/resource/campus/manage/my/campus/interview/record/create_interview_record.html">
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br>
<br>
<div id="result" class="bigResultCon"
	style="width: 720px; margin-left: -10px"></div>
</body>
</html>
