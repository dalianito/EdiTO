<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建物资调配</title>
</head>
<body>
<script>
Validation.init("resource/material_manage/material_allocate/create_allocate.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			alert("物资使用创建不能修改请慎重填写！");
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/material/manage/material/allocate/create_material_allocate.html",param,function(){
					location.href = cp + "/pages/resource/material/manage/material/allocate/query_material_allocate.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function updateRelation(data){
	$("#unit").html(data["material"].unit);
}
function clearRelationData(relationId){
	$("#unit").html("");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 调 配</div>
<br><br><br>
<form id="formA" name="formA" method="post">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">经办人：</th>
		<td width="400" colspan="3">
			<s:property value="#session.LOGIN_EMPLOYEE.person.name" />
		</td>
	</tr>
	<tr>
		<th width="100">物资：</th>
		<td width="400" colspan="3"><input name="instance(MaterialAllocate).materialUuid"
			nextSiblingName="materialName"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_drop_menu.html"
			execute="true"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_info.html"
		    validate="true" >&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">数量：</th>
		<td width="400" colspan="3"><input id="ctn" type="text" name="instance(MaterialAllocate).amount" style="width:50px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">单位：</th>
		<td width="400" colspan="3"><div id="unit"></div></td>
	</tr>
	<tr>
		<th width="100">需求部门：</th>
		<td width="150"><label name="instance(MaterialAllocate).demandSectorUuid" class="BaseTree" javaClassName="Department" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="100">需求校区：</th>
		<td width="150"><label name="instance(MaterialAllocate).demandCampusUuid" class="BaseTree" javaClassName="Campus" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">调配部门：</th>
		<td width="150"><label name="instance(MaterialAllocate).deployedSectorUuid" class="BaseTree" javaClassName="Department" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="100">调配校区：</th>
		<td width="150"><label name="instance(MaterialAllocate).deployedCampusUuid" class="BaseTree" javaClassName="Campus" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">备注：</th>
		<td width="400" colspan="3"><textarea name="instance(MaterialAllocate).remarks" style="width:380px;height:100px" validate="true" ></textarea></td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/material/allocate/query_material_allocate.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
