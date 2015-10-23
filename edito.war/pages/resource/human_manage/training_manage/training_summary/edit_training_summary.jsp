<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>培训总结</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/training_manage/training_summary/create_training_summary.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/training/manage/training/summary/create_training_summary.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/training/manage/training/summary/query_training_summary.html";
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
		$("#h_"+index).val("10000000010170001001000000000020");
	}
	
	else {
		$("#h_"+index).val("10000000010170001001000000000010");
	}
}
var joinStr = 
'<div>'+
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).uuid" value="VALUE0">'+ 
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).timeStamp" value="VALUE1">'+
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).bizDataUuid" value="VALUE2">'+
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).applicantUuid" value="VALUE3">'+ 
'<input type="hidden" name="instance(ApplyInfo[NUMBER]).stateUuid" value="VALUE4">'+ 
'<input type="hidden" id="h_NUMBER" name="instance(ApplyInfo[NUMBER]).joinStateUuid" value="VALUE5">'+ 
'<input type="checkbox" id="b_NUMBER" onclick="choose(NUMBER)" >&nbsp;VALUE6'+
'</div>';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;培 训 总 结</div>
<br><br><br>
<s:iterator value="#request.trainingPlan">
<form id="formA">
<input type="hidden" name="instance(TrainingPlan).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(TrainingPlan).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(TrainingPlan).title" value="<s:property value='title' />" />
<input type="hidden" name="instance(TrainingPlan).lecturerUuid" value="<s:property value='lecturerUuid' />" />
<input type="hidden" name="instance(TrainingPlan).trainingTime" value="<s:date name='trainingTime' format='yyyy-MM-dd' />" />
<input type="hidden" name="instance(TrainingPlan).departmentUuid" value="<s:property value='departmentUuid' />" />
<input type="hidden" name="instance(TrainingPlan).stateUuid" value="<s:property value='stateUuid' />" />
<input type="hidden" name="instance(TrainingPlan).publisherUuid" value="<s:property value='publisherUuid' />" />
<input type="hidden" name="instance(TrainingPlan).typeUuid" value="<s:property value='typeUuid' />" />
<input type="hidden" name="instance(TrainingPlan).ifUsing" value="<s:property value='ifUsing' />" />
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
		<th width="100">参与人员：</th>
		<td>
		<div id="join"></div>
		<s:iterator value="applyInfos">
			<s:if test="stateUuid=='10000000010070001001000000000020'">
			<script>
				createInfoStar("join",joinStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='bizDataUuid' />","<s:property value='applicantUuid' />","<s:property value='stateUuid' />","<s:property value='joinStateUuid' />","<s:property value='applicant.person.name'/>"]);
			</script>
			</s:if>
		</s:iterator>
		</td>
	</tr>
	<tr>
		<th width="100">内容：</th>
		<td><textarea name="instance(TrainingPlan).content" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">课程设置：</th>
		<td><textarea name="instance(TrainingPlan).curriculum" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">教学效果：</th>
		<td><textarea name="instance(TrainingPlan).effect" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">实际情况：</th>
		<td><textarea name="instance(TrainingPlan).situation" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">建议：</th>
		<td><textarea name="instance(TrainingPlan).suggest" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/training/manage/training/summary/query_training_summary.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
