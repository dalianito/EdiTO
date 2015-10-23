<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>我的咨询</title>
</head>

<body>
<form id="form" name="form" method="post"><input type="hidden"
    name="uuid" /> <input type="hidden" name="resultCode" /></form>
<script>
$(document).ready(function(){
    currentResultTableDivWidth = 720;
    execute();
});
function execute(){
    var data = {offset:1, recnum:24};
    $.ajax({
        type: "POST",
        url: cp+"/ajaxs/content/consult/manage/query_my_communications.html",
        data:data,
        cache: false,
        dataType: "json",
        success: function(msg){
            if(msg!=null){
                $("#result").pagination({
                    totalRecord:msg[1],
                    dataStore:msg[0],
                    proxyUrl:cp+"/ajaxs/content/consult/manage/query_my_communications.html",
                    data:data,
                    currentPage:1,
                    perPage:24,
                    toolbarType:"pgBlueToolbar",
                    barPosition:"top&bottom",
                    pageType:"show"
                });
            }
        },
        error: function(){
            alert("请求失败或超时，请稍后再试！");
            return;
        }
    })
}
function addData(dataStore){
    var buffer="";
    buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
    buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
    buffer += "<tr><th>咨询时间</th><th>沟通类型</th><th>学生姓名</th><th width='115'>联系方式</th><th width='115'>结果</th><th width='115'>操作</th></tr>";
    for(var i=0;i<dataStore.length;i++){
        if(i%2==0){
            buffer += "<tr class='tr1' ";
        }
        else {
            buffer += "<tr class='tr2' ";
        }
        buffer += "communicationUuid='" + dataStore[i][0] + "'>";
        buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
        buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][0]+"\",\"\",\"/views/content/consult/manage/communication/view_communication_info.html\",520,620)'>查看</a>&nbsp;</td>";
        buffer += "</tr>";
    }
    buffer += "</table></div>";
    return buffer;
}
</script>
<div id="result" class="bigResultCon" style="width: 720px; margin-left: -10px"></div>
</body>
</html>
