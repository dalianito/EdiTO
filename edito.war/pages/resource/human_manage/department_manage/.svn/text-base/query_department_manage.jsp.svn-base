<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组织机构管理</title>
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
<script>
Validation.init("resource/human_manage/department_manage/create_department.xml");
$(document).ready(function(){
	execute();
})
function execute(){
	$.post(cp+"/ajaxs/resource/human/manage/department/manage/query_department.html",null,function(data){
		addData(data);
	},"json")
}
function addData(dataStore){
	var buffer = "";
	buffer += "<table width='500' border='1' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr>";
	buffer += "<th width='300'>组织机构</th>";
	buffer += "<th>操作</th>";
	buffer += "</tr>";
	for (var i=0;i<dataStore.length;i++){
		buffer += "<tr>";
		buffer += "<td align='left'>";
		buffer += "&nbsp;";
		for (var j=0;j<dataStore[i][0];j++){
			buffer += "&nbsp;&nbsp;";
		}
		buffer += dataStore[i][1];
		buffer += "</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:editDepartment(\""+dataStore[i][2]+"\")'>编辑</a>&nbsp;";
		buffer += "<a href='javascript:deleteDepartment(\""+dataStore[i][2]+"\")'>删除</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	if(dataStore.length==0){
		buffer +="<tr><td colspan='2' align='center'><font color='red'>很遗憾，没有符合条件的结果！</font></td></tr>";
	}
			
    buffer += "</table>";
	$("#result").html(buffer);
}
function create(formId){
	if(Validation.excuteValidate(formId)){
		if(confirm("确认操作？")){
			var param = Submit.excute(formId);
			$.post(cp + "/ajaxs/resource/human/manage/department/manage/create_department.html" ,param, function(data){
				alert("操作成功！");
				execute();
				$("input[name='instance(Department).description']").val("");
				$("label[name='instance(Department).parentUuid']").val("");
				$("#editDiv").css("display","none");
			})	
		}
	}
}
function editDepartment(uuid){
	$.post(cp + '/ajaxs/resource/human/manage/department/manage/get_department_edit.html',{"uuid":uuid},function(data){
		if(data != null){
			$("#uuid").val(data.uuid);
			$("#timeStamp").val(data.timeStamp);
			$("#description").val(data.description);
			$("#parentUuid").val(data.parentUuid==null ? "" : data.parentUuid);
			$("#editDiv").css("display","block");
		}
	},"json");
}
function deleteDepartment(uuid){
	$.post(cp + '/ajaxs/resource/human/manage/department/manage/delete_department.html',{"uuid":uuid},function(data){
		if(data == "0"){
			alert("该机构有下属组织机构，不能删除！");
		}
		else if(data == "2"){
			alert("删除成功！");
			execute();
		}
	},"json");
}
function cancelEdit(){
	$("#uuid").val("");
	$("#timestamp").val("");
	$("#description").val("");
	$("#editDiv").css("display","none");
}
</script>
<body>
<form id="formA">
<div style="font-family:黑体;font-size:20px;">&nbsp;组 织 机 构 管 理</div>
<br><br>
		<h3>新增组织机构</h3>
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width='170'>组织机构</th>
			<th width='130'>所属组织机构</th>
			<th>操作</th>
		</tr>
		<tr>
			<td style="text-align:center">
				<input name="instance(Department).description" size="19" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;
			</td>
			<td style="text-align:center">
				<label name="instance(Department).parentUuid" class="BaseTree" javaClassName="Department"></label>
			</td>
			<td style="text-align:center">
				<a href="javascript:create('formA')">创建</a>
			</td>
		</tr>
	</table><br><br>
</form>
<form id="formB">
		<h3>编辑组织机构</h3>
	<div id="result"></div>
	<div id="editDiv" style="display: none" >
		 <table border="0" align="center" cellpadding="0" cellspacing="0" style="border-width: 0px"> 
			<tr>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lt.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_t.gif')"></td>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rt.gif')"></td>
			</tr>
			<tr>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_l.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/content.gif')">
					<div id="containerEditDiv">
						<input type="hidden" id="uuid" name="instance(Department).uuid">
						<input type="hidden" id="timeStamp" name="instance(Department).timeStamp">
						<table width='300px' border='3' cellpadding='10' cellspacing='0' class='InputPanel'>
							<tr>
								<th width='170'>组织机构</th>
								<th width='130'>所属组织机构</th>
							</tr>
							<tr>
								<td  style="text-align:center">
									<input id="description" name="instance(Department).description" size="19" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;
								</td>
								<td  style="text-align:center">
									<label id="parentUuid" name="instance(Department).parentUuid" class="BaseTree" javaClassName="Department"></label>
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