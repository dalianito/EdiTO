<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建采购申请</title>
</head>
<body>
<script>
Validation.init("resource/material_manage/apply_manage/material_apply/create_apply.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认创建？")){
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/material/manage/apply/manage/material/apply/create_material_apply.html",param,function(){
				location.href = cp+"/pages/resource/material/manage/apply/manage/material/apply/query_material_apply.html";
			})
		}
	}
}
var n = 1;
function createInfo(){
	var officeApplicationStr = officeApplicationStrTmp.replace(/rowIndex/g, n);
	createInfoPlus("OFFICEAPPLICATIONINFO", officeApplicationStr, "0", ["", "", ""]);
	n++;
	generateSeq();
}
function removeInfo(button, outerDivId){
	removeInfoPlus(button, outerDivId);
	generateSeq();
}
function generateSeq(){
	var seq = 1;
	$("[id^='seq_']").each(function(){
		$(this).html(seq);
		seq++;
	});
}
var officeApplicationStrTmp = '<tr iTOType="info">'+ 
	'<td width="30"><input type="hidden" name="instance(OfficeApplicationInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(OfficeApplicationInfo[NUMBER]).ifGenerate" value="false">'+
	'<input type="hidden" name="instance(OfficeApplicationInfo[NUMBER]).receipStateUuid" value="<%=Constants.RECEIPT_STATE_UNDONE%>">'+
	'<input type="hidden" name="instance(OfficeApplicationInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<div id="seq_rowIndex" align="center"></div></td>'+ 
	'<td width="110"><input type="text" name="instance(OfficeApplicationInfo[NUMBER]).materialUuid" value="VALUE1" style="width:90px" '+
	'nextSiblingName="materialName" class="DropMenu" actionPath='+cp+'"/ajaxs/drop/menu/query_material_drop_menu.html" execute="true" '+ 
	'executeUrl='+cp+'"/ajaxs/drop/menu/query_material_info.html" relationId="rowIndex"'+
	'validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;</td>'+ 
	'<td width="110"><div id="no_rowIndex" align="center"></div></td>'+ 
	'<td width="110"><div id="size_rowIndex" align="center"></td>'+
	'<td width="50"><div id="unit_rowIndex" align="center"></td>'+
	'<td width="120"><input type="text" name="instance(OfficeApplicationInfo[NUMBER]).materialAmount" value="VALUE2" style="width:90px" validate="true"><font color="#996633">&nbsp*</font></td>'+ 
	'<td width="80" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfo(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
function updateRelation(data){
	var index = data["relationId"];
	$("#no_"+index).html(data["material"].materialNo);
	$("#size_"+index).html(data["material"].specification);
	$("#unit_"+index).html(data["material"].unit);
}
function clearRelationData(index){
	$("#no_"+index).html("");
	$("#size_"+index).html("");
	$("#unit_"+index).html("");
}
$(document).ready(function(){
	createInfo();
});
</script>

<div style="font-family:黑体;font-size:20px;">&nbsp;采 购 申 请</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING%>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_MATERIAL%>"/>
<table width="620" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	
	<tr>
		<th width="620" colspan="6">申请人基本信息</th>
	</tr>
	<tr>
		<th width="110">申请人：</th>
		<td width="110"><s:property value="#session.LOGIN_EMPLOYEE.person.name" /></td>	
		<th width="100">申请单位：</th>
		<td width="100"><label name="instance(OfficeApplication).departmentUuid" class="BaseTree" javaClassName="Department" value="<s:property value='#session.LOGIN_EMPLOYEE.departmentUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<th width="100">校区：</th>
		<td width="100"><label name="instance(OfficeApplication).campusUuid" class="BaseTree" javaClassName="Campus" value="<s:property value='#session.LOGIN_EMPLOYEE.campusUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
<br>
<table width="620" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="620" colspan="7">申请办公用品信息</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="110">物资名称</th>
		<th width="110">物资编号</th>
		<th width="110">规格型号</th>
		<th width="50">单位</th>
		<th width="120">申请数量</th>
		<th width="80"><input type="button" value="增加" onclick="createInfo()" /></th>
	</tr>
	<tbody id="OFFICEAPPLICATIONINFO"></tbody>
</table>
<br>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/apply/manage/material/apply/query_material_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
