<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>新建员工</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/employee_manage/create_employee.xml");

window.onscroll=function(){
	if(typeof($("#lightBox"))!="undefined"){
		$("#lightBox").css("top", 50 + document.documentElement.scrollTop);
	}
} 
function getAllPhoto(){
	generatePhotoPanel();
	generatePhotoList();
}
function generatePhotoPanel(){
	var photoUuid = $("input[name='instance(Person).photoUuid']").val();
	var photoSrc = $("#showPhoto").attr("src");
	
	$.ajaxSetup({async:false});
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
		$("input[name='instance(Person).photoUuid']").val(photoUuid);
		$("#showPhoto").attr("src", photoSrc);
	}
	lightBox_close_img.style.cursor = "hand";
	lightBox_close_img.style.filter = "chroma(color=#FFFFFF)";

	var lightBox_content = document.createElement("div");
	lightBox.appendChild(lightBox_content);

	var photoPanal = document.createElement("div");
	lightBox_content.appendChild(photoPanal);
	photoPanal.id = "photoPanal";
	photoPanal.style.width = 750;
	photoPanal.style.height = 381;
	photoPanal.style.overflowX = "auto";

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
		generatePhotoList();
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
		$.ajaxSetup({async:false});
		var buffer = "<br>";
		buffer += "<form id='formPhoto' name='formPhoto' method='post' enctype='multipart/form-data'>";
		buffer += "上传新照片：";
		buffer += "<input type='hidden' name='typeUuid' />";
		buffer += "<input type='file' id='photo_file' name='file' style='height:20px;background-color:#ffffff' size='40' />&nbsp;&nbsp;";
		buffer += "<input type='button' value='上传' onclick='javascript:uploadFile(\"formPhoto\")' />";
		buffer += "</form><br>";
		
		if(data.length > 0){
			buffer += "<table width='720' cellspacing='0' cellpadding='0' border='0' style='margin-left:10px'>";
			var i;
			for(i=0; i<data.length; i++){
				if(i % 3 == 0){
					buffer += "<tr>";
				}
				buffer += "<td id='photoTd_"+i+"' width='240' height='300' onmouseover='javascript:changeColor("+i+")' onmouseout='javascript:changeColor(-1)' onclick='photoRadio_"+i+".click()'>";
				buffer += "<img src='"+data[i][1]+"' width='200' height='240' style='cursor:hand' /><br>";
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
		$("#photoPanal").html(buffer);
	},"json");
}
function changeColor(idNum){
	$("#[id^=photoTd_]").css("background-color", "#FFFFFF");
	if(idNum!=-1){
		$("#photoTd_"+idNum).css("background-color", "#CCCCCC");
	}
}
function chosePhoto(uuid, src){
	$("input[name='instance(Person).photoUuid']").val(uuid);
	$("#showPhoto").attr("src", src);
}
var mark = true;
function uploadFile(id){
	if($("#photo_file").val()==""){
		alert("上传文件路径不能为空！");
	}
	else if($("#photo_file").val().substr($("#photo_file").val().length-3,3)!="jpg"){
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
			generatePhotoList();
			mark = true;
		}
		else {
			alert("操作进行中，请勿重复点击！");
		}
	}
}
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		var uuid = $("input[name='instance(Person).uuid']").val();
		var personNo = $("input[name='instance(Person).personNo']").val();
		$.post(cp+"/ajaxs/resource/human/manage/employee/manage/get_employee_if_exist.html",{uuid:uuid,personNo:personNo},function(data){
			if(data != "true"){
				if(confirm("确认创建？")){
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
function updateRelation(data){
	$("input[name='instance(person).uuid']").val(data["person"].uuid);
	$("input[name='instance(Person).timeStamp']").val(data["person"].timeStamp);
	if(data["person"].photoUuid != null){
		$("#showPhoto").attr("src", up+"/"+data["person"].photo.path);
		$("input[name='instance(Person).photoUuid']").val(data["person"].photoUuid);
	}
	$("input[name='instance(Person).personNo']").val(data["person"].personNo);
	$("input[name='instance(Person).name']").val(data["person"].name);
	$("label[name='instance(Person).genderUuid']").val(data["person"].genderUuid);
	if(data["person"].birthDate != null){
		var birthDate = data["person"].birthDate.substring(0,data["person"].birthDate.indexOf(" "));
		var birthDateStr = birthDate.substring(0,4)+"年"+birthDate.substring(5,7)+"月"+birthDate.substring(8)+"日";
		$("label[name='instance(Person).birthDate']").val(birthDate);
		$("label[name='instance(Person).birthDate']").text(birthDateStr);
	}
	$("input[name='instance(Person).idNo']").val(data["person"].idNo);
	if(data["person"].nationalityUuid != null){
		$("label[name='instance(Person).nationalityUuid']").val(data["person"].nationalityUuid);
	}
	if(data["person"].countryUuid != null){
		$("label[name='instance(Person).countryUuid']").val(data["person"].countryUuid);
	}
	$("label[name='instance(Person).educationUuid']").val(data["person"].educationUuid);
	if(data["person"].politicalUuid != null){
		$("label[name='instance(Person).politicalUuid']").val(data["person"].politicalUuid);
	}
	$("input[name='instance(Person).cellPhone']").val(data["person"].cellPhone);
	$("input[name='instance(Person).email']").val(data["person"].email);
	if(typeof(data["employee"]) != "undefined"){
		$("input[name='instance(employee).uuid']").val(data["employee"].uuid);
		$("input[name='instance(employee).timeStamp']").val(data["employee"].timeStamp);
		$("label[name='instance(Employee).campusUuid']").val(data["employee"].campusUuid);
		if(data["employee"].jobUuid != null){
			$("label[name='instance(Employee).jobUuid']").val(data["employee"].jobUuid);
		}
		$("label[name='instance(Employee).departmentUuid']").val(data["employee"].departmentUuid);
		if(data["employee"].workPhone != null){
			$("input[name='instance(Employee).workPhone']").val(data["employee"].workPhone);
		}
		var fromDate = data["employee"].fromDate.substring(0,data["employee"].fromDate.indexOf(" "));
		var fromDateStr = fromDate.substring(0,4)+"年"+fromDate.substring(5,7)+"月"+fromDate.substring(8)+"日";
		$("label[name='instance(Employee).fromDate']").val(fromDate);
		$("label[name='instance(Employee).fromDate']").text(fromDateStr);
		var toDate = data["employee"].toDate.substring(0,data["employee"].toDate.indexOf(" "));
		var toDateStr = toDate.substring(0,4)+"年"+toDate.substring(5,7)+"月"+toDate.substring(8)+"日";
		$("label[name='instance(Employee).toDate']").val(toDate);
		$("label[name='instance(Employee).toDate']").text(toDateStr);
		$("textarea[name='instance(Employee).summary']").val(data["employee"].summary);
		$("textarea[name='instance(Employee).introduction']").val(data["employee"].introduction);
	}
}
function clearRelationData(relationId){
	$("input[name='instance(person).uuid']").val("");
	$("input[name='instance(Person).timeStamp']").val("");
	$("#showPhoto").attr("src", cp+"/images/head.gif");
	$("input[name='instance(Person).photoUuid']").val("");
	$("input[name='instance(Person).personNo']").val("");
	$("label[name='instance(Person).genderUuid']").val("");
	$("label[name='instance(Person).birthDate']").val("");
	$("label[name='instance(Person).birthDate']").text("-选择日期-");
	$("input[name='instance(Person).idNo']").val("");
	$("label[name='instance(Person).nationalityUuid']").val("");
	$("label[name='instance(Person).countryUuid']").val("");
	$("label[name='instance(Person).educationUuid']").val("");
	$("label[name='instance(Person).politicalUuid']").val("");
	$("input[name='instance(Person).cellPhone']").val("");
	$("input[name='instance(Person).email']").val("");
	$("input[name='instance(employee).uuid']").val("");
	$("input[name='instance(employee).timeStamp']").val("");
	$("label[name='instance(Employee).campusUuid']").val("");
	$("label[name='instance(Employee).jobUuid']").val("");
	$("label[name='instance(Employee).departmentUuid']").val("");
	$("input[name='instance(Employee).workPhone']").val("");
	$("label[name='instance(Employee).fromDate']").val("");
	$("label[name='instance(Employee).fromDate']").text("-选择日期-");
	$("label[name='instance(Employee).toDate']").val("");
	$("label[name='instance(Employee).toDate']").text("-选择日期-");
	$("textarea[name='instance(Employee).summary']").val("");
	$("textarea[name='instance(Employee).introduction']").val("");
}
</script>

<iframe name="hiddenPage" style="display:none"></iframe>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 信 息 管 理</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="instance(Person).timeStamp" />
<input type="hidden" name="instance(Employee).uuid" />
<input type="hidden" name="instance(Employee).timeStamp" />
<input type="hidden" name="instance(Employee).workingStateUuid" value="<%=Constants.WORKING_STATE_FORMAL %>"/>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">一般信息</th>
	</tr>
	<tr>
		<td width="110" rowspan="6"><a href="javascript:getAllPhoto()"><img id="showPhoto" src="<%=request.getContextPath()%>/images/head.gif" title="点击选择照片" width="100" height="120"/></a><input type="hidden" name="instance(Person).photoUuid" value="" /></td>
		<td width="90">姓名</td>
		<td width="120"><input name="instance(Person).uuid"
			nextSiblingName="instance(Person).name" class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_person_drop_menu.html"
			execute="true"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_person_info.html"
			relationId="curPerson" nextSiblingValidate="true">&nbsp;<font color="#996633">*</font>&nbsp;</td>
		<td width="90">性别</td>
		<td width="120"><label name="instance(Person).genderUuid" class="BaseTree" javaClassName="Gender" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">员工号</td>
		<td width="120"><input type="text" name="instance(Person).personNo" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">出生日期</td>
		<td width="120"><label type="text" name="instance(Person).birthDate" class="DateTimeSingle" format="all"></label></td>
		<td width="90">民族</td>
		<td width="120"><label name="instance(Person).nationalityUuid" class="BaseTree" javaClassName="Nationality"></label></td>
		<td width="90">国籍</td>
		<td width="120"><label name="instance(Person).countryUuid" class="BaseTree" javaClassName="Country"></label></td>
	</tr>
	<tr>
		<td width="90">身份证号</td>
		<td width="330" colspan="3"><input type="text" name="instance(Person).idNo" style="width:307px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">学历</td>
		<td width="120"><label name="instance(Person).educationUuid" class="BaseTree" javaClassName="Education" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">校区</td>
		<td width="120"><label id="campusUuid" name="instance(Employee).campusUuid" class="BaseTree" javaClassName="Campus" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">岗位</td>
		<td width="120"><label name="instance(Employee).jobUuid" class="BaseTree" javaClassName="Job"></label></td>
		<td width="90">组织机构</td>
		<td width="120"><label name="instance(Employee).departmentUuid" class="BaseTree" javaClassName="Department" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">政治面貌</td>
		<td width="120"><label name="instance(Person).politicalUuid" class="BaseTree" javaClassName="Political"></label></td>
		<td width="90">手机</td>
		<td width="120"><input type="text" name="instance(Person).cellPhone" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">工作电话</td>
		<td width="120"><input type="text" name="instance(Employee).workPhone" style="width:90px" /></td>
	</tr>
	<tr>
		<td width="90">电子邮件</td>
		<td width="330" colspan="3"><input type="text" name="instance(Person).email" style="width:307px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">入职时间</td>
		<td width="120"><label type="text" name="instance(Employee).fromDate" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">简介</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Employee).summary" style="width:720px;height:80px" /></textarea><br><br>
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
			<textarea name="instance(Employee).introduction" style="width:720px;height:100px" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/employee/manage/query_employee_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
