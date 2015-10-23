<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看员工绩效</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
</head>

<body class="BodyView">
<script>
$(document).ready(function(){
	for(var i=0; i<16; i++){
		var num = parseInt($("#perfAttendanceNum"+i+"_0").html())+parseInt($("#perfAttendanceNum"+i+"_1").html());
		$("#perfAttendanceNum"+i).html(num);
	}
	for(var i=4; i<13; i++){
		var num = parseInt($("#perfBehaviourNum"+i+"_0").html())+parseInt($("#perfBehaviourNum"+i+"_1").html())+parseInt($("#perfBehaviourNum"+i+"_2").html());
		$("#perfBehaviourNum"+i).html(num);
	}
});
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_performance.gif"></p>
<s:iterator value="#request.employee">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">员工信息</th>
	</tr>
	<tr>
		<th width="80">员工号：</th>
		<td width="120"><s:property value="person.personNo" />&nbsp;</td>
		<th width="80">姓名：</th>
		<td width="120"><s:property value="person.name" />&nbsp;</td>
		<th width="80">性别：</th>
		<td width="120"><s:property value="person.gender.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">出生日期：</th>
		<td width="120"><s:date name="person.birthDate" format="yyyy-MM-dd" />&nbsp;</td>
		<th width="80">民族：</th>
		<td width="120"><s:property value="person.nationality.description" />&nbsp;</td>
		<th width="80">国籍：</th>
		<td width="120"><s:property value="person.country.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">身份证号：</th>
		<td width="320" colspan="3"><s:property value="person.idNo" />&nbsp;</td>
		<th width="80">学历：</th>
		<td width="120"><s:property value="person.education.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">校区：</th>
		<td width="120"><s:property value="campus.description" />&nbsp;</td>
		<th width="80">岗位：</th>
		<td width="120"><s:property value="job.description" />&nbsp;</td>
		<th width="80">组织机构：</th>
		<td width="120"><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">政治面貌：</th>
		<td width="120"><s:property value="person.political.description" />&nbsp;</td>
		<th width="80">手机：</th>
		<td width="120"><s:property value="person.cellPhone" />&nbsp;</td>
		<th width="80">工作电话：</th>
		<td width="120"><s:property value="person.workPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">电子邮件：</th>
		<td width="320" colspan="3"><s:property value="person.email" />&nbsp;</td>
		<th width="80">入职时间：</th>
		<td width="120"><s:date name="fromDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<div style="color:red;font-weight:bold">月度绩效考核表(<s:property value="#request.month" />)</div>
<br>
<s:iterator value="#request.perfAttendance">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效考勤</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520" style="padding-top:5px;padding-bottom:5px;line-height:20px">
			正常：<div id="perfAttendanceNum0" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum0_0" style="display:inline;width:15px"><s:property value="perfAttendanceM0" /></div>&nbsp;次；下午：<div id="perfAttendanceNum0_1" style="display:inline;width:15px"><s:property value="perfAttendanceA0" /></div>&nbsp;次)<br>
			上课：<div id="perfAttendanceNum14" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum14_0" style="display:inline;width:15px"><s:property value="perfAttendanceM14" /></div>&nbsp;次；下午：<div id="perfAttendanceNum14_1" style="display:inline;width:15px"><s:property value="perfAttendanceA14" /></div>&nbsp;次)<br>
			公休：<div id="perfAttendanceNum1" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum1_0" style="display:inline;width:15px"><s:property value="perfAttendanceM1" /></div>&nbsp;次；下午：<div id="perfAttendanceNum1_1" style="display:inline;width:15px"><s:property value="perfAttendanceA1" /></div>&nbsp;次)<br>
			串休：<div id="perfAttendanceNum2" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_0" style="display:inline;width:15px"><s:property value="perfAttendanceM2" /></div>&nbsp;次；下午：<div id="perfAttendanceNum2_1" style="display:inline;width:15px"><s:property value="perfAttendanceA2" /></div>&nbsp;次)<br>
			分校：<div id="perfAttendanceNum3" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum3_0" style="display:inline;width:15px"><s:property value="perfAttendanceM3" /></div>&nbsp;次；下午：<div id="perfAttendanceNum3_1" style="display:inline;width:15px"><s:property value="perfAttendanceA3" /></div>&nbsp;次)<br>
			外出：<div id="perfAttendanceNum4" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum4_0" style="display:inline;width:15px"><s:property value="perfAttendanceM4" /></div>&nbsp;次；下午：<div id="perfAttendanceNum4_1" style="display:inline;width:15px"><s:property value="perfAttendanceA4" /></div>&nbsp;次)<br>
			迟到：<div id="perfAttendanceNum5" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum5_0" style="display:inline;width:15px"><s:property value="perfAttendanceM5" /></div>&nbsp;次；下午：<div id="perfAttendanceNum5_1" style="display:inline;width:15px"><s:property value="perfAttendanceA5" /></div>&nbsp;次)<br>
			早退：<div id="perfAttendanceNum6" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum6_0" style="display:inline;width:15px"><s:property value="perfAttendanceM6" /></div>&nbsp;次；下午：<div id="perfAttendanceNum6_1" style="display:inline;width:15px"><s:property value="perfAttendanceA6" /></div>&nbsp;次)<br>
			旷工：<div id="perfAttendanceNum7" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum7_0" style="display:inline;width:15px"><s:property value="perfAttendanceM7" /></div>&nbsp;次；下午：<div id="perfAttendanceNum7_1" style="display:inline;width:15px"><s:property value="perfAttendanceA7" /></div>&nbsp;次)<br>
			事假：<div id="perfAttendanceNum8" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum8_0" style="display:inline;width:15px"><s:property value="perfAttendanceM8" /></div>&nbsp;次；下午：<div id="perfAttendanceNum8_1" style="display:inline;width:15px"><s:property value="perfAttendanceA8" /></div>&nbsp;次)<br>
			病假：<div id="perfAttendanceNum9" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum9_0" style="display:inline;width:15px"><s:property value="perfAttendanceM9" /></div>&nbsp;次；下午：<div id="perfAttendanceNum9_1" style="display:inline;width:15px"><s:property value="perfAttendanceA9" /></div>&nbsp;次)<br>
			丧假：<div id="perfAttendanceNum10" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum10_0" style="display:inline;width:15px"><s:property value="perfAttendanceM10" /></div>&nbsp;次；下午：<div id="perfAttendanceNum10_1" style="display:inline;width:15px"><s:property value="perfAttendanceA10" /></div>&nbsp;次)<br>
			婚假：<div id="perfAttendanceNum11" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum11_0" style="display:inline;width:15px"><s:property value="perfAttendanceM11" /></div>&nbsp;次；下午：<div id="perfAttendanceNum11_1" style="display:inline;width:15px"><s:property value="perfAttendanceA11" /></div>&nbsp;次)<br>
			产假：<div id="perfAttendanceNum15" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum15_0" style="display:inline;width:15px"><s:property value="perfAttendanceM15" /></div>&nbsp;次；下午：<div id="perfAttendanceNum15_1" style="display:inline;width:15px"><s:property value="perfAttendanceA15" /></div>&nbsp;次)<br>
			出差：<div id="perfAttendanceNum12" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum12_0" style="display:inline;width:15px"><s:property value="perfAttendanceM12" /></div>&nbsp;次；下午：<div id="perfAttendanceNum12_1" style="display:inline;width:15px"><s:property value="perfAttendanceA12" /></div>&nbsp;次)<br>
			其他：<div id="perfAttendanceNum13" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfAttendanceNum13_0" style="display:inline;width:15px"><s:property value="perfAttendanceM13" /></div>&nbsp;次；下午：<div id="perfAttendanceNum13_1" style="display:inline;width:15px"><s:property value="perfAttendanceA13" /></div>&nbsp;次)<br>
			晚上休息：<s:property value="perfAttendanceE0" />&nbsp;次；晚上上课：<s:property value="perfAttendanceE1" />&nbsp;次；晚上值班：<s:property value="perfAttendanceE2" />&nbsp;次
		</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfBehaviour">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效行为规范</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520" style="padding-top:5px;padding-bottom:5px;line-height:20px">
			日志：<div id="perfBehaviourNum0" style="display:inline;width:15px"><s:property value="perfBehaviour0" /></div>&nbsp;篇(应写&nbsp;<s:property value="perfBehaviourS0" />&nbsp;篇)&nbsp;&nbsp;&nbsp;&nbsp;发帖：<div id="perfBehaviourNum1" style="display:inline;width:15px"><s:property value="perfBehaviour1" /></div>&nbsp;条(应发&nbsp;<s:property value="perfBehaviourS1" />&nbsp;条)<br>
			缺席早会：<div id="perfBehaviourNum2" style="display:inline;width:15px"><s:property value="perfBehaviour2" /></div>&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;缺席夕会：<div id="perfBehaviourNum3" style="display:inline;width:15px"><s:property value="perfBehaviour3" /></div>&nbsp;次<br>
			工装：<div id="perfBehaviourNum4" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum4_0" style="display:inline;width:15px"><s:property value="perfBehaviourM4" /></div>&nbsp;次；下午：<div id="perfBehaviourNum4_1" style="display:inline;width:15px"><s:property value="perfBehaviourA4" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum4_2" style="display:inline;width:15px"><s:property value="perfBehaviourE4" /></div>&nbsp;次)<br>
			工牌：<div id="perfBehaviourNum5" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum5_0" style="display:inline;width:15px"><s:property value="perfBehaviourM5" /></div>&nbsp;次；下午：<div id="perfBehaviourNum5_1" style="display:inline;width:15px"><s:property value="perfBehaviourA5" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum5_2" style="display:inline;width:15px"><s:property value="perfBehaviourE5" /></div>&nbsp;次)<br>
			卫生：<div id="perfBehaviourNum6" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum6_0" style="display:inline;width:15px"><s:property value="perfBehaviourM6" /></div>&nbsp;次；下午：<div id="perfBehaviourNum6_1" style="display:inline;width:15px"><s:property value="perfBehaviourA6" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum6_2" style="display:inline;width:15px"><s:property value="perfBehaviourE6" /></div>&nbsp;次)<br>
			脱岗：<div id="perfBehaviourNum7" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum7_0" style="display:inline;width:15px"><s:property value="perfBehaviourM7" /></div>&nbsp;次；下午：<div id="perfBehaviourNum7_1" style="display:inline;width:15px"><s:property value="perfBehaviourA7" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum7_2" style="display:inline;width:15px"><s:property value="perfBehaviourE7" /></div>&nbsp;次)<br>
			吃东西：<div id="perfBehaviourNum8" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum8_0" style="display:inline;width:15px"><s:property value="perfBehaviourM8" /></div>&nbsp;次；下午：<div id="perfBehaviourNum8_1" style="display:inline;width:15px"><s:property value="perfBehaviourA8" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum8_2" style="display:inline;width:15px"><s:property value="perfBehaviourE8" /></div>&nbsp;次)<br>
			看电影：<div id="perfBehaviourNum9" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum9_0" style="display:inline;width:15px"><s:property value="perfBehaviourM9" /></div>&nbsp;次；下午：<div id="perfBehaviourNum9_1" style="display:inline;width:15px"><s:property value="perfBehaviourA9" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum9_2" style="display:inline;width:15px"><s:property value="perfBehaviourE9" /></div>&nbsp;次)<br>
			听歌：<div id="perfBehaviourNum10" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum10_0" style="display:inline;width:15px"><s:property value="perfBehaviourM10" /></div>&nbsp;次；下午：<div id="perfBehaviourNum10_1" style="display:inline;width:15px"><s:property value="perfBehaviourA10" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum10_2" style="display:inline;width:15px"><s:property value="perfBehaviourE10" /></div>&nbsp;次)<br>
			睡觉：<div id="perfBehaviourNum11" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum11_0" style="display:inline;width:15px"><s:property value="perfBehaviourM11" /></div>&nbsp;次；下午：<div id="perfBehaviourNum11_1" style="display:inline;width:15px"><s:property value="perfBehaviourA11" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum11_2" style="display:inline;width:15px"><s:property value="perfBehaviourE11" /></div>&nbsp;次)<br>
			其他娱乐：<div id="perfBehaviourNum12" style="display:inline;width:15px"></div>&nbsp;次(上午：<div id="perfBehaviourNum12_0" style="display:inline;width:15px"><s:property value="perfBehaviourM12" /></div>&nbsp;次；下午：<div id="perfBehaviourNum12_1" style="display:inline;width:15px"><s:property value="perfBehaviourA12" /></div>&nbsp;次；晚上：<div id="perfBehaviourNum12_2" style="display:inline;width:15px"><s:property value="perfBehaviourE12" /></div>&nbsp;次)<br>
			投诉：<div id="perfBehaviourNum13" style="display:inline;width:15px"><s:property value="perfBehaviour13" /></div>&nbsp;次<br>
		</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfReception">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效接待管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfFacility">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效设施管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfMaterial">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效物资管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfFinancial">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效财务管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfLession">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效课时统计</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfTeaching">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效教学达成</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfChildren">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效少儿部门考核</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfLongTerm">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效长期班学员及班级管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfShortTerm">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效短期班班主任及教务管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfObtain">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效就业管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfRecruit">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效招生任务</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfPropaganda">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效市场宣传</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfAdmin">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效行政管理</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfIncharge">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效分校及部门负责人</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfDriver">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效司机及总务</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfSecurityClean">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效保洁保安</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<s:iterator value="#request.perfOther">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="80">考核项目：</th>
		<td width="520">绩效其他</td>
	</tr>
	<tr>
		<th width="80">考核内容：</th>
		<td width="520">&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核结果：</th>
		<td style="width:520px;height:100px;vertical-align:top"><s:property value="result" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核人：</th>
		<td width="520"><s:property value="checker.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="80">考核时间：</th>
		<td width="520"><s:date name="checkTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
