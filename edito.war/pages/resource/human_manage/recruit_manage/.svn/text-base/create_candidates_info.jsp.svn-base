<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>新建应聘员工</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/recruit_manage/create_candidates.xml");

function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认创建？")){
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/human/manage/recruit/manage/create_candidates.html",param,function(){
				location.href = cp+"/pages/resource/human/manage/recruit/manage/query_recruit_manage.html";
			})
		}
	}
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
var workExperienceStr = '<tr iTOType="info">'+ 
	'<td width="40"><input type="hidden" name="instance(WorkExperienceInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(WorkExperienceInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(WorkExperienceInfo[NUMBER]).sequence" value="VALUE1" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="130"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).name" value="VALUE2" style="width:105px" ></td>'+ 
	'<td width="100"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).position" value="VALUE3" style="width:75px" ></td>'+ 
	'<td width="70"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).reference" value="VALUE4" style="width:45px" ></td>'+ 
	'<td width="80"><input type="text" name="instance(WorkExperienceInfo[NUMBER]).referencePhone" value="VALUE5" style="width:55px" ></td>'+ 
	'<td width="260"><br><label type="text" name="instance(WorkExperienceInfo[NUMBER]).beginDate" class="DateTimeSingle" format="all" value="VALUE6"></label>&nbsp;-&nbsp;<label type="text" name="instance(WorkExperienceInfo[NUMBER]).endDate" class="DateTimeSingle" format="all" value="VALUE7"></label><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
var educateStr = '<tr iTOType="info">'+ 
	'<td width="40"><input type="hidden" name="instance(EducateInfo[NUMBER]).uuid" value="VALUE0">'+ 
	'<input type="hidden" name="instance(EducateInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+ 
	'<input type="text" name="instance(EducateInfo[NUMBER]).sequence" value="VALUE1" style="width:15px" validate="true" >&nbsp;<font color="#996633">*</font></td>'+ 
	'<td width="130"><input type="text" name="instance(EducateInfo[NUMBER]).graduateSchool" value="VALUE2" style="width:105px" ></td>'+ 
	'<td width="100"><input type="text" name="instance(EducateInfo[NUMBER]).professional" value="VALUE3" style="width:75px" ></td>'+ 
	'<td width="70"><input type="text" name="instance(EducateInfo[NUMBER]).reference" value="VALUE4" style="width:45px" ></td>'+ 
	'<td width="80"><input type="text" name="instance(EducateInfo[NUMBER]).referencePhone" value="VALUE5" style="width:55px" ></td>'+ 
	'<td width="260"><br><label type="text" name="instance(EducateInfo[NUMBER]).beginDate" class="DateTimeSingle" format="all" value="VALUE6"></label>&nbsp;-&nbsp;<label type="text" name="instance(EducateInfo[NUMBER]).endDate" class="DateTimeSingle" format="all" value="VALUE7"></label><br><br></td>'+ 
	'<td width="60" style="text-align:center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td>'+
	'</tr>';
</script>

<div style="font-family:黑体;font-size:20px;">&nbsp;招 聘 管 理</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="instance(Candidates).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>"/>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="6">基本信息</th>
	</tr>
	<tr>
		<td width="90">姓名</td>
		<td width="120"><input name="instance(Person).name" style="width:90px" validate="true" >&nbsp;<font color="#996633">*</font>&nbsp;</td>
		<td width="90">性别</td>
		<td width="120"><label name="instance(Person).genderUuid" class="BaseTree" javaClassName="Gender" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">出生日期</td>
		<td><label type="text" name="instance(Person).birthDate" class="DateTimeSingle" format="all"></label></td>
	</tr>
	<tr>
		<td width="90">籍贯</td>
		<td width="120"><input type="text" name="instance(Person).nativePlace" style="width:90px" /></td>
		<td width="90">民族</td>
		<td width="120"><label name="instance(Person).nationalityUuid" class="BaseTree" javaClassName="Nationality"></label></td>
		<td width="90">身份证号</td>
		<td><input type="text" name="instance(Person).idNo" style="width:90px" /></td>
	</tr>
	<tr>
		<td width="90">居住地址</td>
		<td width="120"><input type="text" name="instance(Person).address" style="width:90px" validate="true" />&nbsp;</td>
		<td width="90">工作年限</td>
		<td width="120"><input name="instance(Candidates).years" style="width:90px" validate="true" ></td>
		<td width="90">学历</td>
		<td><label name="instance(Person).educationUuid" class="BaseTree" javaClassName="Education" ></label></td>
	</tr>
	<tr>
		<td width="90">政治面貌</td>
		<td width="120"><label name="instance(Person).politicalUuid" class="BaseTree" javaClassName="Political"></label></td>
		<td width="90">应聘岗位</td>
		<td width="120"><input type="text" name="instance(Candidates).post" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">期望薪酬</td>
		<td><input type="text" name="instance(Candidates).pay" style="width:90px" />&nbsp;</td>
	</tr>
	<tr>
		<td width="90">兴趣爱好</td>
		<td width="120"><input type="text" name="instance(Candidates).hobby" style="width:90px" validate="true" />&nbsp;</td>
		<td width="90">手机</td>
		<td width="120"><input type="text" name="instance(Person).cellPhone" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<td width="90">电子邮件</td>
		<td><input type="text" name="instance(Person).email" style="width:90px" />&nbsp;</td>
	</tr>
	<tr>
		<td width="90">应聘状态</td>
		<td width="120"><label name="instance(Candidates).recruitStateUuid" class="BaseTree" javaClassName="RecruitState" validate="true" ifHasRelated="true"></label>&nbsp;<font color="#996633">*</font></td>
		<td width="90">邀约时间</td>
		<td width="330" colspan="3"><div id="inviteDateHide" style="color:red">无</div><div id="inviteDateShow" style="display:none"><label type="text" name="instance(Candidates).inviteDate" class="DateTimeMultiple" format="Hm"></label></div></td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">工作经历</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="130">单位名称</th>
		<th width="100">职务</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">任职时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStar('WORKEXPERIENCE',workExperienceStr,'0',['','','','','','','',''])" /></th>
	</tr>
	<tbody id="WORKEXPERIENCE"></tbody>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740" colspan="7">教育背景</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="130">毕业院校</th>
		<th width="100">所属专业</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="260">时间</th>
		<th width="60"><input type="button" value="增加" onclick="createInfoStar('EDUCATE',educateStr,'0',['','','','','','','',''])" /></th>
	</tr>
	<tbody id="EDUCATE"></tbody>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="740">资格证书</th>
	</tr>
	<tr>
		<td width="740">
			<textarea name="instance(Candidates).certificate" style="width:720px;height:80px" /></textarea><br><br>
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
			<textarea name="instance(Candidates).remarks" style="width:720px;height:80px" /></textarea><br><br>
		</td>
	</tr>
</table>
<br>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/recruit/manage/query_recruit_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
