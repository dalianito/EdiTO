<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑员工</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
Validation.init("resource/human_manage/employee_manage/create_employee.xml");

$.ajaxSetup({async:false});
window.onscroll=function(){
	if(typeof($("#lightBox"))!="undefined"){
		$("#lightBox").css("top", 50 + document.documentElement.scrollTop);
	}
}
function getAllPhoto(){
	generatePopupPanel("formPhoto");
	generatePhotoList();
}
function generatePopupPanel(formId, divId){
	var photoUuid = "";
	var photoSrc = "";
	var infoUuid = "";
	var infoHtml = "";
	if(formId == "formPhoto"){
		photoUuid = $("input[name='instance(Person).photoUuid']").val();
		photoSrc = $("#showPhoto").attr("src");
	}
	else {
		infoUuid = $("#"+divId+"_input").val();
		infoHtml = $("#"+divId).html();
	}
	
	var container = document.createElement("div");
	document.body.appendChild(container);
	container.id = "coverContainer";

	var coverLightBox = document.createElement("div");
	container.appendChild(coverLightBox);
	coverLightBox.id = "coverLightBox";
	coverLightBox.style.display = "none";
	coverLightBox.style.background = "#000000";
	coverLightBox.style.position = "absolute";
	coverLightBox.style.zIndex = 17;
	coverLightBox.style.left = 0;
	coverLightBox.style.top = 0;		
	$("#" + coverLightBox.id).width(window.screen.width);
	$("#" + coverLightBox.id).height(Math.max(document.body.scrollHeight, window.screen.availHeight - 140));
	$("#" + coverLightBox.id).fadeTo("normal", 0.7);

	var lightBox = document.createElement("div");
	container.appendChild(lightBox);
	lightBox.id = "lightBox";
	lightBox.style.display = "none";
	lightBox.style.background = "#fcfcfc";
	lightBox.style.position = "absolute";
	lightBox.style.zIndex = 18;
	lightBox.style.height = 450;
	lightBox.style.width = 750;
	
	var lightBox_top = document.createElement("div");
	lightBox.appendChild(lightBox_top);
	lightBox_top.id = "lightBox_top";
	lightBox_top.style.position = "relative";
	lightBox_top.style.zIndex = 18;
	lightBox_top.style.height = 26;
	lightBox_top.style.width = lightBox.style.width;
	lightBox_top.style.backgroundColor = "#dfe9f5";

	var close_img_div = document.createElement("div");
	lightBox_top.appendChild(close_img_div);
	close_img_div.style.position = "relative";
	close_img_div.style.align = "right";
	close_img_div.style.paddingLeft = (parseInt(lightBox.style.width)-20)+"px";

	var lightBox_close_img = document.createElement("img");
	close_img_div.appendChild(lightBox_close_img);
	lightBox_close_img.id = "lightBox_close_img";
	lightBox_close_img.src = cp+"/images/button/b_close_3.gif";
	lightBox_close_img.onclick = function(){
		var coverdiv = this.parentNode.parentNode.parentNode.parentNode;
		coverdiv.outerHTML = "";
		if(formId == "formPhoto"){
			$("input[name='instance(Person).photoUuid']").val(photoUuid);
			$("#showPhoto").attr("src", photoSrc);
		}
		else {
			$("#"+divId+"_input").val(infoUuid);
			$("#"+divId).html(infoHtml);
		}
	}
	lightBox_close_img.style.cursor = "hand";
	lightBox_close_img.style.filter = "chroma(color=#FFFFFF)";

	var lightBox_content = document.createElement("div");
	lightBox.appendChild(lightBox_content);

	var resourcePanel = document.createElement("div");
	lightBox_content.appendChild(resourcePanel);
	resourcePanel.id = "resourcePanel";
	resourcePanel.style.width = 750;
	resourcePanel.style.height = 381;
	resourcePanel.style.overflowX = "auto";

	var lightBox_confirm_img = document.createElement("img");
	lightBox_content.appendChild(lightBox_confirm_img);
	lightBox_confirm_img.id = "lightBox_confirm_img";
	lightBox_confirm_img.src = cp+"/images/button/b_confirm_2.gif";
	lightBox_confirm_img.onclick = function(){
		var coverdiv = this.parentNode.parentNode.parentNode;
		coverdiv.outerHTML = "";
	}
	lightBox_confirm_img.style.cursor = "hand";

	var lightBox_refresh_img = document.createElement("img");
	lightBox_content.appendChild(lightBox_refresh_img);
	lightBox_refresh_img.id = "lightBox_refresh_img";
	lightBox_refresh_img.src = cp+"/images/button/refresh.gif";
	lightBox_refresh_img.onclick = function(){
		if(formId == "formPhoto"){
			generatePhotoList();
		}
		else {
			generateResourceList(parDivId, parInfoUuid);
		}
	}
	lightBox_refresh_img.style.cursor = "hand";

	var lightBox_bottom = document.createElement("div");
	lightBox.appendChild(lightBox_bottom);
	lightBox_bottom.id = "lightBox_bottom";
	lightBox_bottom.style.position = "relative";
	lightBox_bottom.style.zIndex = 18;
	lightBox_bottom.style.height = 13;
	lightBox_bottom.style.width = lightBox.style.width;
	lightBox_bottom.style.backgroundColor = "#dfe9f5";
	
	coverLightBox.style.display = "block";
	lightBox.style.display = "block";
	lightBox.firstChild.nextSibling.style.display = "block";

	lightBox.style.top = 50 + document.documentElement.scrollTop;
	lightBox.style.left = 300;	
}
function generatePhotoList(){
	$.post(cp+"/ajaxs/resource/human/manage/employee/manage/get_all_related_file.html",{typeUuid:"<%=Constants.FILE_TYPE_EMPLOYEE_PHOTO%>"},function(data){
		var buffer = "<br>";
		buffer += "<form id='formPhoto' name='formPhoto' method='post' enctype='multipart/form-data'>";
		buffer += "上传新照片：";
		buffer += "<input type='hidden' name='typeUuid' />"
		buffer += "<input type='file' id='formPhoto_file' name='file' style='height:20px;background-color:#ffffff' size='40' />&nbsp;&nbsp;";
		buffer += "<input type='button' value='上传' onclick='javascript:uploadFile(\"formPhoto\")' />";
		buffer += "<div class='formPhoto_progressBarBack' style='display:none;width:450px;height:12px;border:solid 1px #999999;margin-top:10px'>";
		buffer += "<div class='formPhoto_progressBar' style='display:none;height:12px'></div>";
		buffer += "</div>";
		buffer += "<div class='formPhoto_progressInfo' style='display:none;margin-tp:10px'></div>";
		buffer += "</form><br>";
		
		if(data.length > 0){
			buffer += "<table width='720' cellspacing='0' cellpadding='0' border='0' style='margin-left:10px'>";
			var i;
			for(i=0; i<data.length; i++){
				if(i % 3 == 0){
					buffer += "<tr>";
				}
				buffer += "<td id='photoTd_"+i+"' width='240' height='300' onmouseover='javascript:changeColor(\"photoTd\", "+i+")' onmouseout='javascript:changeColor(\"photoTd\", -1)' onclick='photoRadio_"+i+".click()'>";
				buffer += "<img src='"+data[i][1]+"' width='200' height='240' /><br>";
				buffer += "<div style='width:190px;margin-left:15px;word-break:break-all;word-wrap:word-break'>"
				buffer += "<input type='radio' id='photoRadio_"+i+"' name='relatedPhoto' onclick='javascript:chosePhoto(\""+data[i][3]+"\", \""+data[i][1]+"\")' ";
				if($("input[name='instance(Person).photoUuid']").val() == data[i][3]){
					buffer += "checked";
				}
				buffer += " />"+data[i][0];
				buffer += "<br>";
				buffer += data[i][2];
				buffer += "</div>";
				buffer += "</td>";
				if(1 % 3 == 2){
					buffer += "</tr>";
				}
			}
			if(i % 3 != 0){
				var span = 3 - i % 3;
				buffer += "<td width='"+(240*span)+"' colspan='"+span+"'></td></tr>";
			}
			buffer += "</table>";
		}
		buffer += "<br>";
		$("#resourcePanel").html(buffer);
	},"json");
}
function changeColor(id, num){
	$("#[id^="+id+"_]").css("background-color", "#FFFFFF");
	if(num!=-1){
		$("#"+id+"_"+num).css("background-color", "#CCCCCC");
	}
}
function chosePhoto(uuid, src){
	$("input[name='instance(Person).photoUuid']").val(uuid);
	$("#showPhoto").attr("src", src);
}
var mark = true;
function uploadFile(id){
	if($("#"+id+"_file").val()==""){
		alert("上传文件路径不能为空！");
	}
	else if(id=="formPhoto" && $("#"+id+"_file").val().substr($("#"+id+"_file").val().length-3,3)!="jpg"){
		alert("请上传jpg格式的图片文件！");
	}
	else {
		if(mark){
			mark = false;
			var form = document.getElementById(id);
			$.ajaxSetup({async:false});
			form.typeUuid.value = "<%=Constants.FILE_TYPE_EMPLOYEE_PHOTO%>";
			form.action=cp+"/ajaxs/resource/human/manage/employee/manage/upload_related_file.html";
			form.target="hiddenPage";
			form.submit();
			alert("上传完成！");
			if(id == "formPhoto"){
				generatePhotoList();
			}
			else {
				generateResourceList();
			}
			mark = true;
		}
		else {
			alert("操作进行中，请勿重复点击！");
		}
	}
}
var parDivId;
var parInfoUuid;
var parTypeUuid;
function getAllResource(divId, infoUuid, typeUuid){
	parDivId = divId;
	parInfoUuid = infoUuid;
	parTypeUuid = typeUuid;

	generatePopupPanel("formResource", divId);
	generateResourceList();
}
function generateResourceList(){
	var personUuid = $("input[name='instance(Person).uuid']").val();
	$.post(cp+"/ajaxs/resource/human/manage/employee/manage/get_all_related_resource.html",{personUuid:personUuid,typeUuid:parTypeUuid},function(data){
		var buffer = "<br>";
		buffer += "<form id='formResource' name='formResource' method='post' enctype='multipart/form-data'>";
		buffer += "上传新文件：";
		buffer += "<input type='file' id='formResource_file' name='file' style='height:20px;background-color:#ffffff' size='40' />&nbsp;&nbsp;";
		buffer += "<input type='hidden' name='employeeUuid' value='"+employeeUuid+"' />";
		buffer += "<input type='hidden' name='typeUuid' value='"+parTypeUuid+"' />";
		buffer += "<input type='button' value='上传' onclick='javascript:uploadFile(\"formResource\", \""+parTypeUuid+"\")' />";
		buffer += "</form><br>";
		
		if(data.length > 0){
			buffer += "<table width='720' cellspacing='0' cellpadding='0' border='0' style='margin-left:10px'>";
			var i;
			for(i=0; i<data.length; i++){
				if(i % 6 == 0){
					buffer += "<tr>";
				}
				buffer += "<td id='resourceTd_"+i+"' width='120' height='150' onmouseover='javascript:changeColor(\"resourceTd\", "+i+")' onmouseout='javascript:changeColor(\"resourceTd\", -1)'>";
				buffer += "<img src='"+cp+"/images/icon/icon_"+data[i][1]+".gif' width='100' height='100' style='cursor:hand' onclick='resourceRadio_"+i+".click()' /><br>";
				buffer += "<div style='width:90px;margin-left:15px;word-break:break-all;word-wrap:word-break'>"
				buffer += "<input type='radio' id='resourceRadio_"+i+"' name='resourceRadio' onclick='javascript:choseResource(\""+parDivId+"\",\""+data[i][4]+"\",\""+data[i][0]+"\")' ";

				if($("#"+parDivId+"_input").val() == data[i][4]){
					buffer += "checked";
				}
				buffer += " />";
				buffer += "<a href='javascript:downloadResource(\""+data[i][4]+"\")' onmouseover='flag=false' onmouseout='flag=true' title='点击下载'>"+data[i][0]+"</a>";
				buffer += "<br>";
				buffer += data[i][3].replace(" ", "<br>");
				buffer += "</div>";
				buffer += "</td>";
				if(1 % 6 == 5){
					buffer += "</tr>";
				}
			}
			if(i % 6 != 0){
				var span = 6 - i % 6;
				buffer += "<td width='"+(120*span)+"' colspan='"+span+"'></td></tr>";
			}
			buffer += "</table>";
		}
		buffer += "<br>";
		$("#resourcePanel").html(buffer);
	},"json");
}
var flag = true;
var nameStr = "";
function choseResource(divId, uuid, name){
	if(flag){
		$("#"+divId).html("<a href='javascript:downloadResource(\""+uuid+"\")' title='点击下载'>"+name+"</a>");
		$("#"+divId+"_input").val(uuid);
	}
}
function downloadResource(uuid){
	var f = document.getElementById("form");
	f.action = cp + "/views/resource/human/manage/employee/manage/forward_download_resource.html";
	f.uuid.value = uuid;
	f.type.value = "related";
	f.submit();
}
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		var uuid = $("input[name='instance(Person).uuid']").val();
		var personNo = $("input[name='instance(Person).personNo']").val();
		$.post(cp+"/ajaxs/resource/human/manage/employee/manage/get_employee_if_exist.html",{uuid:uuid,personNo:personNo},function(data){
			if(data != "true"){
				if(confirm("确认操作？")){
					var param=Submit.excute(elementId);
					$.post(cp+"/ajaxs/resource/human/manage/employee/manage/create_employee.html",param,function(){
						location.href = cp+"/pages/resource/human/manage/employee/manage/query_employee_manage.html";
					})
				}
			}
			else {
				alert("员工号为 "+personNo+" 的员工已经存在，请核对后重新创建！");
			}
		})
	}
}
var tbodyNum=1;
function createInfoStarChange(tableDiv, htmlText, operationStatus, args){
	var tbody = $("<tbody></tbody>");
	tbody.attr("id", tableDiv+"_"+tbodyNum);
	tbody.attr("iTOType", "info");
	tbody.attr("submit", "true");
	$("#"+tableDiv).append(tbody);
	htmlText = htmlText.replace(/NUMBER/g, tbodyNum);
	createInfoStar(tableDiv+"_"+tbodyNum, htmlText, operationStatus, args)
	tbodyNum++;
}
$(document).ready(function(){
	if($("input[name='instance(Employee).workingStateUuid']").val()=="<%=Constants.WORKING_STATE_PROBATION%>"){
		$("#probationMark").css("display", "inline");
		$("#probationMark").html("试用");
	}
	else if($("input[name='instance(Employee).workingStateUuid']").val()=="<%=Constants.WORKING_STATE_PARTTIME%>"){
		$("#probationMark").css("display", "inline");
		$("#probationMark").html("兼职");
	}
});
</script>
<iframe name="hiddenPage" style="display:none"></iframe>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 信 息 管 理</div>
<br><br><br>
<s:iterator value="#request.employee">
<form id="formA">
<input type="hidden" name="instance(Person).uuid" value="<s:property value='person.uuid' />" />
<input type="hidden" name="instance(Person).timeStamp" value="<s:property value='person.timeStamp' />" />
<input type="hidden" name="instance(Person).nativePlace" value="<s:property value='person.nativePlace' />" />
<input type="hidden" name="instance(Person).address" value="<s:property value='person.address' />" />
<input type="hidden" name="instance(Employee).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Employee).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Employee).workingStateUuid" value="<s:property value='workingStateUuid' />" />
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7"><div id="probationMark" style="display:none;color:red;font-size:11px;float:left"></div>一般信息</th>
	</tr>
	<tr>
		<td width="110" rowspan="6"><a href="javascript:getAllPhoto()"><img id="showPhoto" src="<s:if test='person.photo==null'><%=request.getContextPath()%>/images/head.gif</s:if><s:else><s:property value='#session.UPLOAD_URL' /><s:property value='person.photo.path' /></s:else>" title="点击选择照片" width="100" height="120"/></a><input type="hidden" name="instance(Person).photoUuid" value="<s:property value="person.photoUuid" />" /></td>
		<td width="90">姓名</td>
		<td width="120"><input type="text" name="instance(Person).name" value="<s:property value='person.name' />" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">性别</td>
		<td width="120"><label name="instance(Person).genderUuid" class="BaseTree" javaClassName="Gender" value="<s:property value='person.genderUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">员工号</td>
		<td width="120"><input type="text" name="instance(Person).personNo" style="width:90px" value="<s:property value='person.personNo' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">出生日期</td>
		<td width="120"><label type="text" name="instance(Person).birthDate" value="<s:date name='person.birthDate' format='yyyy-MM-dd' />" class="DateTimeSingle" format="all"></label></td>
		<td width="90">民族</td>
		<td width="120"><label name="instance(Person).nationalityUuid" class="BaseTree" javaClassName="Nationality" value="<s:property value='person.nationalityUuid' />"></label></td>
		<td width="90">国籍</td>
		<td width="120"><label name="instance(Person).countryUuid" class="BaseTree" javaClassName="Country" value="<s:property value='person.countryUuid' />"></label></td>
	</tr>
	<tr>
		<td width="90">身份证号</td>
		<td width="330" colspan="3"><input type="text" name="instance(Person).idNo" style="width:307px" value="<s:property value='person.idNo' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">学历</td>
		<td width="120"><label name="instance(Person).educationUuid" class="BaseTree" javaClassName="Education" value="<s:property value='person.educationUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">校区</td>
		<td width="120"><label id="campusUuid" name="instance(Employee).campusUuid" class="BaseTree" javaClassName="Campus" value="<s:property value='campusUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">岗位</td>
		<td width="120"><label name="instance(Employee).jobUuid" class="BaseTree" javaClassName="Job" value="<s:property value='jobUuid' />"></label></td>
		<td width="90">组织机构</td>
		<td width="120"><label name="instance(Employee).departmentUuid" class="BaseTree" javaClassName="Department" value="<s:property value='departmentUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">政治面貌</td>
		<td width="120"><label name="instance(Person).politicalUuid" class="BaseTree" javaClassName="Political" value="<s:property value='person.politicalUuid' />"></label></td>
		<td width="90">手机</td>
		<td width="120"><input type="text" name="instance(Person).cellPhone" style="width:90px" value="<s:property value='person.cellPhone' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">工作电话</td>
		<td width="120"><input type="text" name="instance(Employee).workPhone" style="width:90px" value="<s:property value='workPhone' />" /></td>
	</tr>
	<tr>
		<td width="90">电子邮件</td>
		<td width="330" colspan="3"><input type="text" name="instance(Person).email" style="width:307px" value="<s:property value='person.email' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">入职时间</td>
		<td width="120"><label type="text" name="instance(Employee).fromDate" value="<s:date name='fromDate' format='yyyy-MM-dd' />" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">简介</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Employee).summary" style="width:720px;height:80px" /><s:property value="summary" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">详细介绍</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Employee).introduction" style="width:720px;height:100px" /><s:property value="introduction" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/employee/manage/query_employee_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
