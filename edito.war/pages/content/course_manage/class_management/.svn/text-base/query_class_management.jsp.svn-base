<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班型管理</title>
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
Validation.init("content/course_manage/class_management/create_class_management.xml");
var isIe=(document.all)?true:false;
$(document).ready(function(){
	execute();
})

function execute(){
	$.post(cp+"/ajaxs/content/course/manage/course/management/query_class_management.html",null,function(data){
		var buffer="";
		buffer += "<table width='500' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='300'>班型</th><th>操作</th></tr>";
		for(var i=0;i<data.length;i++){
			if(i%2==0){
				buffer += "<tr class='tr1'>";
			}
			else {
				buffer += "<tr class='tr2'>";
			}
			buffer += "<td align='center'>"+data[i][1]+"</td>";
			buffer += "<td align='center'>";
			buffer += "<a href='javascript:editClassManagement(\""+data[i][0]+"\")'>编辑</a>";
			buffer += "</td>";
			buffer += "</tr>";
		}
		if(data.length==0){
			buffer +="<tr><td colspan='2' align='center'>很遗憾，没有符合条件的结果！</td></tr>";
		}
		buffer += "</table>";
		$("#result").html(buffer);
	},"json")
}

function create(formId){
	if(Validation.excuteValidate(formId)){
			var param = Submit.excute(formId);
			$.post(cp + "/ajaxs/content/course/manage/course/management/create_class_management.html" ,param, function(data){
				alert("操作成功！");
				if(document.getElementById('back')!=null) {
					document.getElementById('back').parentNode.removeChild(document.getElementById('back'));
				}
				execute();
				$("input[name='instance(ClassManagement).description']").val("");
				$("#editDiv").css("display","none");
			})
		}
}
function editClassManagement(uuid){
	var bWidth=parseInt(document.documentElement.scrollWidth);
	var bHeight=parseInt(document.documentElement.scrollHeight);
	var back=document.createElement("div");
	back.id="back";
	var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
	styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;";
	back.style.cssText=styleStr;
	document.body.appendChild(back);
	showBackground(back,50);
	$.post(cp + "/ajaxs/content/course/manage/course/management/get_class_management.html",{"uuid":uuid},function(data){
		if(data != null){
			$("#uuid").val(data.uuid);
			$("#timeStamp").val(data.timeStamp);
			$("#description").val(data.description);
			$("#parentUuid").val(data.parentUuid==null ? "" : data.parentUuid);
			$("#editDiv").css("display","block");
		}
	},"json");
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

function showBackground(obj,endInt){
	if(isIe){
		obj.filters.alpha.opacity+=1;
		if(obj.filters.alpha.opacity<endInt) {
			setTimeout(function(){showBackground(obj,endInt)},5);
		}
	}
	else{
		var al=parseFloat(obj.style.opacity);al+=0.01;
		obj.style.opacity=al;
		if(al<(endInt/100)){
			setTimeout(function(){showBackground(obj,endInt)},5);
		}
	}
}
</script>
<body>
<form id="formA">
<h3>新增班型</h3>
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width='300'>班型</th>
			<th width='200'>操作</th>
		</tr>
		<tr>
			<td style="text-align:center">
				<input name="instance(ClassManagement).description" size="35" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;
			</td>
			<td style="text-align:center">
				<a href="javascript:create('formA')">创建</a>
			</td>
		</tr>
	</table><br><br>
</form>
<h3>编辑班型</h3>
<div id="result"></div>
<form id="formB">
<div id="editDiv" style="display:none" >
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
					<input type="hidden" id="uuid" name="instance(ClassManagement).uuid">
					<input type="hidden" id="timeStamp" name="instance(ClassManagement).timeStamp">
					<table width='300px' border='3' cellpadding='10' cellspacing='0' class='InputPanel'>
						<tr>
							<th width='300px'>班型</th>
						</tr>
						<tr>
							<td  style="text-align:center">
								<input id="description" name="instance(ClassManagement).description" size="30" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;
							</td>
						</tr>
						<tr>
							<td  style="text-align:center">
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