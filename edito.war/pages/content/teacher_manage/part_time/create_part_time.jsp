<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>新建兼职教师</title>
<script src="<%=request.getContextPath()%>/js/select_tree.js"></script>
</head>
<body>
<script>
Validation.init("content/teacher_manage/part_time/create_part_time.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认创建？")){
			var uuids = "";
			$("#selectTreeInfo :checked").each(function(){ 
				uuids += "," + $(this).val();
			}); 
			if(uuids.length > 0){
				uuids = uuids.substring(1);
				$("#teachingCourse").val(uuids);
			}
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/content/teacher/manage/part/time/create_part_time.html",param,function(){
				location.href = cp+"/pages/content/teacher/manage/part/time/query_part_time.html";
			})
		}
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
var preTeachingExpStr = '<tr iTOType="info">'+ 
	'<td width="40"><input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(PreTeachingExpInfo[NUMBER]).sequence" value="VALUE1" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="120"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).unitName" value="VALUE2" style="width:95px" ></td>'+ 
	'<td width="110"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).className" value="VALUE3" style="width:85px" ></td>'+ 
	'<td width="70"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).reference" value="VALUE4" style="width:45px" ></td>'+ 
	'<td width="80"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).referencePhone" value="VALUE5" style="width:55px" ></td>'+ 
	'<td width="260"><br><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).beginDate" class="datepicker" format="all" value="VALUE6"/>&nbsp;-&nbsp;<input type="text" name="instance(PreTeachingExpInfo[NUMBER]).endDate" class="datepicker" format="all" value="VALUE7"/><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;兼 职 教 师</div>
<br><br><br>
<form id="formA">
<table width="800" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="800" colspan="7">基本信息</th>
	</tr>
	<tr>
		<td width="130" rowspan="6"><a href="javascript:getAllPhoto()"><img id="showPhoto" src="<%=request.getContextPath()%>/images/head.gif" title="点击选择照片" width="100" height="120"/></a><input type="hidden" name="instance(Person).photoUuid" /></td>
		<td width="90">姓名</td>
		<td width="140"><input name="instance(Person).name" style="width:90px" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;</td>
		<td width="90">性别</td>
		<td width="140"><label name="instance(Person).genderUuid" class="BaseTree" javaClassName="Gender" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">员工号</td>
		<td width="140"><input type="text" name="instance(Person).personNo" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">出生日期</td>
		<td width="140"><input type="text" name="instance(Person).birthDate" class="datepicker" format="all" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">民族</td>
		<td width="140"><label name="instance(Person).nationalityUuid" class="BaseTree" javaClassName="Nationality"></label></td>
		<td width="90">国籍</td>
		<td width="140"><label name="instance(Person).countryUuid" class="BaseTree" javaClassName="Country"></label></td>
	</tr>
	<tr>
		<td width="90">身份证号</td>
		<td width="370" colspan="3"><input type="text" name="instance(Person).idNo" style="width:307px" /></td>
		<td width="90">政治面貌</td>
		<td width="140"><label name="instance(Person).politicalUuid" class="BaseTree" javaClassName="Political" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">校区</td>
		<td width="140"><label name="instance(Employee).campusUuid" class="BaseTree" javaClassName="Campus" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">岗位</td>
		<td width="140"><label name="instance(Employee).jobUuid" class="BaseTree" javaClassName="Job"></label></td>
		<td width="90">组织机构</td>
		<td width="140"><label name="instance(Employee).departmentUuid" class="BaseTree" javaClassName="Department" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">手机</td>
		<td width="140"><input type="text" name="instance(Person).cellPhone" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">工作电话</td>
		<td width="140"><input type="text" name="instance(Employee).workPhone" style="width:90px" validate="true"/>&nbsp;<font color="#996633">*</font></td>
		<td width="90">学历</td>
		<td width="140"><label name="instance(Person).educationUuid" class="BaseTree" javaClassName="Education" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<td width="90">电子邮件</td>
		<td width="370" colspan="3"><input type="text" name="instance(Person).email" style="width:307px" /></td>
		<td width="90">职称</td>
		<td width="140"><label type="text" name="instance(Teacher).titleUuid"  class="BaseTree" javaClassName="Title" ></label>&nbsp;</td>
	</tr>
	<tr>
		<td width="130">所在单位</td>
		<td width="230" colspan="2"><input type="text" name="instance(Teacher).workUnit" style="width:180px" /></td>
		<td width="90">职务</td>
		<td width="140"><input type="text" name="instance(Teacher).duty" style="width:90px" />&nbsp;</td>
		<td width="90">入职时间</td>
		<td width="140"><input type="text" name="instance(Employee).fromDate" class="datepicker" format="all" validate="true"/>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="800" colspan="7">过往授课经历</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="120">单位名称</th>
		<th width="110">课程名称</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">任职时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStar('preTeachingExp',preTeachingExpStr,'0',['','','','','','',' -选择日期-',' -选择日期-'])" /></th>
	</tr>
	<tbody id="preTeachingExp"></tbody>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="800">教授课程种类</th>
	</tr>
	<tr>
		<th width="800">课程名称</th>
	</tr>
	<tr>
		<td style="width:800px">
			<input type="hidden" id="teachingCourse" name="instance(Teacher).teachingCourse">
			<div id="selectTreeInfo" class="SelectTree" javaClassName="CourseCategoryType" setCheckLv="-1"
				style="min-height:20px;max-height:600px;overflow:auto">
			</div>
		</td>
	</tr>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="800">授课特色</th>
	</tr>
	<tr>
		<td width="800">
			<textarea name="instance(Teacher).feature" style="width:788px;height:80px" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="800">备注</th>
	</tr>
	<tr>
		<td width="800">
			<textarea name="instance(Teacher).notes" style="width:788px;height:80px" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
</form>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/teacher/manage/part/time/query_part_time.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
