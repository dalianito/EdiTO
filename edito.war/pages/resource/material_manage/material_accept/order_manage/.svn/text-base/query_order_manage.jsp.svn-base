<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants"%>
<html>
<head>
	<title>采购单管理</title>
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
	var materialTypeUuid = $("#materialTypeUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var generator = $("#generator").val();
	var data = {materialTypeUuid:materialTypeUuid,
				beginDate:beginDate,
				endDate:endDate,
				generator:generator,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/accept/order/manage/query_order_manage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/accept/order/manage/qquery_order_manage.html",
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
	buffer += "<tr><th width='20'></th><th width='80'>物资名称</th><th width='80'>物资编号</th><th width='80'>规格型号</th><th width='60'>单位</th><th width='60'>通过数量</th><th width='80'>生成人</th><th width='130'>生成时间</th><th width='130'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer +="<tr class='tr1'>";
		}
		else {
			buffer +="<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>";
		if(dataStore[i][9]=="unReceipt"){
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][8]+"\",\"\",\"/views/resource/material/manage/material/accept/order/manage/forward_view_order.html\",600,700)'>查看</a>&nbsp;";
			buffer += "<a href='javascript:cancelInstance(\""+dataStore[i][8]+"\")'>取消</a>&nbsp;";
			buffer += "<a title='未验收，不能结束！'><font color='#888888'>结束</font></a>&nbsp;";
		
		}
		else{
			buffer += "<a href='javascript:showInstance(\""+dataStore[i][8]+"\",\"\",\"/views/resource/material/manage/material/accept/order/manage/forward_view_order.html\",600,700)'>查看</a>&nbsp;";
			buffer += "<a title='已验收，不能取消！'><font color='#888888'>取消</font></a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][8]+"\")'>结束</a>&nbsp;";
			}
		buffer += "</td>";
		buffer += "</tr>";
		}
	buffer += "</table></div>";
	return buffer;
}
function cancelInstance(uuid){
	if(confirm("确认取消？")){
		$.post(cp+"/ajaxs/resource/material/manage/material/accept/order/manage/cancel_order_generate.html",{uuid:uuid},function(){
			execute();
		})
	}
}
function removeInstance(uuid){
	if(confirm("确认结束？")){
		$.post(cp+"/ajaxs/resource/material/manage/material/accept/order/manage/remove_order_generate.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;采 购 单 管 理</div>
<br><br><br>
<table align="left" width="520" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100" >物资名称</th>
		<td width="160">
			<label id="materialTypeUuid" class="BaseTree" javaClassName="MaterialType" ></label>
		</td>
		<th width="100">生成人</th>
		<td width="160">
			<input id="generator" name="generator" size="11"/>
		</td>
	</tr>
	<tr>
		<th width="100">生成时间</th>
		<td width="420" colspan="3">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
