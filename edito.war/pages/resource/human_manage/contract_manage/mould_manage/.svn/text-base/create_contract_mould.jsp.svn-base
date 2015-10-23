<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建合同模板</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/contract_manage/mould_manage/create_contract_mould.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		$("#EditorDefault").val(FCK.GetData());
		$("#EditorDefault").attr("validate", "true");
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/contract/manage/mould/manage/create_contract_mould.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/contract/manage/mould/manage/query_mould_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
var FCK;
function FCKeditor_OnComplete(editorInstance) {
	FCK = editorInstance;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;合 同 模 板 管 理</div>
<br><br><br>
<form id="formA">
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">模板名称：</th>
		<td width="270"><input name="instance(ContractMould).description" size="25" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="100">创建人：</th>
		<td width="270">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th>模板内容：</th>
	</tr>
	<tr>
		<td><FCK:editor instanceName="EditorDefault" inputName="instance(ContractMould).content" height="500" width="730" ></FCK:editor></td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/contract/manage/mould/manage/query_mould_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
