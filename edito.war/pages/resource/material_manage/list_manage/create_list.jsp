<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建供方名录</title>
</head>
<body>
<script>
Validation.init("resource/material_manage/list_manage/create_list.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/material/manage/list/manage/create_list.html",param,function(){
					location.href = cp + "/pages/resource/material/manage/list/manage/query_list_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
var materialInfoStringTmp = '<div style="padding-top:10px;padding-bottom:1px">'+
	'<input type="hidden" name="instance(MaterialInfo[NUMBER]).uuid" value="VALUE0">'+
	'<input type="hidden" name="instance(MaterialInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS">'+
	'<input type="text" name="instance(MaterialInfo[NUMBER]).materialUuid" value="VALUE1" style="width:90px" '+
	'nextSiblingName="materialName" class="DropMenu" actionPath='+cp+'"/ajaxs/drop/menu/query_material_drop_menu.html" execute="true" '+ 
	'executeUrl='+cp+'"/ajaxs/drop/menu/query_material_info.html" relationId="rowIndex"'+
	'validate="true" /><span id="material_rowIndex" />&nbsp;<font color="#996633">*</font>'+
	'&nbsp;<input type="button" value="删除" class="btn_info" onclick="removeInfoPlus(this,\'OUTERDIVID\')"/>'+
	'</div>';
var n = 1;
function createInfo(){
	var materialInfoString = materialInfoStringTmp.replace(/rowIndex/g, n);
	createInfoPlus("materialInfoName", materialInfoString, "0", ["", ""]);
	n++;
}
function updateRelation(data){
	var index = data["relationId"];
	$("#material_"+index).html("("+data["material"].materialNo+")");
}
function clearRelationData(index){
	$("#material_"+index).html("");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;供 方 名 录 管 理</div>
<br><br><br>
<form id="formA" name="formA" method="post">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">名称：</th>
		<td width="400"><input type="text" name="instance(Supplier).description" style="width:150px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">供应物资：</th>
		<td width="400">
			<input type="button" value="增加" class="btn_info"
				onclick="createInfo()" /><br>
			<div id="materialInfoName"></div><br>
			<script>createInfo();</script>
		</td>
	</tr>
	<tr>
		<th width="100">联系人：</th>
		<td width="400"><input type="text" name="instance(Supplier).contact" style="width:150px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">联系电话：</th>
		<td width="400"><input type="text" name="instance(Supplier).telephone" style="width:150px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">地址：</th>
		<td width="400"><input type="text" name="instance(Supplier).address" style="width:380px" /></td>
	</tr>
	<tr>
		<th width="100">简介：</th>
		<td width="400"><textarea name="instance(Supplier).summary" style="width:380px;height:100px"></textarea></td>
	</tr>
	<tr>
		<th width="100">记录人：</th>
		<td width="400">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/list/manage/query_list_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
