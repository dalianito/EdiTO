<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
	<title>工作日志</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
Validation.init("resource/campus_manage/my_campus/work_record/create_work_record.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/work/record/create_work_record.html",param,function(data){
					uploadResource(data, elementId);
					location.href = cp + "/pages/resource/campus/manage/my/campus/work/record/query_work_record.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function editInstance(elementId){
	document.getElementById('1').style.display='none';
	document.getElementById('2').style.display='';
	document.getElementById('3').style.display='none';
	document.getElementById('4').style.display='';
}
$(document).ready(function(){
	$("#todayDate").html(getFormatDate());
	var fileUuid = $("#fileUuid").val();
	if(fileUuid != "") {
		$("#divId").css("display", "inline");
		$("#divId2").css("display", "none");
	}
	else {
		$("#divId").css("display", "none");
		$("#divId2").css("display", "inline");
	}
});
function downloadResource(uuid){
	var f = document.getElementById("form");
	f.action = cp + "/views/resource/campus/manage/my/campus/work/record/forward_file.html";
	f.uuid.value = uuid;
	f.type.value = "workRecord";
	f.submit();
}
function uploadResource(data, elementId){
	var filePath = $("input[name='file']").val();
	if(filePath != "" ){
		var f = document.getElementById(elementId);
		var fileElement = f.file;
		if(typeof(fileElement) != "undefined"){
			$.ajaxSetup({async:false});
			f.action=cp+"/ajaxs/resource/campus/manage/my/campus/work/record/upload_record_file.html";
			f.workRecordUuid.value = data;
			f.target="_self";
			f.submit();
			alert("已成功上传文件！");
		}
	}
}
function hidden(){
	if(confirm("删除文件重新上传，该操作不可恢复，确认操作？")){
		$("#divId").css("display", "none");
		$("#divId2").css("display", "inline");
		var uuid = $("input[name='instance(WorkRecord).uuid']").val();
		$.post(cp+"/ajaxs/resource/campus/manage/my/campus/work/record/delete_record_file.html",{uuid:uuid},function(timeStamp){
			$("input[name='instance(WorkRecord).timeStamp']").val(timeStamp);
			$("input[name='instance(WorkRecord).fileUuid']").val("");
		});
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;工 作 日 志</div>
<br><br><br>
<a href="<%=request.getContextPath()%>/https/resource/campus/manage/my/campus/work/record/query_view_record.html">查看历史日志</a>&nbsp;
<br><br>
<s:if test="#request.workRecord == null">
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<input type="hidden" name="instance(WorkRecord).recordUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.uuid' />" />
<input type="hidden" name="instance(WorkRecord).ifUsing" value="1" />
<input type="hidden" name="workRecordUuid"/>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130px">记录人：</th>
		<td width="590px">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
	<tr>
		<th width="130px">记录时间：</th>
		<td width="590px">
			<div id="todayDate"></div>
		</td>
	</tr>
	<tr>
		<th width="130px">今日工作总结：</th>
		<td><textarea name="instance(WorkRecord).summary" style="width:550px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130px">明日工作计划：</th>
		<td><textarea name="instance(WorkRecord).schedule" style="width:550px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130px">今日工作感受：</th>
		<td><textarea name="instance(WorkRecord).share" style="width:550px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130px">上传文件：</th>
		<td><input type="file" name="file" style="height:20px;background-color:#ffffff" size="70">&nbsp;</td>
	</tr>
</table>	
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/work/record/query_work_record.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
</form>
<br>
</s:if>
<s:else>
<form id="formB" name="formB" method="post" enctype="multipart/form-data">
<input type="hidden" name="instance(WorkRecord).uuid" value="<s:property value='#request.workRecord.uuid' />" />
<input type="hidden" name="instance(WorkRecord).timeStamp" value="<s:property value='#request.workRecord.timeStamp' />" />
<input type="hidden" name="instance(WorkRecord).recordUuid" value="<s:property value='#request.workRecord.recordUuid' />" />
<input type="hidden" name="instance(WorkRecord).recordTime" value="<s:date name='#request.workRecord.recordTime' format='yyyy-MM-dd' />" />
<input type="hidden" id="fileUuid" name="instance(WorkRecord).fileUuid" value="<s:property value='#request.workRecord.fileUuid' />" />
<input type="hidden" name="instance(WorkRecord).ifUsing" value="<s:property value='#request.workRecord.ifUsing' />" />
<input type="hidden" name="workRecordUuid" />
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">记录人：</th>
		<td width="590">
			<s:property value="#request.workRecord.record.person.name" />
		</td>
	</tr>
	<tr>
		<th width="130">记录时间：</th>
		<td>
			<s:date name="#request.workRecord.recordTime" format="yyyy-MM-dd" />
		</td>
	</tr>
	<tbody id="1" style="display:">
		<tr>
			<th width="130">今日工作总结：</th>
			<td style="width:590px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
				<pre style="width:585px;word-wrap:break-word"><s:property value="#request.workRecord.summary" /></pre>
			</td>
		</tr>
		<tr>
			<th width="130">明日工作计划：</th>
			<td style="width:590px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
				<pre style="width:585px;word-wrap:break-word"><s:property value="#request.workRecord.schedule" />&nbsp;<br></pre>
			</td>	
		</tr>
		<tr>
			<th width="130">今日工作感受：</th>
			<td style="width:590px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
				<pre style="width:585px;word-wrap:break-word"><s:property value="#request.workRecord.share" />&nbsp;<br></pre>
			</td>	
		</tr>
		<tr>
			<th width="130">上传文件：</th>
			<td style="width:590px;word-break:break-all;vertical-align:top;padding-top:5px">
				<a href="javascript:downloadResource('<s:property value="#request.workRecord.fileUuid"/>')"><s:property value="#request.workRecord.file.name" /></a>&nbsp;
			</td>	
		</tr>
	</tbody>
	<tbody id="2" style="display:none">
		<tr>
			<th width="130">今日工作总结：</th>
			<td><textarea name="instance(WorkRecord).summary" style="width:550px;height:100px" validate="true" ><s:property value="#request.workRecord.summary" /></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="130">明日工作计划：</th>
			<td><textarea name="instance(WorkRecord).schedule" style="width:550px;height:100px" validate="true" ><s:property value="#request.workRecord.schedule" /></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="130">今日工作感受：</th>
			<td><textarea name="instance(WorkRecord).share" style="width:550px;height:100px" validate="true" ><s:property value="#request.workRecord.share" /></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="130">上传文件：</th>
			<td>
				<div id="divId">
					<a href="javascript:downloadResource('<s:property value="#request.workRecord.fileUuid"/>')"><s:property value="#request.workRecord.file.name" /></a>&nbsp;&nbsp;<input type="button" class="btn_info" value="删除" onclick="hidden()"/>
				</div>
				<div id="divId2">
					<input type="file" name="file" style="height:20px;background-color:#ffffff" size="70">&nbsp;
				</div>
			</td>
		</tr>
	</tbody>
</table>
<br>
<s:if test="#request.workRecord.reviewFlagUuid=='10000000020110001001000000000010'">
	
</s:if>
<s:elseif test="#request.workRecord != null">
		<div id="3" style="display:">
			<a href="javascript:editInstance('formB')" >
			<img src="<%=request.getContextPath()%>/images/button/b_edit.gif" /></a>
		</div>
		<div id="4" style="display:none">
			<a href="javascript:createInstance('formB')" >
			<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/work/record/query_work_record.html" >
			<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
		</div>
</s:elseif>
<s:else>
	<div id="3" style="display:none">
		<a href="javascript:editInstance('formB')" >
		<img src="<%=request.getContextPath()%>/images/button/b_edit.gif" /></a>
	</div>
	<div id="4" style="display:">
		<a href="javascript:createInstance('formB')" >
		<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/work/record/query_work_record.html" >
		<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
	</div>
</s:else>
</form>
</s:else>
<br>
</body>
</html>
