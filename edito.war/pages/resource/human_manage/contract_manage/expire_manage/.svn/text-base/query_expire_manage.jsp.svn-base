<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>合同期限管理</title>
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
	var contractNo = $("#contractNo").val();
	var mouldUuid = $("#mouldUuid").val();
	var signer = $("#signer").val();
	var expireDay = $("input[name='expireDay']:checked").val();
	var data = {contractNo:contractNo,
				mouldUuid:mouldUuid,
				signer:signer,
				expireDay:expireDay,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/human/manage/contract/manage/info/manage/query_info_manage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/human/manage/contract/manage/info/manage/query_info_manage.html",
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
	buffer += "<tr><th width='20'></th><th width='110'>模板名称</th><th width='120'>合同编号</th><th width='80'>记录人</th><th width='100'>签约者</th><th width='100'>签订时间</th><th width='100'>到期时间</th><th width='90'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='left' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='left' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/human/manage/contract/manage/expire/manage/forward_view_expire_contract.html\",700,800)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][7]+"\", \"/https/resource/human/manage/contract/manage/expire/manage/forward_renew_contract.html\")'>续签</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;合 同 期 限 管 理</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">合同编号</th>
		<td width="140">
			<input id="contractNo" size="16" />
		</td>
		<th width="100">模板名称</th>
		<td width="140">
			<label id="mouldUuid" class="BaseTree" javaClassName="ContractMould"></label>
		</td>
		<th width="100">签约者</th>
		<td width="140">
			<input id="signer" size="16" />
		</td>
	</tr>
	<tr>
		<th width="100">到期时间</th>
		<td width="620" colspan="5">
			<input type="radio" name="expireDay" value="1" checked="checked" />今日到期&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="expireDay" value="7" />7日内到期&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="expireDay" value="15" />15日内到期&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="expireDay" value="30" />30日内到期&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="expireDay" value="0" />已经过期&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="expireDay" value="-1" />全部
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
