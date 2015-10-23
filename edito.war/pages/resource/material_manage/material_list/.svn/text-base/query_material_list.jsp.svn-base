<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物资清单</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 740;
	executeImport();
});
function showPanel(panelId){
	if(panelId == "importDiv"){
		executeImport();
		$("#importDiv").css("display","block");
		$("#exportDiv").css("display","none");
		$("#allocateDiv").css("display","none");
		$("#scrapDiv").css("display","none");
		$("#storageDiv").css("display","none");
	}
	else if(panelId == "exportDiv"){
		executeExport();
		$("#importDiv").css("display","none");
		$("#exportDiv").css("display","block");
		$("#allocateDiv").css("display","none");
		$("#scrapDiv").css("display","none");
		$("#storageDiv").css("display","none");
	}
	else if(panelId == "allocateDiv"){
		executeAllocate();
		$("#importDiv").css("display","none");
		$("#exportDiv").css("display","none");
		$("#allocateDiv").css("display","block");
		$("#scrapDiv").css("display","none");
		$("#storageDiv").css("display","none");
	}
	else if(panelId == "scrapDiv"){
		executeScrap();
		$("#importDiv").css("display","none");
		$("#exportDiv").css("display","none");
		$("#allocateDiv").css("display","none");
		$("#scrapDiv").css("display","block");
		$("#storageDiv").css("display","none");
	}
	else if(panelId == "storageDiv"){
		executeStorage();
		$("#importDiv").css("display","none");
		$("#exportDiv").css("display","none");
		$("#allocateDiv").css("display","none");
		$("#scrapDiv").css("display","none");
		$("#storageDiv").css("display","block");
	}
}
function executeImport(){
	var departmentUuid = $("#departmentUuid").val();
	var campusUuid = $("#campusUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {departmentUuid:departmentUuid,
				campusUuid:campusUuid,
				beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/list/query_material_import.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#resultImport").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/list/query_material_import.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function executeExport(){
	var state = $("#state").val();
	var campusUuid = $("#campusUuid2").val();
	var beginDate = $("#beginDate2").val();
	var endDate = $("#endDate2").val();
	var data = {state:state,
				campusUuid:campusUuid,
				beginDate:beginDate,
				endDate:endDate,
				flag:0,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/usage/query_material_usage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#resultExport").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/usage/query_material_usage.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function executeAllocate(){
	var beginDate = $("#beginDate3").val();
	var endDate = $("#endDate3").val();
	var data = {beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/allocate/query_material_allocate.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#resultAllocate").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/allocate/query_material_allocate.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function executeScrap(){
	var departmentUuid = $("#departmentUuid4").val();
	var campusUuid = $("#campusUuid4").val();
	var beginDate = $("#beginDate4").val();
	var endDate = $("#endDate4").val();
	var data = {departmentUuid:departmentUuid,
				campusUuid:campusUuid,
				beginDate:beginDate,
				endDate:endDate,
				flag:0,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/damage/query_material_damage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#resultScrap").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/damage/query_material_damage.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function executeStorage(){
	var campusUuid = $("#campusUuid5").val();
	var material = $("#material").val();
	var data = {campusUuid:campusUuid,
				material:material,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/material/manage/material/list/query_material_storage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#resultStorage").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/material/manage/material/list/query_material_storage.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function addData(dataStore){
	if($("input[name='displayType']:checked").val() == "import"){
		return addDataImport(dataStore);
	}
	else if($("input[name='displayType']:checked").val() == "export"){
		return addDataExport(dataStore);
	}
	else if($("input[name='displayType']:checked").val() == "allocate"){
		return addDataAllocate(dataStore);
	}
	else if($("input[name='displayType']:checked").val() == "scrap"){
		return addDataScrap(dataStore);
	}
	else if($("input[name='displayType']:checked").val() == "storage"){
		return addDataStorage(dataStore);
	}
}
function addDataImport(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='670' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='100'>物资名称</th><th width='50'>数量</th><th width='90'>供应商</th><th width='90'>校区</th><th width='80'>入库人</th><th width='80'>入库日期</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center' id='"+dataStore[i][8]+"'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][8]+"\",\"\",\"/views/resource/material/manage/material/list/forward_view_import.html\",550,500)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function addDataExport(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='150'>物资名称</th><th width='50'>数量</th><th width='100'>接受部门</th><th width='90'>出库日期</th><th width='80'>归还状态</th><th width='90'>归还日期</th><th width='140'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][7]+"\",\"\",\"/views/resource/material/manage/material/usage/forward_view_usage.html\",550,500)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function addDataAllocate(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='150'>物资名称</th><th width='50'>数量</th><th width='100'>需求校区</th><th width='100'>调配校区</th><th width='90'>记录时间</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][6]+"\",\"\",\"/views/resource/material/manage/material/allocate/forward_view_allocate.html\",550,500)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function addDataScrap(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='520' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='100'>物资名称</th><th width='50'>数量</th><th width='100'>责任部门</th><th width='90'>记录时间</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/material/manage/material/damage/forward_view_damage.html\",550,500)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}

function addDataStorage(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='520' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='100'>物资名称</th><th width='50'>总数</th><th width='100'>剩余</th><th width='90'>校区</th><th>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/material/manage/material/list/forward_view_storage.html\",550,500)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>

<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 清 单</div><br><br>
<input type="radio" name="displayType" value="import" onclick="showPanel('importDiv')" checked />物资入库&nbsp;&nbsp;
<input type="radio" name="displayType" value="export" onclick="showPanel('exportDiv')" />物资使用&nbsp;&nbsp;
<input type="radio" name="displayType" value="allocate" onclick="showPanel('allocateDiv')" />物资调配&nbsp;&nbsp;
<input type="radio" name="displayType" value="scrap" onclick="showPanel('scrapDiv')" />物资报废&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="displayType" value="storage" onclick="showPanel('storageDiv')" />物资库存
<br><br>
<div id="importDiv">
	<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="100">组织机构</th>
			<td width="100">
				<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
			</td>
			<th width="100">校区</th>
			<td width="100">
				<label id="campusUuid" class="BaseTree" javaClassName="Campus" ></label>
			</td>
			<th width="100">入库日期</th>
			<td width="220">
				<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
			</td>
		</tr>
	</table>
	<br><br><br>
	<a href="#" onclick="executeImport()">
	<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
	<br><br>
	<div id="resultImport" style="width:600px;margin-left:-10px"></div>
</div>


<div id="exportDiv" style="display:none">
	<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="100">归还状态</th>
			<td width="100">
				<label id="state" class="BaseTree" javaClassName="ReturnState" ></label>
			</td>
			<th width="100">校区</th>
			<td width="100">
				<label id="campusUuid2" class="BaseTree" javaClassName="Campus" ></label>
			</td>	
			<th width="100">出库日期</th>
			<td width="220">
				<label type="text" id="beginDate2" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate2" class="DateTimeSingle" format="all"></label>
			</td>
		</tr>
	</table>
	<br><br><br>
	<a href="#" onclick="executeExport()">
	<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
	<br><br>
	<div id="resultExport" style="width:600px;margin-left:-10px"></div>
</div>

<div id="allocateDiv" style="display:none">
	<table align="left" width="400" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="100">记录时间</th>
			<td width="300">
				<label type="text" id="beginDate3" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate3" class="DateTimeSingle" format="all"></label>
			</td>
		</tr>
	</table>
	<br><br><br>
	<a href="#" onclick="executeAllocate()">
	<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
	<br><br>
	<div id="resultAllocate" style="width:600px;margin-left:-10px"></div>
</div>

<div id="scrapDiv" style="display:none">
	<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="100">组织机构</th>
			<td width="100">
				<label id="departmentUuid4" class="BaseTree" javaClassName="Department" ></label>
			</td>
			<th width="100">校区</th>
			<td width="100">
				<label id="campusUuid4" class="BaseTree" javaClassName="Campus" ></label>
			</td>
			<th width="100">记录时间</th>
			<td width="220">
				<label type="text" id="beginDate4" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate4" class="DateTimeSingle" format="all"></label>
			</td>
		</tr>
	</table>
	<br><br><br>
	<a href="#" onclick="executeScrap()">
	<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
	<br><br>
	<div id="resultScrap" style="width:600px;margin-left:-10px"></div>
</div>

<div id="storageDiv" style="display:none">
	<table align="left" width="400" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="100">校区</th>
			<td width="100">
				<label id="campusUuid5" class="BaseTree" javaClassName="Campus" ></label>
			</td>
			<th width="100">物资：</th>
			<td width="100">
 			<input id="material" class="DropMenu" actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_drop_menu.html" >
 			</td>
		</tr>
	</table>
	<br><br><br>
	<a href="#" onclick="executeStorage()">
	<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
	<br><br>
	<div id="resultStorage" style="width:600px;margin-left:-10px"></div>
</div>


<!--<a  href="<%=request.getContextPath()%>/https/personal/main/page/main_page.html" >
<img src="<%=request.getContextPath()%>/images/button/b_back.gif"/></a>
--><br><br>
</body>
</html>