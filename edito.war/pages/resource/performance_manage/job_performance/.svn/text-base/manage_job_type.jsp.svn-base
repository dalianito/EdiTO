<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>岗位绩效设置</title>
</head>
<body>

<script>
function getSystemTypes(){
	$.post(cp+"/ajaxs/resource/performance/manage/job/performance/get_system_type.html",{},function(data){
		fillTypesDiv(data, "systemTypesDiv");
	},"json")
}
function fillTypesDiv(result, divId){
	var typesDiv = $("#"+divId);
	var htmlStr = "";
	var prep = "&nbsp;&nbsp;";
	if(result=="1"){
		typesDiv.html("该岗位没有绩效类型！");
	}
	else{
		htmlStr = compMenuHtml(result, htmlStr, prep, divId);
		typesDiv.html(htmlStr);
	}
}
function compMenuHtml(types, html, prep, divId){
	prep+="&nbsp;&nbsp;";
	for(var i=0;i<types.length;i++){
		var type = types[i];
		var href = "";

		if (type.child==0&&divId=="systemTypesDiv"){
			href = "<a href='javascript:createJobType(\""+ type.uuid +"\")'>增加</a>";
		}
		if(divId=="jobTypesDiv"){
			href = "<a href='javascript:deleteJobType(\""+ type.uuid +"\")'>删除</a>";
		}
		var eleStr = "<div id='type_"+type.id+"'>"+prep+type.sequence.replace(/\b(0+)/gi,"")+". "+type.description+"&nbsp;&nbsp;"+href+"</div>";
		html+=eleStr;
		html = compMenuHtml(type.childrens, html, prep, divId);
	}
	return html;
}
function createJobType(typeUuid){
	var jobUuid = $("#jobUuid").val();
	var param = {};
	param["uuid"]=typeUuid;
	param["jobUuid"]=jobUuid;
	$.post(cp+"/ajaxs/resource/performance/manage/job/performance/create_job_type.html",param,function(){
		var param2 = new Array()
		param2.push({name:"uuid",value:jobUuid});
		getJobTypes(param2);
	})
}
function deleteJobType(typeUuid){
	var jobUuid = $("#jobUuid").val();
	if(jobUuid!=""){
		var param = {};
		param["uuid"]=typeUuid;
		param["jobUuid"]=jobUuid;
		$.post(cp+"/ajaxs/resource/performance/manage/job/performance/delete_job_type.html",param,function(){
			var param2 = new Array()
			param2.push({name:"uuid",value:jobUuid});
			getJobTypes(param2);
		})
    }
}
function getJobTypes(param){
	$.post(cp+"/ajaxs/resource/performance/manage/job/performance/get_job_type.html",param,function(data){
		$("#allFuns").text("("+data["jobName"]+")"+"所拥有的绩效类型");
		fillTypesDiv(data["types"], "jobTypesDiv");
	},"json")
}
function goBack(){
	if(confirm("注意：如果您做了修改，这些修改将被保存，您确认返回吗？")){
		location.href = cp+"/pages/resource/performance/manage/job/performance/query_job_performance.html";
	}
}
$(document).ready(function(){
	getSystemTypes();
	var uuid = $("#jobUuid").val();
	var param = new Array();
	param.push({name:"uuid",value:uuid});
	getJobTypes(param);	
});
</script>
<input type="hidden" id="jobUuid" value="<s:property value='#request.job.uuid' />" />
<div style="font-family:黑体;font-size:20px;">&nbsp;岗 位 绩 效 设 置</div>
<br><br><br>
<table>
	<tr>
		<td style="vertical-align:top">
		<table width="370" border="0" cellpadding="0" cellspacing="0"
			class="InputPanel">
			<tr>
				<th>本系统的所有绩效类型</th>
			</tr>
			<tr>
				<td>
				<div id="systemTypesDiv"></div>
				</td>
			</tr>
		</table>
		</td>
		<td style="vertical-align:top">
		<table width="370" border="0" cellpadding="0" cellspacing="0"
			class="InputPanel">
			<tr>
				<th>
				<div id="allFuns">所拥有的绩效类型</div>
				</th>
			</tr>
			<tr>
				<td>
				<div id="jobTypesDiv"></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>
<a href="javascript:goBack()" >
<img src="<%=request.getContextPath()%>/images/button/b_back.gif" /></a>
</body>
</html>
