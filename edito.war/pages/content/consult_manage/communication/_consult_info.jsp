<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script src="<%=request.getContextPath()%>/js/content/dependsOn-1.0.2.js"></script>
<!-- Consult Info Section -->
<div class="col-md-7">
    <legend>咨询记录</legend>
    <form id="communication_form">
        <input type="hidden" name="typeUuid" value="<s:property value='typeUuid' />" />
        <input type="hidden" id="personUuid" name="personUuid" />
        <input type="hidden" id="action" name="action" value="submit" />
        <input type="hidden" id="communicationUuid" name="communicationUuid" />
        <fieldset>
            <div>
                <div>
                <table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
    <tr>
        <th width="130">是否本人咨询</th>
        <td colspan="3">
            <div>
                <input type="radio" name="consultForHimself" value="是"/>是
                <input type="radio" name="consultForHimself" value="否"/>否
            </div>
        </td>
    </tr>
    <tr>
        <th width="130">咨询途径</th>
        <td colspan="3">
            <div class="checkbox">
                <s:iterator value="consultMannerOptions">
                    <label>
                    <input type="checkbox" name="consultMannerUuid" value="<s:property value='uuid' />">
                    <s:property value="description" />
                    </label>
                </s:iterator>
            </div>
            <div>
                <label>
                    <input type="checkbox" name="consultMannerOther" value="1"/> 其他
                </label>
                <input type="text" name="consultMannerOtherDescription"/>
            </div> 
        </td>
    </tr>
    <tr>
        <th width="130">来源</th>
        <td colspan="3">
            <div class="checkbox">
                <s:iterator value="consultSourceOptions">
                    <label>
                    <input type="checkbox" name="consultSourceUuid" value="<s:property value='uuid' />">
                    <s:property value="description" />
                    </label>
                </s:iterator>
            </div>  
            <div>
                <label>
                    <input type="checkbox" name="consultSourceOther" value="1"/> 其他
                </label>
                <input type="text" name="consultSourceOtherDescription"/>
            </div>
        </td>
    </tr>
    <tr>
        <th width="130">感兴趣的校区</th>
        <td colspan="3">
            <div class="checkbox">
                <s:iterator value="availableCampuses">
                <label>
                    <input type="checkbox" name="interestedCampuses" value="<s:property value='uuid' />">
                    <s:property value="description" />
                </label>
                </s:iterator>
            </div>  
        </td>
    </tr>
    <tr>
        <th width="130">可上课的时间</th>
        <td colspan="3">
            <div>
                <span>平时</span>
                    <input type="checkbox" name="availableTimeForClass" value="平时上午" />上午
                    <input type="checkbox" name="availableTimeForClass" value="平时下午" />下午
                    <input type="checkbox" name="availableTimeForClass" value="平时晚上" />晚上
            </div>
            <div>
                <span>周末</span>
                    <input type="checkbox" name="availableTimeForClass" value="周末上午" />上午
                    <input type="checkbox" name="availableTimeForClass" value="周末下午" />下午
                    <input type="checkbox" name="availableTimeForClass" value="周末晚上" />晚上
            </div>
        </td>
    </tr>
</table>
                </div>
            </div>
        
            <div>
            
            
            
        <div style="margin-top:20px">
                <table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
 <tr>
        <th width="130">感兴趣的课程</th>
        <td colspan="3">
 <div id="interestedCourseTree" class="course-tree"></div>
        </td>
    </tr>
 <tr>
        <th width="130">推荐课程</th>
        <td colspan="3">
 <div id="recommendCourseTree" class="course-tree"></div>
        </td>
    </tr>

    <tr>
        <th width="130">详细记录</th>
        <td colspan="3">
            <textarea name="communicationDetails" style="width:400px;height:100px" ></textarea>
        </td>
    </tr>
    <tr>
        <th width="130">学生咨询结论</th>
        <td colspan="3">
            <div>
                <input type="radio" name="studentDecision" value="考虑中"/>考虑中
                <input type="radio" name="studentDecision" value="拒绝"/>拒绝
                <input type="radio" name="studentDecision" value="报名"/>报名
            </div> 
            <div>
                <label class="choose-reason">请选择原因:</label>
                <s:iterator value="studentRefuseReasonOptions">
                <label>
                    <input type="checkbox" name="studentRefuseReasonUuid" value="<s:property value='uuid' />">
                    <s:property value="description" />
                </label>
                </s:iterator> 
                <s:iterator value="studentConsideringReasonOptions">
                <label>
                    <input type="checkbox" name="studentConsideringReasonUuid" value="<s:property value='uuid' />">
                    <s:property value="description" />
                </label>
                </s:iterator> 
            </div>
            <div>
                <label class="choose-reason">
                    <input type="checkbox" name="studentDecisionOther" value="1" /> 其他
                </label>
                <input type="text" name="studentDecisionOtherDescription"/>
            </div>
        </td>
    </tr>
</table>
                </div>
            </div>
            
            <div style="margin-top:20px">
                <legend>下一步</legend>
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-0">
                              <input type="checkbox" name="followUps" id="next_steps-0" value="CALL_BACK" />
                              预约回访
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="CALL_BACK_TIME"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-1">
                              <input type="checkbox" name="followUps" id="next_steps-1" value="ONSITE_VISIT">
                              预约到访
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="ONSITE_VISIT_TIME"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div> 
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-2">
                              <input type="checkbox" name="followUps" id="next_steps-2" value="OPEN_CLASS">
                              邀请公开课
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="OPEN_CLASS_TIME"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                    </div>
                </div> 
            </div> 
        </fieldset>
    </form>
    <button id="complete_communication_btn" class="btn btn-primary">完成咨询</button>
    <button id="cancel_communication_btn" class="btn btn-default" onclick="goback()">取消咨询</button>
</div>
<!-- End of Consult Info Section -->
<link href="<%=request.getContextPath()%>/style/content/ui.fancytree.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/content/jquery.fancytree-all.js"></script>
<script type="text/javascript">
glyph_opts = {
        map: {
          doc: "glyphicon glyphicon-file",
          docOpen: "glyphicon glyphicon-file",
          checkbox: "glyphicon glyphicon-unchecked",
          checkboxSelected: "glyphicon glyphicon-check",
          checkboxUnknown: "glyphicon glyphicon-share",
          dragHelper: "glyphicon glyphicon-play",
          dropMarker: "glyphicon glyphicon-arrow-right",
          error: "glyphicon glyphicon-warning-sign",
          expanderClosed: "glyphicon glyphicon-plus-sign",
          expanderLazy: "glyphicon glyphicon-plus-sign",  // glyphicon-expand
          expanderOpen: "glyphicon glyphicon-minus-sign",  // glyphicon-collapse-down
          folder: "glyphicon glyphicon-folder-close",
          folderOpen: "glyphicon glyphicon-folder-open",
          loading: "glyphicon glyphicon-refresh"
        }
      };

$(function(){
    $(".course-tree").fancytree({
          extensions: ["glyph"],
          checkbox: true,
          glyph: glyph_opts,
          icons: false,
          selectMode: 2,
          clickFolderMode: 2,
          source:{
              url: cp+"/ajaxs/content/course/manage/query_course_data.html",
              type: "POST"
          },
          lazyLoad: function(event, data) {
            var node = data.node;
            data.result = {
              url: cp+"/ajaxs/content/course/manage/query_course_data.html",
              data: {nodeUuid: node.key},
              type: "POST"
            }
          }
    });
    
    $("#complete_communication_btn").click(function(){
        var nodes = $("#interestedCourseTree").fancytree("getTree").getSelectedNodes();
        var interestedCoursesUuids = [];
        for (var i=0; i<nodes.length; i++){
            interestedCoursesUuids.add(nodes[i].key);
            console.log(nodes[i].key);
        }
        console.log(interestedCoursesUuids);
        
        nodes = $("#recommendCourseTree").fancytree("getTree").getSelectedNodes();
        var recommendCoursesUuids = [];
        for (var i=0; i<nodes.length; i++){
            recommendCoursesUuids.add(nodes[i].key);
        }
        console.log(recommendCoursesUuids);

        if (!confirm("提交后将不可修改! 您确认提交?")) {
            return;
        }
        var dataArray = $("#communication_form").serializeArray();
        dataArray.push({name: "interestedCoursesUuids", value: interestedCoursesUuids});
        dataArray.push({name: "recommendCoursesUuids", value: recommendCoursesUuids});

        $.ajax({
            type: "POST",
            data: dataArray,             
            async: false,
            dataType: "json",
            url: cp+"/ajaxs/content/consult/manage/save_communication.html" ,
            success: function(data){
                if (data["success"] == "success") {
                    $("#nextStepModal").modal({
                        backdrop: 'static',
                        keyboard: false
                    });
                } else {
                    alert("请求失败，请稍后重试!")
                }
            },
            error: function(){
                alert("请求失败，请稍后重试!");
            }
        })  
    })
})

</script>
<script type="text/javascript">
    $(function () {
        $('.datetimepicker').datetimepicker({
                sideBySide: true,
                locale: "zh-cn",
                format: "YYYY-MM-DD HH:mm"
        });
        
        $('#communication_form input[name="consultMannerOtherDescription"]').dependsOn({
            '#communication_form input[name="consultMannerOther"]': {
                checked: true
            }
        });
        $('#communication_form input[name="consultSourceOtherDescription"]').dependsOn({
            '#communication_form input[name="consultSourceOther"]': {
                checked: true
            }
        });
        $('#communication_form input[name="studentRefuseReasonUuid"]').dependsOn({
            '#communication_form input[name="studentDecision"]': {
                values:["拒绝"]
            }
        });
        $('#communication_form input[name="studentConsideringReasonUuid"]').dependsOn({
            '#communication_form input[name="studentDecision"]': {
                values:["考虑中"]
            }
        });
        $('.choose-reason').dependsOn({
            '#communication_form input[name="studentDecision"]': {
                values:["考虑中", "拒绝"]
            }
        });
        $('#communication_form input[name="studentDecisionOtherDescription"]').dependsOn({
            '#communication_form input[name="studentDecisionOther"]': {
                checked: true
            },
            '#communication_form input[name="studentDecision"]': {
                values:["考虑中", "拒绝"]
            }
        });
        
    });

    function goback(){
    	location.href = cp + "/pages/content/consult/manage/communication/consult_student.html";
    }
</script>