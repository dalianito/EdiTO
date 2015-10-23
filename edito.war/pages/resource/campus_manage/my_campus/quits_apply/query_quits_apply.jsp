<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>离职申请</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
Validation.init("resource/human_manage/apply_manage/quit_apply/create_quit_apply.xml");
$(document).ready(function(){
	currentResultTableDivWidth = 750;
	execute();
});
function execute(){
	hideDiv("createApply");
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	$.post(cp+"/ajaxs/resource/campus/manage/my/campus/quits/apply/query_quits_apply.html",{beginDate:beginDate,endDate:endDate},function(data){
		var buffer="";
		buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
		buffer += "<table width='750' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='80'>申请时间</th><th width='70'>分校校长</th><th width='70'>审核状态</th><th width='120'>人力资源处处长</th><th width='70'>审核状态</th><th width='60'>副校长</th><th width='70'>审核状态</th><th width='60'>校长</th><th width='70'>审核状态</th><th width='80'>操作</th></tr>";
		for(var i=0;i<data.length;i++){
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
			buffer += "<td align='center'>"+data[i][8]+"</td>";
			buffer += "<td align='center'>";
			buffer += "<a href='javascript:showInstance(\""+data[i][9]+"\",\"\",\"/views/resource/human/manage/apply/manage/relationship/apply/forward_view_apply.html\",600,700)'>查看</a>&nbsp;";
			if(data[i][2]=="通过" || data[i][4]=="通过" || data[i][6]=="通过" || data[i][8]=="通过"){
				buffer += "<a title='申请正在审批中，不能删除！'><font color='#888888'>删除</font></a>&nbsp;";
			}
			else{
				buffer += "<a href='javascript:removeInstance(\""+data[i][9]+"\")'>删除</a>&nbsp;";
			}
			buffer += "</td>";
			buffer += "</tr>";
		}
		buffer += "</table></div>";
		$("#result").html(buffer);
	},"json");
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/apply/manage/quit/apply/remove_apply.html",{uuid:uuid},function(){
			execute();
		})
	}
}
function showDiv(id){
	$("#"+id).css("display","block");
}
function hideDiv(id){
	$("#"+id).css("display","none");
}
function createInstance(elementId){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/quits/apply/create_apply.html",param,function(data){
					execute();
					$("#createApply").css("display","none");
				});
			}
		}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;离 职 申 请</div>
<br><br><br>
<table align="left" width="350" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">申请时间</th>
		<td width="270">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:750px;margin-left:0px"></div>
<br>
<a href="javascript:showDiv('createApply')">
<img src="<%=request.getContextPath()%>/images/button/create_apply.gif" /></a>
<br><br>
<div id="createApply" style="display: none">
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_QUIT %>"/>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">申请人：</th>
		<td width="160">
			<s:property value="#session.LOGIN_USER.person.name" />
			<input type="hidden" name="instance(Quit).employeeUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.uuid' />" />
		</td>
		<th width="130">组织机构：</th>
		<td width="160">
			<s:property value="#session.LOGIN_EMPLOYEE.department.description" />
			<input type="hidden" name="instance(Quit).departmentUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.departmentUuid' />" />
		</td>
	</tr>
	<tr>
		<th width="130">离职类别：</th>
		<td width="160">辞职<input type="hidden" name="instance(Quit).departureTypeUuid" value="10000000010120001001000000000010" /></td>
		<th width="130">离职时间：</th>
		<td width="160"><label name="instance(Quit).departureTime" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">离职原因：</th>
		<td colspan="3"><textarea name="instance(Quit).reason" style="width:410px;height:80px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table></form>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:hideDiv('createApply')">
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a></div>
</body>
</html>
