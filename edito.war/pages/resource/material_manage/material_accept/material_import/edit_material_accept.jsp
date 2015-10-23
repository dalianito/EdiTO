<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>物资验收</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
function receiptInstance(uuid,flag,id){
	var price=$("#"+id).val();
	if(price!=null && price!=""){
		if(confirm("确认验收？")){
			$.post(cp+"/ajaxs/resource/material/manage/material/accept/order/manage/forward_receipt_material.html",{uuid:uuid,price:price},function(){
				$("#divId1_"+flag).css("display", "none");
				$("#divId2_"+flag).css("display", "inline");
				$("#divId3_"+flag).css("display", "none");
				$("#divId4_"+flag).css("display", "inline");
				$("#divId5_"+flag).css("display", "none");
				$("#divId6_"+flag).css("display", "inline");
				$("#divId6_"+flag).html(price);
			})
		}
	}
	else{
		alert("物资单价不能为空！");
	}
}
</script>

<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 验 收</div>
<br><br><br>
<s:iterator value="#request.officeApplication">
<input type="hidden" name="instance(Apply).stateUuid" value="<s:property value='apply.stateUuid'/>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<s:property value='apply.typeUuid'/>"/>
<input type="hidden" name="instance(Apply).timeStamp" value="<s:property value='apply.timeStamp' />" />
<input type="hidden" name="instance(Apply).uuid" value="<s:property value='applyUuid' />"/>
<input type="hidden" name="instance(OfficeApplication).uuid" value="<s:property value='uuid'/>"/>
<input type="hidden" name="instance(OfficeApplication).timeStamp" value="<s:property value='timeStamp'/>" />
<table width="620" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="650" colspan="7">物资采购申请信息</th>
	</tr>
	<tr>
	<th width="90">申请人</th>
	<th width="90">申请单位</th>
	<th width="90">校区</th>
	<th width="120">申请时间</th>
	<th width="80">申请条目数</th>
	<th width="80">通过条目数</th>
	<th width="80">审核状态</th>
	</tr>
	<tr>
		<td width="90" style="text-align: center"><s:property value="apply.applicant.person.name" /></td>	
		<td width="90" style="text-align: center"><s:property value="apply.applicant.department.description" /></td>	
		<td width="90" style="text-align: center"><s:property value="apply.applicant.campus.description" /></td>	
		<td width="120" style="text-align: center"><s:date name="apply.applicationTime" format="yyyy-MM-dd HH:mm" /></td>
		<td width="80" style="text-align: center"><s:property value="officeMaterials.length" /></td>
		<td width="80" style="text-align: center"><s:property value="#request.passNum"/></td>
		<td width="80" style="text-align: center"><s:property value="apply.state.description"/></td>
		
	</tr>
</table>
<br>
<div class="resultTableDiv" style="width:740px;overflow:auto">
<table width="1280" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="1280" colspan="16">物资采购申请详细信息</th>
	</tr>
	<tr>
		<th width="50">序号</th>
		<th width="80">物资名称</th>
		<th width="80">物资编号</th>
		<th width="80">规格型号</th>
		<th width="60">单位</th>
		<th width="70">申请数量</th>
		<th width="70">通过数量</th>
		<th width="80">单价(元)</th>
		<th width="80">审批状态</th>
		<th width="100">备注</th>
		<th width="80">是否生成<br>采购单</th>
		<th width="80">采购单<br>生成人</th>
		<th width="130">采购单<br>生成时间</th>
		<th width="80">供货厂商</th>
		<th width="80">验收状态</th>
		<th width="80">操作</th>
	</tr>
	<s:iterator value="officeMaterials" status="rowList">
	<tr>
    <td style="text-align:center"><s:property value="#rowList.count"/></td>
    <td style="text-align:center"><s:property value="material.type.description"/></td>
    <td style="text-align:center"><s:property value="material.materialNo"/></td>
    <td style="text-align:center"><s:property value="material.specification"/></td>
    <td style="text-align:center"><s:property value="material.unit"/></td>
    <td style="text-align:center"><s:property value="materialAmount"/></td>
    <td style="text-align:center"><s:property value="approvalAmount"/></td>
    <td style="text-align:center">
    <s:if test="receipStateUuid==#request.receipStateUuid">
    <div id="divId5_<s:property value="#rowList.count"/>">
    <input id="price_<s:property value="#rowList.index"/>" type="text" name="instance(MaterialImport).price" style="width:40px"  validate="true" />&nbsp;<font color="#996633">*</font>
    </div>
    <div id="divId6_<s:property value="#rowList.count"/>" style="display:none"></div>
    </s:if>
    <s:else>
    <s:iterator value="#request.priceList" id="price" status="priceList">
    	<s:if test="#rowList.index==#priceList.index">
	    	<s:property value="price" />
    	</s:if>
    </s:iterator>
    </s:else>
    </td>
    <td style="text-align:center"><s:property value="state.description"/></td>
    <td style="text-align:center"><s:property value="notes"/></td>
    <td style="text-align:center"><s:if test="ifGenerate==1">已生成</s:if><s:else>未生成</s:else></td>
    <s:if test="ifGenerate==1">
    <td style="text-align:center"><s:property value="#request.orderGenerate.generator.person.name"/></td>
    <td style="text-align:center"><s:date name="#request.orderGenerate.generateTime" format="yyyy-MM-dd HH:mm"/></td>
    <td style="text-align:center"><s:property value="#request.orderGenerate.supplier.description"/></td>
    <td style="text-align:center">
    <div id="divId3_<s:property value="#rowList.count"/>"> 
    <s:property value="receipState.description"/>
    </div>
    <div id="divId4_<s:property value="#rowList.count"/>" style="display:none">已验收</div>
    </td>
    <td style="text-align:center">
    <s:if test="receipStateUuid==#request.receipStateUuid">
    <div id="divId1_<s:property value="#rowList.count"/>">
    <a href='javascript:receiptInstance("<s:property value="uuid"/>","<s:property value="#rowList.count"/>","price_<s:property value="#rowList.index"/>")'>验收</a>
    </div>
    <div id="divId2_<s:property value="#rowList.count"/>" style="display:none">
    <a title='已验收，不能重复验收！'><font color='#888888'>验收</font></a>
    </div>
    </s:if>
    <s:else>
    <a title='已验收，不能重复验收！'><font color='#888888'>验收</font></a>
    </s:else>
    </td>
    </s:if>
    <s:else>
    <td style="text-align:center"><s:property value="#request.orderGenerate.generator.person.name"/></td>
    <td style="text-align:center"><s:date name="#request.orderGenerate.generateTime" format="yyyy-MM-dd HH:mm"/></td>
    <td style="text-align:center"><s:property value="#request.orderGenerate.supplier.description"/></td>
    <td style="text-align:center"><s:property value=""/></td>
    <td style="text-align:center">
    <a title='未生成采购单，不能验收！'><font color='#888888'>验收</font></a>
    </td>
    </s:else>
	</tr>
</s:iterator>
</table>
</div>
<br>
</s:iterator>
<br>
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/material/accept/material/import/query_material_import.html" >
<img src="<%=request.getContextPath()%>/images/button/b_back.gif" /></a>
<br>
</body>
</html>
