<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<title>咨询基表设置</title>
<script language="JavaScript" type="text/JavaScript">
$(document).ready(function() {
    $.fn.editable.defaults.mode = 'inline';

    function initializeEvents($e){
    $e.find('.editable-record').editable({
    	emptytext: '空白',
        type: 'text',
        url: cp + '/ajaxs/content/consult/manage/default_options/update_default_option.html',
        params: function(params) { 
            var data = {};
            data['uuid'] = $(this).attr("data-pk");
            data['description'] = params.value;
            data['entity'] = $(this).parents("table").attr("entity");
            data['attribute'] = $(this).parents("table").attr("attribute");
            return data;
        },
        success: function(response, newValue){
        	if (response == null || response == "") {
        		return;
        	}
        	response = JSON.parse(response);
        	if (!(typeof response.uuid === undefined)){
        		$(this).attr("data-pk", response.uuid);
        		$(this).parents("tr").attr("data-id", response.uuid);
        	}
        }
    });
    $e.find('.delete-button').on('click', function(e){
    	var id = $(this).parents("tr").data('id');
    	$('#myModal').data('id', id).modal('show');
    });
    $e.find('.edit-button').click(function(e){
    	e.stopPropagation();
        $(this).parents('tr.record-row').find("a.editable-record")[0].click();	
    });
    }
    
    initializeEvents($(".tab-content"));
    
    $('#btnYes').click(function() {
        var id = $('#myModal').data('id');
        if (id.indexOf("newRecord") > -1) {
        	$('[data-id='+id+']').remove();
            $('#myModal').modal('hide');
            return;
        }
        $.ajax({
        	type: "POST",
        	url: cp+"/ajaxs/content/consult/manage/default_options/delete_default_option.html",
        	data: {uuid:id},
        	success: function(){
        	    $('[data-id='+id+']').remove();
        	    $('#myModal').modal('hide');
        	},
        	error: function(){
        		alert("请求失败，请重试!");
        	    $('#myModal').modal('hide');
        	}
        })
    });
    
    var newRecordCnt = 0;
    $('.btn-add-new-option').click(function(e){
    	e.stopPropagation();
    	var emptyRecordRow = $(this).parents("div.tab-pane").find("tr.empty-record-row"); 
    	var newRow = emptyRecordRow.clone().removeAttr('id').removeClass("hide").removeClass("empty-record-row").attr("data-id", "newRecord"+newRecordCnt);
    	emptyRecordRow.before(newRow);
    	initializeEvents(newRow);
    	$('[data-id=newRecord'+newRecordCnt+']').find("a.editable-record")[0].click();
    	newRecordCnt ++;
    });
    
    
    $("ul.nav-tabs").find("a").first().click();
});
</script>


<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true"></button>
		<h4 id="myModalLabel">确认删除么？</h4>
	</div>
	<div class="modal-body">
		<p>您确定要删除该项基表么？</p>
	</div>
	<div class="modal-footer">
		<button data-dismiss="modal" class="btn-danger" id="btnYes">确定</button>
		<button class="btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
	</div>
	</div>
	</div>
</div>
<div class="tabbable tabs-left">
	<ul class="nav nav-tabs">
	    <s:iterator value="attributeDisplayNameMap">
		<li><a href="#<s:property value='key'/>" data-toggle="tab"><s:property value="value"/></a></li>
		</s:iterator>
	</ul>
	<div class="tab-content col-lg-5">
	    <s:iterator value="defaultOptionsHash">
		<div class="tab-pane" id="<s:property value='key'/>">
		  <table class="table table-striped table-condensed" entity="consult" attribute="<s:property value='key'/>">
		      <tr>
		          <th class="col-xs-7">选项</th>
		          <th class="col-xs-1">编辑</th>
		          <th class="col-xs-1">删除</th>
		      </tr>
		      <s:iterator value="value">
		      <tr data-id="<s:property value='uuid' />" class="record-row">
		          <td>
                    <a href="#" data-pk="<s:property value='uuid'/>" class="editable editable-record" style="display: inline;"><s:property value="description"/></a>
		          </td>
		          <td>
    				<button type="button" class="btn btn-info btn-sm edit-button">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
                    </button>
		          </td>
		          <td>
    				<button type="button" class="btn btn-danger btn-sm delete-button">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 
                    </button>
		          </td>
		      </tr>
		      </s:iterator>
		      <tr class="record-row hide empty-record-row">
		          <td>
                    <a href="#" data-pk="" class="editable editable-record" style="display: inline;"></a>
		          </td>
		          <td>
    				<button type="button" class="btn btn-info btn-sm edit-button">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
                    </button>
		          </td>
		          <td>
    				<button type="button" class="btn btn-danger btn-sm delete-button">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 
                    </button>
		          </td>
		      </tr>
          </table>
          <button type="button" class="btn btn-primary btn-add-new-option col-xs-offset-5">添加新选项</button>
		</div>
		</s:iterator>
	</div>
</div>