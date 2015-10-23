<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>物资信息管理</title>
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
	var materialNo = $("#materialNo").val();
	var specification = $("#specification").val();
	var typeUuid = $("#typeUuid").val();
	var data = {materialNo:materialNo,
				specification:specification,
				typeUuid:typeUuid,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/generate/query_material_generate.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/generate/query_material_generate.html",
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
	buffer += "<tr><th width='20'></th><th width='100'>编号</th><th width='100'>规格型号</th><th width='60'>单位</th><th width='80'>类别</th><th width='70'>警戒线</th><th width='70'>记录人</th><th width='140'>记录时间</th><th width='80'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<a title='备注："+dataStore[i][12]+"'><tr class='tr1'>";
		}
		else {
			buffer += "<a title='备注："+dataStore[i][12]+"'><tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='left' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='left' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][9]+"\", \"/https/resource/material/manage/material/generate/forward_edit_material.html\")'>编辑</a>&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][9]+"\")'>删除</a>";
		buffer += "</td>";
		buffer += "</tr></a>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/material/manage/material/generate/remove_material.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 信 息 管 理</div>
<br><br><br>
<table align="left" width="600" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">物资编号</th>
		<td width="100">
			<input id="materialNo" size="12" />
		</td>
		<th width="100">物资规格型号</th>
		<td width="100">
			<input id="specification" size="12" />
		</td>
		<th width="100">类别</th>
		<td width="100">
			<label id="typeUuid" class="BaseTree" JavaClassName="MaterialType"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/material/manage/material/generate/create_material.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
