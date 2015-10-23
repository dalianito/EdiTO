<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
</head>
<body>
<script>
var mark = true;
function createInstance(){
	if(mark){
		if(confirm("确认操作？")){
			var employeeUuid = $("#employeeUuid").val();
			var authorityLevel = $("#authorityLevel").val();
			var uuid = $("#uuid").val();
			var notesOne = typeof($("#notesOne").val())=="undefined" ? "" : $("#notesOne").val();
			var checkStateOneUuid = typeof($("#checkStateOneUuid").val())=="undefined" ? "" : $("#checkStateOneUuid").val();
			var notesTwo = typeof($("#notesTwo").val())=="undefined" ? "" : $("#notesTwo").val();
			var checkStateTwoUuid = typeof($("#checkStateTwoUuid").val())=="undefined" ? "" : $("#checkStateTwoUuid").val();
			var notesThree = typeof($("#notesThree").val())=="undefined" ? "" : $("#notesThree").val();
			var checkStateThreeUuid = typeof($("#checkStateThreeUuid").val())=="undefined" ? "" : $("#checkStateThreeUuid").val();

			var data = {employeeUuid:employeeUuid,
						authorityLevel:authorityLevel,
						uuid:uuid,
						notesOne:notesOne,
						checkStateOneUuid:checkStateOneUuid,
						notesTwo:notesTwo,
						checkStateTwoUuid:checkStateTwoUuid,
						notesThree:notesThree,
						checkStateThreeUuid:checkStateThreeUuid};
			$.post(cp+"/whttps/wechat/approval/work/wechat_approval_leave.whtml", data, function(){
				goBack();
			});
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function goBack(){
	var employeeUuid = $("#employeeUuid").val();
	location.href = cp + "/whttps/wechat/approval/work/wechat_leave_approval.whtml_" + employeeUuid;
}
</script>
<input type="hidden" id="pageTitle" value="请 假 审 批" />
<br>
<s:iterator value="#request.leaveApplication">
<input type="hidden" id="employeeUuid" value="<s:property value='#request.employeeUuid' />" />
<input type="hidden" id="authorityLevel" value="<s:property value='#request.authorityLevel' />" />
<input type="hidden" id="uuid" value="<s:property value='uuid' />" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">申请人</th>
		<td width="70%"><s:property value="apply.applicant.person.name" /></td>
	</tr>
	<tr>
		<th width="30%">组织机构</th>
		<td width="70%"><s:property value="department.description" /></td>
	</tr>
	<tr>
		<th width="30%">校区</th>
		<td width="70%"><s:property value="campus.description" /></td>
	</tr>
	<tr>
		<th width="30%">请假类别</th>
		<td width="70%"><s:property value="leaveType.description" /></td>
	</tr>
	<tr>
		<th width="30%">请假事由</th>
		<td width="70%"><div style="min-height:110px"><s:property value="leaveReason" /></div></td>
	</tr>
	<tr>
		<th width="30%">开始时间</th>
		<td width="70%"><s:date name="fromDt" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="30%">结束时间</th>
		<td width="70%"><s:date name="toDt" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="30%">请假天数</th>
		<td width="70%"><s:property value="days" /></td>
	</tr>
	<s:if test="#request.authorityLevel=='level1' && checkStateOneUuid == null">
		<tr>
			<th width="30%">主管领导意见</th>
			<td width="70%"><textarea id="notesOne" style="width:95%;height:110px"></textarea></td>
		</tr>
		<tr>
			<th width="30%">审批结果</th>
			<td width="70%">
				<select id="checkStateOneUuid">
					<option value="10000000010070001001000000000020">通过</option>
					<option value="10000000010070001001000000000030">未通过</option>
				</select>
			</td>
		</tr>
	</s:if>
	<s:else>
		<tr>
			<th width="30%">主管领导意见</th>
			<td width="70%"><div style="min-height:110px"><s:property value="apply.notesOne" /></div></td>
		</tr>
		<tr>
			<th width="30%">审批结果</th>
			<td width="70%"><s:property value="apply.checkStateOne.description" /></td>
		</tr>		
	</s:else>
	<s:if test="#request.authorityLevel=='level2' && checkStateTwoUuid == null">
		<tr>
			<th width="30%">分校校长意见</th>
			<td width="70%"><textarea id="notesTwo" style="width:95%;height:110px"></textarea></td>
		</tr>
		<tr>
			<th width="30%">审批结果</th>
			<td width="70%">
				<select id="checkStateTwoUuid">
					<option value="10000000010070001001000000000020">通过</option>
					<option value="10000000010070001001000000000030">未通过</option>
				</select>
			</td>
		</tr>
	</s:if>
	<s:else>
		<tr>
			<th width="30%">分校校长意见</th>
			<td width="70%"><div style="min-height:110px"><s:property value="apply.notesTwo" /></div></td>
		</tr>
		<tr>
			<th width="30%">审批结果</th>
			<td width="70%"><s:property value="apply.checkStateTwo.description" /></td>
		</tr>		
	</s:else>
	<s:if test="#request.authorityLevel=='level3' && checkStateThreeUuid == null">
		<tr>
			<th width="30%">校长意见</th>
			<td width="70%"><textarea id="notesThree" style="width:95%;height:110px"></textarea></td>
		</tr>
		<tr>
			<th width="30%">审批结果</th>
			<td width="70%">
				<select id="checkStateThreeUuid">
					<option value="10000000010070001001000000000020">通过</option>
					<option value="10000000010070001001000000000030">未通过</option>
				</select>
			</td>
		</tr>
	</s:if>
	<s:else>
		<tr>
			<th width="30%">校长意见</th>
			<td width="70%"><div style="min-height:110px"><s:property value="apply.notesThree" /></div></td>
		</tr>
		<tr>
			<th width="30%">审批结果</th>
			<td width="70%"><s:property value="apply.checkStateThree.description" /></td>
		</tr>		
	</s:else>
</table>
</s:iterator>
<br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onclick="createInstance()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_back.gif" onClick="goBack()" />
<br><br>
</body>
</html>
