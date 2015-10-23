<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>退班</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" /></form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 720;
});
function showDiv(id){
	$("#"+id).css("display","block");
}
function hideDiv(id){
	$("#"+id).css("display","none");
}
function chooseStudent(){
	$("#chooseStudent").modal();
}
function executeStudent(){
	var name = $("#name").val();
	var birthDate = $("#birthDate").val();
	var cellPhone = $("#cellPhone").val();
	var tag = "student";
	$.post(cp+"/ajaxs/content/student/manage/student/enrollment/query_student_info.html", {name:name,birthDate:birthDate,cellPhone:cellPhone,tag:tag}, function(data){
		var tableHeader = "<tr>";
		tableHeader += "<th>学生编号</th>";
	    tableHeader += "<th>姓名</th>";
	    tableHeader += "<th>性别</th>";
	    tableHeader += "<th>出生日期</th>";
	    tableHeader += "<th>联系方式</th>";
	    tableHeader += "<th>操作</th>";
	    tableHeader += "</tr>";
	    $("#showStudent").html(tableHeader);

	    for (var i=0; i<data.length; i++) {
		    if(data[i][1] != null){
		        var newRow = "<tr>";
		        newRow += "<td>"+data[i][1]+"</td>";
		        newRow += "<td colName='personName"+i+"'>"+data[i][2]+"</td>";
		        newRow += "<td>"+data[i][3]+"</td>";
		        newRow += "<td>"+data[i][4]+"</td>";
		        newRow += "<td>"+data[i][5]+"</td>";
		       	newRow += "<td><a href='javascript:showInstance(\""+data[i][6]+"\",\"\",\"/views/content/student/manage/student/info/forward_view_student.html\",600,700)'>查看</a>";
		        newRow += "<td><a href='#' onclick='loadStudentBasicInfo(\""+data[i][0]+"\",\""+data[i][6]+"\",\""+i+"\")' data-dismiss='modal'>选择</a></td>";
		        newRow += "</tr>";
		        $("#showStudent").append(newRow);
		    }
	    }
	}, "json");
}
function loadStudentBasicInfo(studentUuid,personUuid,i){
	$("#personName").val($("td[colName='personName"+i+"']").html());
	$("#studentUuid").val(studentUuid);
    $("#personUuid").val(personUuid);

    var uuid = personUuid;
	$.post(cp+"/ajaxs/content/student/manage/student/enrollment/find_student.html", {personUuid:uuid}, function(data){
		var studentInfo = data[0];
		var classInfo = data[1];
		var buffer="";
		buffer += "<div class='resultTableDiv' style='width:660px;overflow:auto'>";
		buffer += "<table align='left' border='0' cellpadding='0' cellspacing='0' class='InputPanel'>";
		buffer += "<tr><th colspan='6' align='center'>学生信息</th></tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>学生编号</th>";
		buffer += "<td width='120'>"+studentInfo[0][0]+"</td>";
		buffer += "<th width='100'>学生姓名</th>";
		buffer += "<td width='120'>"+studentInfo[0][1]+"</td>";
		buffer += "<th width='100'>性别</th>";
		buffer += "<td width='120'>"+studentInfo[0][15]+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>出生日期</th>";
		buffer += "<td width='120'>"+studentInfo[0][3]+"</td>";
		buffer += "<th width='100'>民族</th>";
		buffer += "<td width='120'>"+studentInfo[0][16]+"</label></td>";
		buffer += "<th width='100'>婚否</th>";
		buffer += "<td width='120'>"+studentInfo[0][17]+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>最高学历</th>";
		buffer += "<td width='120'>"+studentInfo[0][18]+"</td>";
		buffer += "<th width='100'>家长姓名</th>";
		buffer += "<td width='120'>"+studentInfo[0][7]+"</td>";
		buffer += "<th width='100'>家长电话</th>";
		buffer += "<td width='120'>"+studentInfo[0][8]+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>政治面貌</th>";
		buffer += "<td width='120'>"+studentInfo[0][19]+"</td>";
		buffer += "<th width='100'>身份证号</th>";
		buffer += "<td colspan='3' width='340'>"+studentInfo[0][10]+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>电话</th>";
		buffer += "<td width='120'>"+studentInfo[0][11]+"</td>";
		buffer += "<th width='100'>身份证住址</th>";
		buffer += "<td colspan='3' width='340'>"+studentInfo[0][12]+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>QQ</th>";
		buffer += "<td width='120'>"+studentInfo[0][13]+"</td>";
		buffer += "<th width='100'>实际居住地址</th>";
		buffer += "<td colspan='3' width='340'>"+studentInfo[0][14]+"</td>";
		buffer += "</tr>";
		buffer += "<th width='100'>是否免费</th>";
		buffer += "<td colspan='5' width='560'>";
		buffer += "<input type='radio' id='free' name='instance(ClassEnrollment).ifFree' onclick='hideDiv(\"viewTuitionInfo\")' value='true' checked />&nbsp;免费重听&nbsp;&nbsp;&nbsp;";
		buffer += "<input type='radio' id='notFree' name='instance(ClassEnrollment).ifFree' onclick='showDiv(\"viewTuitionInfo\");loadTuitionInfo()' value='false' />&nbsp;缴费";
		buffer += "</td></tr>";
		buffer += "</table></div>";
		$("#viewStudentInfo").html(buffer);

		$("#clsName").empty();
		$("#clsName").append("<option id='actualClass'>--请选择--</option>");
		for(var i=0; i<classInfo.length; i++){
			$("#clsName").append("<option id='actualClass"+i+"' value='"+classInfo[i][0]+"' onclick='loadClassBasicInfo(\""+classInfo[i][0]+"\",\""+i+"\"),showDiv(\"viewClassInfo\")'>"+classInfo[i][1]+"</option>");
		}
	}, "json");
	showDiv("viewStudentInfo");
	$("#clsName").removeAttr("disabled");
	hideDiv("viewTuitionInfo");
	hideDiv("viewClassInfo");
	$("#free").attr("checked");
}
function loadClassBasicInfo(arrangeClassUuid,i){
	$("#arrangeClassUuid").val(arrangeClassUuid);

	var uuid = arrangeClassUuid;
	$.post(cp+"/ajaxs/content/student/manage/student/enrollment/find_class.html", {arrangeClassUuid:uuid}, function(data){
		var classData = data[0];
		var courseData = data[1];
		var studentData = data[2];

		var buffer="";
		buffer += "<div class='resultTableDiv' style='width:660px;overflow:auto'>";
		buffer += "<table width='660' align='center' border='0' cellpadding='0' cellspacing='0' class='InputPanel'>";
		buffer += "<tr><th colspan='6' align='center'>班级信息</th></tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>班级名</th>";
		buffer += "<td width='120'>"+classData[0][0]+"</td>";
		buffer += "<th width='100'>班级类型</th>";
		buffer += "<td width='120'>"+classData[0][1]+"</td>";
		buffer += "<th width='100'>课程编号</th>";
		buffer += "<td width='120'>"+classData[0][2]+"</td>";
		buffer += "</tr>";
		buffer += "<tr>";
		buffer += "<th width='100'>课程名</th>";
		buffer += "<td width='120' id='courseUuid03'>"+classData[0][3]+"</td>";
		buffer += "<th width='100'>课程类别</th>";
		buffer += "<td width='120'>"+classData[0][4]+"</td>";
		buffer += "<th width='100'>校区</th>";
		buffer += "<td width='120'>"+classData[0][5]+"</td>";
		buffer += "</tr>";
		buffer += "</table><br>";
		buffer += "<table width='660' align='center' border='0' cellpadding='0' cellspacing='0' class='InputPanel'>";
		buffer += "<tr><th colspan='6' align='center'>时间和地点及授课教师</th></tr>";
		for(var i=0; i<courseData.length; i++){
			buffer += "<tr>";
			buffer += "<td width='420'>"+courseData[i][0]+"</td>";
			buffer += "<td width='120'>"+courseData[i][1]+"</td>";
			buffer += "<td width='120'>"+courseData[i][2]+"</td>";
			buffer += "</tr>";
		}
		buffer += "</table></div>";
		$("#viewClassInfo").html(buffer);
		$("#courseUuid").val($("#courseUuid03").html());
	}, "json");
	loadTuitionInfo();
}
function loadTuitionInfo(){
	var studentUuid = $("#studentUuid").val();
	var arrangeClassUuid = $("#arrangeClassUuid").val();

	$.post(cp+"/ajaxs/content/student/manage/student/quit/find_Tuition.html", {studentUuid:studentUuid,arrangeClassUuid:arrangeClassUuid}, function(data){
		$("#tuitionUuid").val(data[0][0]);
		$("#preDiscountAmount").html(data[0][1]);
		$("#discount").html(data[0][2]);
		$("#discountReason").html("原因：&nbsp;"+data[0][3]);
		$("#actualTotalAmount").html(data[0][4]);
		$("#amountPaid").html(data[0][5]);
		
	}, "json");
}
function chooseQuitReason(type){
	if(type == "出差"){
		$("#reason2").val("");
		$("#reason3").val("");
		$("#reason4").val("");
		$("#reason4").attr("disabled","disabled");
		$("#reason1").val("出差");
	}
	else if(type == "不感兴趣"){
		$("#reason1").val("");
		$("#reason3").val("");
		$("#reason4").val("");
		$("#reason4").attr("disabled","disabled");
		$("#reason2").val("不感兴趣");
	}
	else if(type == "成绩差"){
		$("#reason1").val("");
		$("#reason2").val("");
		$("#reason4").val("");
		$("#reason4").attr("disabled","disabled");
		$("#reason3").val("成绩差");
	}
	else{
		$("#reason1").val("");
		$("#reason2").val("");
		$("#reason3").val("");
		$("#reason4").removeAttr("disabled");
	}
}
function createInstance(elementId){
	if($("#personName").val() == "请选择"){
		alert("请选择学生");
		return
	}
	else if($("#arrangeClassUuid").val() == ""){
		alert("请选择班级");
		return
	}
	else{
		if(confirm("确认退班？")){
			var param=Submit.excute(elementId);
			$.ajax({
		        type: "POST",
		        url: cp + "/ajaxs/content/student/manage/student/quit/create_quit.html",
		        data: param,
		        dataType: "json",
		        success: function(){
	                alert("退班成功");
	                queryStudent();
		        },
		        error: function(){
		            alert("请求失败或超时，请稍后再试！");
		            return;
		        }
		    })
		}
	}
}

function queryStudent(){
	var mark = "quit";
	location.href = cp + "/https/content/student/manage/student/enrollment/query_studentstatus.html_" + mark ;
}
function goback(){
	location.href = cp + "/pages/content/student/manage/student/quit/query_quit.html";
}
</script>
<form id="formA">
<table align="left">
	<tr>
		<th width="80">学生姓名</th>
		<td width="120">
			<input type="hidden" id="personUuid" name="instance(Person).uuid" />
			<input type="hidden" id="studentUuid" name="instance(Student).uuid" />
			<input type="button" id="personName" value="请选择" onclick="chooseStudent()" />
		</td>
		<th width="80">班级名</th>
		<td width="120">
			<input type="hidden" id="arrangeClassUuid" name="instance(ArrangeClass).uuid" />
			<select id="clsName" disabled="disabled">
				<option id="actualClass">--请选择--</option>
			</select>
		</td>
		<th width="80">课程名</th>
		<td width="120"><input type="text" id="courseUuid" disabled="disabled" size="14" /></td>
	</tr>
</table>
<br><br>
<div class="modal fade" id="chooseStudent" tabindex="-1" role="dialog" 
   aria-labelledby="chooseStudentLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="chooseStudentLabel">
               选择学生
            </h4>
         </div>
         <div class="modal-body">
			 <table style="margin:0 auto" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
				 <tr>
					<th width="80">姓名</th>
					<td width="120"><input type="text" id="name" size="14" /></td>
					<th width="80">出生日期</th>
					<td width="120"><input type="text" id="birthDate" class="datepicker" format="all" size="14" /></td>
					<th width="80">联系方式</th>
					<td width="120"><input type="text" id="cellPhone" size="14" /></td>
				</tr>
			 </table>
			 <br>
			 &nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="#" onclick="executeStudent()"><img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
	         <div style="margin-top:20px">
	             <legend></legend>
	             <div>
	             	<table id="showStudent" style="width:100%"></table>
	             </div>
	         </div>
         </div>
         <div class="modal-footer"></div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<br>
<div id="viewStudentInfo" style="display:none"></div>
<br>
<div id="viewClassInfo"></div>
<br>
<div id="viewTuitionInfo" style="display:none">
	<table class="InputPanel">
		<tr>
			<th colspan="2" align="center">费用信息</th>
			<input type="hidden" id="tuitionUuid" name="instance(Tuition).uuid" />
		</tr>
		<tr>
			<th width="100">应收取费用</th>
			<td width="560">
				<span id="preDiscountAmount"></span>
			</td>
		</tr>
		<tr>
			<th width="100">优惠</th>
			<td width="560">
				<span id="discount"></span>&nbsp;&nbsp;&nbsp;<span id="discountReason"></span>
			</td>
		</tr>
		<tr>
			<th width="100">折扣后总费用</th>
			<td width="560">
				<span id="actualTotalAmount"></span>
			</td>
		</tr>
		<tr>
			<th width="100">目前已缴费用</th>
			<td width="560">
				<span id="amountPaid"></span>
			</td>
		</tr>
		<tr>
			<th width="100">退还费用</th>
			<td width="560">
				<input type="text" id="amountReturn" name="instance(Tuition).amountReturn" size="14" />&nbsp;元
			</td>
		</tr>
		<tr>
			<th width="100">退出原因</th>
			<td width="560">
				<input type="radio" name="quitReason" onclick="chooseQuitReason('出差')" />&nbsp;出差<input type="hidden" id="reason1" name="instance(ClassEnrollment).quitReason" />
				<br>
				<input type="radio" name="quitReason" onclick="chooseQuitReason('不感兴趣')" />&nbsp;不感兴趣<input type="hidden" id="reason2" name="instance(ClassEnrollment).quitReason" />
				<br>
				<input type="radio" name="quitReason" onclick="chooseQuitReason('成绩差')" />&nbsp;成绩差<input type="hidden" id="reason3" name="instance(ClassEnrollment).quitReason" />
				<br>
				<input type="radio" name="quitReason" onclick="chooseQuitReason('其他')" />&nbsp;其他&nbsp;&nbsp;<input type="text" id="reason4" name="instance(ClassEnrollment).quitReason" size="24" />
			</td>
		</tr>
		<tr>
			<th width="100">备注</th>
			<td width="560">
				<input type="textarea" id="remark" name="instance(ClassEnrollment).remark" />
			</td>
		</tr>
	</table>
</div>
</form>
<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-info" onclick="javascript:createInstance('formA')" >确定</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-default" onclick="goback()" >取消</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-warning" onclick="queryStudent()" >查询</button>
<br>
<br>
</body>
</html>