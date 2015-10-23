<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
</head>
<body class="BodyView">
<script>
var mark = "true";
$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	$("#nowTime").html(nowTime);
});
function createInstance(elementId){
	if(mark){
		mark = false;	
		var param = Submit.excute(elementId);
		$.post(cp+"/ajaxs/wechat/common/work/create_wechat_network_propaganda.whtml",param,function(data){
			if(data != null){
				alert("已保存！");
				goBack();
				mark = true;
			}
			else {
				alert("网络慢，请重新访问本页！");
			}
		});
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}

function goBack(){
	var employeeUuid = document.getElementById("employeeUuid").value;
	location.href = cp + "/whttps/wechat/common/work/wechat_network_propaganda.whtml_" + employeeUuid;
}

var tbodyNum=1;
function createInfoStarChange(tableDiv, htmlText, operationStatus, args){
	var tbody = $("<tbody></tbody>");
	tbody.attr("id", tableDiv+"_"+tbodyNum);
	tbody.attr("iTOType", "info");
	tbody.attr("submit", "true");
	$("#"+tableDiv).append(tbody);
	htmlText = htmlText.replace(/NUMBER/g, tbodyNum);
	createInfoStar(tableDiv+"_"+tbodyNum, htmlText, operationStatus, args);
	tbodyNum++;
}

var posterInfoStr = '<tr>'+
'<td width="70%"><input type="hidden" name="instance(PosterInfo[NUMBER]).uuid" value="VALUE0">'+
'<input type="hidden" name="instance(PosterInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+
'<input type="hidden" name="instance(PosterInfo[NUMBER]).timeStamp" value="VALUE1">'+
'<input type="hidden" name="instance(PosterInfo[NUMBER]).bizDataUuid" value="VALUE2">'+
'<input type="text" name="instance(PosterInfo[NUMBER]).site" value="VALUE3" style="width:90%" ></td>'+
'<td width="30%" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
'</tr>';
</script>
<input type="hidden" id="pageTitle" value="发 帖 信 息" />
<s:if test="#request.internetPublicity == null">
<form id="formA">
<input type="hidden" id="employeeUuid" value="<%=request.getParameter("uuid") %>">
<input type="hidden" name="instance(InternetPublicity).recordUuid" value="<%=request.getParameter("uuid") %>" />
<input type="hidden" name="instance(InternetPublicity).ifUsing" value="1" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">记录时间</th>
		<td width="70%"><div id="nowTime"></div></td>
	</tr>
	<tr>
		<th width="30%">序号</th>
		<td width="70%" align="center">网址</td>
	</tr>
	<tr>
		<th width="30%">1</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[0]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">2</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[1]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">3</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[2]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">4</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[3]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">5</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[4]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">6</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[5]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">7</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[6]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">8</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[7]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">9</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[8]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">10</th>
		<td width="70%">
		<textarea name="instance(PosterInfo[9]).site" style="width:90%;height:40px" ></textarea>
		</td>
	</tr>
	<tr>
		<th width="30%">备注：</th>
		<td width="70%"><textarea name="instance(InternetPublicity).notes" style="width:90%;height:150px" ></textarea></td>
	</tr>
</table>

<br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onclick="createInstance('formA')" style="cursor:hand" />&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_back.gif" onClick="goBack()" style="cursor:hand" />
<br>
</form>
</s:if>
<s:else>
<form id="formB">
<input type="hidden" id="employeeUuid" value="<s:property value="#request.internetPublicity.recordUuid" />">
<input type="hidden" name="instance(InternetPublicity).uuid" value="<s:property value='#request.internetPublicity.uuid' />" />
<input type="hidden" name="instance(InternetPublicity).timeStamp" value="<s:property value='#request.internetPublicity.timeStamp' />" />
<input type="hidden" name="instance(InternetPublicity).recordUuid" value="<s:property value='#request.internetPublicity.recordUuid' />" />
<input type="hidden" name="instance(InternetPublicity).ifUsing" value="1" />
<table id="posterInfoExp" width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="70%">网址</th>
		<td width="30%" style="text-align:center"><input type="button" value="增加" onclick="createInfoStarChange('posterInfoExp',posterInfoStr,'0',['','','',''])" /></td>
	</tr>
	 <s:iterator value="#request.posterInfo" status="s">
		<script>
			createInfoStarChange("posterInfoExp",posterInfoStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='bizDataUuid' />","<s:property value='site' />"]);
		</script>
	</s:iterator>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">记录时间</th>
		<td width="70%"><s:date name="#request.internetPublicity.recordTime" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="30%">备注：</th>
		<td width="70%"><textarea name="instance(InternetPublicity).notes" style="width:90%;height:150px;word-wrap:break-word;word-break:break-all" ><s:property value="#request.internetPublicity.notes" /></textarea></td>
	</tr>
</table>
<br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_save.gif" onclick="createInstance('formB')" style="cursor:hand" />&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_back.gif" onClick="goBack()" style="cursor:hand" />
<br>
</form>
</s:else>
</body>
</html>
