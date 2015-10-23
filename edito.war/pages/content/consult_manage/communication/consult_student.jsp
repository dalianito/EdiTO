<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<title>学生咨询</title>
<style>
.student-basic-info-table tr{
    height: 37px;
}
</style>
<script src="<%=request.getContextPath()%>/js/content/consult.js"></script>
<%@ include file="_student_info.jsp"%>
<%@ include file="_consult_info.jsp"%>

<div class="modal fade" id="nextStepModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-body">
            您已经完成当前学生咨询，请选择下一步:
         </div>
         <div class="modal-footer">
            <a href="<%=request.getContextPath()%>/pages/content/consult/manage/consultant/dashboard.html" class="btn btn-default">我的工作</a>
            <a href="<%=request.getContextPath()%>/pages/content/consult/manage/communication/my_communications.html" class="btn btn-default">我的咨询</a>
            <a href="" class="btn btn-default">下一位</a>
         </div>
      </div>
    </div>
</div>

<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" /></form>
