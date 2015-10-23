<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑供方名录</title>
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
				var param=Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/material/manage/list/manage/create_list.html",param,function(data){
					location.href = cp+"/pages/resource/material/manage/list/manage/query_list_manage.html";
				})
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
var materialInfoStringTmp = '<div style="padding-top:10px;padding-bottom:1px">'+
	'<input type="hidden" name="instance(MaterialInfo[NUMBER]).uuid" value="VALUE0">'+
	'<input type="hidden" name="instance(MaterialInfo[NUMBER]).timeStamp" value="VALUE1">'+
	'<input type="hidden" name="instance(MaterialInfo[NUMBER]).bizDataUuid" value="VALUE2">'+
	'<input type="hidden" name="instance(MaterialInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS">'+
	'<input type="text" name="instance(MaterialInfo[NUMBER]).materialUuid" value="VALUE3" nextSiblingValue="VALUE4" style="width:90px" '+
	'nextSiblingName="materialName" class="DropMenu" actionPath='+cp+'"/ajaxs/drop/menu/query_material_drop_menu.html" execute="true" '+ 
	'executeUrl='+cp+'"/ajaxs/drop/menu/query_material_info.html" relationId="rowIndex"'+
	'validate="true" /><span id="material_rowIndex" >VALUE5</span>&nbsp;<font color="#996633">*</font>'+
	'&nbsp;<input type="button" value="删除" class="btn_info" onclick="removeInfoPlus(this,\'OUTERDIVID\')"/>'+
	'</div>';
var n = 1;
function createInfo(operationStatus, args){
	var materialInfoString = materialInfoStringTmp.replace(/rowIndex/g, n);
	createInfoPlus("materialInfoName", materialInfoString, operationStatus, args);
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
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 差 错 管 理</div>
<br><br><br>
<s:iterator value="#request.supplier">
<form id="formA" name="formA" method="post">
<input type="hidden" name="instance(Supplier).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Supplier).timeStamp" value="<s:property value='timeStamp' />" />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">名称：</th>
		<td width="400"><input type="text" name="instance(Supplier).description" style="width:150px" value="<s:property value='description' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">供应物资：</th>
		<td width="400">
			<input type="button" value="增加" class="btn_info"
				onclick="createInfo('0', ['', '', '', '', '', ''])" /><br>
			<div id="materialInfoName"></div><br>
			<s:iterator value="materials">
				<script>createInfo("1", ["<s:property value='uuid' />", "<s:property value='timeStamp' />", "<s:property value='bizDataUuid' />", "<s:property value='materialUuid' />", "<s:property value='material.type.description' />", "(<s:property value='material.materialNo' />)"]);</script>
			</s:iterator>
		</td>
	</tr>
	<tr>
		<th width="100">联系人：</th>
		<td width="400"><input type="text" name="instance(Supplier).contact" style="width:150px" value="<s:property value='contact' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">联系电话：</th>
		<td width="400"><input type="text" name="instance(Supplier).telephone" style="width:150px" value="<s:property value='telephone' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">地址：</th>
		<td width="400"><input type="text" name="instance(Supplier).address" style="width:380px" value="<s:property value='address' />" /></td>
	</tr>
	<tr>
		<th width="100">简介：</th>
		<td width="400"><textarea name="instance(Supplier).summary" style="width:380px;height:100px"><s:property value="summary" /></textarea></td>
	</tr>
	<tr>
		<th width="100">记录人：</th>
		<td width="400">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/list/manage/query_list_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
