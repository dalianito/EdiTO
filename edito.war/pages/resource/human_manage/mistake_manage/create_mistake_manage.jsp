<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建员工差错</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/mistake_manage/create_mistake.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/mistake/manage/create_mistake.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/mistake/manage/query_mistake_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 差 错 管 理</div>
<br><br><br>
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">标题：</th>
		<td width="480"><input type="text" name="instance(Mistake).title" style="width:440px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th>内容：</th>
		<td><textarea name="instance(Mistake).content" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th>记录人：</th>
		<td>
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/mistake/manage/query_mistake_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
