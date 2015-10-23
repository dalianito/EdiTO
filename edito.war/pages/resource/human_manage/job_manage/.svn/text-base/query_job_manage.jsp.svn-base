<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>岗位管理</title>
<style type="text/css">
	#editDiv {
		z-index:1;
		position:fixed;
		left:50%;
		top:200px;
		margin-left:-210px;
	}
</style>
</head>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
Validation.init("resource/human_manage/job_manage/create_job.xml");
$(document).ready(function(){
	execute();
})
function execute(){
	$.post(cp+"/ajaxs/resource/human/manage/job/manage/query_job_manage.html",null,function(data){
		addData(data);
	},"json")
}
function addData(dataStore){
	var buffer = "";
	buffer += "<table width='350' border='1' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr>";
	buffer += "<th width='200'>岗位</th>";
	buffer += "<th width='150'>操作</th>";
	buffer += "</tr>";
	for (var i=0;i<dataStore.length;i++){
		buffer += "<tr>";
		buffer += "<td align='left'>&nbsp;" + dataStore[i][1] + "</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:editJob(\""+dataStore[i][2]+"\")'>编辑</a>&nbsp;";
		buffer += "<a href='javascript:deleteJob(\""+dataStore[i][2]+"\")'>删除</a>&nbsp;";
		buffer += "<a href='javascript:queryJobEmployee(\""+dataStore[i][1]+"\", \""+dataStore[i][2]+"\")'>岗位人员</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	if(dataStore.length==0){
		buffer +="<tr><td colspan='4' align='center'><font color='red'>很遗憾，没有符合条件的结果！</font></td></tr>";
	}
    buffer += "</table>";
	$("#result").html(buffer);
}
function create(formId){
	if(Validation.excuteValidate(formId)){
		if(confirm("确认操作？")){
			var param = Submit.excute(formId);
			$.post(cp + "/ajaxs/resource/human/manage/job/manage/create_job.html" ,param, function(data){
				alert("操作成功！");
				execute();
				$("input[name='instance(Job).description']").val("");
				$("#editDiv").css("display","none");
			})
		}
	}
}
function editJob(uuid){
	$.post(cp + "/ajaxs/resource/human/manage/job/manage/get_job_edit.html",{"uuid":uuid},function(data){
		if(data != null){
			$("#uuid").val(data.uuid);
			$("#timeStamp").val(data.timeStamp);
			$("#description").val(data.description);
			$("#editDiv").css("display","block");
		}
	},"json");
}
function deleteJob(uuid){
	$.post(cp + "/ajaxs/resource/human/manage/job/manage/remove_job.html",{"uuid":uuid},function(data){
		alert("删除成功！");
		execute();
	},"json");
}
function queryJobEmployee(name, uuid){
	$.post(cp + "/ajaxs/resource/human/manage/job/manage/query_job_employee.html",{"uuid":uuid},function(data){
		var num = data.length;
		var buffer = "<br><hr><br>";
		buffer += "<font color='red'><b>" + name + "</b>&nbsp;岗位现有员工&nbsp;<b>" + num + "</b>&nbsp;人</font>";
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
			buffer += "<tr><td colspan='10'>&nbsp;<font color='red'>该岗位暂未分配员工！</font></td></tr>";
		}
		buffer += "</table><br>";
		buffer += "<a href='javascript:hideTable()'><img src='"+cp+"/images/button/b_cancel.gif' /></a>";

		$("#jobEmployee").css("display", "block");
		$("#jobEmployee").html(buffer);
	},"json");
}
function hideTable(){
	$("#jobEmployee").css("display", "none");
}
function cancelEdit(){
	$("#uuid").val("");
	$("#timestamp").val("");
	$("#description").val("");
	$("#editDiv").css("display","none");
}
</script>
<body>
<div style="font-family:黑体;font-size:20px;">&nbsp;岗 位 管 理</div>
<br><br>
<h3>新增岗位</h3>
<form id="formA">
<table width="350" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="200">岗位</th>
		<th width="150">操作</th>
	</tr>
	<tr>
		<td>
			<input name="instance(Job).description" size="22" validate="true" />&nbsp;<font color="#996633">*</font>&nbsp;
		</td>
		<td style="text-align:center">
			<a href="javascript:create('formA')">创建</a>
		</td>
	</tr>
</table>
<br><br>
</form>
<form id="formB">
<h3>编辑岗位</h3>
<div id="result"></div>
<div id="jobEmployee"></div>
<div id="editDiv" style="display:none" >
<table border="0" align="center" cellpadding="0" cellspacing="0" style="border-width:0px"> 
	<tr>
		<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lt.gif')"></td>
		<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_t.gif')"></td>
		<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rt.gif')"></td>
	</tr>
	<tr>
		<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_l.gif')"></td>
		<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/content.gif')">
			<div id="containerEditDiv">
				<input type="hidden" id="uuid" name="instance(Job).uuid">
				<input type="hidden" id="timeStamp" name="instance(Job).timeStamp">
				<table width="200px" border="3" cellpadding="10" cellspacing="0" class="InputPanel">
					<tr>
						<th width="200">岗位</th>
					</tr>
					<tr>
						<td>
							<input id="description" name="instance(Job).description" size="22" validate="true" />&nbsp;<font color="#996633">*</font>&nbsp;
						</td>
					</tr>
					<tr>
						<td  style="text-align:center" colspan="2">
							<br/>
							<input type="button" value="确定修改" onclick="javascript:create('formB')">
							&nbsp;&nbsp;&nbsp;
							<input type="button" value="取消" onclick="javascript:cancelEdit()">
						</td>
					</tr>
				</table>
			</div>
		</td>
		<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_r.gif')"></td>
	</tr>
	<tr>
		<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lb.gif')"></td>
		<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_b.gif')"></td>
		<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rb.gif')"></td>
	</tr>
</table>
</div>
</form>
</body>
</html>
