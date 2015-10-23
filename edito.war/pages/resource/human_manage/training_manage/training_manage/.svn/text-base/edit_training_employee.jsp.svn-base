<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>培训管理</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/apply_manage/relationship_apply/create_relationship_apply.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/training/manage/training/manage/create_training_employee.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/training/manage/training/manage/query_training_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function choose(index){
	if($("#b_"+index).attr("checked")){
		$("#h_"+index).val("10000000010070001001000000000020");
	}
	
	else {
		$("#h_"+index).val("10000000010070001001000000000010");
	}
}
var applyStr = 
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).uuid" value="VALUE0">'+ 
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).timeStamp" value="VALUE1">'+
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).bizDataUuid" value="VALUE2">'+
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).applicantUuid" value="VALUE3">'+ 
'<input type="hidden" id="h_NUMBER" name="instance(ApplyInfo[NUMBER]).stateUuid" value="VALUE4">'+ 
'<input type="checkbox" id="b_NUMBER" onclick="choose(NUMBER)" >&nbsp;VALUE5';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;培 训 管 理</div>
<br><br><br>
<s:iterator value="#request.trainingPlan">
<form id="formA">
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">培训主题：</th>
		<td><s:property value='title' /></td>
	</tr>
	<tr>
		<th width="100">讲师：</th>
		<td><s:property value='lecturer.person.name' /></td>
	</tr>
	<tr>
		<th width="100">考核日期：</th>
		<td><s:date name="trainingTime" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="100">组织机构：</th>
		<td><s:property value='department.description' /></td>
	</tr>
	<tr>
		<th width="100">类型：</th>
		<td><s:property value='type.description' /></td>
	</tr>
	<tr>
		<th width="100">申请人员：</th>
		<td>
		<div id="apply"></div>
		<s:iterator value="applyInfos">
			<s:if test="stateUuid=='10000000010070001001000000000010'">
			<script>
				createInfoStar("apply",applyStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='bizDataUuid' />","<s:property value='applicantUuid' />","<s:property value='stateUuid' />","<s:property value='applicant.person.name'/>"]);
			</script>
			</s:if>
		</s:iterator>
		</td>
	</tr>
	<tr>
		<th width="100">通过人员：</th>
		<td>
		<div id="apply"></div>
		<s:iterator value="applyInfos">
			<s:if test="stateUuid=='10000000010070001001000000000020'">
				<s:property value='applicant.person.name' />
			</s:if>
		</s:iterator>
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/training/manage/training/manage/query_training_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
