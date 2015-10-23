<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看活动申请</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
	<script>var cp = "<%=request.getContextPath()%>";</script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
</head>

<body class="BodyView">
<form id="formA" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
$(document).ready(function(){
	$("#preCost").html(parseFloat($("#preCostTemp").val()).toFixed(2));
	$("#cost").html(parseFloat($("#costTemp").val()).toFixed(2));
});
function downloadResource(uuid){
	var f = document.getElementById("formA");
	f.action = cp + "/views/resource/campus/manage/campus/publicity/publicity/apply/forward_resource.html";
	f.uuid.value = uuid;
	f.type.value = "publicityApplication";
	f.submit();
}
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_publicityApply.gif"></p>
<s:iterator value="#request.publicityApplication">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">申请人：</th>
		<td width="450"><s:property value="apply.applicant.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">申请时间：</th>
		<td width="450"><s:date name='apply.applicationTime' format='yyyy-MM-dd'/>&nbsp;</td>
	</tr>
	<tr>
		<th width="150">组织机构：</th>
		<td width="450"><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">校区：</th>
		<td width="450"><s:property value="campus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">活动简述：</th>
		<td width="450" style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="description" /></div>
		</td>
	</tr>
	<tr>
		<th width="150">活动时间：</th>
		<td width="450">
			<s:date name="activityTime" format="yyyy年MM月dd日 HH时mm分" />
		</td>
	</tr>
	<tr>
		<th width="150">活动地点：</th>
		<td width="450">
			<s:property value="location" />&nbsp;
		</td>
	</tr>
	<tr>
		<th width="150">文案：</th>
		<td width="450" style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="copyContent" /></div>
			<a href="javascript:downloadResource('<s:property value="copyFileUuid"/>')"><s:property value='copyFile.name' /></a>
		</td>
	</tr>
	<tr>
		<th width="150">预参与员工：</th>
		<td width="450">
			<s:iterator value="preParticipators">
				<s:property value="employee.person.name" />,
			</s:iterator>&nbsp;
		</td>
	</tr>
	<tr>
		<th width="150">预估成本：</th>
		<td width="450">
			<input type="hidden" id="preCostTemp" value="<s:property value='preCost' />" />
			<div id="preCost" style="display:inline"></div>&nbsp;元
		</td>
	</tr>
	<tr>
		<th width="150">备注：</th>
		<td width="450" style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="notes" /></div>
		</td>
	</tr>
</table>
<br>
<s:iterator value="materials" status="index">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="3">
			宣传品<s:property value="#index.count" />
		</th>
	</tr>
	<tr>
		<th width="150">申请物料：</th>
		<td width="450" colspan="2">
			<s:property value="applicationMaterial.description" />&nbsp;&nbsp;<s:property value="materialOther" />
		</td>
	</tr>
	<tr>
		<th width="150">申请数量：</th>
		<td width="450" colspan="2">
			<s:property value="applicationNumber" />&nbsp;
		</td>
	</tr>
	<tr>
		<th width="140" rowspan="3">规格要求：</th>
		<td width="100">尺寸(成品)</td>
		<td width="340">
			<s:property value="applicationMaterialSize.description" />&nbsp;&nbsp;<s:property value="sizeOther" />
		</td>
	</tr>
	<tr>
		<td width="100">色彩</td>
		<td width="340">
			<s:property value="applicationMaterialColor.description" />&nbsp;
		</td>
	</tr>
	<tr>
		<td width="100">材质</td>
		<td width="340">
			<s:property value="applicationMaterialTexture.description" />&nbsp;&nbsp;<s:property value="textureOther" />
		</td>
	</tr>
	<tr>
		<th width="150">制作单位：</th>
		<td width="450" colspan="2">
			<s:property value="productionUnit.description" />&nbsp;&nbsp;<s:property value="unitOther" />
		</td>
	</tr>
	<tr>
		<th width="150">设计负责人：</th>
		<td width="450" colspan="2">
			<s:property value="designer" />&nbsp;
		</td>
	</tr>
	<tr>
		<th width="150">制作周期：</th>
		<td width="450" colspan="2">
			<s:date name="makeStartTime" format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name="makeEndTime" format="yyyy-MM-dd" />&nbsp;&nbsp;<s:property value="makeDays" />&nbsp;天
		</td>
	</tr>
	<tr>
		<th width="150">验收状态：</th>
		<td width="450" colspan="2">
			<s:property value="acceptState.description" />&nbsp;
		</td>
	</tr>
	<tr>
		<th width="150">使用数量：</th>
		<td width="450" colspan="2">
			<s:property value="usedNumber" />&nbsp;
		</td>
	</tr>
</table>
<br>
</s:iterator>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">企划部负责人：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerOne.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesOne" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="150"><s:property value="apply.checkStateOne.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeOne" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">主管校领导：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerTwo.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesTwo" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="150"><s:property value="apply.checkStateTwo.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeTwo" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">参与员工：</th>
		<td width="450">
			<s:iterator value="participators">
				<s:property value="employee.person.name" />,
			</s:iterator>&nbsp;
		</td>
	</tr>
	<tr>
		<th width="150">实际成本：</th>
		<td width="450">
			<input type="hidden" id="costTemp" value="<s:property value='cost' />" />
			<div id="cost" style="display:inline"></div>&nbsp;元
		</td>
	</tr>
	<tr>
		<th width="150">活动效果：</th>
		<td width="450" style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="effect" /></div>
		</td>
	</tr>
	<tr>
		<th width="150">评价：</th>
		<td width="450" style="vertical-align:top">
			<div style="height:100px;margin-top:3px">&nbsp;&nbsp;<s:property value="evaluate" /></div>
		</td>
	</tr>
</table>
<br>
</s:iterator>
<p align="center">
<img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand">
<br><br>
</p>
</body>
</html>
