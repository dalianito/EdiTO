<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建合同</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/contract_manage/info_manage/create_contract_info.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		$("#EditorDefault").val(FCK.GetData());
		$("#EditorDefault").attr("validate", "true");
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/contract/manage/info/manage/create_contract.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/contract/manage/info/manage/query_info_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
var oriUuid = "";
function showRelatedContent(){
	var newUuid = $("label[name='instance(Contract).mouldUuid']").val();
	if(newUuid != oriUuid){
		oriUuid = newUuid;
		if(newUuid == ""){
			FCK.SetData("");
		}
		else {
			$.post(cp+"/ajaxs/resource/human/manage/contract/manage/info/manage/get_mould_content.html", {uuid:newUuid}, function(data){
				FCK.SetData(data);
			});
		}
	}
}
var FCK;
function FCKeditor_OnComplete(editorInstance) {
	FCK = editorInstance;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;合 同 信 息 管 理</div>
<br><br><br>
<form id="formA">
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">模板名称：</th>
		<td width="150"><label name="instance(Contract).mouldUuid" class="BaseTree" javaClassName="ContractMould" ifHasRelated="true" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<th width="100">合同编号：</th>
		<td width="150"><input name="instance(Contract).contractNo" size="16" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="100">记录人：</th>
		<td width="140">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
	<tr>
		<th width="100">签约者：</th>
		<td width="150"><input name="instance(Contract).signer" size="16" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="100">到期时间：</th>
		<td width="390" colspan="3"><label type="text" name="instance(Contract).expireTime" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th>合同内容：</th>
	</tr>
	<tr>
		<td><FCK:editor instanceName="EditorDefault" inputName="instance(Contract).content" height="500" width="730" ></FCK:editor></td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/contract/manage/info/manage/query_info_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
