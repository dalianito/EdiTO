<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>报名</title>
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
function chooseClass(){
	$("#chooseClass").modal();
}
function executeStudent(){
	var name = $("#name").val();
	var birthDate = $("#birthDate").val();
	var cellPhone = $("#cellPhone").val();
	var tag = "person";
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
	}, "json");
}
function executeClass(){
	var clsNo = $("#clsNo").val();
	var clsTypeUuid = $("#clsTypeUuid").val();
	var courseName = $("#courseName").val();
	var campusUuid = $("#campusUuid").val();
	$.post(cp+"/ajaxs/content/student/manage/student/enrollment/query_class_infos.html", {clsNo:clsNo,clsTypeUuid:clsTypeUuid,courseName:courseName,campusUuid:campusUuid}, function(data){
		var tableHeader = "<tr>";
	    tableHeader += "<th>班级名</th>";
	    tableHeader += "<th>班级类型</th>";
	    tableHeader += "<th>校区</th>";
	    tableHeader += "<th>课程名</th>";
	    tableHeader += "<th>操作</th>";
	    tableHeader += "</tr>";
	    $("#showClass").html(tableHeader);

	    for (var i=0; i<data.length; i++) {
	        var newRow = "<tr>";
	        newRow += "<td colName='clsName"+i+"'>"+data[i][1]+"</td>";
	        newRow += "<td>"+data[i][2]+"</td>";
	        newRow += "<td>"+data[i][3]+"</td>";
	        newRow += "<td colName='courseUuid"+i+"'>"+data[i][4]+"</td>";
	       	newRow += "<td><a href='javascript:showInstance(\""+data[i][0]+"\",\"\",\"/views/content/class/manage/view/class/view_class_info.html\",700,750)'>查看</a>";
	        newRow += "<td><a href='#' onclick='loadClassBasicInfo(\""+data[i][0]+"\",\""+i+"\")' data-dismiss='modal'>选择</a></td>";
	        newRow += "</tr>";
	        $("#showClass").append(newRow);
	    }
	}, "json");
}
function loadStudentBasicInfo(studentUuid,personUuid,i){
	$("#studentUuid").val(studentUuid);
	$("#personUuid").val(personUuid);
	$("#sPUuid").val(personUuid);
	$("#personName").val($("td[colName='personName"+i+"']").html());

    var personUuid = personUuid;
    var studentUuid = studentUuid;
	$.post(cp+"/ajaxs/content/student/manage/student/enrollment/find_student.html", {personUuid:personUuid, studentUuid:studentUuid}, function(data){
		var studentInfo = data[0]
		if(studentInfo[0][2] != null && studentInfo[0][2].length>0) {
			$("#genderUuid").val(studentInfo[0][2]);
			$("#genderUuid").html(studentInfo[0][15]);
		}
		if(studentInfo[0][4] != null && studentInfo[0][4].length>0) {
			$("#nationalityUuid").val(studentInfo[0][4]);
			$("#nationalityUuid").html(studentInfo[0][16]);
		}
		if(studentInfo[0][5] != null && studentInfo[0][5].length>0) {
			$("#marriageUuid").val(studentInfo[0][5]);
			$("#marriageUuid").html(studentInfo[0][17]);
		}
		if(studentInfo[0][6] != null && studentInfo[0][6].length>0) {
			$("#educationUuid").val(studentInfo[0][6]);
			$("#educationUuid").html(studentInfo[0][18]);
		}
		if(studentInfo[0][9] != null && studentInfo[0][9].length>0) {
			$("#politicalUuid").val(studentInfo[0][9]);
			$("#politicalUuid").html(studentInfo[0][19]);
		}
		$("input[name='instance(Student).studentID']").val(studentInfo[0][0]);
		$("input[name='instance(Person).name']").val(studentInfo[0][1]);
		$("input[name='instance(Person).birthDate']").val(studentInfo[0][3]);
		$("input[name='instance(Person).parentName']").val(studentInfo[0][7]);
		$("input[name='instance(Person).parentPhone']").val(studentInfo[0][8]);
		$("input[name='instance(Person).idNo']").val(studentInfo[0][10]);
		$("input[name='instance(Person).cellPhone']").val(studentInfo[0][11]);
		$("input[name='instance(Person).address']").val(studentInfo[0][12]);
		$("input[name='instance(Person).qq']").val(studentInfo[0][13]);
		$("input[name='instance(Person).realAddress']").val(studentInfo[0][14]);
	}, "json");
	if($("#personName").val() != ""){
		$("#personName").attr("disabled","disabled");
	}
	showDiv("viewStudentInfo");
}
function loadClassBasicInfo(arrangeClassUuid,i){
	$("#arrangeClassUuid").val(arrangeClassUuid);
	$("#clsName").val($("td[colName='clsName"+i+"']").html());
	$("#courseUuid").val($("td[colName='courseUuid"+i+"']").html());

	var uuid = arrangeClassUuid;
	$.post(cp+"/ajaxs/content/student/manage/student/enrollment/find_class.html", {arrangeClassUuid:uuid}, function(data){
		var classData = data[0];
		var courseData = data[1];
		$("#preDiscountAmountInput").val(classData[0][6]);
		$("#preDiscountAmount").html(classData[0][6]+"元");
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
		buffer += "<td width='120'>"+classData[0][3]+"</td>";
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
	}, "json");
	if($("#clsName").val() != ""){
		$("#clsName").attr("disabled","disabled");
	}
}
function chooseDiscountType(type) {
	if(type == "discount") {
		$("#discount2").attr("value","");
		$("#discount2").attr({"disabled":true});
		$("#discountReason2").attr("value","");
		$("#discountReason2").attr({"disabled":true});
		$("#discount1").attr("value","0");
		$("#discount1").attr({"disabled":false});
		$("#discountReason1").attr("value","");
		$("#discountReason1").attr({"disabled":false});
	}
	else {
		$("#discount1").attr("value","");
		$("#discount1").attr({"disabled":true});
		$("#discountReason1").attr("value","");
		$("#discountReason1").attr({"disabled":true});
		$("#discount2").attr("value","0");
		$("#discount2").attr({"disabled":false});
		$("#discountReason2").attr("value","");
		$("#discountReason2").attr({"disabled":false});
	}
}
function calculate(){
	var preDiscountAmount = $("#preDiscountAmountInput").val();
	var discount1 = $("#discount1").val();
	var discount2 = $("#discount2").val();
	var actualTotalAmount = "";
	if(discount1 == "" && discount2 != ""){
		actualTotalAmount = (preDiscountAmount-discount2);
	}
	else if(discount1 != "" && discount2 == ""){
		var percent = discount1/100;
		actualTotalAmount = Math.ceil(preDiscountAmount*percent);
	}
	else{
		actualTotalAmount = "";
	}
	$("input[id='actualTotalAmount']").val(actualTotalAmount);
	$("span[id='actualTotalAmount']").html(actualTotalAmount+"元");
}
function createInstance(elementId){
	if($("#personName").val() == "请选择"){
		alert("请选择学生");
		return
	}
	else if($("#clsName").val() == "请选择"){
		alert("请选择班级");
		return
	}
	else{
		if(confirm("确认报名？")){
			var param=Submit.excute(elementId);
			$.ajax({
		        type: "POST",
		        url: cp + "/ajaxs/content/student/manage/student/enrollment/create_enrollment.html",
		        data: param,
		        dataType: "json",
		        success: function() {
	                alert("报名成功");
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
	var mark = "enrollment";
	location.href = cp + "/https/content/student/manage/student/enrollment/query_studentstatus.html_" + mark ;
}
function goback(){
	location.href = cp + "/pages/content/student/manage/student/enrollment/query_enrollment.html";
}
</script>
<form id="formA">
<table align="left">
	<tr>
		<th width="80">学生姓名</th>
		<td width="120">
			<input type="hidden" id="personUuid" name="instance(Person).uuid" />
			<input type="hidden" id="sPUuid" name="instance(Student).personUuid" />
			<input type="hidden" id="employeeUuid" name="instance(Consultant).employeeUuid" value="<s:property value='#session.LOGIN_USER.uuid' />" />
			<input type="button" id="personName" size="14" value="请选择" onclick="chooseStudent()" />
		</td>
		<th width="80">班级名</th>
		<td width="120">
			<input type="hidden" id="arrangeClassUuid" name="instance(ArrangeClass).uuid" />
			<input type="button" id="clsName" size="14" value="请选择" onclick="chooseClass()" />
		</td>
		<th width="80">课程名</th>
		<td width="120"><input type="text" id="courseUuid" disabled="disabled" size="14" /></td>
	</tr>
</table>
<br><br>
<div class="modal fade" id="chooseStudent" tabindex="-1" role="dialog" aria-labelledby="chooseStudentLabel" aria-hidden="true">
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
<div class="modal fade" id="chooseClass" tabindex="-1" aria-labelledby="chooseClassLabel" role="dialog" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="chooseClassLabel">
               选择班级
            </h4>
         </div>
         <div class="modal-body">
			<table style="margin:0 auto" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
				<tr>
					<th width="80">班级名</th>
					<td width="120"><input type="text" id="clsNo" size="14" /></td>
					<th width="80">班级类型</th>
					<td width="120"><label id="clsTypeUuid" class="BaseTree" javaClassName="ClassManagement" ></label></td>
				</tr>
				<tr>
					<th width="80">课程名</th>
					<td width="120"><input type="text" id="courseName" size="14" /></td>
					<th width="80">所在校区</th>
					<td width="120"><label id="campusUuid" class="BaseTree" javaClassName="Campus" ></label></td>
				</tr>
			</table>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="executeClass()"><img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
         <div style="margin-top:20px">
             <legend></legend>
             <div>
             	<table id="showClass" style="width:100%"></table>
             </div>
         </div>
         </div>
         <div class="modal-footer"></div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<br>
<div id="viewStudentInfo" style="display:none">
	<table class="InputPanel">
		<tr>
			<th colspan="6" align="center">学生信息</th>
		</tr>
		<tr>
			<th width="100px">学生编号</th>
			<td width="120px">
				<input type="text" name="instance(Student).studentID" disabled="disabled" style="width:90px" validate="true" />
				<input type="hidden" id="studentUuid" name="instance(Student).uuid" />
				
			</td>
			<th width="100px">学生姓名</th>
			<td width="120px">
				<input name="instance(Person).name" style="width:90px" validate="true" >&nbsp;
			</td>
			<th width="100px">性别</th>
			<td width="120px">
				<label id="genderUuid" name="instance(Person).genderUuid"  class="BaseTree" javaClassName="Gender" validate="true"></label>
			</td>
		</tr>
		<tr>
			<th width="100">出生日期</th>
			<td width="120">
				<input type="text" name="instance(Person).birthDate"  class="datepicker" format="all" validate="true"/>
			</td>
			<th width="100">民族</th>
			<td width="120">
				<label id="nationalityUuid" name="instance(Person).nationalityUuid"  class="BaseTree" javaClassName="Nationality"></label>
			</td>
			<th width="100">婚否</th>
			<td width="120">
				<label id="marriageUuid" name="instance(Person).marriageUuid"  class="BaseTree" javaClassName="MarriageState" /></label>
			</td>
		</tr>
		<tr>
			<th width="100">最高学历</th>
			<td width="120">
				<label id="educationUuid" name="instance(Person).educationUuid"  class="BaseTree" javaClassName="Education" validate="true" ></label>
			</td>
			<th width="100">家长姓名</th>
			<td width="120">
				<input name="instance(Person).parentName"  style="width:90px" />
			</td>
			<th width="100">家长电话</th>
			<td width="120">
				<input name="instance(Person).parentPhone"  style="width:90px"/>
			</td>
		</tr>
		<tr>
			<th width="100">政治面貌</th>
			<td width="120">
				<label id="politicalUuid" name="instance(Person).politicalUuid"  class="BaseTree" javaClassName="Political"></label>
			</td>
			<th width="100" >身份证号</th>
			<td width="340" colspan="3" >
				<input type="text" name="instance(Person).idNo"  style="width:310px" validate="true" />
			</td>
		</tr>
		<tr>
			<th width="100">电话</th>
			<td width="120">
				<input type="text" name="instance(Person).cellPhone"  style="width:90px" validate="true" />
			</td>
			<th width="100" >身份证住址</th>
			<td width="340" colspan="3" >
				<input type="text" name="instance(Person).address"   style="width:310px" />
			</td>
		</tr>
		<tr>
			<th width="100">QQ</th>
			<td width="120">
				<input type="text" name="instance(Person).qq" style="width:90px"  />
			</td>
			<th width="100" >实际居住住址</th>
			<td width="340" colspan="3" >
				<input type="text" name="instance(Person).realAddress"   style="width:310px" />
			</td>
		</tr>
		<tr>
			<th width="100">是否免费</th>
            <td colspan="5" width="560">
                <input type="radio" name="instance(ClassEnrollment).ifFree" value="true" onclick="hideDiv('viewTuitionInfo')" checked />&nbsp;免费重听&nbsp;&nbsp;&nbsp;
                <input type="radio" name="instance(ClassEnrollment).ifFree" value="false" onclick="showDiv('viewTuitionInfo')" />&nbsp;缴费
            </td>
		</tr>
	</table>
</div>
<br>
<div id="viewClassInfo"></div>
<br>
<div id="viewTuitionInfo" style="display:none">
	<table class="InputPanel">
		<tr>
			<th colspan="2" align="center">费用信息</th>
		</tr>
		<tr>
			<th width="100">应收取费用</th>
			<td width="560">
				<input type="hidden" id="preDiscountAmountInput" name="instance(Tuition).preDiscountAmount" />
				<span id="preDiscountAmount"></span>
			</td>
		</tr>
		<tr>
			<th width="100">优惠</th>
			<td width="560">
				<input type="radio" name="discountType" value="" onclick="chooseDiscountType('discount')" checked/>&nbsp;折扣&nbsp;&nbsp;<input type="text" id="discount1" name="instance(Tuition).discount" size="11" />&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;原因&nbsp;<input type="text" id="discountReason1" name="instance(Tuition).discountReason" size="18" />
				<br>
				<input type="radio" name="discountType" value="" onclick="chooseDiscountType('number')" />&nbsp;金额&nbsp;&nbsp;<input type="text" id="discount2" name="instance(Tuition).discount" size="11" disabled="disabled" />&nbsp;元&nbsp;&nbsp;&nbsp;原因&nbsp;<input type="text" id="discountReason2" name="instance(Tuition).discountReason" size="18" disabled="disabled" />
			</td>
		</tr>
		<tr>
			<th width="100">折扣后总费用</th>
			<td width="560">
				<input type="hidden" id="actualTotalAmount" name="instance(Tuition).actualTotalAmount" />
				<span id="actualTotalAmount"></span>
			</td>
		</tr>
		<tr>
			<th width="100">此次收取费用</th>
			<td width="560">
				<input type="text" id="amountPaid" name="instance(Tuition).amountPaid" size="14" onclick="calculate()" />&nbsp;元
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