<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>培训规划</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	queryTraining();
	execute();
});
function queryTraining(){
	$.post(cp+"/ajaxs/resource/campus/manage/my/campus/training/program/query_training_program.html",{offset:1,recnum:4},function(data){
		var buffer = "";
		for(var i=0; i<data.length; i++){
			buffer += "<div>";
			buffer += "<div style='width:100px;display:inline;float:left;word-break:break-all;word-wrap:word-break'>"+handleStr(data[i][0], 13, 1)+"</div>";
			buffer += "<div style='width:90px;display:inline;float:left;'>"+data[i][1].substring(0, 10)+"</div>";
			buffer += "<div style='width:90px;display:inline;float:left;'>"+data[i][2].substring(0, 10)+"</div>";
			buffer += "<div style='width:90px;display:inline;float:left;'>"+data[i][7].substring(0, 10)+"</div>";
			buffer += "<div style='width:90px;display:inline;float:left;'>"+data[i][3].substring(0, 10)+"</div>";
			buffer += "<div style='width:90px;display:inline;float:left;'>"+data[i][8].substring(0, 10)+"</div>";
			if(data[i][6]=="已申请"){
				buffer += "<div style='width:80px;display:inline;float:right;text-align:;margin-right:5px'>";
				buffer += "<a title='已申请，不能重复申请！'><font color='#888888'>申请</font></a></div><br>";
				buffer += "</div>";
			}
			else{
				buffer += "<div style='width:80px;display:inline;float:right;text-align:;margin-right:5px'>";
				buffer += "<a href='#' onclick='javascript:applyInstance(\""+data[i][5]+"\")'>申请</a></div><br>";
				buffer += "</div>";
			}		
		}
		$("#train").html(buffer);
	},"json");
}
function applyInstance(uuid){
	if(confirm("确认申请？")){
		$.post(cp+"/ajaxs/resource/campus/manage/my/campus/training/program/create_training_program.html",{uuid:uuid},function(){
			queryTraining();
		})
	}
}

function handleStr(str, minSize, minusSize){
	if(str.length > minSize){
		return str.substring(0, minSize-minusSize)+ "...";
	}
	else {
		return str;
	}
}

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
		url: cp+"/ajaxs/resource/campus/manage/my/campus/training/program/query_training_summary.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/my/campus/training/program/query_training_summary.html",
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
	buffer += "<table width='510' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
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
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][5]+"\",\"/https/resource/campus/manage/my/campus/training/program/forward_training_summary.html\")'>总结</a>&nbsp;";
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/campus/manage/my/campus/training/program/forward_training_summary.html\",600,700)'>查看</a>";
		}
		else{
			buffer += "<a title='已总结 ，不能重复总结！'><font color='#888888'>总结</font></a>&nbsp;";
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/campus/manage/my/campus/training/program/forward_training_summary.html\",600,700)'>查看</a>";
		}		
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;培 训 规 划</div>
<br><br><br>
<table width="650" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_notice" width="650" height="150" style="border:1px solid #FF7256" valign="top" >
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="<%=request.getContextPath() %>/https/resource/campus/manage/my/campus/training/program/query_training_all_program.html" style="font-size:15px">培训申请：</a>
<div id="train" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
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
