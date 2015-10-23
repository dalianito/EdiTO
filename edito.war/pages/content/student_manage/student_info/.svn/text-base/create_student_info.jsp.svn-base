<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>学生信息</title>
</head>
<body>
<script>
Validation.init("content/student_manage/student_info/create_student_info.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认创建？")){
			var uuids = "";
			$("#selectTreeInfo :checked").each(function(){ 
				uuids += "," + $(this).val();
			}); 
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/content/student/manage/student/info/create_student_info.html",param,function(){
				location.href = cp+"/pages/content/student/manage/student/info/query_students.html";
			})
		}
	}
}

var educationHistoryStr = '<tr iTOType="info">'+
'<td width="240"><input type="hidden" name="instance(EducationExpInfo[NUMBER]).uuid" value="VALUE0">'+ 
'<input type="hidden" name="instance(EducationExpInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+
'<input type="text" name="instance(EducationExpInfo[NUMBER]).school" value="VALUE1" style="width:210px" validate="true">&nbsp;<font color="#996633">*</font></td>'+
'<td width="120"><input type="text" name="instance(EducationExpInfo[NUMBER]).degree" value="VALUE2" style="width:90px" validate="true">&nbsp;<font color="#996633">*</font></td>'+
'<td width="120">&nbsp;<input type="text" name="instance(EducationExpInfo[NUMBER]).beginDate" class="datepicker" format="all" value="VALUE3" validate="true"/>&nbsp;<font color="#996633">*</font></td>'+
'<td width="120">&nbsp;<input type="text" name="instance(EducationExpInfo[NUMBER]).endDate" class="datepicker" format="all" value="VALUE4" validate="true"/>&nbsp;<font color="#996633">*</font></td>'+
'<td width="120" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
'</tr>';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;创建学生信息</div>
<br>
<form id="formA">
<input type="hidden" name="instance(Student).personUuid" />
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="110">学生编号</th>
		<td width="130"><input type="text" name="instance(Student).studentID" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="110">学生姓名</th>
		<td width="130"><input name="instance(Person).name" style="width:90px" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;</td>
		<th width="110">性别</th>
		<td width="130"><label name="instance(Person).genderUuid" class="BaseTree" javaClassName="Gender" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="110">出生日期</th>
		<td width="130"><input type="text" name="instance(Person).birthDate" class="datepicker" format="all" validate="true"/>&nbsp;<font color="#996633">*</font></td>
		<th width="110">民族</th>
		<td width="130"><label name="instance(Person).nationalityUuid" class="BaseTree" javaClassName="Nationality"></label></td>
		<th width="110">婚否</th>
		<td width="130"><label type="text" name="instance(Person).marriageUuid" class="BaseTree" javaClassName="MarriageState" /></label></td>
	</tr>
	<tr>
		<th width="110">最高学历</th>
		<td width="130"><label name="instance(Person).educationUuid" class="BaseTree" javaClassName="Education" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="110">家长姓名</th>
		<td width="130"><input name="instance(Person).parentName" style="width:90px" /></td>
		<th width="110">家长电话</th>
		<td width="130"><input name="instance(Person).parentPhone" style="width:90px"/></td>
	</tr>
	<tr>
		<th width="110">政治面貌</th>
		<td width="130"><label name="instance(Person).politicalUuid" class="BaseTree" javaClassName="Political"></label></td>
		<th width="110" >身份证号</th>
		<td width="370" colspan="3" ><input type="text" name="instance(Person).idNo" style="width:330px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="110">电话</th>
		<td width="130"><input type="text" name="instance(Person).cellPhone" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="110" >身份证住址</th>
		<td width="370" colspan="3" ><input type="text" name="instance(Person).address" style="width:330px"  /></td>
	</tr>
	<tr>
		<th width="110">QQ</th>
		<td width="130"><input type="text" name="instance(Person).qq" style="width:90px"  /></td>
		<th width="110" >实际居住住址</th>
		<td width="370" colspan="3" ><input type="text" name="instance(Person).realAddress" style="width:330px" /></td>
	</tr>
</table>
<table width="720" style="margin-top:20px" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="720" colspan="7">教育经历</th>
	</tr>
	<tr>
		<th width="240">学校</th>
		<th width="120">学习内容</th>
		<th width="120">开始时间</th>
		<th width="120">结束时间</th>
		<th width="120"><input type="button" value="增加" onclick="createInfoStar('educationHistory',educationHistoryStr,'0',['','','','',''])" /></th>
	</tr>
	<tbody id="educationHistory"></tbody>
</table>
<table width="720" style="margin-top:20px" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
<tr>
	<th width="110">特殊专长</th>
	<td width="610" colspan="5"><textarea name="instance(Person).specialExpertise" style="width:590px;height:80px" /></textarea></td>
</tr>
<tr>
	<th width="110">外语及<br>熟练程度</th>
	<td width="610" colspan="5"><textarea name="instance(Person).foreignLanguageAndQualification" style="width:590px;height:80px" /></textarea></td>
</tr>
<tr>
	<th width="110">备注</th>
	<td width="610" colspan="5"><textarea name="instance(Student).note" style="width:590px;height:80px" /></textarea></td>
</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/student/manage/student/info/query_students.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
