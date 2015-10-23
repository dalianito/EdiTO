<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>编辑活动申请</title>
</head>
<body>
<form id="form" name="form" method="post">
	<input type="hidden" name="uuid" />
	<input type="hidden" name="type" />
</form>
<script>
Validation.init("resource/campus_manage/campus_publicity/publicity_apply/create_apply.xml");

$(document).ready(function(){
	var copyFileUuid = $("#copyFileUuid").val();
	if(copyFileUuid != ""){
		$("#div1").css("display", "inline");
		$("#div2").css("display", "none");
	}
	else{
		$("#div1").css("display", "none");
		$("#div2").css("display", "inline");
	}
	showRelatedContent();
	$("#preCost").val(parseFloat($("#preCostTemp").val()).toFixed(2));
})
function downloadResource(uuid){
	var f = document.getElementById("form");
	f.action = cp + "/views/resource/campus/manage/campus/publicity/publicity/apply/forward_resource.html";
	f.uuid.value = uuid;
	f.type.value = "publicityApplication";
	f.submit();
}
function deleteFile(){
	$("#div1").css("display", "none");
	$("#div2").css("display", "inline");
	var uuid = $("input[name='instance(PublicityApplication).uuid']").val();
	$.post(cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/apply/delete_file.html",{uuid:uuid},function(timeStamp){
		$("input[name='instance(PublicityApplication).timeStamp']").val(timeStamp);
		$("input[name='instance(PublicityApplication).copyFileUuid']").val("");
	});
}
function createInfoPlusTmp(operationStatus, args){
	if(operationStatus == "0"){
		createInfoPlus("materials", materialStr, operationStatus, args);
	}
	else if(operationStatus == "1"){
		createInfoPlus("materials", materialStr2, operationStatus, args);
	}
	
	var num = 1;
	$("[id^='no_']").each(function(){
		if($(this).parents("*[iTOType='info']").find("input[iTOType='operationStatus']").val() != 2){
			$(this).html(num++);
		}
	});

	var childIndex = parseInt($("#materials").attr("childIndex"), 10);
	$("#startTime_"+childIndex).bind("propertychange",function() {
		var fromDate = $("#startTime_"+childIndex).val();
		var toDate = $("#endTime_"+childIndex).val();
		if(fromDate!="" && toDate!=""){
			var iDays = DateDiff(toDate, fromDate);
			$("#makeDays_"+childIndex).val(iDays);
		}
		else{
			$("#makeDays_"+childIndex).val("");
		}
	});
	$("#endTime_"+childIndex).bind("propertychange",function() {
		var fromDate = $("#startTime_"+childIndex).val();
		var toDate = $("#endTime_"+childIndex).val();
		if(fromDate!="" && toDate!=""){
			var iDays = DateDiff(toDate,fromDate);
			$("#makeDays_"+childIndex).val(iDays);
		}
		else{
			$("#makeDays_"+childIndex).val("");
		}
	});
}
function removeInfoStarTmp(div, divId){
	removeInfoStar(div, divId);
	var num = 1;
	$("[id^='no_']").each(function(){
		if($(this).parents("*[iTOType='info']").find("input[iTOType='operationStatus']").val() != 2){
			$(this).html(num++);
		}
	});
}
function showRelatedContent(){
	$("[id^='type_']").each(function(){
		var labelId = $(this).attr("id");
		if(labelId.indexOf("con") == -1){
			if($(this).val()=="<%=Constants.APPLICATION_MATERIAL_TYPE_OTHER%>" && $("#"+labelId+"_con").css("display")=="none"){
				$("#"+labelId+"_con").css("display", "inline");
				$("#"+labelId+"_con").attr("submit", "true");
			}
			else if($(this).val()!="<%=Constants.APPLICATION_MATERIAL_TYPE_OTHER%>" && $("#"+labelId+"_con").css("display")=="inline"){
				$("#"+labelId+"_con").css("display", "none");
				$("#"+labelId+"_con").attr("submit", "false");
			}
		}
	});
	$("[id^='size_']").each(function(){
		var labelId = $(this).attr("id");
		if(labelId.indexOf("con") == -1){
			if($(this).val()=="<%=Constants.APPLICATION_MATERIAL_SIZE_OTHER%>" && $("#"+labelId+"_con").css("display")=="none"){
				$("#"+labelId+"_con").css("display", "inline");
				$("#"+labelId+"_con").attr("submit", "true");
			}
			else if($(this).val()!="<%=Constants.APPLICATION_MATERIAL_SIZE_OTHER%>" && $("#"+labelId+"_con").css("display")=="inline"){
				$("#"+labelId+"_con").css("display", "none");
				$("#"+labelId+"_con").attr("submit", "false");
			}
		}
	});
	$("[id^='texture_']").each(function(){
		var labelId = $(this).attr("id");
		if(labelId.indexOf("con") == -1){
			if($(this).val()=="<%=Constants.APPLICATION_MATERIAL_TEXTURE_OTHER%>" && $("#"+labelId+"_con").css("display")=="none"){
				$("#"+labelId+"_con").css("display", "inline");
				$("#"+labelId+"_con").attr("submit", "true");
			}
			else if($(this).val()!="<%=Constants.APPLICATION_MATERIAL_TEXTURE_OTHER%>" && $("#"+labelId+"_con").css("display")=="inline"){
				$("#"+labelId+"_con").css("display", "none");
				$("#"+labelId+"_con").attr("submit", "false");
			}
		}
	});
	$("[id^='unit_']").each(function(){
		var labelId = $(this).attr("id");
		if(labelId.indexOf("con") == -1){
			if($(this).val()=="<%=Constants.PRODUCTION_UNIT_OTHER%>" && $("#"+labelId+"_con").css("display")=="none"){
				$("#"+labelId+"_con").css("display", "inline");
				$("#"+labelId+"_con").attr("submit", "true");
			}
			else if($(this).val()!="<%=Constants.PRODUCTION_UNIT_OTHER%>" && $("#"+labelId+"_con").css("display")=="inline"){
				$("#"+labelId+"_con").css("display", "none");
				$("#"+labelId+"_con").attr("submit", "false");
			}
		}
	});
}
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认操作？")){
			var param = Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/apply/create_apply.html",param,function(data){
				uploadResource(data);
				location.href = cp + "/pages/resource/campus/manage/campus/publicity/publicity/apply/query_apply_manage.html";
			});
		}
	}
}
function uploadResource(data){
	var filePath = $("input[name='file']").val();
	if(filePath != ""){
		var fileElement = document.formA.file;
		if(typeof(fileElement) != "undefined"){
			$.ajaxSetup({async:false});
			document.formA.action=cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/apply/upload_file.html";
			document.formA.publicityApplyUuid.value = data;
			document.formA.target="_self";
			document.formA.submit();
			alert("已成功上传文件！");
		}
	}
}
var preParticipatorStr = '<div iTOType="info" style="margin-top:5px">'+ 
	'<input type="hidden" name="instance(PreParticipatorInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(PreParticipatorInfo[NUMBER]).timeStamp" value="VALUE1">'+ 
	'<input type="hidden" name="instance(PreParticipatorInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(PreParticipatorInfo[NUMBER]).employeeUuid" nextSiblingName="employeeName" value="VALUE2" nextSiblingValue="VALUE3" class="DropMenu" actionPath="'+cp+'/ajaxs/drop/menu/query_employee_drop_menu.html" validate="true" />&nbsp;<font color="#996633">*</font>'+ 
	'&nbsp;<input type="button" class="btn_info" value="删除" onclick="removeInfoPlus(this,\'OUTERDIVID\')"/>'+ 
	'</div>';
var materialStr = '<div iTOType="info"><table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">'+ 
	'<tr><th width="720" colspan="3"><input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus" /><div style="float:left;width:18px">&nbsp;</div>宣传品 <div id="no_NUMBER" style="display:inline"></div><img style="float:right;margin-top:-7px;cursor:hand" src="'+cp+'/images/button/b_close_3.gif" onclick="removeInfoStarTmp(this,\'OUTERDIVID\')" /></th></tr>'+ 
	'<tr><th width="120">申请物料：</th><td width="600" colspan="2"><label id="type_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialUuid" class="BaseTree" javaClassName="ApplicationMaterialType" ifHasRelated="true" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;<div id="type_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).materialOther" size="15"></div></td></tr>'+  
	'<tr><th width="120">申请数量：</th><td width="600" colspan="2"><input name="instance(PropagandaMaterialInfo[NUMBER]).applicationNumber" size="10" validate="true" />&nbsp;<font color="#996633">*</font></td></tr>'+ 
	'<tr><th width="120" rowspan="3">规格要求：</th><td width="100">尺寸(成品)</td><td width="500"><label id="size_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialSizeUuid" class="BaseTree" javaClassName="ApplicationMaterialSize" ifHasRelated="true" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;<div id="size_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).sizeOther" size="15"></div></td></tr>'+ 
	'<tr><td width="100">色彩</td><td width="500"><label name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialColorUuid" class="BaseTree" javaClassName="ApplicationMaterialColor" validate="true"></label>&nbsp;<font color="#996633">*</font></td></tr>'+ 
	'<tr><td width="100">材质</td><td width="500"><label id="texture_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialTextureUuid" class="BaseTree" javaClassName="ApplicationMaterialTexture" ifHasRelated="true" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;<div id="texture_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).textureOther" size="15"></div></td></tr>'+ 
	'<tr><th width="120">制作单位：</th><td width="600" colspan="2"><label id="unit_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).productionUnitUuid" class="BaseTree" javaClassName="ProductionUnit" ifHasRelated="true"></label>&nbsp;&nbsp;<div id="unit_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).unitOther" size="20"></div></td></tr>'+ 
	'<tr><th width="120">设计负责人：</th><td width="600" colspan="2"><input name="instance(PropagandaMaterialInfo[NUMBER]).designer" size="15" /></td></tr>'+ 
	'<tr><th width="120">制作周期：</th><td width="600" colspan="2"><label id="startTime_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).makeStartTime" class="DateTimeSingle"></label>&nbsp;-&nbsp;<label id="endTime_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).makeEndTime" class="DateTimeSingle"></label>&nbsp;&nbsp;<input id="makeDays_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).makeDays" disabled="disabled" size="5" />&nbsp;天<br></td></tr>'+ 
	'</table><br></div>';
var materialStr2 = '<div iTOType="info"><table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">'+ 
	'<tr><th width="720" colspan="3">'+ 
	'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).uuid" value="VALUE0" />'+ 
	'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).timeStamp" value="VALUE1" />'+ 
	'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus" />'+ 
	'<div style="float:left;width:18px">&nbsp;</div>宣传品 <div id="no_NUMBER" style="display:inline"></div><img style="float:right;margin-top:-7px;cursor:hand" src="'+cp+'/images/button/b_close_3.gif" onclick="removeInfoStarTmp(this,\'OUTERDIVID\')" /></th></tr>'+ 
	'<tr><th width="120">申请物料：</th><td width="600" colspan="2"><label id="type_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialUuid" class="BaseTree" javaClassName="ApplicationMaterialType" ifHasRelated="true" value="VALUE2" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;<div id="type_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).materialOther" size="15" value="VALUE3"></div></td></tr>'+  
	'<tr><th width="120">申请数量：</th><td width="600" colspan="2"><input name="instance(PropagandaMaterialInfo[NUMBER]).applicationNumber" size="10" value="VALUE4" validate="true" />&nbsp;<font color="#996633">*</font></td></tr>'+ 
	'<tr><th width="120" rowspan="3">规格要求：</th><td width="100">尺寸(成品)</td><td width="500"><label id="size_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialSizeUuid" class="BaseTree" javaClassName="ApplicationMaterialSize" ifHasRelated="true" value="VALUE5" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;<div id="size_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).sizeOther" size="15" value="VALUE6"></div></td></tr>'+ 
	'<tr><td width="100">色彩</td><td width="500"><label name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialColorUuid" class="BaseTree" javaClassName="ApplicationMaterialColor" value="VALUE7" validate="true"></label>&nbsp;<font color="#996633">*</font></td></tr>'+ 
	'<tr><td width="100">材质</td><td width="500"><label id="texture_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialTextureUuid" class="BaseTree" javaClassName="ApplicationMaterialTexture" ifHasRelated="true" value="VALUE8" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;<div id="texture_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).textureOther" size="15" value="VALUE9"></div></td></tr>'+ 
	'<tr><th width="120">制作单位：</th><td width="600" colspan="2"><label id="unit_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).productionUnitUuid" class="BaseTree" javaClassName="ProductionUnit" ifHasRelated="true" value="VALUE10"></label>&nbsp;&nbsp;<div id="unit_NUMBER_con" style="display:none" submit="false"><input name="instance(PropagandaMaterialInfo[NUMBER]).unitOther" size="20" value="VALUE11"></div></td></tr>'+ 
	'<tr><th width="120">设计负责人：</th><td width="600" colspan="2"><input name="instance(PropagandaMaterialInfo[NUMBER]).designer" size="15" value="VALUE12" /></td></tr>'+ 
	'<tr><th width="120">制作周期：</th><td width="600" colspan="2"><label id="startTime_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).makeStartTime" class="DateTimeSingle" value="VALUE13"></label>&nbsp;-&nbsp;<label id="endTime_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).makeEndTime" class="DateTimeSingle" value="VALUE14"></label>&nbsp;&nbsp;<input id="makeDays_NUMBER" name="instance(PropagandaMaterialInfo[NUMBER]).makeDays" disabled="disabled" size="5" value="VALUE15" />&nbsp;天<br></td></tr>'+ 
	'</table><br></div>';
</script>
<iframe name="hiddenPage" style="display:none"></iframe>
<div style="font-family:黑体;font-size:20px;">&nbsp;活 动 申 请</div>
<br><br><br>
<s:iterator value="#request.publicityApplication">
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<input type="hidden" name="instance(PublicityApplication).uuid" value="<s:property value='uuid'/>" />
<input type="hidden" name="instance(PublicityApplication).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Apply).uuid" value="<s:property value='applyUuid'/>" />
<input type="hidden" name="instance(Apply).timeStamp" value="<s:property value='apply.timeStamp' />"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<s:property value='apply.typeUuid' />"/>
<input type="hidden" name="instance(Apply).stateUuid" value="<s:property value='apply.stateUuid' />"/>
<input type="hidden" id="copyFileUuid" name="instance(PublicityApplication).copyFileUuid" value="<s:property value='copyFileUuid'/>" />
<input type="hidden" name="publicityApplyUuid"/>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="120">申请人：</th>
		<td width="120"><s:property value="#session.LOGIN_EMPLOYEE.person.name" /></td>
		<th width="120">组织机构：</th>
		<td width="120"><label name="instance(PublicityApplication).departmentUuid" class="BaseTree" javaClassName="Department" value="<s:property value='departmentUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<th width="120">校区：</th>
		<td width="120"><label name="instance(PublicityApplication).campusUuid" class="BaseTree" javaClassName="Campus" value="<s:property value='campusUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="120">活动简述：</th>
		<td width="600" colspan="5">
			<textarea name="instance(PublicityApplication).description" style="width:580px;height:100px" validate="true"><s:property value="description" /></textarea>&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="120">活动时间：</th>
		<td width="600" colspan="5">
			<input type="hidden"  name="instance(PublicityApplication).activityTime" class="DateTimeMultiple" format="Hm" value="<s:date name='activityTime' format='yyyy-MM-dd HH:mm' />" />
		</td>
	</tr>
	<tr>
		<th width="120">活动地点：</th>
		<td width="600" colspan="5">
			<input name="instance(PublicityApplication).location" style="width:580px" value="<s:property value='location' />" validate="true" />&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="120">文案：</th>
		<td width="600" colspan="5">
			<textarea name="instance(PublicityApplication).copyContent" style="width:580px;height:100px" validate="true"><s:property value="copyContent" /></textarea>&nbsp;<font color="#996633">*</font><br><br>
			<div id="div1">
				<a href="javascript:downloadResource('<s:property value="copyFileUuid"/>')"><s:property value='copyFile.name'/></a>&nbsp;&nbsp;<input type="button" value="删除" onclick="deleteFile()"/>
			</div>
			<div id="div2">
				<input type="file" name="file" style="width:580px;height:20px;background-color:#ffffff" />
			</div>
		</td>
	</tr>
	<tr>
		<th width="120">预参与员工：</th>
		<td width="600" colspan="5">
			<input type="button" value="增加" onclick="javascript:createInfoPlus('preParticipatorsDiv', preParticipatorStr, '0', [])" />
			<div id="preParticipatorsDiv"></div>
			<s:iterator value="preParticipators">
				<script>
					createInfoPlus("preParticipatorsDiv", preParticipatorStr, "1", ["<s:property value='uuid' />", "<s:property value='timeStamp' />", "<s:property value='employeeUuid' />", "<s:property value='employee.person.name' />"]);
				</script>
			</s:iterator>
		</td>
	</tr>
	<tr>
		<th width="120">预估成本：</th>
		<td width="600" colspan="5">
			<input type="hidden" id="preCostTemp" value="<s:property value='preCost' />" />
			<input type="text" id="preCost" name="instance(PublicityApplication).preCost" style="width:100px" validate="true" />&nbsp;元&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="120">备注：</th>
		<td width="600" colspan="5">
			<textarea name="instance(PublicityApplication).notes" style="width:580px;height:100px"><s:property value="notes" /></textarea>
		</td>
	</tr>
</table>
<br>
<div style="display:inline;font-size:18px;font-weight:bold">所需宣传品</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="增加" onclick="javascript:createInfoPlusTmp('0', [])" />
<hr>
<br>
<div id="materials"></div>
<s:iterator value="materials">
	<script>
		createInfoPlusTmp("1", ["<s:property value='uuid' />", "<s:property value='timeStamp' />", "<s:property value='applicationMaterialUuid' />", "<s:property value='materialOther' />", "<s:property value='applicationNumber' />", "<s:property value='applicationMaterialSizeUuid' />", "<s:property value='sizeOther' />", "<s:property value='applicationMaterialColorUuid' />", "<s:property value='applicationMaterialTextureUuid' />", "<s:property value='textureOther' />", "<s:property value='productionUnitUuid' />", "<s:property value='unitOther' />", "<s:property value='designer' />", "<s:date name='makeStartTime' format='yyyy-MM-dd' />", "<s:date name='makeEndTime' format='yyyy-MM-dd' />", "<s:property value='makeDays' />"]);
	</script>
</s:iterator>
</form>
</s:iterator>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/campus/publicity/publicity/apply/query_apply_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>