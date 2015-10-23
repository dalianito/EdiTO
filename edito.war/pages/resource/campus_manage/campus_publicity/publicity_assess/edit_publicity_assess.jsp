<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>活动评估</title>
</head>
<body>
<form id="formB" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
Validation.init("resource/campus_manage/campus_publicity/publicity_assess/create_publicity_assess.xml");
$(document).ready(function(){
	$("#preCost").html(parseFloat($("#preCostTemp").val()).toFixed(2));
})
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/assess/create_publicity_assess.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/campus/publicity/publicity/assess/query_publicity_assess.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function downloadResource(uuid){
	var f = document.getElementById("formB");
	f.action = cp + "/views/resource/campus/manage/campus/publicity/publicity/apply/forward_resource.html";
	f.uuid.value = uuid;
	f.type.value = "publicityApplication";
	f.submit();
}
function createInfoPlusTmp(operationStatus, args){
	if(operationStatus == "1"){
		createInfoPlus("materials", materialStr2, operationStatus, args);
	}
	var num = 1;
	$("[id^='no_']").each(function(){
		if($(this).parents("*[iTOType='info']").find("input[iTOType='operationStatus']").val() != 2){
			$(this).html(num++);
		}
	});
}
var participatorStr = '<div iTOType="info" style="margin-top:5px">'+ 
'<input type="hidden" name="instance(ParticipatorInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
'<input type="text" name="instance(ParticipatorInfo[NUMBER]).employeeUuid" nextSiblingName="employeeName" class="DropMenu" actionPath="'+cp+'/ajaxs/drop/menu/query_employee_drop_menu.html" validate="true" />&nbsp;<font color="#996633">*</font>'+ 
'&nbsp;<input type="button" class="btn_info" value="删除" onclick="removeInfoPlus(this,\'OUTERDIVID\')"/>'+ 
'</div>';

var materialStr2 = '<div iTOType="info"><table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">'+ 
'<tr><th width="580" colspan="3">'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).uuid" value="VALUE0" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).timeStamp" value="VALUE1" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialUuid" value="VALUE2" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).materialOther" value="VALUE3" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).applicationNumber" value="VALUE4" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialSizeUuid" value="VALUE5" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).sizeOther" value="VALUE6" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialColorUuid" value="VALUE7" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).applicationMaterialTextureUuid" value="VALUE8" />'+
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).textureOther" value="VALUE9" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).productionUnitUuid" value="VALUE10" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).unitOther" value="VALUE11" />'+
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).designer" value="VALUE12" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).makeStartTime" value="VALUE13" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).makeEndTime" value="VALUE14" />'+
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).makeDays" value="VALUE15" />'+ 
'<input type="hidden" name="instance(PropagandaMaterialInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus" />'+ 
'<div style="float:left;width:18px">&nbsp;</div>宣传品 <div id="no_NUMBER" style="display:inline"></div></th></tr>'+ 
'<tr><th width="100">申请物料：</th><td width="480" colspan="2">VALUE16&nbsp;VALUE17</td></tr>'+  
'<tr><th width="100">申请数量：</th><td width="480" colspan="2">VALUE18</td></tr>'+ 
'<tr><th width="100" rowspan="3">规格要求：</th><td>尺寸(成品)</td><td>VALUE19&nbsp;&nbsp;VALUE20</td></tr>'+ 
'<tr><td width="100">色彩</td><td width="380">VALUE21&nbsp;</td></tr>'+ 
'<tr><td width="100">材质</td><td width="380">VALUE22&nbsp;VALUE23</td></tr>'+ 
'<tr><th width="100">制作单位：</th><td width="480" colspan="2">VALUE24&nbsp;VALUE25</td></tr>'+ 
'<tr><th width="100">设计负责人：</th><td width="480" colspan="2">VALUE26</td></tr>'+ 
'<tr><th width="100">制作周期：</th><td width="480" colspan="2">VALUE27&nbsp;-&nbsp;VALUE28&nbsp;&nbsp;VALUE29&nbsp;天<br></td></tr>'+ 
'<tr><th width="100">验收状态：</th><td width="480" colspan="2"><label name="instance(PropagandaMaterialInfo[NUMBER]).acceptStateUuid" class="BaseTree" javaClassName="ReceiptState" ifHasRelated="true" validate="true"></label>&nbsp;<font color="#996633">*</font>&nbsp;&nbsp;</td></tr>'+  
'<tr><th width="100">使用数量：</th><td width="480" colspan="2"><input name="instance(PropagandaMaterialInfo[NUMBER]).usedNumber" size="10" validate="true" />&nbsp;<font color="#996633">*</font></td></tr>'+
'</table><br></div>';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;活 动 评 估</div>
<br><br><br>
<s:iterator value="#request.publicityApplication">
<form id="formA">
<input type="hidden" name="instance(PublicityApplication).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(PublicityApplication).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(PublicityApplication).applyUuid" value="<s:property value='applyUuid' />" />
<input type="hidden" name="instance(PublicityApplication).departmentUuid" value="<s:property value='departmentUuid' />" />
<input type="hidden" name="instance(PublicityApplication).campusUuid" value="<s:property value='campusUuid' />" />
<input type="hidden" name="instance(PublicityApplication).description" value="<s:property value='description' />" />
<input type="hidden" name="instance(PublicityApplication).activityTime" value="<s:date name='activityTime' format='yyyy-MM-dd' />" />
<input type="hidden" name="instance(PublicityApplication).location" value="<s:property value='location' />" />
<input type="hidden" name="instance(PublicityApplication).copyContent" value="<s:property value='copyContent' />" />
<input type="hidden" name="instance(PublicityApplication).copyFileUuid" value="<s:property value='copyFileUuid' />" />
<input type="hidden" name="instance(PublicityApplication).preCost" value="<s:property value='preCost' />" />
<input type="hidden" name="instance(PublicityApplication).notes" value="<s:property value='notes' />" />
<input type="hidden" name="instance(PublicityApplication).ifUsing" value="<s:property value='ifUsing' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">申请人：</th>
		<td><s:property value='apply.applicant.person.name' /></td>
	</tr>
	<tr>
		<th width="100">申请时间：</th>
		<td><s:date name='apply.applicationTime' format='yyyy-MM-dd'/></td>
	</tr>
	<tr>
		<th width="100">组织机构：</th>
		<td><s:property value='department.description' /></td>
	</tr>
	<tr>
		<th width="100">校区：</th>
		<td><s:property value='campus.description' /></td>
	</tr>
	<tr>
		<th width="100">活动简述：</th>
		<td style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="description" /></div>
		</td>
	</tr>
	<tr>
		<th width="100">活动时间：</th>
		<td><s:date name="activityTime" format="yyyy年MM月dd日 HH时mm分" /></td>
	</tr>
	<tr>
		<th width="100">活动地点：</th>
		<td><s:property value='location' /></td>
	</tr>
	<tr>
		<th width="100">文案内容：</th>
		<td style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="copyContent" /></div>
			<a href="javascript:downloadResource('<s:property value="copyFileUuid"/>')"><s:property value='copyFile.name' /></a>
		</td>
	</tr>
	<tr>
		<th width="100">预参与员工：</th>
		<td>
			<s:iterator value="preParticipators">
				<s:property value="employee.person.name" />,
			</s:iterator>&nbsp;
		</td>
	</tr>
	<tr>
		<th width="100">预估成本：</th>
		<td>
			<input type="hidden" id="preCostTemp" value="<s:property value='preCost' />" />
			<span id='preCost' ></span>&nbsp;元
		</td>
	</tr>
	<tr>
		<th width="100">备注：</th>
		<td width="480" style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="notes" /></div>
		</td>
	</tr>
</table>
<br>
<div id="materials"></div>
<s:iterator value="materials">
	<script>
		createInfoPlusTmp("1", ["<s:property value='uuid' />", "<s:property value='timeStamp' />", "<s:property value='applicationMaterialUuid' />", "<s:property value='materialOther' />", "<s:property value='applicationNumber' />", "<s:property value='applicationMaterialSizeUuid' />", "<s:property value='sizeOther' />", "<s:property value='applicationMaterialColorUuid' />", "<s:property value='applicationMaterialTextureUuid' />", "<s:property value='textureOther' />", "<s:property value='productionUnitUuid' />", "<s:property value='unitOther' />", "<s:property value='designer' />", "<s:date name='makeStartTime' format='yyyy-MM-dd' />", "<s:date name='makeEndTime' format='yyyy-MM-dd' />", "<s:property value='makeDays' />", "<s:property value='applicationMaterial.description' />", "<s:property value='materialOther' />", "<s:property value='applicationNumber' />", "<s:property value='applicationMaterialSize.description' />", "<s:property value='sizeOther' />", "<s:property value='applicationMaterialColor.description' />", "<s:property value='applicationMaterialTexture.description' />", "<s:property value='textureOther' />", "<s:property value='productionUnit.description' />", "<s:property value='unitOther' />", "<s:property value='designer' />", "<s:date name='makeStartTime' format='yyyy-MM-dd'/>", "<s:date name='makeEndTime' format='yyyy-MM-dd' />", "<s:property value='makeDays' />"]);
	</script>
</s:iterator>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">参与人员详细：</th>
		<td>
			<input type="button" value="增加" onclick="javascript:createInfoPlus('participator', participatorStr, '0', [])" />
			<div id="participator"></div>
			<script>
				createInfoPlus("participator", participatorStr, "0", []);
			</script>
		</td>
	</tr>
	<tr>
		<th width="100">实际成本：</th>
		<td>
			<input type="text" name="instance(PublicityApplication).cost" style="width:100px" validate="true" />&nbsp;元&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="100">活动效果：</th>
		<td>
			<textarea name="instance(PublicityApplication).effect" style="width:440px;height:100px" validate="true" /></textarea>&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="100">评价：</th>
		<td>
			<textarea name="instance(PublicityApplication).evaluate" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/campus/publicity/publicity/assess/query_publicity_assess.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
