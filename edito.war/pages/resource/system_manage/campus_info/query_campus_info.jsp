<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>校区信息管理</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	execute();
});
function execute(){
	$.post(cp+"/ajaxs/resource/system/manage/campus/info/query_campus_info.html", {}, function(data){
		var buffer = "";
		if(data.length > 0){
			buffer += "<div id='campusDiv' style='display:inline;line-height:40px;float:left'>";
			for(var i=0; i<data.length; i++){
				buffer += "<div style='display:inline'>";
				buffer += "<div style='display:inline;font-size:22px;cursor:hand' onclick='toggleDetail("+i+")'>";
				buffer += data[i][0];
				buffer += "</div>";
				buffer += "&nbsp;&nbsp;";
				buffer += "<div style='display:inline;font-size:13px;color:blue'>[";
				buffer += "<a id='removeDiv_"+i+"' style='color:blue' onmouseover='changeColor("+i+", \"red\")' onmouseout='changeColor("+i+", \"blue\")' href='javascript:removeCampus(\""+data[i][6]+"\")'>删除</a>";
				buffer += "]</div>";
				buffer += "</div>";
				buffer += "<div id='hiddenDiv_"+i+"' style='display:none'>";
				buffer += "<table width='320' style='display:inline;line-height:30px' class='InputPanel'>";
				buffer += "<tr><th style='font-size:20px'>";
				buffer += "<div style='float:left;width:18px'>&nbsp;</div>";
				buffer += "<a href='javascript:editInstance(\""+data[i][6]+"\", \"/https/resource/system/manage/campus/info/forward_edit_campus.html\")' title='点击进行编辑'>" + data[i][0] + "</a>";
				buffer += "<img style='float:right;margin-top:-3px;cursor:hand' src='"+cp+"/images/button/b_close_3.gif' onclick='javascript:closeDiv()' />";
				buffer += "</th></tr>";
				buffer += "<tr><td style='font-size:18px'>地址：" + data[i][1] + "</td></tr>";
				buffer += "<tr><td style='font-size:18px'>联系人：" + data[i][2] + "</td></tr>";
				buffer += "<tr><td style='font-size:18px'>联系电话：" + data[i][3] + "</td></tr>";
				buffer += "<tr><td style='font-size:18px'>分校校长：" + data[i][4] + "</td></tr>";
				buffer += "<tr><td>";
				buffer += "<a href='javascript:showInstruction(\""+data[i][0]+"\", \""+data[i][5]+"\", \""+i+"\")'>简介</a>&nbsp;&nbsp;";
				buffer += "<a href='javascript:showEmployee(\""+data[i][6]+"\", \""+data[i][0]+"\", \""+i+"\")'>下属员工</a>";
				buffer += "</td></tr>";
				buffer += "</table>";
				buffer += "</div><br>";
			}
			buffer += "</div>";
			buffer += "<div id='showDiv' style='display:none;float:right'></div>";
		}
		else {
			buffer += "<font color='red'>暂无分校信息！</font>";
		}
		$("#result1").html(buffer);
	}, "json");
}
function changeColor(no, color){
	$("#removeDiv_"+no).css("color", color);
}
function toggleDetail(no){
	$("#showDiv").css("display", "inline");
	$("#showDiv").html($("#hiddenDiv_"+no).html());
	if($("#result2").val()!=no){
		$("#result2").html("");
	}
}
function closeDiv(){
	$("#showDiv").css("display", "none");
	$("#result2").html("");
}
function showInstruction(campusName, instructionm, no){
	var buffer = "";
	var buffer = "<hr><br>";
	buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th>"+campusName+"&nbsp;简介</th></tr>";
	buffer += "<tr><td>"+instructionm+"</td></tr>";
	buffer += "</table>";
	$("#result2").html(buffer);
	$("#result2").val(no);

	var marginTop = $("#campusDiv").height() > $("#showDiv").height() ? $("#campusDiv").height() : $("#showDiv").height();
	$("#result2").css("margin-top", marginTop + 5);	
}
function showEmployee(campusUuid, campusName, no){
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/query_campus_employee.html", {campusUuid:campusUuid}, function(data){
		var num = data.length;
		var buffer = "";
		var buffer = "<hr><br>";
		buffer += "<font color='red'><b>" + campusName + "</b>&nbsp;现有员工&nbsp;<b>" + num + "</b>&nbsp;人</font>";
		buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='20'></th><th width='80'>员工号</th><th width='80'>姓名</th><th width='60'>性别</th><th width='60'>学历</th><th width='100'>组织机构</th><th width='100'>入职时间</th><th width='80'>员工状态</th><th width='80'>有无帐户</th><th width='60'>操作</th></tr>";
		if(num > 0){
			for(var i=0; i<num; i++){
				if(i%2==0){
					buffer += "<tr class='tr1'>";
				}
				else {
					buffer += "<tr class='tr2'>";
				}
				buffer += "<td align='center'>"+data[i][0]+"</td>";
				buffer += "<td align='center'>"+data[i][1]+"</td>";
				buffer += "<td align='center'>"+data[i][2]+"</td>";
				buffer += "<td align='center'>"+data[i][3]+"</td>";
				buffer += "<td align='center'>"+data[i][4]+"</td>";
				buffer += "<td align='center'>"+data[i][5]+"</td>";
				buffer += "<td align='center'>"+data[i][6]+"</td>";
				buffer += "<td align='center'>"+data[i][7]+"</td>";
				buffer += (data[i][8]=="true" ? "<td align='center'><font color='red'>有</font></td>" : "<td align='center'>无</td>");
				buffer += "<td align='center'><a href='javascript:showInstance(\""+data[i][9]+"\",\"\",\"/views/resource/human/manage/employee/manage/forward_view_employee.html\",520,620)'>查看</a></td>";
				buffer += "</tr>";
			}
		}
		else {
			buffer += "<tr><td colspan='10'>&nbsp;<font color='red'>该分校暂未分配员工！</font></td></tr>";
		}
		buffer += "</table>";
		$("#result2").html(buffer);
		$("#result2").val(no);

		var marginTop = $("#campusDiv").height() > $("#showDiv").height() ? $("#campusDiv").height() : $("#showDiv").height();
		$("#result2").css("margin-top", marginTop + 5);
	}, "json");
}
function removeCampus(uuid){
	$.post(cp+"/ajaxs/resource/system/manage/authority/manage/get_campus_employee_no.html",{campusUuid:uuid},function(no){
		var alertStr = "确认删除？";
		if(no > 0){
			alertStr = "该分校还有"+no+"名员工没有转出，" + alertStr;
		}
		if(confirm(alertStr)){
			$.post(cp+"/ajaxs/resource/system/manage/authority/manage/remove_campus.html",{uuid:uuid},function(){
				execute();
				closeDiv();
			})
		}
	})
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;校 区 信 息 管 理</div>
<br><br><br>
<a href="<%=request.getContextPath()%>/https/resource/system/manage/campus/info/create_campus_info.html" >
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br><br>
<div id="result1" class="bigResultCon" style="width:720px"></div>
<br>
<div id="result2" class="bigResultCon" style="width:720px;position:relative" value="none"></div>
</body>
</html>
