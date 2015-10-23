<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
<title>新建全职教师</title>
<script src="<%=request.getContextPath()%>/js/select_tree.js"></script>
</head>

<body>
<script>
Validation.init("content/teacher_manage/full_time/create_full_time.xml");

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
			$.post(cp+"/ajaxs/content/teacher/manage/full/time/create_full_time.html",param,function(){
				location.href = cp+"/pages/content/teacher/manage/full/time/query_full_time.html";
			})
		}
	}
}
var preTeachingExpStr = '<tr iTOType="info">'+ 
	'<td width="40"><input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(PreTeachingExpInfo[NUMBER]).sequence" value="VALUE1" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="120"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).unitName" value="VALUE2" style="width:95px"></td>'+ 
	'<td width="110"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).className" value="VALUE3" style="width:85px"></td>'+ 
	'<td width="70"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).reference" value="VALUE4" style="width:45px"></td>'+ 
	'<td width="80"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).referencePhone" value="VALUE5" style="width:55px"></td>'+ 
	'<td width="260"><br><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).beginDate" class="datepicker" format="all" value="VALUE6"/>&nbsp;-&nbsp;<input type="text" name="instance(PreTeachingExpInfo[NUMBER]).endDate" class="datepicker" format="all" value="VALUE7" /><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
function updateRelation(data){
	if(data["employee"].person.photoUuid != null){
		$("#showPhoto").attr("src", cp+data["employee"].person.photo.path);
	}
	$("input[name='personNo']").val(data["employee"].person.personNo);
	$("input[name='personName']").val(data["employee"].person.name);
	$("input[name='no']").val(data["employee"].personUuid);
	$("input[name='name']").val(data["employee"].personUuid);
	$("#gender").html(data["employee"].person.gender.description);
	if(data["employee"].person.birthDate != null){
		var birthDate = data["employee"].person.birthDate.substring(0,data["employee"].person.birthDate.indexOf(" "));
		var birthDateStr = birthDate.substring(0,4)+"年"+birthDate.substring(5,7)+"月"+birthDate.substring(8)+"日";
		$("#birthDate").html(birthDate);
	}
	$("#idNo").html(data["employee"].person.idNo);
	if(data["employee"].person.nationalityUuid != null){
		$("#nationality").html(data["employee"].person.nationality.description);
	}
	if(data["employee"].person.countryUuid != null){
		$("#country").html(data["employee"].person.country.description);
	}
	$("#education").html(data["employee"].person.education.description);
	if(data["employee"].person.politicalUuid !== null){
		$("#political").html(data["employee"].person.political.description);
	}
	$("#cellPhone").html(data["employee"].person.cellPhone);
	$("#email").html(data["employee"].person.email);
	if(typeof(data["employee"]) != "undefined"){
		$("input[name='instance(Teacher).employeeUuid']").val(data["employee"].uuid);
		$("#campus").html(data["employee"].campus.description);
		if(data["employee"].jobUuid != null){
			$("#job").html(data["employee"].job.description);
		}
		$("#department").html(data["employee"].department.description);
		if(data["employee"].workPhone != null)
		{
			$("#workPhone").html(data["employee"].workPhone);
		}
		var fromDate = data["employee"].fromDate.substring(0,data["employee"].fromDate.indexOf(" "));
		var fromDateStr = fromDate.substring(0,4)+"年"+fromDate.substring(5,7)+"月"+fromDate.substring(8)+"日";
		$("#fromDate").html(fromDate);
		$("label[name='instance(Employee).fromDate']").text(fromDateStr);
		if(data["employee"].toDate != null){
			var toDate = data["employee"].toDate.substring(0,data["employee"].toDate.indexOf(" "));
			var toDateStr = toDate.substring(0,4)+"年"+toDate.substring(5,7)+"月"+toDate.substring(8)+"日";
			$("label[name='instance(Employee).toDate']").val(toDate);
			$("label[name='instance(Employee).toDate']").text(toDateStr);
		}
		if(data["employee"].summary != null){
			$("#summary").html(data["employee"].summary);
		}
		if(data["employee"].introduction){
			$("#introduction").html(data["employee"].introduction);
		}
	}
}
function clearRelationData(relationId){
	$("#showPhoto").attr("src", cp+"/images/head.gif");
	$("input[name='personName']").val("");
	$("input[name='personNo']").val("");
	$("input[name='name']").val("");
	$("input[name='no']").val("");
	$("#gender").html("");
	$("#birthDate").html("");
	$("#idNo").html("");
	$("#nationality").html("");
	$("#country").html("");
	$("#education").html("");
	$("#political").html("");
	$("#cellPhone").html("");
	$("#email").html("");
	$("input[name='instance(Teacher).employeeUuid']").val("");
	$("#campus").html("");
	$("#job").html("");
	$("#department").html("");
	$("#workPhone").html("");
	$("#fromDate").html("");
	$("label[name='instance(Employee).fromDate']").text("-选择日期-");
	$("label[name='instance(Employee).toDate']").val("");
	$("label[name='instance(Employee).toDate']").text("-选择日期-");
	$("#summary").val("");
	$("#introduction").val("");
}
</script>

<iframe name="hiddenPage" style="display: none"></iframe>
<form id="formA">
<input type="hidden" name="instance(Teacher).employeeUuid" />
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780" colspan="7">一般信息</th>
	</tr>
	<tr>
		<td width="110" rowspan="7"><img id="showPhoto" src="<%=request.getContextPath()%>/images/head.gif" width="100" height="120" /></td>
		<td width="90">姓名</td>										
		<td width="140"><input name="name" class="DropMenu" nextSiblingName="personName" actionPath="<%=request.getContextPath()%>/ajaxs/drop/menu/query_employee_drop_menu.html" parameterLength="1" execute="true" nextSiblingSize="12" relationId="curPerson" executeUrl="<%=request.getContextPath()%>/ajaxs/drop/menu/query_employee_info.html" validate="true" />&nbsp;<font color="#996633">*</font>&nbsp;</td>
		<td width="90">性别</td>
		<td width="140">
			<span id="gender"></span>
		</td>
		<td width="90">员工号</td>
		<td width="140"><input name="no" class="DropMenu" nextSiblingName="personNo" actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html" field="personNo" execute="true" relationId="curPersonNo" nextSiblingSize="12" executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_info.html" validate="true" />&nbsp;<font color="#996633">*</font>&nbsp;</td>
	</tr>
	<tr>
		<td width="90">出生日期</td>
		<td width="140">
			<span id="birthDate"></span>
		</td>
		<td width="90">民族</td>
		<td width="140">
			<span id="nationality"></span>
		</td>
		<td width="90">国籍</td>
		<td width="140">
			<span id="country"></span>
		</td>
	</tr>
	<tr>
		<td width="90">身份证号</td>
		<td width="370" colspan="3"> <span id="idNo"></span></td>
		<td width="90">学历</td>
		<td width="140">
			<span id="education"></span>
		</td>
	</tr>
	<tr>
		<td width="90">校区</td>
		<td width="140">
			<span id="campus"></span>
		</td>
		<td width="90">岗位</td>
		<td width="140">
			<span id="job"></span>
		</td>
		<td width="90">组织机构</td>
		<td width="140">
			<span id="department"></span>
		</td>
	</tr>
	<tr>
		<td width="90">政治面貌</td>
		<td width="140">
			<span id="political"></span>
		</td>
		<td width="90">手机</td>
		<td width="140">
			<span id="cellPhone"></span>
		</td>
		<td width="90">工作电话</td>
		<td width="140">
			<span id="workPhone"></span>
		</td>
	</tr>
	<tr>
		<td width="90">电子邮件</td>
		<td width="370" colspan="3">
			<span id="email"></span>
		</td>
		<td width="90">入职时间</td>
		<td width="140">
			<span id="fromDate"></span>
		</td>
	</tr>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780">简介</th>
	</tr>
	<tr>
		<td width="780">
			<div id="summary" style="width:768px;height:80px"></div>
		</td>
	</tr>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780">详细介绍</th>
	</tr>
	<tr>
		<td width="780">
			<div id="introduction" style="width:768px;height:80px"></div>
		</td>
	</tr>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780"><font color="red">补充资料</font></th>
	</tr>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780" colspan="7">过往授课经历</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="120">工作单位</th>
		<th width="110">课程名称</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">任职时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStar('preTeachingExp',preTeachingExpStr,'0',['','','','','','',' -选择日期-',' -选择日期-'])" /></th>
	</tr>
	<tbody id="preTeachingExp"></tbody>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780">教授课程种类</th>
	</tr>
	<tr>
		<th width="780">课程名称</th>
	</tr>
	<tr>
		<td style="width:780px">
			<input type="hidden" id="teachingCourse" name="instance(Teacher).teachingCourse">
			<div id="selectTreeInfo" class="SelectTree" javaClassName="CourseCategoryType" setCheckLv="-1"
				style="min-height:20px;max-height:600px;overflow:auto">
			</div>
		</td>
	</tr>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780">授课特色</th>
	</tr>
	<tr>
		<td width="780">
			<textarea name="instance(Teacher).feature" style="width:768px;height:80px" /></textarea><br>
		</td>
	</tr>
</table>
<br>
<table width="780" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="780">备注</th>
	</tr>
	<tr>
		<td width="780">
			<textarea name="instance(Teacher).notes" style="width:768px;height:80px" /></textarea><br>
		</td>
	</tr>
</table>
<br>
</form>
<a href="javascript:createInstance('formA')"> <img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/teacher/manage/full/time/query_full_time.html">
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
