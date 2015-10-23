<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- Student Info Section -->
<div class="col-md-5">
    <legend>学生信息</legend>
    <div class="search-student-info">
        <form id="search_student_info">
            <table class="InputPanel">
                <tr>
                    <th width="100px">学生姓名</th>
                    <td>
                        <input type="text" name="studentName" />
                    </td>
                </tr>
                <tr>
                    <th>电话/QQ</th>
                    <td>
                        <input type="text" name="studentContactInfo" />
                    </td>
                </tr>
            </table>
        </form>
            <div style="margin:10px 0 20px 60px">
                <button onclick="findStudentInfo()" class="btn btn-md btn-primary">查询</button>
                <span> -或- </span>
                <button onclick="createStudentInfo()" class="btn btn-md btn-primary">新建</button>
            </div>
    </div>
    
    <div class="search-student-info student-search-result hide">
        <table class="table table-striped" style="width:100%">
        </table> 
    </div>
    
<%@ include file="_student_basic_info.jsp"%>
<%@ include file="_student_communication_history.jsp"%>
    
</div>
<!-- End of Student Info Section -->