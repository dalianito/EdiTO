<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>编辑全职教师</title>
	<script src="<%=request.getContextPath()%>/js/select_tree.js"></script>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
Validation.init("content/teacher_manage/full_time/create_full_time.xml");

var preTeachingExpInfoStr = '<tr iTOType="info">'+ 
	'<td width="40"><input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).timeStamp" value="VALUE1">'+ 
	'<input type="hidden" name="instance(PreTeachingExpInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(PreTeachingExpInfo[NUMBER]).sequence" value="VALUE2" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="120"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).unitName" value="VALUE3" style="width:95px"></td>'+ 
	'<td width="110"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).className" value="VALUE4" style="width:85px"></td>'+ 
	'<td width="70"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).reference" value="VALUE5" style="width:45px"></td>'+ 
	'<td width="80"><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).referencePhone" value="VALUE6" style="width:55px"></td>'+ 
	'<td width="260"><br><input type="text" name="instance(PreTeachingExpInfo[NUMBER]).beginDate" class="datepicker" format="all" value="VALUE7" />&nbsp;-&nbsp;<input type="text" name="instance(PreTeachingExpInfo[NUMBER]).endDate" class="datepicker" format="all" value="VALUE8"/><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认操作？")){
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
</script>
<iframe name="hiddenPage" style="display:none"></iframe>
<div style="font-family:黑体;font-size:20px;">&nbsp;全 职 教 师</div>
<br><br><br>
<s:iterator value="#request.teacher">
<form id="formA">
<input type="hidden" name="instance(Teacher).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Teacher).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Teacher).employeeUuid" value="<s:property value='employeeUuid' />" />
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">一般信息</th>
	</tr>
	<tr>
		<td width="110" rowspan="7"><img id="showPhoto" src="<s:if test='photo==null'><%=request.getContextPath()%>/images/head.gif</s:if><s:else><s:property value='#session.UPLOAD_URL' /><s:property value='employee.person.photo.path' /></s:else>" width="100" height="120"/></td>
		<td width="90">姓名</td>
		<td width="120"><s:property value='employee.person.name' /></td>
		<td width="90">性别</td>
		<td width="120"><s:property value='employee.person.gender.description' /></td>
		<td width="90">员工号</td>
		<td width="120"><s:property value='employee.person.personNo' /></td>
	</tr>
	<tr>
		<td width="90">出生日期</td>
		<td width="120"><s:date name='employee.person.birthDate' format='yyyy-MM-dd' /></td>
		<td width="90">民族</td>
		<td width="120"><s:property value='employee.person.nationality.description' /></td>
		<td width="90">国籍</td>
		<td width="120"><s:property value='employee.person.country.description' /></td>
	</tr>
	<tr>
		<td width="90">身份证号</td>
		<td width="330" colspan="3"><s:property value='employee.person.idNo' /></td>
		<td width="90">学历</td>
		<td width="120"><s:property value='employee.person.education.description' />&nbsp;</td>
	</tr>
	<tr>
		<td width="90">校区</td>
		<td width="120"><s:property value='employee.campus.description' /></td>
		<td width="90">岗位</td>
		<td width="120"><s:property value='employee.job.description' /></td>
		<td width="90">组织机构</td>
		<td width="120"><s:property value='employee.department.description' /></td>
	</tr>
	<tr>
		<td width="90">政治面貌</td>
		<td width="120"><s:property value='employee.person.political.description' /></td>
		<td width="90">手机</td>
		<td width="120"><s:property value='employee.person.cellPhone' /></td>
		<td width="90">工作电话</td>
		<td width="120"><s:property value='employee.workPhone' /></td>
	</tr>
	<tr>
		<td width="90">电子邮件</td>
		<td width="330" colspan="3"><s:property value='employee.person.email' /></td>
		<td width="90">入职时间</td>
		<td width="120"><s:date name='employee.fromDate' format='yyyy-MM-dd' /></td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">简介</th>
	</tr>
	<tr>
		<td width="740">
			<div id="summary" style="width:730px;height:80px"><s:property value="employee.summary" /></div>
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
			<div id="summary" style="width:730px;height:80px"><s:property value="employee.introduction" /></div>
		</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740"><font color="red">补充资料</font></th>
	</tr>
</table>
<br>
<table id="preTeachingExpInfo" width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">过往授课经历</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="120">工作单位</th>
		<th width="110">课程名称</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">任职时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStarChange('preTeachingExpInfo',preTeachingExpInfoStr,'0',['','','','','','','','',''])" /></th>
	</tr>
</table>
<s:iterator value="#request.preTeachingExpInfoList">
	<script>
		createInfoStarChange("preTeachingExpInfo",preTeachingExpInfoStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='sequence' />","<s:property value='unitName' />","<s:property value='className' />","<s:property value='reference' />","<s:property value='referencePhone' />","<s:date name='beginDate' format='yyyy-MM-dd' />","<s:date name='endDate' format='yyyy-MM-dd' />"]);
	</script>
</s:iterator>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">教授课程种类</th>
	</tr>
	<tr>
		<th width="740">课程名称</th>
	</tr>
	<tr>
		<td style="width:740px">
			<input type="hidden" id="teachingCourse" name="instance(Teacher).teachingCourse">
			<div id="selectTreeInfo" class="SelectTree" javaClassName="CourseCategoryType" setCheckLv="-1"
				value="<s:property value='teachingCourse' />"
				style="min-height:20px;max-height:600px;overflow:auto">
			</div>
		</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">授课特色</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Teacher).feature" style="width:720px;height:80px" /><s:property value='feature' /></textarea><br>
		</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">备注</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Teacher).notes" style="width:720px;height:80px" /><s:property value='notes' /></textarea><br>
		</td>
	</tr>
</table>
<br>
</form>
</s:iterator>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/teacher/manage/full/time/query_full_time.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
