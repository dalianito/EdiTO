<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>新建培训计划</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/training_manage/training_plan/create_training_plan.xml");
$(document).ready(function(){
	createInfoStar("DEPARTMENT", departmentStr0, "0", ["", ""]);
	createInfoStar("PERSON", personStr0, "0", ["", ""]);
	changeType("all");
});
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			$("input[name='instance(TrainingPlan).typeUuid']").val($("input[name='trainingType']:checked").val());
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/training/manage/training/plan/create_training_plan.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/training/manage/training/plan/query_training_plan.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function changeType(type){
	if(type == "all"){
		$("#department").css("display", "none");
		Submit.cancelSubmit($("#department"));
		Validation.cancelValidate($("#department"));
		$("#person").css("display", "none");
		Validation.cancelValidate($("#person"));
		Submit.cancelSubmit($("#person"));
	}
	else if(type == "department"){
		$("#department").css("display", "inline");
		Validation.revertValidate($("#department"));
		Submit.revertSubmit($("#department"));
		$("#person").css("display", "none");
		Validation.cancelValidate($("#person"));
		Submit.cancelSubmit($("#person"));
	}
	else if(type == "person"){
		$("#department").css("display", "none");
		Validation.cancelValidate($("#department"));
		Submit.cancelSubmit($("#department"));
		$("#person").css("display", "inline");
		Validation.revertValidate($("#person"));
		Submit.revertSubmit($("#person"));
	}
}
var departmentStr = '<div style="padding-top:5px;padding-bottom:1px" iTOType="info">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<label name="instance(ReceiverInfo[NUMBER]).receiverUuid" value="VALUE1" class="BaseTree" javaClassName="Department" nodeLevel="all" validate="true"></label>&nbsp;<font color="#996633">*</font>'+ 
	'&nbsp;<input type="button" value="删除" class="btn_info" onclick="removeInfoStar(this,\'OUTERDIVID\')"/>'+ 
	'</div>';
var departmentStr0 = '<div style="padding-top:10px;padding-bottom:5px" iTOType="info">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<label name="instance(ReceiverInfo[NUMBER]).receiverUuid" value="VALUE1" class="BaseTree" javaClassName="Department" nodeLevel="all" validate="true"></label>&nbsp;<font color="#996633">*</font>'+ 
	'</div>';
var personStr = '<div style="padding-top:5px;padding-bottom:1px" iTOType="info">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input name="instance(ReceiverInfo[NUMBER]).receiverUuid" class="DropMenu" actionPath="'+cp+'/ajaxs/drop/menu/query_employee_drop_menu.html" nextSiblingSize="15" validate="true" />&nbsp;<font color="#996633">*</font>'+ 
	'&nbsp;<input type="button" value="删除" class="btn_info" onclick="removeInfoStar(this,\'OUTERDIVID\')"/>'+
	'</div>';
var personStr0 = '<div style="padding-top:10px;padding-bottom:2px" iTOType="info">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(ReceiverInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input name="instance(ReceiverInfo[NUMBER]).receiverUuid" class="DropMenu" actionPath="'+cp+'/ajaxs/drop/menu/query_employee_drop_menu.html" nextSiblingSize="15" validate="true" />&nbsp;<font color="#996633">*</font>'+ 
	'</div>';
</script>
<iframe name="hiddenPage" style="display:none"></iframe>
<div style="font-family:黑体;font-size:20px;">&nbsp;培 训 计 划</div>
<br><br><br>
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<input type="hidden" name="bizDataUuid" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">培训主题：</th>
		<td width="480"><input type="text" name="instance(TrainingPlan).title" style="width:440px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">讲师：</th>
		<td width="480"><input name="instance(TrainingPlan).lecturerUuid"
			nextSiblingName=""
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			validate="true" nextSiblingValidate="true">&nbsp;<font color="#996633">*</font>&nbsp;</td>
	</tr>
	<tr>
		<th width="100">培训日期：</th>
		<td width="480"><label type="text" name="instance(TrainingPlan).trainingTime" class="DateTimeSingle" format="all" validate="true" ></label>&nbsp;<font color="#996633">*</font>&nbsp;</td>
	</tr>
	<tr>
		<th width="100">组织机构</th>
		<td width="480"><label name="instance(TrainingPlan).departmentUuid" class="BaseTree" javaClassName="Department" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th>类型：</th>
		<td>											   
			<input type="radio" name="trainingType" value="10000000010160001001000000000010" checked onclick="changeType('all')" />全部
			<input type="radio" name="trainingType" value="10000000010160001001000000000020" onclick="changeType('department')" />组织机构
			<input type="radio" name="trainingType" value="10000000010160001001000000000030" onclick="changeType('person')" />个人
			<input type="hidden" name="instance(TrainingPlan).typeUuid" />
		</td>
	</tr>
	<tbody id="department" style="display:none">
		<tr>
			<th>组织机构：</th>
			<td>
				<input type="button" value="增加" onclick="createInfoStar('DEPARTMENT', departmentStr, '0', ['', ''])" />
				<br>
				<div id="DEPARTMENT" childIndex="1"></div>
			</td>
		</tr>
	</tbody>
	<tbody id="person" style="display:none">
		<tr>
			<th>接受人：</th>
			<td>
				<input type="button" value="增加" onclick="createInfoStar('PERSON', personStr, '0', ['', ''])" />
				<br>
				<div id="PERSON" childIndex="101"></div>
			</td>
		</tr>
	</tbody>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/training/manage/training/plan/query_training_plan.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
