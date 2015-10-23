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


function loadStudentSearchResult(result){
    var tableHeader = "<tr>";
    tableHeader += "<th>姓名</th>";
    tableHeader += "<th>联系方式</th>";
    tableHeader += "<th>上次咨询时间</th>";
    tableHeader += "<th>操作</th>";
    tableHeader += "</tr>";
    $(".student-search-result table").html(tableHeader);
             
    for (var i=0; i<result.length; i++) {
        var newRow = "<tr personUuid='" + result[i].personUuid + "'>";
        newRow += "<td>";
        newRow += result[i].name ? result[i].name : "";
        newRow += "</td>";
        newRow += "<td>";
        if (result[i].contactInfo) {
            for (var j=0;j<result[i].contactInfo.length; j++){
                newRow += result[i].contactInfo[j] + "<br/>";
            }
        }
        newRow += "</td>";
        newRow += "<td></td>";
        newRow += "<td><a class='btn btn-sm btn-info btn-select-student'>选择</a></td>";
        newRow += "</tr>";
        $(".student-search-result table").append(newRow);
    }
    
    $(".btn-select-student").click(function(){
        var personUuid = $(this).parents('tr').attr("personUuid");
        loadStudentBasicInfo(personUuid);
    });
}

function loadStudentBasicInfo(personUuid) {
    $("#personUuid").val(personUuid);
    $(".search-student-info").addClass("hide");
    $(".student-basic-info").removeClass("hide");   
    $(".student-communication-history").removeClass("hide");    
    
    $.ajax({
        type: "POST",
        data: {personUuid: personUuid},
        dataType: "json",
        url: cp + "/ajaxs/content/consult/manage/student/query_student_communication_history.html",
        success: function(result) {
            if (!result || result.length == 0) {
                alert("请求失败，请重试!");
                return;
            }
            for (var key in result) {
                $("#"+key).html(result[key]);
            }
            
            $(".student-info-editable[data-type=text]").editable({
                url: cp + "/ajaxs/content/consult/manage/update_student_basic_info.html",
                pk: personUuid,
                emptytext: "需补充",
            });
            $(".student-info-editable[name='genderUuid']").editable({
                url: cp + "/ajaxs/content/consult/manage/update_student_basic_info.html",
                pk: personUuid,
                autotext: 'always',
                value: result["genderUuid"],
                emptytext: "需补充",
                source: getSelectOptions("Gender"),
            });

            $(".student-info-editable[name='educationUuid']").editable({
                url: cp + "/ajaxs/content/consult/manage/update_student_basic_info.html",
                pk: personUuid,
                emptytext: "需补充",
                autotext: 'always',
                value: result["educationUuid"],
                source: getSelectOptions("Education"),
            });
            
            loadCommunicationHistories(result["communicationHistories"]);
        },
        error: function(){
            alert("请求失败，请重试！");
        }
    })
}

function loadCommunicationHistories(communicationHistories) {
    var tableHeader = "<tr>";
    tableHeader += "<th>时间</th>";
    tableHeader += "<th>负责人</th>";
    tableHeader += "<th>咨询课程</th>";
    tableHeader += "<th>结论</th>";
    tableHeader += "<th>操作</th>";
    tableHeader += "</tr>";
    $(".student-communication-history table").html(tableHeader);
             
    for (var i=0; i<communicationHistories.length; i++) {
        var comm = communicationHistories[i];
        var newRow = "<tr communicationUuid='" + comm.communicationUuid + "'>";
        newRow += "<td>" + comm.date + "</td>";
        newRow += "<td>" + comm.owner + "</td>";
        newRow += "<td><div id='courseTree"+comm.communicationUuid+"'></div></td>";
        if (comm.decision == null) {
            newRow += "<td></td>";
        } else {
            newRow += "<td>" + comm.decision + "</td>";
        }
        newRow += "<td><a href='javascript:showInstance(\""+comm.communicationUuid+"\",\"\",\"/views/content/consult/manage/communication/view_communication_info.html\",600,700)'>查看</a>&nbsp;&nbsp;&nbsp;";
        newRow += "</tr>";
        $(".student-communication-history table").append(newRow);
        if (comm.courses != null && comm.courses.length > 0){
                $("#courseTree"+comm.communicationUuid).fancytree({
                    extensions: ["glyph"],
                    glyph: glyph_opts,
                    icons: false,
                    selectMode: 2,
                    clickFolderMode: 2,
                    source: comm.courses,
                }); 
        }
    }
}

function getSelectOptions(className) {
    var returnData = [];
    $.ajax({
        type: "POST",
        data: {className: className, sortField: "uuid", sortType: "asc"},
        dataType: "json",
        async: false,
        url: cp+"/ajaxs/tree/get_data_of_base_tree.html" ,
        success: function(data){
            for (var i=0; i<data.length; i++) {
                returnData.add({value: data[i].uuid, text: data[i].text});
            }
        },
        error: function(){
            alert("请求失败，请稍后重试!");
        }
    })  
    
    return returnData;
}

function findStudentInfo(){
    $.ajax({
        type: "POST",
        url: cp + "/ajaxs/content/consult/manage/student/query_student.html",
        data: $("#search_student_info").serialize(),
        dataType: "json",
        success: function(result) {
            if (!result || result.length == 0) {
                alert("无法找到相关学生，请重新查找或新建学生信息!");
            } else {
                $(".student-search-result").removeClass("hide");    
                loadStudentSearchResult(result);
            } 
        },
        error: function(){
            alert("请求失败或超时，请稍后再试！");
            return;
        }
    })
}

function createStudentInfo(){
    var studentName = $("#search_student_info input[name='studentName']").val();
    var studentContactInfo = $("#search_student_info input[name='studentContactInfo']").val();
    
    if (studentName.length == 0 && studentContactInfo.length == 0) {
        alert("请至少填一项内容再新建!");
        return;
    }
    
    $.ajax({
        type: "POST",
        url: cp + "/ajaxs/content/consult/manage/student/create_student.html",
        data: $("#search_student_info").serialize(),
        async: false,
        success: function(result) {
            if (!result || result.length == 0) {
                alert("创建学生信息失败，请重试!");
            } else {
                loadStudentBasicInfo(result);
            } 
        },
        error: function(){
            alert("请求失败或超时，请稍后再试！");
            return;
        }   
    })
}
