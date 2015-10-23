<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>培训总结</title>
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
	var title = $("#title").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {title:title,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/human/manage/training/manage/training/summary/query_training_summary.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/human/manage/training/manage/training/summary/query_training_summary.html",
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
	buffer += "<table width='610' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='120'>主题</th><th width='90'>组织机构</th><th width='100'>培训日期</th><th width='80'>讲师</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='left' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>";
		if(dataStore[i][6]=="0"){
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][5]+"\",\"/https/resource/human/manage/training/manage/training/summary/forward_edit_training_summary.html\")'>总结</a>&nbsp;";
			buffer += "<a title='未总结 ，不能查看总结！'><font color='#888888'>查看总结</font></a>&nbsp;";
			buffer += "<a title='未总结 ，不能查看员工总结！'><font color='#888888'>员工总结</font></a>&nbsp;";
		}
		else{
			buffer += "<a title='已总结 ，不能重复总结！'><font color='#888888'>总结</font></a>&nbsp;";
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/human/manage/training/manage/training/summary/forward_training_summary.html\",600,700)'>查看总结</a>&nbsp;";
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/human/manage/training/manage/training/summary/forward_employee_summary.html\",600,700)'>员工总结</a>&nbsp;";
		}	
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;培 训 总 结</div>
<br><br><br>
<table align="left" width="510" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">标题</th>
		<td width="100">
			<input id="title" size="12" />
		</td>
		<th width="80">培训日期</th>
		<td width="250">
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
