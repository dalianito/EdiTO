<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程类别管理</title>
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
Validation.init("content/course_manage/course_type/create_course_type.xml");
var isIe=(document.all)?true:false;
$(document).ready(function(){
	execute();
})
function execute(){
	$.post(cp+"/ajaxs/content/course/manage/course/type/query_course_type.html",null,function(data){
		addData(data);
	},"json")
}
function addData(dataStore){
	var buffer = "";
	if(dataStore.length < 25){
		buffer += "<table width='500' border='1' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr>";
		buffer += "<th width='340'>课程类别</th>";
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
			buffer += "<a href='javascript:editMaterialType(\""+dataStore[i][2]+"\")'>编辑</a>&nbsp;";
			buffer += "<a href='javascript:deleteMaterialType(\""+dataStore[i][2]+"\")'>删除</a>&nbsp;";
			buffer += "</td>";
			buffer += "</tr>";
		}if(dataStore.length==0){
			buffer +="<tr><td colspan='2' align='center'>很遗憾，没有符合条件的结果！</td></tr>";
		}
			
    	buffer += "</table>";
	}
	else {
		buffer += "<div>";
		buffer += "<div>";
		buffer += "<table width='500' border='1' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr>";
		buffer += "<th width='300'>课程类别</th>";
		buffer += "<th>操作</th>";
		buffer += "</tr>";
    	buffer += "</table>";
		buffer += "</div>";
		buffer += "<div style='height:500;overflow-y:auto'>";
		buffer += "<table width='500' border='1' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		for (var i=0;i<dataStore.length;i++){
			buffer += "<tr>";
			buffer += "<td width='300' align='left'>";
			buffer += "&nbsp;";
			for (var j=0;j<dataStore[i][0];j++){
				buffer += "&nbsp;&nbsp;";
			}
			buffer += dataStore[i][1];
			buffer += "</td>";
			buffer += "<td align='center'>";
			buffer += "<a href='javascript:editMaterialType(\""+dataStore[i][2]+"\")'>编辑</a>&nbsp;";
			buffer += "<a href='javascript:deleteMaterialType(\""+dataStore[i][2]+"\")'>删除</a>&nbsp;";
			buffer += "</td>";
			buffer += "</tr>";
		}
    	buffer += "</table>";
		buffer += "</div>";
		buffer += "</div>";
		buffer += "<br><br>";
	}
	$("#result").html(buffer);
}
function create(formId){
	if(Validation.excuteValidate(formId)){
			var param = Submit.excute(formId);
			$.post(cp + "/ajaxs/content/course/manage/course/type/create_course_type.html" ,param, function(data){
				alert("操作成功！");
				if(document.getElementById('back')!=null) {
					document.getElementById('back').parentNode.removeChild(document.getElementById('back'));
				}
				execute();
				$("input[name='instance(CourseCategoryType).description']").val("");
				$("label[name='instance(CourseCategoryType).parentUuid']").val("");
				$("label[name='instance(CourseCategoryType).parentUuid']").text("-选择-");
				$("#editDiv").css("display","none");
			})	
		}
}
function editMaterialType(uuid){
	var bWidth=parseInt(document.documentElement.scrollWidth);
	var bHeight=parseInt(document.documentElement.scrollHeight);
	var back=document.createElement("div");
	back.id="back";
	var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
	styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;";
	back.style.cssText=styleStr;
	document.body.appendChild(back);
	showBackground(back,50);
	$.post(cp + "/ajaxs/content/course/manage/course/type/get_course_type.html",{"uuid":uuid},function(data){
		if(data != null){
			$("#uuid").val(data.uuid);
			$("#timeStamp").val(data.timeStamp);
			$("#description").val(data.description);
			$("#parentUuid").val(data.parentUuid==null ? "" : data.parentUuid);
			$("#parentUuid").text(data.parentUuid==null ? "" : data.parent.description);
			$("#editDiv").css("display","block");
		}
	},"json");
}
function deleteMaterialType(uuid){
	if(confirm("确认操作？")){
		$.post(cp + '/ajaxs/content/course/manage/course/type/delete_course_type.html',{"uuid":uuid},function(data){
			if(data == "0"){
				alert("该课程类别有子类别，不能删除！");
			}
			else if(data == "1"){
				alert("删除成功！");
				execute();
			}
		},"json");
	}
}
function cancelEdit(){
	$("#uuid").val("");
	$("#timestamp").val("");
	$("#description").val("");
	$("#editDiv").css("display","none");
	if(document.getElementById('back')!=null) {
		document.getElementById('back').parentNode.removeChild(document.getElementById('back'));
	}
}

function showBackground(obj,endInt) {
	if(isIe) {
		obj.filters.alpha.opacity+=1;
		if(obj.filters.alpha.opacity<endInt) {
			setTimeout(function(){showBackground(obj,endInt)},5);
		}
	}
	else {
		var al=parseFloat(obj.style.opacity);al+=0.01;
		obj.style.opacity=al;
		if(al<(endInt/100)) {
			setTimeout(function(){showBackground(obj,endInt)},5);
		}
	}
}
</script>
<body>
<form id="formA">
<h3>新增课程类别</h3>
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width='250'>课程类别</th>
			<th width='150'>所属课程类别</th>
			<th width='100'>操作</th>
		</tr>
		<tr>
			<td style="text-align:center">
				<input name="instance(CourseCategoryType).description" size="19" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;
			</td>
			<td style="text-align:center">
				<label name="instance(CourseCategoryType).parentUuid" class="BaseTree" javaClassName="CourseCategoryType"></label>
			</td>
			<td style="text-align:center">
				<a href="javascript:create('formA')">创建</a>
			</td>
		</tr>
	</table><br><br>
</form>
<h3>编辑课程类别</h3>
<div id="result"></div>
<form id="formB">
<div id="editDiv" style="display:none;" >
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
					<input type="hidden" id="uuid" name="instance(CourseCategoryType).uuid">
					<input type="hidden" id="timeStamp" name="instance(CourseCategoryType).timeStamp">
					<table width='300px' border='3' cellpadding='10' cellspacing='0' class='InputPanel'>
						<tr>
							<th width='170'>课程类别</th>
							<th width='130'>所属课程类别</th>
						</tr>
						<tr>
							<td  style="text-align:center">
								<input id="description" name="instance(CourseCategoryType).description" size="17" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;
							</td>
							<td  style="text-align:center">
								<label id="parentUuid" name="instance(CourseCategoryType).parentUuid" class="BaseTree" javaClassName="CourseCategoryType"></label>
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
