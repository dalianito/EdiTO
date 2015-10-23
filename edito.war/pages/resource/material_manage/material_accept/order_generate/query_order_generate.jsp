<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>采购单生成</title>
	<style type="text/css">
	#editDiv {
		z-index:1;
		position:fixed;
		left:50%;
		top:200px;
		margin-left:-210px;
	}
</style>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
Validation.init("resource/material_manage/order_generate/create_order.xml");
$(document).ready(function(){
	currentResultTableDivWidth = 740;
	execute();
});
function execute(){
	$.post(cp+"/ajaxs/resource/material/manage/material/accept/order/generate/query_order_generate.html",null,function(data){
		addData(data);
	},"json")
}
function check(materialUuid, i){
	if($("#material_"+materialUuid+"_"+i).attr("checked")){
		$("[id^='material_']").each(function(){
			if($(this).index("[id^='material_"+materialUuid+"']")==-1){
				$(this).attr("disabled", "disabled");
			}
		});
	}
	else {
		var disabled = false;
		$("[id^='material_"+materialUuid+"']").each(function(){
			disabled = disabled || $(this).attr("checked");
		});
		if(!disabled){
			$("[id^='material_']").each(function(){
				$(this).attr("disabled", "");
			});
		}
	}
}
function orderGenerate(){
	var flag = true;
	var materialName;
	var materialNo;
	var materialSize;
	var materialUnit;
	var materialCount = 0;
	var materialUuid = "";
	var infoUuids = "";
	$("[id^='material_']").each(function(){
		if($(this).attr("checked")){
			flag = false;
			var str = $(this).val();
			var strArr = str.split(",");
			materialName = strArr[0];
			materialNo = strArr[1];
			materialSize = strArr[2];
			materialUnit = strArr[3];
			materialCount += parseInt( strArr[4] );
			materialUuid = strArr[5];
			infoUuids += strArr[6]+",";
		}
	});
		if(!flag){
			$("#materialUuid").val(materialUuid);
			$("#materialName").html(materialName);
			$("#materialNo").html(materialNo);
			$("#materialSize").html(materialSize);
			$("#materialUnit").html(materialUnit);
			$("#materialCount").html(materialCount);
			$("#materialAmount").val(materialCount);
			$("#infoUuids").val(infoUuids);
			$("#editDiv").css("display","block");
		}
		else
		{
			alert("未选择物资，不能生成采购单！");
		}
}
function addData(dataStore){
	var buffer="";
	buffer += "<table width='750' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='30'></th><th width='80'>物资名称</th><th width='70'>物资编号</th><th width='70'>规格型号</th><th width='40'>单位</th><th width='70'>申请数量</th>";
	buffer +="<th width='70'>通过数量</th><th width='60'>申请人</th><th width='80'>申请时间</th><th width='80'>申请部门</th><th width='100'>校区</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
		buffer += "<a title='备注："+dataStore[i][12]+"'><tr class='tr1'>";
		}
		else {
			buffer += "<a title='备注："+dataStore[i][12]+"'><tr class='tr2'>";
		}
		buffer += "<td align='center'><input id='material_"+dataStore[i][11]+"_"+i+"' type='checkbox' onclick='check(\""+dataStore[i][11]+"\", \""+i+"\")'  ";
		buffer += "value='"+dataStore[i][1]+","+dataStore[i][2]+","+dataStore[i][3]+","+dataStore[i][4]+","+dataStore[i][6]+","+dataStore[i][11]+","+dataStore[i][13]+"'/></td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";//物资名称	
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";//物资编号
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";//规格型号
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";//物资单位
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";//申请数量
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";//通过条数
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";//申请人
		buffer += "<td align='center'>"+dataStore[i][8]+"</td>";//申请时间
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";//组织机构
		buffer += "<td align='center'>"+dataStore[i][14]+"</td>";//校区
		buffer += "</tr></a>";
		}
		buffer += "</table>";
	$("#result").html(buffer);
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/material/manage/apply/manage/material/apply/remove_apply.html",{uuid:uuid},function(){
			execute();
		})
	}
}
function create(formId){
	if(Validation.excuteValidate(formId)){
		if(confirm("确认操作？")){
			var materialUuid = $("#materialUuid").val();
			var materialAmount = $("#materialAmount").val();
			var supplierUuid = $("#supplier").val();
			var infoUuids = $("#infoUuids").val();
			$.post(cp + "/ajaxs/resource/material/manage/material/accept/order/generate/create_order_generate.html" ,{materialUuid:materialUuid,materialAmount:materialAmount,supplierUuid:supplierUuid,infoUuids:infoUuids}, function(data){
				$("#editDiv").css("display","none");
				execute();
				$("#supplier").val("");
			})	
		}
	}
}
function cancel(){
	$("#editDiv").css("display","none");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;采 购 单 生 成</div>
<br><br><br>
<a href="javascript:orderGenerate()" >
<img src="<%=request.getContextPath()%>/images/button/create_order.gif" /></a>
<div id="result" style="margin-top:5px;margin-bottom:8px"></div>
<a href="javascript:orderGenerate()" >
<img src="<%=request.getContextPath()%>/images/button/create_order.gif" /></a>
<form id="formA">
	<div id="editDiv" style="display: none" >
		 <table border="0" align="center" cellpadding="0" cellspacing="0" style="border-width: 0px"> 
			<tr>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lt.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_t.gif')"></td>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rt.gif')"></td>
			</tr>
			<tr>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_l.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/content.gif')">
					<div id="containerEditDiv">
						<input type="hidden" id="materialUuid" name="instance(OrderGenerate).materialUuid"/>
						<input type="hidden" id="timeStamp" name="instance(OrderGenerate).timeStamp"/>
						<input type="hidden" id="materialAmount" name="instance(OrderGenerate).materialAmount"/>
						<input type="hidden" id="infoUuids">
						<table width='530px' border='3' cellpadding='10' cellspacing='0' class='InputPanel'>
							<tr>
								<th width='80'>物资名称</th>
								<th width='80'>物资编号</th>
								<th width='80'>规格型号</th>
								<th width='60'>单位</th>
								<th width='70'>采购总数</th>
								<th width='80'>供货厂商</th>
								<th width='80'>生成人</th>
							</tr>
							
							<tr>
								<td  style="text-align:center">
								<div id="materialName" ></div>
								</td>
								<td  style="text-align:center">
									<div id="materialNo"></div>
								</td>
								<td  style="text-align:center">
									<div id="materialSize" ></div>
								</td>
								<td  style="text-align:center">
									<div id="materialUnit"></div>
								</td>
								<td  style="text-align:center">
									<div id="materialCount"></div>
								</td>
								<td  style="text-align:center">
									<label id="supplier" name="instance(OrderGenerate).supplierUuid" validate="true" class="BaseTree" javaClassName="Supplier" parentId="materialUuid" parentKey="materialUuid" childKey="bizDataUuid" rJavaClassName="MaterialInfo"></label>&nbsp;<font color="#996633">*</font>
								</td>
								<td  style="text-align:center">
									<s:property value="#session.LOGIN_EMPLOYEE.person.name" />
								</td>
							</tr>
							<tr>
								<td  style="text-align:center" colspan="7">
									<br>
									<input type="button" value="确定生成" onclick="javascript:create('formA')">
									&nbsp;&nbsp;&nbsp;
									<input type="button" value="取消" onclick="javascript:cancel()">
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_r.gif')"></td>
			</tr>
			<tr>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lb.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_b.gif')"></td>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rb.gif')"></td>
			</tr>
		</table>
	</div>
</form>
<div id="result" ></div>
</body>
</html>
