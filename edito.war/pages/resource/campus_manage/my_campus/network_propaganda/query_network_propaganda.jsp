<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
	<title>网络宣传</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/my_campus/network_propaganda/create_network_propaganda.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/network/propaganda/create_network_propaganda.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/my/campus/network/propaganda/query_network_propaganda.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}

$(document).ready(function(){
	$("#todayDate").html(getFormatDate());
});

var n = 1;
function createInfo(){
	var posterStr = posterStrTmp.replace(/rowIndex/g, n);
	createInfoPlus("POSTER", posterStr, "0", ["", "", ""]);
	n++;
	generateSeq();
}

function removeInfo(button, outerDivId){
	removeInfoStar(button, outerDivId);
	generateSeq();
}
function generateSeq(){
	var seq = 1;
	$("[id^='seq_']").each(function(){
		$(this).html(seq);
		seq++;
	});
}

function createInfo2(tableDiv, posterStrTmp2, operationStatus, args){
	var posterStr2 = posterStrTmp2.replace(/rowIndex/g, n);
	createInfoPlus(tableDiv, posterStr2, operationStatus, args);
	n++;
	generateSeq2();
}
function generateSeq2(){
	var seq = 1;
	$("[id^='seq_']").each(function(){
		var infoObj = $(this).parents("*[iTOType='info']");
		if(infoObj.css("display")!="none"){
			$(this).html(seq);
			seq++;
		}
	});
}
function openLink(url){
	window.open(url);
}
var posterStrTmp = '<tr iTOType="info">'+ 
'<td width="100"><input type="hidden" name="instance(PosterInfo[NUMBER]).uuid" value="VALUE0">'+ 
'<input type="hidden" name="instance(PosterInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
'<div id="seq_rowIndex" align="center"></div></td>'+ 
'<td width="520"><input type="text" name="instance(PosterInfo[NUMBER]).site" value="VALUE1" style="width:480px" validate="true"><font color="#996633">&nbsp*</font></td>'+ 
'<td style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfo(this,\'OUTERDIVID\')"/></td>'+
'</tr>';

var posterStrTmp2 = '<tr iTOType="info">'+ 
'<td width="100"><input type="hidden" name="instance(PosterInfo[NUMBER]).uuid" value="VALUE0">'+ 
'<input type="hidden" name="instance(PosterInfo[NUMBER]).timeStamp" value="VALUE1">'+
'<input type="hidden" name="instance(PosterInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
'<div id="seq_rowIndex" align="center"></div></td>'+ 
'<td width="520"><input type="text" name="instance(PosterInfo[NUMBER]).site" value="VALUE2" style="width:480px" validate="true"><font color="#996633">&nbsp*</font></td>'+ 
'<td style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfo(this,\'OUTERDIVID\')"/></td>'+
'</tr>';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;网 络 宣 传</div>
<br><br><br>
<a href="<%=request.getContextPath()%>/https/resource/campus/manage/my/campus/network/propaganda/query_view_propaganda.html">查看历史宣传</a>&nbsp;
<br><br>
<s:if test="#request.internetPublicity == null">
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<input type="hidden" name="instance(InternetPublicity).recordUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.uuid' />" />
<input type="hidden" name="instance(InternetPublicity).ifUsing" value="1" />
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="720" colspan="3">基本信息</th>
	</tr>
	<tr>
		<th width="100">记录人：</th>
		<td colspan="2">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
	<tr>
		<th width="100">记录时间：</th>
		<td colspan="2">
			<div id="todayDate"></div>
		</td>
	</tr>
	<tr>
		<th width="720" colspan="3">发帖信息</th>
	</tr>
	<tr>
		<th width="100">序号</th>
		<th width="520">网址</th>
		<th width="100"><input type="button" value="增加" onclick="createInfo()" /></th>
	</tr>
	<tbody id="POSTER"></tbody>
	<tr>
		<th width="100">备注：</th>
		<td colspan="2"><textarea name="instance(InternetPublicity).notes" style="width:600px;height:40px" ></textarea></td>
	</tr>
</table>	
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/network/propaganda/query_network_propaganda.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
</form>
<br>
</s:if>
<s:elseif test="#request.internetPublicity.reviewFlagUuid=='10000000020110001001000000000010'">
	<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="720" colspan="3">基本信息</th>
		</tr>
		<tr>
			<th width="100">记录人：</th>
			<td colspan="2">
				<s:property value='#request.internetPublicity.record.person.name' />
			</td>
		</tr>
		<tr>
			<th width="100">记录时间：</th>
			<td colspan="2">
				<s:date name="#request.internetPublicity.recordTime" format="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<th colspan="3">发帖信息</th>
		</tr>
		<tr>
			<th width="100">序号</th>
			<th width="520" colspan="2">网址</th>
		</tr>
		<s:iterator value="#request.internetPublicity.posterInfos" status="rowList">
		<tr>
			<td width="100" style="text-align: center;"><s:property value="#rowList.count" />&nbsp;</td>
			<td style="width:520px;word-break:break-all;vertical-align:top;padding-top:5px" colspan="2"><a href="javascript:openLink('<s:property value="site" />')"><s:property value="site" /></a>&nbsp;</td>
		</tr>
		</s:iterator>
		<tr>
			<th width="100">备注：</th>
			<td colspan="2" style="width:520px;word-break:break-all;height:40px;vertical-align:top;padding-top:5px">
				<s:property value="#request.internetPublicity.notes" />&nbsp;<br>
			</td>	
		</tr>
	</table>
</s:elseif>
<s:else>
<form id="formB" name="formB" method="post" enctype="multipart/form-data">
<input type="hidden" name="instance(InternetPublicity).uuid" value="<s:property value='#request.internetPublicity.uuid' />" />
<input type="hidden" name="instance(InternetPublicity).timeStamp" value="<s:property value='#request.internetPublicity.timeStamp' />" />
<input type="hidden" name="instance(InternetPublicity).recordUuid" value="<s:property value='#request.internetPublicity.record.uuid' />" />
<input type="hidden" name="instance(InternetPublicity).recordTime" value="<s:date name='#request.internetPublicity.recordTime' format='yyyy-MM-dd' />" />
<input type="hidden" name="instance(InternetPublicity).ifUsing" value="<s:property value='#request.internetPublicity.ifUsing' />" />
<div id="1" style="display:block">
	<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="720" colspan="3">基本信息</th>
		</tr>
		<tr>
			<th width="100">记录人：</th>
			<td colspan="2">
				<s:property value='#request.internetPublicity.record.person.name' />
			</td>
		</tr>
		<tr>
			<th width="100">记录时间：</th>
			<td colspan="2">
				<s:date name="#request.internetPublicity.recordTime" format="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<th colspan="3">发帖信息</th>
		</tr>
		<tr>
			<th width="100">序号</th>
			<th width="520">网址</th>
			<th width="100"><input type="button" name="Submit" value="编辑" onclick="document.getElementById('2').style.display='block';document.getElementById('1').style.display='none';"/></th>
		</tr>
		<s:iterator value="#request.internetPublicity.posterInfos" status="rowList">
		<tr>
			<td width="100" style="text-align: center;"><s:property value="#rowList.count" />&nbsp;</td>
			<td style="width:520px;word-break:break-all;vertical-align:top;padding-top:5px" colspan="2"><a href="javascript:openLink('<s:property value="site" />')"><s:property value="site" /></a>&nbsp;</td>
		</tr>
		</s:iterator>
		<tr>
			<th width="100">备注：</th>
			<td colspan="2" style="width:520px;word-break:break-all;height:40px;vertical-align:top;padding-top:5px">
				<s:property value="#request.internetPublicity.notes" />&nbsp;<br>
			</td>	
		</tr>
	</table>
</div>
<div id="2" style="display:none">
	<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="720" colspan="3">基本信息</th>
		</tr>
		<tr>
			<th width="100">记录人：</th>
			<td colspan="2">
				<s:property value='#request.internetPublicity.record.person.name' />
			</td>
		</tr>
		<tr>
			<th width="100">记录时间：</th>
			<td colspan="2">
				<s:date name="#request.internetPublicity.recordTime" format="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<th colspan="3">发帖信息</th>
		</tr>
		<tr>
			<th width="100">序号</th>
			<th width="520">网址</th>
			<th width="100"><input type="button" value="增加" onclick="createInfo2('POSTER2',posterStrTmp2,'0',['','',''])" /></th>
		</tr>
		<tbody id="POSTER2"></tbody>
		<s:iterator value="#request.internetPublicity.posterInfos" status="rowList">
			<script>
				createInfo2("POSTER2",posterStrTmp2,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='site' />"]);
			</script>
		</s:iterator>
		<tr>
			<th width="100">备注：</th>
			<td colspan="2" style="height:40px;vertical-align:top;padding-top:5px"><textarea name="instance(InternetPublicity).notes" style="width:600px;height:40px"><s:property value="#request.internetPublicity.notes" /></textarea></td>
		</tr>
	</table>
	<br>
	<a href="javascript:createInstance('formB')" >
		<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/network/propaganda/query_network_propaganda.html" >
		<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
</div>
</form>
</s:else>
<br>
</body>
</html>
