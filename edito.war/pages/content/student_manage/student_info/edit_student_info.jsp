<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑学生信息</title>
	<script src="<%=request.getContextPath()%>/js/select_tree.js"></script>
</head>
<body>
<form id="form" name="form" method="post">
	<input type="hidden" name="uuid" />
	<input type="hidden" name="type" />
</form>
<script>
Validation.init("content/student_manage/student_info/create_student_info.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认操作？")){
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

var educationHistoryStr = '<tr iTOType="info">'+ 
'<td width="240"><input type="hidden" name="instance(EducationExpInfo[NUMBER]).uuid" value="VALUE0">'+
'<input type="hidden" name="instance(EducationExpInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+
'<input type="hidden" name="instance(EducationExpInfo[NUMBER]).timeStamp" value="VALUE1">'+
'<input type="text" name="instance(EducationExpInfo[NUMBER]).school" value="VALUE2" style="width:210px" validate="true">&nbsp;<font color="#996633">*</font></td>'+
'<td width="120"><input type="text" name="instance(EducationExpInfo[NUMBER]).degree" value="VALUE3" style="width:90px" validate="true">&nbsp;<font color="#996633">*</font></td>'+
'<td width="120">&nbsp;<input type="text" name="instance(EducationExpInfo[NUMBER]).beginDate" class="datepicker" format="all" value="VALUE4" validate="true"/>&nbsp;<font color="#996633">*</font></td>'+
'<td width="120">&nbsp;<input type="text" name="instance(EducationExpInfo[NUMBER]).endDate" class="datepicker" format="all" value="VALUE5" validate="true"/>&nbsp;<font color="#996633">*</font></td>'+
'<td width="120" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
'</tr>';
</script>
<div style="font-family:黑体;font-size:20px;">编辑学生信息</div>
<br>
<s:iterator value="#request.student">
<form id="formA">
<input type="hidden" name="instance(Person).uuid" value="<s:property value='person.uuid' />" />
<input type="hidden" name="instance(Person).timeStamp" value="<s:property value='person.timeStamp' />" />
<input type="hidden" name="instance(Student).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Student).timeStamp" value="<s:property value='timeStamp' />" />
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="110">学生编号</th>
		<td width="130"><input type="text" name="instance(Student).studentID" value="<s:property value='studentID' />" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="110">学生姓名</th>
		<td width="130"><input name="instance(Person).name" value="<s:property value='person.name' />" style="width:90px" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;</td>
		<th width="110">性别</th>
		<td width="130"><label name="instance(Person).genderUuid" value="<s:property value='person.genderUuid' />" class="BaseTree" javaClassName="Gender" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="110">出生日期</th>
		<td width="130"><input type="text" name="instance(Person).birthDate" value="<s:date name='person.birthDate' format='yyyy-MM-dd' />" class="datepicker" format="all" validate="true"/>&nbsp;<font color="#996633">*</font></td>
		<th width="110">民族</th>
		<td width="130"><label name="instance(Person).nationalityUuid" value="<s:property value='person.nationalityUuid' />" class="BaseTree" javaClassName="Nationality"></label></td>
		<th width="110">婚否</th>
		<td width="130"><label type="text" name="instance(Person).marriageUuid" value="<s:property value='person.marriageUuid' />" class="BaseTree" javaClassName="MarriageState" /></label></td>
	</tr>
	<tr>
		<th width="110">最高学历</th>
		<td width="130"><label name="instance(Person).educationUuid" value="<s:property value='person.educationUuid' />" class="BaseTree" javaClassName="Education" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="110">家长姓名</th>
		<td width="130"><input name="instance(Person).parentName" value="<s:property value='person.parentName' />" style="width:90px" /></td>
		<th width="110">家长电话</th>
		<td width="130"><input name="instance(Person).parentPhone" value="<s:property value='person.parentPhone' />" style="width:90px"/></td>
	</tr>
	<tr>
		<th width="110">政治面貌</th>
		<td width="130"><label name="instance(Person).politicalUuid" value="<s:property value='person.politicalUuid' />" class="BaseTree" javaClassName="Political"></label></td>
		<th width="110" >身份证号</th>
		<td width="370" colspan="3" ><input type="text" name="instance(Person).idNo" value="<s:property value='person.idNo' />" style="width:330px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="110">电话</th>
		<td width="130"><input type="text" name="instance(Person).cellPhone" value="<s:property value='person.cellPhone' />" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="110" >身份证住址</th>
		<td width="370" colspan="3" ><input type="text" name="instance(Person).address"  value="<s:property value='person.address' />" style="width:330px"  /></td>
	</tr>
	<tr>
		<th width="110">QQ</th>
		<td width="130"><input type="text" name="instance(Person).qq"  value="<s:property value='person.qq' />" style="width:90px"  /></td>
		<th width="110" >实际居住住址</th>
		<td width="370" colspan="3" ><input type="text" name="instance(Person).realAddress"   value="<s:property value='person.realAddress' />" style="width:330px" /></td>
	</tr>
</table>
<table  id="educationExp" style="margin-top:20px" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="720" colspan="7">教育经历</th>
	</tr>
	<tr>
		<th width="240">学校</th>
		<th width="120">学习内容</th>
		<th width="120">开始时间</th>
		<th width="120">结束时间</th>
		<th width="120"><input type="button" value="增加" onclick="createInfoStar('educationHistory',educationHistoryStr,'0',['','','','','',''])" /></th>
	</tr>
	<tbody id="educationHistory"></tbody>
</table>
<s:iterator value="#request.educationExpInfoList">
	<script>
		createInfoStarChange("educationExp",educationHistoryStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='school' />","<s:property value='degree' />","<s:date name='beginDate' format='yyyy-MM-dd' />","<s:date name='endDate' format='yyyy-MM-dd' />"]);
	</script>
</s:iterator>
<table style="margin-top:20px" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
<tr>
	<th width="110">特殊专长</th>
	<td width="610" colspan="5"><textarea name="instance(Person).specialExpertise" style="width:590px;height:80px" /><s:property value='person.specialExpertise' /></textarea></td>
</tr>
<tr>
	<th width="110">外语及<br>熟练程度</th>
	<td width="610" colspan="5"><textarea name="instance(Person).foreignLanguageAndQualification" style="width:590px;height:80px" /><s:property value='person.foreignLanguageAndQualification' /></textarea></td>
</tr>
<tr>
	<th width="110">备注</th>
	<td width="610" colspan="5"><textarea name="instance(Student).note" style="width:590px;height:80px" /><s:property value='note' /></textarea></td>
</tr>
</table>
<br>
</form>
</s:iterator>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/student/manage/student/info/query_students.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
