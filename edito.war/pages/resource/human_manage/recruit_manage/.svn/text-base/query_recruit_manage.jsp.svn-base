<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>招聘管理</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 750;
	execute();
});
function execute(){
	var name = $("#name").val();
	var genderUuid = $("#genderUuid").val();
	var educationUuid = $("#educationUuid").val();
	var inviteDate = $("#inviteDate").val();
	var recruitStateUuid = $("#recruitStateUuid option:selected").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {name:name,
				genderUuid:genderUuid,
				educationUuid:educationUuid,
				inviteDate:inviteDate,
				recruitStateUuid:recruitStateUuid,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/human/manage/recruit/manage/query_candidates.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/human/manage/recruit/manage/query_candidates.html",
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
	buffer += "<table width='750' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='50'>姓名</th><th width='40'>性别</th><th width='40'>学历</th><th width='90'>毕业院校</th><th width='70'>应聘岗位</th><th width='70'>应聘状态</th><th width='80'>邀约时间</th><th width='90'>手机</th><th width='200'>操作</th></tr>";
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
		buffer += "<td align='center'>"+dataStore[i][10]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		if((dataStore[i][4] == "待邀约") || (dataStore[i][4] == "已在职") || (dataStore[i][4] == "通过") || (dataStore[i][4] == "未通过"))
		{
			buffer += "<td align='center'></td>";
		}
		else {
			buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		}
		buffer += "<td align='center'>"+dataStore[i][8]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/human/manage/recruit/manage/forward_view_candidates.html\",600,700)'>查看</a>&nbsp;";
		if(dataStore[i][4]=="待邀约" || dataStore[i][4]=="已邀约" || dataStore[i][4]=="初试" || dataStore[i][4]=="复试" || dataStore[i][4]=="已在职"){
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][5]+"\",\"/https/resource/human/manage/recruit/manage/forward_edit_candidates.html\")'>编辑</a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][6]+"\")'>删除</a>&nbsp;";
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][5]+"\",\"/https/resource/human/manage/recruit/manage/forward_edit_probation.html\")'>试用</a>&nbsp;";
			buffer += "<a href='javascript:failedInstance(\""+dataStore[i][5]+"\")'>未通过</a>";
		}
		else if(dataStore[i][4]=="通过"){
			buffer += "<a title='员工已转为试用，招聘信息不能修改！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='员工已转为试用，招聘信息不能删除！'><font color='#888888'>删除</font></a>&nbsp;";
			buffer += "<a title='员工已转为试用，不能重复操作！'><font color='#888888'>试用</font></a>&nbsp;";
			buffer += "<a title='员工已转为试用，不能冲突操作！'><font color='#888888'>未通过</font></a>";
		}		
		else if(dataStore[i][4]=="未通过"){
			buffer += "<a title='员工未通过招聘，招聘信息不能修改！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][6]+"\")'>删除</a>&nbsp;";
			buffer += "<a title='员工未通过招聘，不能冲突操作！'><font color='#888888'>试用</font></a>&nbsp;";
			buffer += "<a title='员工未通过招聘，不能重复操作！'><font color='#888888'>未通过</font></a>";
		}		
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/recruit/manage/remove_candidates.html",{uuid:uuid},function(){
			execute();
		})
	}
}
function failedInstance(uuid){
	if(confirm("确认未通过？")){
		$.post(cp+"/ajaxs/resource/human/manage/recruit/manage/failed_candidates.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;招 聘 管 理</div>
<br><br><br>
<table align="left" width="750" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="110">姓名</th>
		<td width="140">
			<input id="name" size="11" />
		</td>
		<th width="110">性别</th>
		<td width="140">
			<label id="genderUuid" class="BaseTree" javaClassName="Gender" ></label>
		</td>
		<th width="110">学历</th>
		<td width="140">
			<label id="educationUuid" class="BaseTree" javaClassName="Education" ></label>
		</td>
	</tr>
	<tr>
		<th width="110">应聘状态</th>
		<td width="140">
			<select id="recruitStateUuid">
				<option value="" selected="selected">-选择-</option>
				<option value="10000000010180001001000000000010">待邀约</option>
				<option value="10000000010180001001000000000020">已邀约</option>
				<option value="10000000010180001001000000000030">初试</option>
				<option value="10000000010180001001000000000040">复试</option>
				<option value="10000000010180001001000000000050">已在职</option>
				<option value="10000000010180001001000000000060">通过</option>
				<option value="10000000010180001001000000000070">未通过</option>
			</select>
		</td>
		<th width="100">邀约时间</th>
		<td width="340" colspan="3">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/human/manage/recruit/manage/create_candidates_info.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:750px;margin-left:-10px"></div>
</body>
</html>
