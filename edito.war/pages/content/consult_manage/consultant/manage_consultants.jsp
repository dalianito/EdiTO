<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>管理咨询师</title>
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
    var personNo = $("#personNo").val();
    var name = $("#name").val();
    var data = {personNo:personNo,
                name:name,
                offset:1,
                recnum:24};
    $.ajax({
        type: "POST",
        url: cp+"/ajaxs/content/consult/manage/consultant/query_consultants.html",
        data:data,
        cache: false,
        dataType: "json",
        success: function(msg){
            if(msg!=null){
                $("#result").pagination({
                    totalRecord:msg[1],
                    dataStore:msg[0],
                    proxyUrl:cp+"/ajaxs/content/consult/manage/consultant/query_consultants.html",
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
    buffer += "<table width='600' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
    buffer += "<tr><th width='75'>员工号</th><th width='75'>姓名</th><th width='100'>组织机构</th><th width='115'>校区</th><th width='100'>操作</th></tr>";
    for(var i=0;i<dataStore.length;i++){
        if(i%2==0){
            buffer += "<tr class='tr1'>";
        }
        else {
            buffer += "<tr class='tr2'>";
        }
        buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
        buffer += "<td align='center'><a href='javascript:deleteInstance(\""+dataStore[i][6]+"\")'>删除</a>";
        buffer += "</td>";
        buffer += "</tr>";
    }
    buffer += "</table></div>";
    return buffer;
}
function deleteInstance(uuid){
    if(confirm("确认删除？")){
        $.post(cp+"/ajaxs/content/consult/manage/consultant/delete_consultant.html",{uuid:uuid},function(){
        	alert("删除成功！")
            execute();
        })
    }
}
</script>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
    <tr>
        <th width="100">员工号</th>
        <td width="140"><input id="personNo" size="11" /></td>
        <th width="100">姓名</th>
        <td width="140"><input id="name" size="11" /></td>
    </tr>
</table>
<br>
<br>
<br>
<a href="#" onclick="execute()"> <img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/content/consult/manage/consultant/create.html">
<img src="<%=request.getContextPath()%>/images/button/b_create.gif" /></a>
<br>
<br>
<div id="result" class="bigResultCon" style="width: 720px; margin-left: -10px"></div>
</body>
</html>
