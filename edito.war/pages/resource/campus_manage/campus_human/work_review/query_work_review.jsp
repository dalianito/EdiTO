<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>工作日志审阅</title>
</head>

<body>
<form id="formB" name="formB" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 740;

	$.ajaxSetup({async:false});
	$.post(cp+"/ajaxs/resource/campus/manage/campus/human/work/inquiry/query_all_campus.html", {}, function(data){
		var buffer = "<select id='campusUuid'>";
		buffer += "<option value='all' selected='selected'>全部</option>";
		for(var i=0; i<data.length; i++){
			buffer += "<option value='"+data[i]["uuid"]+"'>"+data[i]["description"]+"</option>";
		}
		buffer += "</select>";

		$("#campusList").html(buffer);
	}, "json");

	var today = new Date();
	var year = today.getFullYear();
	var month = (new Date(today.getTime() - 86400000)).getMonth() + 1;
	var day = (new Date(today.getTime() - 86400000)).getDate();

	$("#beginDate").val(year + "-" + month + "-" + day);
	$("#beginDate").text(year + "年" + month + "月" + day + "日");
	$("#endDate").val(year + "-" + month + "-" + day);
	$("#endDate").text(year + "年" + month + "月" + day + "日");

	execute();
});
function execute(){
	var name = $("#name").val();
	var departmentUuid = $("#departmentUuid").val();
	var campusUuid = "none";
	if(typeof($("#campusUuid").val())!="undefined"){
		campusUuid = $("#campusUuid").val();
	}
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var reviewStateUuid = $("#reviewStateUuid").val();
	var data = {name:name,
				departmentUuid:departmentUuid,
				campusUuid:campusUuid,
				beginDate:beginDate,
				endDate:endDate,
				reviewStateUuid:reviewStateUuid,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/campus/manage/campus/human/work/inquiry/query_work_inquiry.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/campus/human/work/inquiry/query_work_inquiry.html",
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
	var buffer="<form id='formA'>";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:left-none'>";
	buffer += "<table width='720' border='0' cellpadding='3' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='35'>序号</th><th width='55'>记录人</th><th width='80'>记录时间</th><th width='95'>组织机构</th><th width='95'>校区</th><th width='85'><input type='checkbox' id='alls' onClick='review()' title='全选' />审阅状态</th><th width='170'>评语</th><th width='55'>审阅人</th><th width='50'>操作</th></tr>";

	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2].substr(0,10)+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";

		if(dataStore[i][8] == "未审阅"){
			buffer += "<td align='center'>";
			buffer += "<input type='checkbox' id='reviewFlagCheckBox"+i+"' class='reviewFlag' onclick='javascript:setReviewFlag("+i+")'/>";
			buffer += "<input type='hidden' id='reviewFlagCKBX"+i+"' submit='false' name='instance(WorkRecord["+i+"]).reviewFlagUuid' value='<%=Constants.NOT_REVIEW_FLAG%>'/>";
			buffer += dataStore[i][8];
			buffer += "</td>";
			buffer += "<td align='left'  id='td_" + i + "' ondblclick='editContent(\""+i+"\")'>";
			buffer += "<div id='show_" + i + "' style='width:170px;word-wrap:break-word;'>"+dataStore[i][7]+"</div>";
			buffer += "<div id='hide_" + i + "' submit='false' style='display:none'>";

			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).uuid' value='"+dataStore[i][5]+"' />";
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).timeStamp' value='"+dataStore[i][9]+"' />";
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).recordUuid' value='"+dataStore[i][6]+"' />";		
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).recordTime' value='"+dataStore[i][2]+"' />";
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).summary' value='"+dataStore[i][10]+"' />";
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).schedule' value='"+dataStore[i][11]+"' />";
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).share' value='"+dataStore[i][12]+"' />";
			buffer += "<input type='hidden' name='instance(WorkRecord["+i+"]).fileUuid' value='"+dataStore[i][13]+"' />";
			buffer += "<textarea id='textArea"+i+"' name='instance(WorkRecord["+i+"]).reviewComment' style='width:160px;height:80px'>"+dataStore[i][7]+"</textarea><br>";
			buffer += "</div>";
			buffer += "</td>";
			buffer += "<td align='center'>" + dataStore[i][15] + "</td>";
		}
		else {
			buffer += "<td align='center'>";
			buffer += "<input type='checkbox' checked='true' disabled/>";
			buffer += "<font color='#888888'>"+dataStore[i][8]+"</font></td>";
			buffer += "<td align='left'><div style='width:170px;word-wrap:break-word;'><font color='#888888'>"+dataStore[i][7]+"</font></div></td>";
			buffer += "<td align='center'>" + dataStore[i][15] + "</td>";
		}
		buffer += "<td align='center'>";
		buffer += "<a id='operation_"+i+"' href='javascript:toggleContent(\""+dataStore[i][5]+"\", \""+i+"\")'>查看</a>";
		buffer += "</td>";
		buffer += "</tr>";
		buffer += "<tbody id='content_"+i+"' width='720' ></tbody>";
	}
	
	buffer += "</table></div>";
	buffer += "</form>";
	return buffer;
}

function toggleContent(uuid, num){
	var id = "content_"+num;
	if($("#"+id+"_div").height() == null || $("#"+id+"_div").height() == 0){
		showContent(uuid, id);
		$("#operation_"+num).text("收起");
	}
	else {
		hideTimeout(id);
		$("#operation_"+num).text("查看");
	}
}
function showContent(uuid, id){
	$.post(cp+"/ajaxs/resource/campus/manage/campus/human/work/review/query_workRecord_info.html", {uuid:uuid}, function(data){
		var buffer = "<tr><td colspan='9' align='center' ><div id='"+id+"_div' style='overflow:hidden' value='0'>";
		buffer += "<br>";
		buffer += "<form id='"+id+"_form'>";
		buffer += "<input type='hidden' name='instance(WorkRecord).uuid' value='"+uuid+"' />";

		buffer += "<table width='600' border='0' cellpadding='3' cellspacing='0' class='InfoShowPanel_2'>";
		buffer += "<tr>";
		buffer += "<th width='180'>今日工作总结：</th>";
		buffer += "<td style='width:410px;word-break:break-all;height:81px;vertical-align:top;padding-top:5px'>"+(data["workRecordInfo"].summary !=null ? data["workRecordInfo"].summary.replace(/\n/g,"<br>") : "&nbsp;")+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='180'>明日工作计划：</th>";
		buffer += "<td style='width:410px;word-break:break-all;height:81px;vertical-align:top;padding-top:5px'>"+(data["workRecordInfo"].schedule !=null ? data["workRecordInfo"].schedule.replace(/\n/g,"<br>") : "&nbsp;")+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='180'>今日工作感受：</th>";
		buffer += "<td style='width:410px;word-break:break-all;height:81px;vertical-align:top;padding-top:5px'>"+(data["workRecordInfo"].share !=null ? data["workRecordInfo"].share.replace(/\n/g,"<br>") : "&nbsp;")+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='180'>上传文件：</th>";
		buffer += "<td style='width:410px;word-break:break-all'><a href='javascript:downloadResource(\""+(data["workRecordInfo"].fileUuid !=null ? data["workRecordInfo"].fileUuid : "&nbsp;")+"\")'>"+(data["workRecordInfo"].fileUuid !=null ? data["workRecordInfo"].file.name : "&nbsp;")+"</a></td>";
		buffer += "</tr>";
		
		buffer += "</table>";
		buffer += "</form>";
		buffer += "<br>";
		buffer += "</div></td></tr>";
		
		$("#"+id).html(buffer);
		$("#"+id).css("display", "inline");
		document.getElementById(id).style.display = "";
		$("#"+id).val($("#"+id).height());
		$("label").filter(".BaseTree").basetree({});
		showTimeout(id);
	}, "json");
}
function showTimeout(id){
	var i = $("#"+id+"_div").val();
	var height = $("#"+id).val();
	if(i <= 10){
		$("#"+id+"_div").height(i*height/10);
		$("#"+id+"_div").val(++i);
		showTimeout(id);
	}
	else {
		$("#"+id+"_div").val("0");
	}
}
function hideTimeout(id){
	var i = $("#"+id+"_div").val();
	var height = $("#"+id).val();
	if(i <= 10){
		$("#"+id+"_div").height((10-i)*height/10);
		$("#"+id+"_div").val(++i);
		hideTimeout(id);
	}
	else {
		$("#"+id).css("display", "none");
		$("#"+id+"_div").val("0");
	}
}

function setReviewFlag(i){
	if($("#reviewFlagCheckBox"+i).attr("checked")){
		$("#reviewFlagCKBX"+i+"").val("<%=Constants.REVIEWD_FLAG%>");
		$("#hide_"+i).attr("submit", "true");
		$("#reviewFlagCKBX"+i).attr("submit", "true");
	}
	else {
		$("#reviewFlagCKBX"+i+"").val("<%=Constants.NOT_REVIEW_FLAG%>");
		$("#hide_"+i).attr("submit", "false");
		$("#reviewFlagCKBX"+i).attr("submit", "false");
	}
}

function downloadResource(uuid){
	var f = document.getElementById("formB");
	f.action = cp + "/views/resource/campus/manage/my/campus/work/record/forward_file.html";
	f.uuid.value = uuid;
	f.type.value = "workRecord";
	f.submit();
}

function review(){ 
	var options = $(".reviewFlag");
	if($("#alls").attr("checked")){
		for (var i=0;i<options.length;i++){ 
			if(!options[i].disabled){
				options[i].checked=true;
				var index = options[i].id.replace("reviewFlagCheckBox","");
				$("#reviewFlagCKBX"+index+"").val("<%=Constants.REVIEWD_FLAG%>");
				$("#hide_"+index).attr("submit", "true");
				$("#reviewFlagCKBX"+index).attr("submit", "true");
			}
		}
	}
	else {
		for (var i=0;i<options.length;i++){
			if(options[i].disabled == false){
				options[i].checked=false;
				var index = options[i].id.replace("reviewFlagCheckBox","");
				$("#reviewFlagCKBX"+index+"").val("<%=Constants.NOT_REVIEW_FLAG%>");
				$("#hide_"+index).attr("submit", "false");
				$("#reviewFlagCKBX"+index).attr("submit", "false");
			}
		}
	}
}

function createInstance(elementId){
	if(confirm("确认操作？")){
		if(true){
			var param = Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/campus/manage/campus/human/work/review/create_workrecord_review.html",param,function(data){
				execute();
			})
		}
	}
}

function editContent(i){
	if($("#show_"+i).css("display")=="block"){
		$("#td_"+i).attr("title", "双击退出编辑");
		$("#show_"+i).css("display", "none");
		$("#hide_"+i).css("display", "block");
		$("#hide_"+i).attr("submit", "true");
		$("#reviewFlagCKBX"+i).attr("submit", "true");
	}
	else {
		$("#td_"+i).attr("title", "双击编辑记录");
		$("#show_"+i).css("display", "block");
		$("#hide_"+i).css("display", "none");
		if(!($("#reviewFlagCheckBox"+i).attr("checked"))){
			$("#hide_"+i).attr("submit", "true");
			$("#reviewFlagCKBX"+i).attr("submit", "true");
		}
		$("#show_"+i).html($("#textArea"+i).val());
		$("#textArea"+i).val($("#show_"+i).html());
	}
}

</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;工 作 日 志 审 阅</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel" >
	<tr>
		<th width="100">记录人</th>
		<td width="140">
			<input id="name" name="name" size="11"/>
		</td>
		<th width="100" >组织机构</th>
		<td width="140" >
			<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
		</td>
		<th width="100" >校区</th>
		<td width="140" >
			<s:if test="%{#session.LOGIN_EMPLOYEE.jobUuid=='11000000010190001000000000000000' || #session.LOGIN_EMPLOYEE.jobUuid=='11000000010190001000000000000010' || #session.LOGIN_EMPLOYEE.jobUuid=='11000000010190001000000000000020'}">
				<div id="campusList"></div>
			</s:if>
			<s:else>
				<font color="red"><s:property value="#session.LOGIN_EMPLOYEE.campus.description" /></font>
			</s:else>
		</td>
	</tr>
	<tr>
		<th width="100" >审阅状态</th>
		<td width="140">
			<label id="reviewStateUuid" class="BaseTree" javaClassName="ReviewState"/></label>
		</td>
		<th width="100">记录时间</th>
		<td width="380" colspan="3">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all" ></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>
<br>
</body>
</html>
