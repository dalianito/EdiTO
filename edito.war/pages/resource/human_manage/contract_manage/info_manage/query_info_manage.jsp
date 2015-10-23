<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>合同信息管理</title>
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
	var beginExpireDate = $("#beginExpireDate").val();
	var endExpireDate = $("#endExpireDate").val();
	var recorder = $("#recorder").val();
	var signer = $("#signer").val();
	var beginSignDate = $("#beginSignDate").val();
	var endSignDate = $("#endSignDate").val();
	var data = {contractNo:contractNo,
				mouldUuid:mouldUuid,
				beginSignDate:beginSignDate,
				endSignDate:endSignDate,
				recorder:recorder,
				signer:signer,
				beginExpireDate:beginExpireDate,
				endExpireDate:endExpireDate,
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
	buffer += "<tr><th width='20'></th><th width='110'>模板名称</th><th width='110'>合同编号</th><th width='70'>记录人</th><th width='90'>签约者</th><th width='100'>签订时间</th><th width='100'>到期时间</th><th width='120'>操作</th></tr>";
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
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/human/manage/contract/manage/info/manage/forward_view_contract.html\",700,800)'>查看</a>&nbsp;";
		buffer += "<a href='javascript:editInstance(\""+dataStore[i][7]+"\", \"/https/resource/human/manage/contract/manage/info/manage/forward_edit_contract.html\")'>编辑</a>&nbsp;";
		buffer += "<a href='javascript:removeInstance(\""+dataStore[i][7]+"\")'>删除</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/contract/manage/info/manage/remove_contract.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;合 同 信 息 管 理</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">合同编号</th>
		<td width="110">
			<input id="contractNo" size="12" />
		</td>
		<th width="80">模板名称</th>
		<td width="110">
			<label id="mouldUuid" class="BaseTree" javaClassName="ContractMould"></label>
		</td>
		<th width="80">到期时间</th>
		<td width="260">
			<label type="text" id="beginExpireDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endExpireDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
	<tr>
		<th width="80">记录人</th>
		<td width="110">
			<input id="recorder" size="12" />
		</td>
		<th width="80">签约者</th>
		<td width="110">
			<input id="signer" size="12" />
		</td>
		<th width="80">签订时间</th>
		<td width="260">
			<label type="text" id="beginSignDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endSignDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/human/manage/contract/manage/info/manage/create_contract_info.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
