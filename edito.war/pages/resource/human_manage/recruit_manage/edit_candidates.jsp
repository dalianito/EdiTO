<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑应聘员工</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
Validation.init("resource/human_manage/recruit_manage/create_candidates.xml");

$(document).ready(function(){
	showRelatedContent();
});
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认操作？")){
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/human/manage/recruit/manage/create_candidates.html",param,function(){
				location.href = cp+"/pages/resource/human/manage/recruit/manage/query_recruit_manage.html";
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
function showRelatedContent(){
	var recruitStateUuid = $("label[name='instance(Candidates).recruitStateUuid']").val();
	if((recruitStateUuid == "<%=Constants.RECRUITSTATE_TBINVITED%>") || (recruitStateUuid == "<%=Constants.RECRUITSTATE_AOTJOB%>") || (recruitStateUuid == "")) {
		$("#inviteDateHide").css("display","inline");
		$("#inviteDateShow").css("display","none");
	}
	else
	{
		$("#inviteDateShow").css("display","inline");
		$("#inviteDateHide").css("display","none");
	}
}
var workExperienceStr = '<tr>'+ 
	'<td width="40"><input type="hidden" name="instance(WorkExperienceInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(WorkExperienceInfo[NUMBER]).timeStamp" value="VALUE1">'+ 
	'<input type="hidden" name="instance(WorkExperienceInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(WorkExperienceInfo[NUMBER]).sequence" value="VALUE2" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="130"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).name" value="VALUE3" style="width:105px" ></td>'+ 
	'<td width="100"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).position" value="VALUE4" style="width:75px" ></td>'+ 
	'<td width="70"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).reference" value="VALUE5" style="width:45px" ></td>'+ 
	'<td width="80"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).referencePhone" value="VALUE6" style="width:55px" ></td>'+ 
	'<td width="260"><br><label type="text" name="instance(WorkExperienceInfo[NUMBER]).beginDate" class="DateTimeSingle" format="all" value="VALUE7"></label>&nbsp;-&nbsp;<label type="text" name="instance(WorkExperienceInfo[NUMBER]).endDate" class="DateTimeSingle" format="all" value="VALUE8"></label><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
var educateStr = '<tr>'+ 
	'<td width="40"><input type="hidden" name="instance(EducateInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(EducateInfo[NUMBER]).timeStamp" value="VALUE1">'+ 
	'<input type="hidden" name="instance(EducateInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(EducateInfo[NUMBER]).sequence" value="VALUE2" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="130"><input type="text" name="instance(EducateInfo[NUMBER]).graduateSchool" value="VALUE3" style="width:105px" ></td>'+ 
	'<td width="100"><input type="text" name="instance(EducateInfo[NUMBER]).professional" value="VALUE4" style="width:75px" ></td>'+ 
	'<td width="70"><input type="text" name="instance(EducateInfo[NUMBER]).reference" value="VALUE5" style="width:45px" ></td>'+ 
	'<td width="80"><input type="text" name="instance(EducateInfo[NUMBER]).referencePhone" value="VALUE6" style="width:55px" ></td>'+ 
	'<td width="260"><br><label type="text" name="instance(EducateInfo[NUMBER]).beginDate" class="DateTimeSingle" format="all" value="VALUE7"></label>&nbsp;-&nbsp;<label type="text" name="instance(EducateInfo[NUMBER]).endDate" class="DateTimeSingle" format="all" value="VALUE8"></label><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;招 聘 管 理</div>
<br><br><br>
<s:iterator value="#request.candidates">
<form id="formA">
<input type="hidden" name="instance(Person).uuid" value="<s:property value='person.uuid' />" />
<input type="hidden" name="instance(Person).timeStamp" value="<s:property value='person.timeStamp' />" />
<input type="hidden" name="instance(Candidates).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Candidates).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Candidates).stateUuid" value="<s:property value='stateUuid' />" />
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="6">基本信息</th>
	</tr>
	<tr>
		<td width="90">姓名</td>
		<td width="120"><input type="text" name="instance(Person).name" value="<s:property value='person.name' />" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">性别</td>
		<td width="120"><label name="instance(Person).genderUuid" class="BaseTree" javaClassName="Gender" value="<s:property value='person.genderUuid' />" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">出生日期</td>
		<td><label type="text" name="instance(Person).birthDate" value="<s:date name='person.birthDate' format='yyyy-MM-dd' />" class="DateTimeSingle" format="all"></label></td>
	</tr>
	<tr>
		<td width="90">籍贯</td>
		<td width="120"><input type="text" name="instance(Person).nativePlace" value="<s:property value='person.nativePlace' />" style="width:90px" /></td>
		<td width="90">民族</td>
		<td width="120"><label name="instance(Person).nationalityUuid" class="BaseTree" javaClassName="Nationality" value="<s:property value='person.nationalityUuid' />"></label></td>
		<td width="90">身份证号</td>
		<td><input type="text" name="instance(Person).idNo" style="width:90px" value="<s:property value='person.idNo' />" /></td>
	</tr>
	<tr>
		<td width="90">居住地址</td>
		<td width="120"><input type="text" name="instance(Person).address" value="<s:property value='person.address' />" style="width:90px" validate="true" />&nbsp;</td>
		<td width="90">学历</td>
		<td width="120"><label name="instance(Person).educationUuid" class="BaseTree" javaClassName="Education" value="<s:property value='person.educationUuid' />" ></label></td>
		<td width="90">工作年限</td>
		<td width="120"><input name="instance(Candidates).years" value="<s:property value='years' />" style="width:90px" ></td>
	</tr>
	<tr>
		<td width="90">政治面貌</td>
		<td><label name="instance(Person).politicalUuid" class="BaseTree" javaClassName="Political" value="<s:property value='person.politicalUuid' />"></label></td>
		<td width="90">应聘岗位</td>
		<td width="120"><input type="text" name="instance(Candidates).post" value="<s:property value='post' />" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">期望薪酬</td>
		<td><input type="text" name="instance(Candidates).pay" value="<s:property value='pay' />" style="width:90px" validate="true" />&nbsp;</td>
	</tr>
	<tr>
		<td width="90">兴趣爱好</td>
		<td width="120"><input type="text" name="instance(Candidates).hobby" value="<s:property value='hobby' />" style="width:90px" validate="true" />&nbsp;</td>
		<td width="90">手机</td>
		<td width="120"><input type="text" name="instance(Person).cellPhone" style="width:90px" value="<s:property value='person.cellPhone' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">电子邮件</td>
		<td width="120"><input type="text" name="instance(Person).email" style="width:90px" value="<s:property value='person.email' />" /></td>
	</tr>
	<tr>
		<td width="90">应聘状态</td>
		<td width="120"><label name="instance(Candidates).recruitStateUuid" class="BaseTree" javaClassName="RecruitState" value="<s:property value='recruitStateUuid' />" validate="true" ifHasRelated="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">邀约时间</td>
		<td width="330" colspan="3"><div id="inviteDateHide" style="color:red">无</div><div id="inviteDateShow" style="display:none"><label type="text" name="instance(Candidates).inviteDate" class="DateTimeMultiple" format="Hm" value="<s:date name='inviteDate' format='yyyy-MM-dd HH:mm:ss' />"></label></div></td>
	</tr>
</table>
<br>
<table id="workExperience" width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">工作经历信息</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="130">单位名称</th>
		<th width="100">职务</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">任职时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStarChange('workExperience',workExperienceStr,'0',['','','','','','','','',''])" /></th>
	</tr>
</table>
<s:iterator value="#request.workExperienceInfos">
	<script>
		createInfoStarChange("workExperience",workExperienceStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='sequence' />","<s:property value='name' />","<s:property value='position' />","<s:property value='reference' />","<s:property value='referencePhone' />","<s:date name='beginDate' format='yyyy-MM-dd' />","<s:date name='endDate' format='yyyy-MM-dd' />"]);
	</script>
</s:iterator>
<br>
<table id="educate" width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">教育背景信息</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="130">毕业院校</th>
		<th width="100">所属专业</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStarChange('educate',educateStr,'0',['','','','','','','','',''])" /></th>
	</tr>
</table>
<s:iterator value="#request.educateInfos">
	<script>
		createInfoStarChange("educate",educateStr,"1",["<s:property value='uuid' />","<s:property value='timeStamp' />","<s:property value='sequence' />","<s:property value='graduateSchool' />","<s:property value='professional' />","<s:property value='reference' />","<s:property value='referencePhone' />","<s:date name='beginDate' format='yyyy-MM-dd' />","<s:date name='endDate' format='yyyy-MM-dd' />"]);
	</script>
</s:iterator>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">资格证书</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Candidates).certificate" style="width:720px;height:80px" /><s:property value="certificate" /></textarea><br><br>
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
			<textarea name="instance(Candidates).remarks" style="width:720px;height:80px" /><s:property value="remarks" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/recruit/manage/query_recruit_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
