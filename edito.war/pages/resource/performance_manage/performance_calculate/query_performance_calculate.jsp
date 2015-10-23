<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="com.ito.edito.util.Constants"%>
<html>
<head>
	<title>员工绩效考核</title>
</head>
<body>
<script>
Validation.init("resource/performance_manage/performance_calculate/query_performance_calculate.xml");

function updateRelation(data){
	$("input[name='employeeNo']").val(data["employee"].person.personNo);
	$("input[name='employeeName']").val(data["employee"].person.name);
	if(data["employee"].person.genderUuid != null){
		$("#gender").html(data["employee"].person.gender.description);
	}
	if(data["employee"].departmentUuid != null){
		$("#department").html(data["employee"].department.description);
	}
	if(data["employee"].workPhone != null){
		$("#workPhone").html(data["employee"].workPhone);
	}
	$("#month").css("display", "inline");
}
function clearRelationData(relationId){
	if(relationId != "curEmployeeNo"){
		$("input[name='employeeNo']").val("");
	}
	if(relationId != "curEmployeeName"){
		$("input[name='employeeName']").val("");
	}
	$("#gender").html("");
	$("#department").html("");
	$("#workPhone").html("");
	$("#month").val("");
	$("#month").text("-选择日期-");
	$("#month").css("display", "none");
	$("#perfTable").css("display", "none");
	$("#title").css("display", "none");
	$("tbody[id^='perf']").each(function(){
		$(this).css("display", "none");
		$(this).attr("submit", false);
	});
}
function showTable(){
	$("#perfTable").css("display", "none");
	$("#title").css("display", "none");
	$("tbody[id^='perf']").each(function(){
		$(this).css("display", "none");
		$(this).attr("submit", false);
	});

	var employeeUuid = "";
	if($("input[name='noUuid']").val()!=""){
		employeeUuid = $("input[name='noUuid']").val();
	}
	if($("input[name='nameUuid']").val()!=""){
		employeeUuid = $("input[name='nameUuid']").val();
	}
	var month = $("#month").val();
	$.post(cp+"/ajaxs/resource/performance/manage/performance/calculate/get_employee_performance_edit.html",{employeeUuid:employeeUuid,month:month},function(data){
		if(data["employeePerformance"]=="no_licensed"){
			$("#perfNoLicensed").css("display", "inline");
		}
		else if(data["employeePerformance"]=="licensed"){
			$("#perfTitle").css("display", "inline");
			if(data["perfAttendance"] != null){
				for(var i=0; i<16; i++){
					$("#perfAttendanceNum1_"+i+"_0").val(data["attendance"][2*i+0]);
					$("#perfAttendanceNum1_"+i+"_1").val(data["attendance"][2*i+1]);
					$("#perfAttendanceNum1_"+i).html(data["attendance"][2*i+0]+data["attendance"][2*i+1]);
				}
				$("#perfAttendanceNum1_16_0").val(data["attendance"][32]);
				$("#perfAttendanceNum1_16_1").val(data["attendance"][33]);
				$("#perfAttendanceNum1_16_2").val(data["attendance"][34]);
				
				$("textarea[name='instance(PerfAttendance).result']").text("");

				$("#perfAttendance1").css("display", "inline");
				$("#perfAttendance1").attr("submit", true);
			}
			if(data["perfBehaviour"] != null){
				for(var i=0; i<4; i++){
					$("#perfBehaviourNum1_"+i).val(data["behaviour"][i]);
				}
				for(var i=4; i<13; i++){
					$("#perfBehaviourNum1_"+i+"_0").val(data["behaviour"][3*i-8]);
					$("#perfBehaviourNum1_"+i+"_1").val(data["behaviour"][3*i-7]);
					$("#perfBehaviourNum1_"+i+"_2").val(data["behaviour"][3*i-6]);
					$("#perfBehaviourNum1_"+i).val(data["behaviour"][3*i-8]+data["behaviour"][3*i-7]+data["behaviour"][3*i-6]);
				}
				$("#perfBehaviourNum1_13").val(0);
				$("#perfBehaviourNum1_14").val(data["behaviour"][31]);
				$("#perfBehaviourNum1_15").val(data["behaviour"][32]);
				$("textarea[name='instance(PerfBehaviour).result']").text("");

				$("#perfBehaviour1").css("display", "inline");
				$("#perfBehaviour1").attr("submit", true);
			}
			if(data["perfReception"] != null){
				$("#perfReception1").css("display", "inline");
				$("#perfReception1").attr("submit", true);
			}
			if(data["perfFacility"] != null){
				$("#perfFacility1").css("display", "inline");
				$("#perfFacility1").attr("submit", true);
			}
			if(data["perfMaterial"] != null){
				$("#perfMaterial1").css("display", "inline");
				$("#perfMaterial1").attr("submit", true);
			}
			if(data["perfFinancial"] != null){
				$("#perfFinancial1").css("display", "inline");
				$("#perfFinancial1").attr("submit", true);
			}
			if(data["perfLession"] != null){
				$("#perfLession1").css("display", "inline");
				$("#perfLession1").attr("submit", true);
			}
			if(data["perfTeaching"] != null){
				$("#perfTeaching1").css("display", "inline");
				$("#perfTeaching1").attr("submit", true);
			}
			if(data["perfChildren"] != null){
				$("#perfChildren1").css("display", "inline");
				$("#perfChildren1").attr("submit", true);
			}
			if(data["perfLongTerm"] != null){
				$("#perfLongTerm1").css("display", "inline");
				$("#perfLongTerm1").attr("submit", true);
			}
			if(data["perfShortTerm"] != null){
				$("#perfShortTerm1").css("display", "inline");
				$("#perfShortTerm1").attr("submit", true);
			}
			if(data["perfObtain"] != null){
				$("#perfObtain1").css("display", "inline");
				$("#perfObtain1").attr("submit", true);
			}
			if(data["perfRecruit"] != null){
				$("#perfRecruit1").css("display", "inline");
				$("#perfRecruit1").attr("submit", true);
			}
			if(data["perfPropaganda"] != null){
				$("#perfPropaganda1").css("display", "inline");
				$("#perfPropaganda1").attr("submit", true);
			}
			if(data["perfAdmin"] != null){
				$("#perfAdmin1").css("display", "inline");
				$("#perfAdmin1").attr("submit", true);
			}
			if(data["perfIncharge"] != null){
				$("#perfIncharge1").css("display", "inline");
				$("#perfIncharge1").attr("submit", true);
			}
			if(data["perfDriver"] != null){
				$("#perfDriver1").css("display", "inline");
				$("#perfDriver1").attr("submit", true);
			}
			if(data["perfSecurityClean"] != null){
				$("#perfSecurityClean1").css("display", "inline");
				$("#perfSecurityClean1").attr("submit", true);
			}
			if(data["perfOther"] != null){
				$("#perfOther1").css("display", "inline");
				$("#perfOther1").attr("submit", true);
			}
		}
		else if(data["employeePerformance"]=="created"){
			$("#perfTitle").css("display", "inline");
			if(data["perfAttendance"] != null){
				$("#perfAttendance2").css("display", "inline");
				var num0 = 0;
				if(data["perfAttendance"].perfAttendanceM0 != null){
					$("#perfAttendanceNum2_0_0").html(data["perfAttendance"].perfAttendanceM0);
					num0 += data["perfAttendance"].perfAttendanceM0;
				}
				if(data["perfAttendance"].perfAttendanceA0 != null){
					$("#perfAttendanceNum2_0_1").html(data["perfAttendance"].perfAttendanceA0);
					num0 += data["perfAttendance"].perfAttendanceA0;
				}
				$("#perfAttendanceNum2_0").html(num0);
				var num1 = 0;
				if(data["perfAttendance"].perfAttendanceM1 != null){
					$("#perfAttendanceNum2_1_0").html(data["perfAttendance"].perfAttendanceM1);
					num1 += data["perfAttendance"].perfAttendanceM1;
				}
				if(data["perfAttendance"].perfAttendanceA1 != null){
					$("#perfAttendanceNum2_1_1").html(data["perfAttendance"].perfAttendanceA1);
					num1 += data["perfAttendance"].perfAttendanceA1;
				}
				$("#perfAttendanceNum2_1").html(num1);
				var num2 = 0;
				if(data["perfAttendance"].perfAttendanceM2 != null){
					$("#perfAttendanceNum2_2_0").html(data["perfAttendance"].perfAttendanceM2);
					num2 += data["perfAttendance"].perfAttendanceM2;
				}
				if(data["perfAttendance"].perfAttendanceA2 != null){
					$("#perfAttendanceNum2_2_1").html(data["perfAttendance"].perfAttendanceA2);
					num2 += data["perfAttendance"].perfAttendanceA2;
				}
				$("#perfAttendanceNum2_2").html(num2);
				var num3 = 0;
				if(data["perfAttendance"].perfAttendanceM3 != null){
					$("#perfAttendanceNum2_3_0").html(data["perfAttendance"].perfAttendanceM3);
					num3 += data["perfAttendance"].perfAttendanceM3;
				}
				if(data["perfAttendance"].perfAttendanceA3 != null){
					$("#perfAttendanceNum2_3_1").html(data["perfAttendance"].perfAttendanceA3);
					num3 += data["perfAttendance"].perfAttendanceA3;
				}
				$("#perfAttendanceNum2_3").html(num3);
				var num4 = 0;
				if(data["perfAttendance"].perfAttendanceM4 != null){
					$("#perfAttendanceNum2_4_0").html(data["perfAttendance"].perfAttendanceM4);
					num4 += data["perfAttendance"].perfAttendanceM4;
				}
				if(data["perfAttendance"].perfAttendanceA4 != null){
					$("#perfAttendanceNum2_4_1").html(data["perfAttendance"].perfAttendanceA4);
					num4 += data["perfAttendance"].perfAttendanceA4;
				}
				$("#perfAttendanceNum2_4").html(num4);
				var num5 = 0;
				if(data["perfAttendance"].perfAttendanceM5 != null){
					$("#perfAttendanceNum2_5_0").html(data["perfAttendance"].perfAttendanceM5);
					num5 += data["perfAttendance"].perfAttendanceM5;
				}
				if(data["perfAttendance"].perfAttendanceA5 != null){
					$("#perfAttendanceNum2_5_1").html(data["perfAttendance"].perfAttendanceA5);
					num5 += data["perfAttendance"].perfAttendanceA5;
				}
				$("#perfAttendanceNum2_5").html(num5);
				var num6 = 0;
				if(data["perfAttendance"].perfAttendanceM6 != null){
					$("#perfAttendanceNum2_6_0").html(data["perfAttendance"].perfAttendanceM6);
					num6 += data["perfAttendance"].perfAttendanceM6;
				}
				if(data["perfAttendance"].perfAttendanceA6 != null){
					$("#perfAttendanceNum2_6_1").html(data["perfAttendance"].perfAttendanceA6);
					num6 += data["perfAttendance"].perfAttendanceA6;
				}
				$("#perfAttendanceNum2_6").html(num6);
				var num7 = 0;
				if(data["perfAttendance"].perfAttendanceM7 != null){
					$("#perfAttendanceNum2_7_0").html(data["perfAttendance"].perfAttendanceM7);
					num7 += data["perfAttendance"].perfAttendanceM7;
				}
				if(data["perfAttendance"].perfAttendanceA7 != null){
					$("#perfAttendanceNum2_7_1").html(data["perfAttendance"].perfAttendanceA7);
					num7 += data["perfAttendance"].perfAttendanceA7;
				}
				$("#perfAttendanceNum2_7").html(num7);
				var num8 = 0;
				if(data["perfAttendance"].perfAttendanceM8 != null){
					$("#perfAttendanceNum2_8_0").html(data["perfAttendance"].perfAttendanceM8);
					num8 += data["perfAttendance"].perfAttendanceM8;
				}
				if(data["perfAttendance"].perfAttendanceA8 != null){
					$("#perfAttendanceNum2_8_1").html(data["perfAttendance"].perfAttendanceA8);
					num8 += data["perfAttendance"].perfAttendanceA8;
				}
				$("#perfAttendanceNum2_8").html(num8);
				var num9 = 0;
				if(data["perfAttendance"].perfAttendanceM9 != null){
					$("#perfAttendanceNum2_9_0").html(data["perfAttendance"].perfAttendanceM9);
					num9 += data["perfAttendance"].perfAttendanceM9;
				}
				if(data["perfAttendance"].perfAttendanceA9 != null){
					$("#perfAttendanceNum2_9_1").html(data["perfAttendance"].perfAttendanceA9);
					num9 += data["perfAttendance"].perfAttendanceA9;
				}
				$("#perfAttendanceNum2_9").html(num9);
				var num10 = 0;
				if(data["perfAttendance"].perfAttendanceM10 != null){
					$("#perfAttendanceNum2_10_0").html(data["perfAttendance"].perfAttendanceM10);
					num10 += data["perfAttendance"].perfAttendanceM10;
				}
				if(data["perfAttendance"].perfAttendanceA10 != null){
					$("#perfAttendanceNum2_10_1").html(data["perfAttendance"].perfAttendanceA10);
					num10 += data["perfAttendance"].perfAttendanceA10;
				}
				$("#perfAttendanceNum2_10").html(num10);
				var num11 = 0;
				if(data["perfAttendance"].perfAttendanceM11 != null){
					$("#perfAttendanceNum2_11_0").html(data["perfAttendance"].perfAttendanceM11);
					num11 += data["perfAttendance"].perfAttendanceM11;
				}
				if(data["perfAttendance"].perfAttendanceA11 != null){
					$("#perfAttendanceNum2_11_1").html(data["perfAttendance"].perfAttendanceA11);
					num11 += data["perfAttendance"].perfAttendanceA11;
				}
				$("#perfAttendanceNum2_11").html(num11);
				var num12 = 0;
				if(data["perfAttendance"].perfAttendanceM12 != null){
					$("#perfAttendanceNum2_12_0").html(data["perfAttendance"].perfAttendanceM12);
					num12 += data["perfAttendance"].perfAttendanceM12;
				}
				if(data["perfAttendance"].perfAttendanceA12 != null){
					$("#perfAttendanceNum2_12_1").html(data["perfAttendance"].perfAttendanceA12);
					num12 += data["perfAttendance"].perfAttendanceA12;
				}
				$("#perfAttendanceNum2_12").html(num12);
				var num13 = 0;
				if(data["perfAttendance"].perfAttendanceM13 != null){
					$("#perfAttendanceNum2_13_0").html(data["perfAttendance"].perfAttendanceM13);
					num13 += data["perfAttendance"].perfAttendanceM13;
				}
				if(data["perfAttendance"].perfAttendanceA13 != null){
					$("#perfAttendanceNum2_13_1").html(data["perfAttendance"].perfAttendanceA13);
					num13 += data["perfAttendance"].perfAttendanceA13;
				}
				$("#perfAttendanceNum2_13").html(num13);
				var num14 = 0;
				if(data["perfAttendance"].perfAttendanceM14 != null){
					$("#perfAttendanceNum2_14_0").html(data["perfAttendance"].perfAttendanceM14);
					num14 += data["perfAttendance"].perfAttendanceM14;
				}
				if(data["perfAttendance"].perfAttendanceA14 != null){
					$("#perfAttendanceNum2_14_1").html(data["perfAttendance"].perfAttendanceA14);
					num14 += data["perfAttendance"].perfAttendanceA14;
				}
				$("#perfAttendanceNum2_14").html(num14);
				var num15 = 0;
				if(data["perfAttendance"].perfAttendanceM15 != null){
					$("#perfAttendanceNum2_15_0").html(data["perfAttendance"].perfAttendanceM15);
					num15 += data["perfAttendance"].perfAttendanceM15;
				}
				if(data["perfAttendance"].perfAttendanceA15 != null){
					$("#perfAttendanceNum2_15_1").html(data["perfAttendance"].perfAttendanceA15);
					num15 += data["perfAttendance"].perfAttendanceA15;
				}
				$("#perfAttendanceNum2_15").html(num15);
				if(data["perfAttendance"].perfAttendanceE0 != null){
					$("#perfAttendanceNum2_16_0").html(data["perfAttendance"].perfAttendanceE0);
				}
				if(data["perfAttendance"].perfAttendanceE1 != null){
					$("#perfAttendanceNum2_16_1").html(data["perfAttendance"].perfAttendanceE1);
				}
				if(data["perfAttendance"].perfAttendanceE2 != null){
					$("#perfAttendanceNum2_16_2").html(data["perfAttendance"].perfAttendanceE2);
				}
				if(data["perfAttendance"].result != null){
					$("#perfAttendance2_result").html(data["perfAttendance"].result);
				}
			}
			if(data["perfBehaviour"] != null){
				$("#perfBehaviour2").css("display", "inline");
				if(data["perfBehaviour"].perfBehaviour0 != null){
					$("#perfBehaviourNum2_0").html(data["perfBehaviour"].perfBehaviour0);
				}
				if(data["perfBehaviour"].perfBehaviour1 != null){
					$("#perfBehaviourNum2_1").html(data["perfBehaviour"].perfBehaviour1);
				}
				if(data["perfBehaviour"].perfBehaviour2 != null){
					$("#perfBehaviourNum2_2").html(data["perfBehaviour"].perfBehaviour2);
				}
				if(data["perfBehaviour"].perfBehaviour3 != null){
					$("#perfBehaviourNum2_3").html(data["perfBehaviour"].perfBehaviour3);
				}
				var num4 = 0;
				if(data["perfBehaviour"].perfBehaviourM4 != null){
					$("#perfBehaviourNum2_4_0").html(data["perfBehaviour"].perfBehaviourM4);
					num4 += data["perfBehaviour"].perfBehaviourM4;
				}
				if(data["perfBehaviour"].perfBehaviourA4 != null){
					$("#perfBehaviourNum2_4_1").html(data["perfBehaviour"].perfBehaviourA4);
					num4 += data["perfBehaviour"].perfBehaviourA4;
				}
				if(data["perfBehaviour"].perfBehaviourE4 != null){
					$("#perfBehaviourNum2_4_2").html(data["perfBehaviour"].perfBehaviourE4);
					num4 += data["perfBehaviour"].perfBehaviourE4;
				}
				$("#perfBehaviourNum2_4").html(num4);
				var num5 = 0;
				if(data["perfBehaviour"].perfBehaviourM5 != null){
					$("#perfBehaviourNum2_5_0").html(data["perfBehaviour"].perfBehaviourM5);
					num5 += data["perfBehaviour"].perfBehaviourM5;
				}
				if(data["perfBehaviour"].perfBehaviourA5 != null){
					$("#perfBehaviourNum2_5_1").html(data["perfBehaviour"].perfBehaviourA5);
					num5 += data["perfBehaviour"].perfBehaviourA5;
				}
				if(data["perfBehaviour"].perfBehaviourE5 != null){
					$("#perfBehaviourNum2_5_2").html(data["perfBehaviour"].perfBehaviourE5);
					num5 += data["perfBehaviour"].perfBehaviourE5;
				}
				$("#perfBehaviourNum2_5").html(num5);
				var num6 = 0;
				if(data["perfBehaviour"].perfBehaviourM6 != null){
					$("#perfBehaviourNum2_6_0").html(data["perfBehaviour"].perfBehaviourM6);
					num6 += data["perfBehaviour"].perfBehaviourM6;
				}
				if(data["perfBehaviour"].perfBehaviourA6 != null){
					$("#perfBehaviourNum2_6_1").html(data["perfBehaviour"].perfBehaviourA6);
					num6 += data["perfBehaviour"].perfBehaviourA6;
				}
				if(data["perfBehaviour"].perfBehaviourE6 != null){
					$("#perfBehaviourNum2_6_2").html(data["perfBehaviour"].perfBehaviourE6);
					num6 += data["perfBehaviour"].perfBehaviourE6;
				}
				$("#perfBehaviourNum2_6").html(num6);
				var num7 = 0;
				if(data["perfBehaviour"].perfBehaviourM7 != null){
					$("#perfBehaviourNum2_7_0").html(data["perfBehaviour"].perfBehaviourM7);
					num7 += data["perfBehaviour"].perfBehaviourM7;
				}
				if(data["perfBehaviour"].perfBehaviourA7 != null){
					$("#perfBehaviourNum2_7_1").html(data["perfBehaviour"].perfBehaviourA7);
					num7 += data["perfBehaviour"].perfBehaviourA7;
				}
				if(data["perfBehaviour"].perfBehaviourE7 != null){
					$("#perfBehaviourNum2_7_2").html(data["perfBehaviour"].perfBehaviourE7);
					num7 += data["perfBehaviour"].perfBehaviourE7;
				}
				$("#perfBehaviourNum2_7").html(num7);
				var num8 = 0;
				if(data["perfBehaviour"].perfBehaviourM8 != null){
					$("#perfBehaviourNum2_8_0").html(data["perfBehaviour"].perfBehaviourM8);
					num8 += data["perfBehaviour"].perfBehaviourM8;
				}
				if(data["perfBehaviour"].perfBehaviourA8 != null){
					$("#perfBehaviourNum2_8_1").html(data["perfBehaviour"].perfBehaviourA8);
					num8 += data["perfBehaviour"].perfBehaviourA8;
				}
				if(data["perfBehaviour"].perfBehaviourE8 != null){
					$("#perfBehaviourNum2_8_2").html(data["perfBehaviour"].perfBehaviourE8);
					num8 += data["perfBehaviour"].perfBehaviourE8;
				}
				$("#perfBehaviourNum2_8").html(num8);
				var num9 = 0;
				if(data["perfBehaviour"].perfBehaviourM9 != null){
					$("#perfBehaviourNum2_9_0").html(data["perfBehaviour"].perfBehaviourM9);
					num9 += data["perfBehaviour"].perfBehaviourM9;
				}
				if(data["perfBehaviour"].perfBehaviourA9 != null){
					$("#perfBehaviourNum2_9_1").html(data["perfBehaviour"].perfBehaviourA9);
					num9 += data["perfBehaviour"].perfBehaviourA9;
				}
				if(data["perfBehaviour"].perfBehaviourE9 != null){
					$("#perfBehaviourNum2_9_2").html(data["perfBehaviour"].perfBehaviourE9);
					num9 += data["perfBehaviour"].perfBehaviourE9;
				}
				$("#perfBehaviourNum2_9").html(num9);
				var num10 = 0;
				if(data["perfBehaviour"].perfBehaviourM10 != null){
					$("#perfBehaviourNum2_10_0").html(data["perfBehaviour"].perfBehaviourM10);
					num10 += data["perfBehaviour"].perfBehaviourM10;
				}
				if(data["perfBehaviour"].perfBehaviourA10 != null){
					$("#perfBehaviourNum2_10_1").html(data["perfBehaviour"].perfBehaviourA10);
					num10 += data["perfBehaviour"].perfBehaviourA10;
				}
				if(data["perfBehaviour"].perfBehaviourE10 != null){
					$("#perfBehaviourNum2_10_2").html(data["perfBehaviour"].perfBehaviourE10);
					num10 += data["perfBehaviour"].perfBehaviourE10;
				}
				$("#perfBehaviourNum2_10").html(num10);
				var num11 = 0;
				if(data["perfBehaviour"].perfBehaviourM11 != null){
					$("#perfBehaviourNum2_11_0").html(data["perfBehaviour"].perfBehaviourM11);
					num11 += data["perfBehaviour"].perfBehaviourM11;
				}
				if(data["perfBehaviour"].perfBehaviourA11 != null){
					$("#perfBehaviourNum2_11_1").html(data["perfBehaviour"].perfBehaviourA11);
					num11 += data["perfBehaviour"].perfBehaviourA11;
				}
				if(data["perfBehaviour"].perfBehaviourE11 != null){
					$("#perfBehaviourNum2_11_2").html(data["perfBehaviour"].perfBehaviourE11);
					num11 += data["perfBehaviour"].perfBehaviourE11;
				}
				$("#perfBehaviourNum2_11").html(num11);
				var num12 = 0;
				if(data["perfBehaviour"].perfBehaviourM12 != null){
					$("#perfBehaviourNum2_12_0").html(data["perfBehaviour"].perfBehaviourM12);
					num12 += data["perfBehaviour"].perfBehaviourM12;
				}
				if(data["perfBehaviour"].perfBehaviourA12 != null){
					$("#perfBehaviourNum2_12_1").html(data["perfBehaviour"].perfBehaviourA12);
					num12 += data["perfBehaviour"].perfBehaviourA12;
				}
				if(data["perfBehaviour"].perfBehaviourE12 != null){
					$("#perfBehaviourNum2_12_2").html(data["perfBehaviour"].perfBehaviourE12);
					num12 += data["perfBehaviour"].perfBehaviourE12;
				}
				$("#perfBehaviourNum2_12").html(num12);
				if(data["perfBehaviour"].perfBehaviour13 != null){
					$("#perfBehaviourNum2_13").html(data["perfBehaviour"].perfBehaviour13);
				}
				if(data["perfBehaviour"].perfBehaviourS0 != null){
					$("#perfBehaviourNum2_14").html(data["perfBehaviour"].perfBehaviourS0);
				}
				if(data["perfBehaviour"].perfBehaviourS1 != null){
					$("#perfBehaviourNum2_15").html(data["perfBehaviour"].perfBehaviourS1);
				}
				if(data["perfBehaviour"].result != null){
					$("#perfBehaviour2_result").html(data["perfBehaviour"].result);
				}
			}
			if(data["perfReception"] != null){
				$("#perfReception2").css("display", "inline");
				if(data["perfReception"].result != null){
					$("#perfReception2_result").html(data["perfReception"].result);
				}
			}
			if(data["perfFacility"] != null){
				$("#perfFacility2").css("display", "inline");
				if(data["perfFacility"].result != null){
					$("#perfFacility2_result").html(data["perfFacility"].result);
				}
			}
			if(data["perfMaterial"] != null){
				$("#perfMaterial2").css("display", "inline");
				if(data["perfMaterial"].result != null){
					$("#perfMaterial2_result").html(data["perfMaterial"].result);
				}
			}
			if(data["perfFinancial"] != null){
				$("#perfFinancial2").css("display", "inline");
				if(data["perfFinancial"].result != null){
					$("#perfFinancial2_result").html(data["perfFinancial"].result);
				}
			}
			if(data["perfLession"] != null){
				$("#perfLession2").css("display", "inline");
				if(data["perfLession"].result != null){
					$("#perfLession2_result").html(data["perfLession"].result);
				}
			}
			if(data["perfTeaching"] != null){
				$("#perfTeaching2").css("display", "inline");
				if(data["perfTeaching"].result != null){
					$("#perfTeaching2_result").html(data["perfTeaching"].result);
				}
			}
			if(data["perfChildren"] != null){
				$("#perfChildren2").css("display", "inline");
				if(data["perfChildren"].result != null){
					$("#perfChildren2_result").html(data["perfChildren"].result);
				}
			}
			if(data["perfLongTerm"] != null){
				$("#perfLongTerm2").css("display", "inline");
				if(data["perfLongTerm"].result != null){
					$("#perfLongTerm2_result").html(data["perfLongTerm"].result);
				}
			}
			if(data["perfShortTerm"] != null){
				$("#perfShortTerm2").css("display", "inline");
				if(data["perfShortTerm"].result != null){
					$("#perfShortTerm2_result").html(data["perfShortTerm"].result);
				}
			}
			if(data["perfObtain"] != null){
				$("#perfObtain2").css("display", "inline");
				if(data["perfObtain"].result != null){
					$("#perfObtain2_result").html(data["perfObtain"].result);
				}
			}
			if(data["perfRecruit"] != null){
				$("#perfRecruit2").css("display", "inline");
				if(data["perfRecruit"].result != null){
					$("#perfRecruit2_result").html(data["perfRecruit"].result);
				}
			}
			if(data["perfPropaganda"] != null){
				$("#perfPropaganda2").css("display", "inline");
				if(data["perfPropaganda"].result != null){
					$("#perfPropaganda2_result").html(data["perfPropaganda"].result);
				}
			}
			if(data["perfAdmin"] != null){
				$("#perfAdmin2").css("display", "inline");
				if(data["perfAdmin"].result != null){
					$("#perfAdmin2_result").html(data["perfAdmin"].result);
				}
			}
			if(data["perfIncharge"] != null){
				$("#perfIncharge2").css("display", "inline");
				if(data["perfIncharge"].result != null){
					$("#perfIncharge2_result").html(data["perfIncharge"].result);
				}
			}
			if(data["perfDriver"] != null){
				$("#perfDriver2").css("display", "inline");
				if(data["perfDriver"].result != null){
					$("#perfDriver2_result").html(data["perfDriver"].result);
				}
			}
			if(data["perfSecurityClean"] != null){
				$("#perfSecurityClean2").css("display", "inline");
				if(data["perfSecurityClean"].result != null){
					$("#perfSecurityClean2_result").html(data["perfSecurityClean"].result);
				}
			}
			if(data["perfOther"] != null){
				$("#perfOther2").css("display", "inline");
				if(data["perfOther"].result != null){
					$("#perfOther2_result").html(data["perfOther"].result);
				}
			}
		}
		$("#monthShow").html(month);
		$("#perfTable").css("display", "inline");
	}, "json");
}
function calculateSum(id){
	var sum = 0;
	var num = 0;
	if(id.indexOf("perfAttendance")!=-1){
		num = 2;
	}
	else if(id.indexOf("perfBehaviour")!=-1){
		num = 3;
	}
	for(var i=0; i<num; i++){
		sum += parseInt($("#"+id+"_"+i).val());
	}
	$("#"+id).html(sum);
}
var mark = true;
function createInstance(elementId){
	var nowMonth = getTime().substr(0, 7);
	var month = $("#month").val();
	if(month.localeCompare(nowMonth) > 0){
		alert("不能对未来的绩效进行创建！");
	}
	else {
		if(mark){
			if($("input[name='noUuid']").val()!=""){
				$("input[name='instance(EmployeePerformance).employeeUuid']").val($("input[name='noUuid']").val());
			}
			if($("input[name='nameUuid']").val()!=""){
				$("input[name='instance(EmployeePerformance).employeeUuid']").val($("input[name='nameUuid']").val());
			}
			$("input[name='instance(EmployeePerformance).month']").val(month);
			if(Validation.excuteValidate(elementId)){
				if(confirm("确认操作？")){
					mark = false;
					var param = Submit.excute(elementId);
					$.post(cp+"/ajaxs/resource/performance/manage/performance/calculate/create_employee_performance.html",param,function(data){
						location.href = cp + "/pages/resource/performance/manage/performance/calculate/query_performance_calculate.html";
					});
				}
			}
		}
		else {
			alert("操作进行中，请勿重复点击！");
		}
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 绩 效 考 核</div>
<br><br><br>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="720" colspan="6">员工信息</th>
	</tr>
	<tr>
		<th width="100">员工号：</th>
		<td width="140"><input name="noUuid" nextSiblingName="employeeNo" class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			field="personNo" parameterLength="1" execute="true" nextSiblingSize="12" relationId="curEmployeeNo"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_info.html" />
		</td>
		<th width="100">姓名：</th>
		<td width="140"><input name="nameUuid" nextSiblingName="employeeName" class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			execute="true" nextSiblingSize="12" relationId="curEmployeeName"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_info.html" />
		</td>
		<th width="100">性别：</th>
		<td width="140"><div id="gender"></div></td>
	</tr>
	<tr>
		<th width="100">组织机构：</th>
		<td width="140"><div id="department"></div></td>
		<th width="100">工作电话：</th>
		<td width="140"><div id="workPhone"></div></td>
		<th width="100">月份：</th>
		<td width="140"><label style="display:none" id="month" class="DateTimeSingle" format="part" execute="showTable()"></label></td>
	</tr>
</table>	
<br>
<form id="formA">
<div id="perfTable" style="display:none">
<input type="hidden" name="instance(EmployeePerformance).employeeUuid" />
<input type="hidden" name="instance(EmployeePerformance).month" />
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th colspan="3">月度绩效考核表(<div id="monthShow" style="display:inline"></div>)</th>
	</tr>
	<tbody id="perfNoLicensed" style="display:none">
	<tr>
		<td colspan="3">&nbsp;<font color="red">该员工未分配岗位，或该岗位未进行绩效设置！</font></td>
	</tr>
	</tbody>
	<tbody id="perfTitle" style="display:none">
	<tr>
		<th width="100">考核项目</th>
		<th width="420">考核内容</th>
		<th width="200">考核结果</th>
	</tr>
	</tbody>
	<tbody id="perfAttendance1" style="display:none" submit="false">
	<tr>
		<th width="100">考勤</th>
		<td width="420">
			正常：<div id="perfAttendanceNum1_0" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM0" id="perfAttendanceNum1_0_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_0')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA0" id="perfAttendanceNum1_0_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_0')" validate="true" />&nbsp;次)<br>
			上课：<div id="perfAttendanceNum1_14" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM14" id="perfAttendanceNum1_14_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_14')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA14" id="perfAttendanceNum1_14_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_14')" validate="true" />&nbsp;次)<br>
			公休：<div id="perfAttendanceNum1_1" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM1" id="perfAttendanceNum1_1_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_1')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA1" id="perfAttendanceNum1_1_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_1')" validate="true" />&nbsp;次)<br>
			串休：<div id="perfAttendanceNum1_2" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM2" id="perfAttendanceNum1_2_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_2')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA2" id="perfAttendanceNum1_2_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_2')" validate="true" />&nbsp;次)<br>
			分校：<div id="perfAttendanceNum1_3" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM3" id="perfAttendanceNum1_3_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_3')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA3" id="perfAttendanceNum1_3_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_3')" validate="true" />&nbsp;次)<br>
			外出：<div id="perfAttendanceNum1_4" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM4" id="perfAttendanceNum1_4_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_4')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA4" id="perfAttendanceNum1_4_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_4')" validate="true" />&nbsp;次)<br>
			迟到：<div id="perfAttendanceNum1_5" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM5" id="perfAttendanceNum1_5_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_5')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA5" id="perfAttendanceNum1_5_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_5')" validate="true" />&nbsp;次)<br>
			早退：<div id="perfAttendanceNum1_6" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM6" id="perfAttendanceNum1_6_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_6')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA6" id="perfAttendanceNum1_6_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_6')" validate="true" />&nbsp;次)<br>
			旷工：<div id="perfAttendanceNum1_7" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM7" id="perfAttendanceNum1_7_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_7')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA7" id="perfAttendanceNum1_7_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_7')" validate="true" />&nbsp;次)<br>
			事假：<div id="perfAttendanceNum1_8" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM8" id="perfAttendanceNum1_8_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_8')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA8" id="perfAttendanceNum1_8_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_8')" validate="true" />&nbsp;次)<br>
			病假：<div id="perfAttendanceNum1_9" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM9" id="perfAttendanceNum1_9_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_9')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA9" id="perfAttendanceNum1_9_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_9')" validate="true" />&nbsp;次)<br>
			丧假：<div id="perfAttendanceNum1_10" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM10" id="perfAttendanceNum1_10_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_10')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA10" id="perfAttendanceNum1_10_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_10')" validate="true" />&nbsp;次)<br>
			婚假：<div id="perfAttendanceNum1_11" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM11" id="perfAttendanceNum1_11_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_11')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA11" id="perfAttendanceNum1_11_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_11')" validate="true" />&nbsp;次)<br>
			产假：<div id="perfAttendanceNum1_15" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM15" id="perfAttendanceNum1_15_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_15')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA15" id="perfAttendanceNum1_15_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_15')" validate="true" />&nbsp;次)<br>
			出差：<div id="perfAttendanceNum1_12" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM12" id="perfAttendanceNum1_12_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_12')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA12" id="perfAttendanceNum1_12_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_12')" validate="true" />&nbsp;次)<br>
			其他：<div id="perfAttendanceNum1_13" style="display:inline;width:20px"></div>&nbsp;次(上午：<input name="instance(PerfAttendance).perfAttendanceM13" id="perfAttendanceNum1_13_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_13')" validate="true" />&nbsp;次；下午：<input name="instance(PerfAttendance).perfAttendanceA13" id="perfAttendanceNum1_13_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfAttendanceNum1_13')" validate="true" />&nbsp;次)<br>
			晚上休息：<input name="instance(PerfAttendance).perfAttendanceE0" id="perfAttendanceNum1_16_0" style="width:20px;margin-top:5px" validate="true" />&nbsp;次；晚上上课：<input name="instance(PerfAttendance).perfAttendanceE1" id="perfAttendanceNum1_16_1" style="width:20px;margin-top:5px" validate="true" />&nbsp;次；晚上值班：<input name="instance(PerfAttendance).perfAttendanceE2" id="perfAttendanceNum1_16_2" style="width:20px;margin-top:5px" validate="true" />&nbsp;次
		</td>
		<td width="200">
			<textarea name="instance(PerfAttendance).result" style="width:190px;height:390px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfAttendance2" style="display:none">
	<tr>
		<th width="100">考勤</th>
		<td width="420" style="line-height:20px">
			正常：<div id="perfAttendanceNum2_0" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_0_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_0_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			上课：<div id="perfAttendanceNum2_14" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_14_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_14_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			公休：<div id="perfAttendanceNum2_1" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_1_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_1_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			串休：<div id="perfAttendanceNum2_2" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_2_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_2_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			分校：<div id="perfAttendanceNum2_3" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_3_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_3_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			外出：<div id="perfAttendanceNum2_4" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_4_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_4_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			迟到：<div id="perfAttendanceNum2_5" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_5_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_5_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			早退：<div id="perfAttendanceNum2_6" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_6_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_6_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			旷工：<div id="perfAttendanceNum2_7" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_7_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_7_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			事假：<div id="perfAttendanceNum2_8" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_8_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_8_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			病假：<div id="perfAttendanceNum2_9" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_9_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_9_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			丧假：<div id="perfAttendanceNum2_10" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_10_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_10_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			婚假：<div id="perfAttendanceNum2_11" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_11_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_11_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			产假：<div id="perfAttendanceNum2_15" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_15_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_15_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			出差：<div id="perfAttendanceNum2_12" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_12_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_12_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			其他：<div id="perfAttendanceNum2_13" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfAttendanceNum2_13_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfAttendanceNum2_13_1" style="display:inline;width:20px"></div>&nbsp;次)<br>
			晚上休息：<div id="perfAttendanceNum2_16_0" style="display:inline;width:20px"></div>&nbsp;次；晚上上课：<div id="perfAttendanceNum2_16_1" style="display:inline;width:20px"></div>&nbsp;次；晚上值班：<div id="perfAttendanceNum2_16_2" style="display:inline;width:20px"></div>&nbsp;次
		</td>
		<td width="200" style="vertical-align:top">
			<div id="perfAttendance2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfBehaviour1" style="display:none" submit="false">
	<tr>
		<th width="100">行为规范</th>
		<td width="420">
			日志：<input name="instance(PerfBehaviour).perfBehaviour0" id="perfBehaviourNum1_0" style="width:20px;margin-top:5px" validate="true" />&nbsp;篇(应写&nbsp;<input name="instance(PerfBehaviour).perfBehaviourS0" id="perfBehaviourNum1_14" style="width:20px;margin-top:5px" validate="true" />&nbsp;篇)&nbsp;&nbsp;&nbsp;&nbsp;发帖：<input name="instance(PerfBehaviour).perfBehaviour1" id="perfBehaviourNum1_1" style="width:20px;margin-top:5px" validate="true" />&nbsp;条(应发&nbsp;<input name="instance(PerfBehaviour).perfBehaviourS1" id="perfBehaviourNum1_15" style="width:25px;margin-top:5px" validate="true" />&nbsp;条)<br>
			缺席早会：<input name="instance(PerfBehaviour).perfBehaviour2" id="perfBehaviourNum1_2" style="width:20px;margin-top:5px" validate="true" />&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;缺席夕会：<input name="instance(PerfBehaviour).perfBehaviour3" id="perfBehaviourNum1_3" style="width:20px;margin-top:5px" validate="true" />&nbsp;次<br>
			工装：<div id="perfBehaviourNum1_4" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM4" id="perfBehaviourNum1_4_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_4')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA4" id="perfBehaviourNum1_4_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_4')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE4" id="perfBehaviourNum1_4_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_4')" validate="true" />&nbsp;次)<br>
			工牌：<div id="perfBehaviourNum1_5" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM5" id="perfBehaviourNum1_5_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_5')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA5" id="perfBehaviourNum1_5_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_5')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE5" id="perfBehaviourNum1_5_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_5')" validate="true" />&nbsp;次)<br>
			卫生：<div id="perfBehaviourNum1_6" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM6" id="perfBehaviourNum1_6_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_6')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA6" id="perfBehaviourNum1_6_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_6')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE6" id="perfBehaviourNum1_6_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_6')" validate="true" />&nbsp;次)<br>
			脱岗：<div id="perfBehaviourNum1_7" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM7" id="perfBehaviourNum1_7_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_7')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA7" id="perfBehaviourNum1_7_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_7')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE7" id="perfBehaviourNum1_7_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_7')" validate="true" />&nbsp;次)<br>
			吃东西：<div id="perfBehaviourNum1_8" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM8" id="perfBehaviourNum1_8_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_8')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA8" id="perfBehaviourNum1_8_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_8')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE8" id="perfBehaviourNum1_8_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_8')" validate="true" />&nbsp;次)<br>
			看电影：<div id="perfBehaviourNum1_9" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM9" id="perfBehaviourNum1_9_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_9')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA9" id="perfBehaviourNum1_9_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_9')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE9" id="perfBehaviourNum1_9_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_9')" validate="true" />&nbsp;次)<br>
			听歌：<div id="perfBehaviourNum1_10" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM10" id="perfBehaviourNum1_10_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_10')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA10" id="perfBehaviourNum1_10_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_10')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE10" id="perfBehaviourNum1_10_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_10')" validate="true" />&nbsp;次)<br>
			睡觉：<div id="perfBehaviourNum1_11" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM11" id="perfBehaviourNum1_11_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_11')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA11" id="perfBehaviourNum1_11_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_11')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE11" id="perfBehaviourNum1_11_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_11')" validate="true" />&nbsp;次)<br>
			其他娱乐：<div id="perfBehaviourNum1_12" style="display:inline;width:20px">0</div>&nbsp;次(上午：<input name="instance(PerfBehaviour).perfBehaviourM12" id="perfBehaviourNum1_12_0" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_12')" validate="true" />&nbsp;次；下午：<input name="instance(PerfBehaviour).perfBehaviourA12" id="perfBehaviourNum1_12_1" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_12')" validate="true" />&nbsp;次；晚上：<input name="instance(PerfBehaviour).perfBehaviourE12" id="perfBehaviourNum1_12_2" style="width:20px;margin-top:5px" onchange="javascript:calculateSum('perfBehaviourNum1_12')" validate="true" />&nbsp;次)<br>
			投诉：<input name="instance(PerfBehaviour).perfBehaviour13" id="perfBehaviourNum1_13" style="width:20px;margin-top:5px" validate="true" />&nbsp;次<br>
		</td>
		<td width="200">
			<textarea name="instance(PerfBehaviour).result" style="width:190px;height:270px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfBehaviour2" style="display:none">
	<tr>
		<th width="100">行为规范</th>
		<td width="420" style="line-height:20px">
			日志：<div id="perfBehaviourNum2_0" style="display:inline;width:20px"></div>&nbsp;篇(应写&nbsp;<div id="perfBehaviourNum2_14" style="display:inline;width:20px"></div>&nbsp;篇)&nbsp;&nbsp;&nbsp;&nbsp;发帖：<div id="perfBehaviourNum2_1" style="display:inline;width:20px"></div>&nbsp;条(应发&nbsp;<div id="perfBehaviourNum2_15" style="display:inline;width:20px"></div>&nbsp;条)<br>
			缺席早会：<div id="perfBehaviourNum2_2" style="display:inline;width:20px"></div>&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;缺席夕会：<div id="perfBehaviourNum2_3" style="display:inline;width:20px"></div>&nbsp;次<br>
			工装：<div id="perfBehaviourNum2_4" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_4_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_4_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_4_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			工牌：<div id="perfBehaviourNum2_5" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_5_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_5_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_5_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			卫生：<div id="perfBehaviourNum2_6" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_6_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_6_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_6_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			脱岗：<div id="perfBehaviourNum2_7" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_7_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_7_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_7_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			吃东西：<div id="perfBehaviourNum2_8" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_8_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_8_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_8_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			看电影：<div id="perfBehaviourNum2_9" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_9_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_9_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_9_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			听歌：<div id="perfBehaviourNum2_10" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_10_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_10_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_10_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			睡觉：<div id="perfBehaviourNum2_11" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_11_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_11_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_11_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			其他娱乐：<div id="perfBehaviourNum2_12" style="display:inline;width:20px"></div>&nbsp;次(上午：<div id="perfBehaviourNum2_12_0" style="display:inline;width:20px"></div>&nbsp;次；下午：<div id="perfBehaviourNum2_12_1" style="display:inline;width:20px"></div>&nbsp;次；晚上：<div id="perfBehaviourNum2_12_2" style="display:inline;width:20px"></div>&nbsp;次)<br>
			投诉：<div id="perfBehaviourNum2_13" style="display:inline;width:20px"></div>&nbsp;次<br>
		</td>
		<td width="200" style="vertical-align:top">
			<div id="perfBehaviour2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfReception1" style="display:none" submit="false">
	<tr>
		<th width="100">接待管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfReception).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfReception2" style="display:none">
	<tr>
		<th width="100">接待管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfReception2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfFacility1" style="display:none" submit="false">
	<tr>
		<th width="100">设施管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfFacility).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfFacility2" style="display:none">
	<tr>
		<th width="100">设施管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfFacility2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfMaterial1" style="display:none" submit="false">
	<tr>
		<th width="100">物资管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfMaterial).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfMaterial2" style="display:none">
	<tr>
		<th width="100">物资管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfMaterial2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfFinancial1" style="display:none" submit="false">
	<tr>
		<th width="100">财务管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfFinancial).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfFinancial2" style="display:none">
	<tr>
		<th width="100">财务管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfFinancial2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfLession1" style="display:none" submit="false">
	<tr>
		<th width="100">课时统计</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfLession).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfLession2" style="display:none">
	<tr>
		<th width="100">课时统计</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfLession2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfTeaching1" style="display:none" submit="false">
	<tr>
		<th width="100">教学达成</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfTeaching).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfTeaching2" style="display:none">
	<tr>
		<th width="100">教学达成</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfTeaching2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfChildren1" style="display:none" submit="false">
	<tr>
		<th width="100">少儿部门考核</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfChildren).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfChildren2" style="display:none">
	<tr>
		<th width="100">少儿部门考核</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfChildren2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfLongTerm1" style="display:none" submit="false">
	<tr>
		<th width="100">长期班学员<br>及班级管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfLongTerm).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfLongTerm2" style="display:none">
	<tr>
		<th width="100">长期班学员<br>及班级管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfLongTerm2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfShortTerm1" style="display:none" submit="false">
	<tr>
		<th width="100">短期班班主任及教务管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfShortTerm).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfShortTerm2" style="display:none">
	<tr>
		<th width="100">短期班班主任及教务管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfShortTerm2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfObtain1" style="display:none" submit="false">
	<tr>
		<th width="100">就业管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfObtain).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfObtain2" style="display:none">
	<tr>
		<th width="100">就业管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfObtain2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfRecruit1" style="display:none" submit="false">
	<tr>
		<th width="100">招生任务</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfRecruit).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfRecruit2" style="display:none">
	<tr>
		<th width="100">招生任务</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfRecruit2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfPropaganda1" style="display:none" submit="false">
	<tr>
		<th width="100">市场宣传</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfPropaganda).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfPropaganda2" style="display:none">
	<tr>
		<th width="100">市场宣传</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfPropaganda2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfAdmin1" style="display:none" submit="false">
	<tr>
		<th width="100">行政管理</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfAdmin).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfAdmin2" style="display:none">
	<tr>
		<th width="100">行政管理</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfAdmin2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfIncharge1" style="display:none" submit="false">
	<tr>
		<th width="100">分校<br>及部门负责人</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfIncharge).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfIncharge2" style="display:none">
	<tr>
		<th width="100">分校<br>及部门负责人</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfIncharge2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfDriver1" style="display:none" submit="false">
	<tr>
		<th width="100">司机及总务</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfDriver).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfDriver2" style="display:none">
	<tr>
		<th width="100">司机及总务</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfDriver2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfSecurityClean1" style="display:none" submit="false">
	<tr>
		<th width="100">保洁保安</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfSecurityClean).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfSecurityClean2" style="display:none">
	<tr>
		<th width="100">保洁保安</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfSecurityClean2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
	<tbody id="perfOther1" style="display:none" submit="false">
	<tr>
		<th width="100">其他</th>
		<td width="420">
		</td>
		<td width="200">
			<textarea name="instance(PerfOther).result" style="width:190px;height:100px"></textarea>
		</td>
	</tr>
	</tbody>
	<tbody id="perfOther2" style="display:none">
	<tr>
		<th width="100">其他</th>
		<td width="420">
		</td>
		<td width="200">
			<div id="perfOther2_result"></div>&nbsp;
		</td>
	</tr>
	</tbody>
</table>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:clearRelationData('all')" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
</div>
</form>
<br>
</body>
</html>
