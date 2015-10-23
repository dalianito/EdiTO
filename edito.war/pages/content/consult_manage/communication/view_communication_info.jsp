<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <title>查看沟通详情</title>
    <link href="<%=request.getContextPath()%>/style/style_content.css" rel="stylesheet" type="text/css">
</head>
<link href="<%=request.getContextPath()%>/style/bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/bootstrap-theme.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/content/jquery.1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/content/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/style/content/jquery-ui.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/style/content/jquery-ui.theme.css" type="text/css" rel="stylesheet"/>
<script src="<%=request.getContextPath()%>/js/content/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/style/content/ui.fancytree.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/content/jquery.fancytree-all.js"></script>
<script>var cp = "<%=request.getContextPath()%>";</script>
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
    $("#interestedCourseTree").fancytree({
          extensions: ["glyph"],
          glyph: glyph_opts,
          icons: false,
          selectMode: 2,
          clickFolderMode: 2,
          source:{
              url: cp+"/ajaxs/content/consult/manage/communication/query_interested_courses.html",
              type: "POST",
              data: {uuid: "<s:property value='communication.uuid' />"},
          }
    });
    $("#recommendCourseTree").fancytree({
          extensions: ["glyph"],
          glyph: glyph_opts,
          icons: false,
          selectMode: 2,
          clickFolderMode: 2,
          source:{
              url: cp+"/ajaxs/content/consult/manage/communication/query_recommended_courses.html",
              type: "POST",
              data: {uuid: "<s:property value='communication.uuid' />"},
          }
    });
});
</script>
<body class="BodyView">
<legend>详细沟通记录</legend>
            <table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
                <tr>
                    <th>咨询时间</th>
                    <td><s:date name="communication.startAt" format="yyyy-MM-dd HH:mm" /></td> 
                    <th>咨询师</th>
                    <td><s:property value="communication.employee.person.name" /></td> 
                </tr>
            </table>
            <legend style="margin-top: 20px; margin-bottom: 5px;">学生信息</legend>
            <table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
                <tr>
                    <th width="70px">学生编号</th>
                    <td colspan="5"><s:property value="studentID" /></td>
                </tr>
                <tr>
                    <th>学生姓名</th>
                    <td width="120px">
                        <s:property value="person.name" />
                    </td>
                    <th width="70px">性别</th>
                    <td width="50px">
                        <s:property value="person.gender.description" />
                    </td>
                    <th width="50px">年龄</th>
                    <td width="50px">
                        <s:property value="person.estAge" />
                    </td>
                </tr>
                <tr>
                    <th>学历</th>
                    <td colspan="5">
                        <s:property value="person.education.description" />
                    </td>
                </tr>
                <tr>
                    <th>家长姓名</th>
                    <td>
                        <s:property value="person.parentName" />
                    </td>
                    <th>家长电话</th>
                    <td colspan="3">
                        <s:property value="person.parentPhone" />
                    </td>
                </tr>
                <tr>
                    <th>联系电话</th>
                    <td>
                        <s:property value="person.cellPhone" />
                    </td>
                    <th>QQ</th>
                    <td colspan="3">
                        <s:property value="person.Qq" />
                    </td>
                </tr>
                <tr>
                    <th>居住地址</th>
                    <td colspan="5">
                        <s:property value="person.realAddress" />
                    </td>
                </tr>
            </table>

            <legend style="margin-top: 20px; margin-bottom: 5px;">咨询记录</legend>
<div>
    <s:if test="!isFollowUpView">
      <div>

            <table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
            <s:if test="!isFollowUpView">
    <tr>
        <th width="130">是否本人咨询</th>
        <td colspan="3">
            <s:property value="consultForHimself"/>
        </td>
    </tr>
    </s:if>
    <s:if test="!isFollowUpView">
    <tr>
        <th width="130">咨询途径</th>
        <td colspan="3">
            <div>
                <s:iterator value="consultManners">
                    <s:property />
                </s:iterator>
            </div>
        </td>
    </tr>
    </s:if>

    <s:if test="!isFollowUpView">
    <tr>
        <th width="130">来源</th>
        <td colspan="3">
            <div>
                <s:iterator value="consultSources">
                    <s:property />
                </s:iterator>
            </div>  
        </td>
    </tr>
    </s:if>

    <s:if test="!isFollowUpView">
    <tr>
        <th width="130">感兴趣的校区</th>
        <td colspan="3">
            <div>
                <s:iterator value="availableCampuses">
                    <s:property />
                </s:iterator>
            </div>  
        </td>
    </tr>
    </s:if>

    <s:if test="!isFollowUpView">
    <tr>
        <th width="130">可上课的时间</th>
        <td colspan="3">
            <div>
                <s:iterator value="availableTimesForClass">
                    <s:property/> 
                </s:iterator>
            </div>
        </td>
    </tr>
    </s:if>
</table>
                </div>
                </s:if>

            </div>
        
            <div>
            
            
            
        <div style="margin-top:20px">
                <table width="600px" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">

    <s:if test="!isFollowUpView">
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
    </s:if>

    <tr>
        <th width="130">详细记录</th>
        <td colspan="3">
            <pre style="white-space:pre-wrap"><s:property value="consultDetails" /></pre>
        </td>
    </tr>
    <tr>
        <th width="130">学生结论</th>
        <td colspan="3">
            <div>
                <s:property value="communication.customerDecision" />
            </div> 
            <div>
                <s:iterator value="studentDecisionReasons">
                    <s:property />
                </s:iterator>
            </div>
        </td>
    </tr>
</table>
                </div>
            </div>
            
            <div style="margin-top:20px">
                <legend style="margin-top: 20px; margin-bottom: 5px;">下一步</legend>
                <table width="600px" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
                    <s:iterator value="followUps">
                        <tr>
                        <th width="150"><s:property value="key" /></th>
                        <td><s:property value="value" /></td>
                        </tr>
                    </s:iterator>
                    </table>
            </div> 
</body>
</html>
