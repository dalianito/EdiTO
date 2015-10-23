<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List"%>
<%@ page import="com.ito.edito.schema.Menu"%>
<%@ page import="java.util.ArrayList"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
<title><decorator:title default="Struts Showcase"/></title>
<script>var cp = "<%=request.getContextPath()%>";</script>
<script>var up = "<%=request.getSession().getAttribute("UPLOAD_URL")%>";</script>
<script src="<%=request.getContextPath()%>/js/Concurrent.Thread.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.resizable.js"></script>
<script src="<%=request.getContextPath()%>/js/hashtable.js"></script>
<script src="<%=request.getContextPath()%>/js/dateformat.js"></script>
<script src="<%=request.getContextPath()%>/js/json2.js"></script>
<script src="<%=request.getContextPath()%>/js/iscript.js"></script>
<script src="<%=request.getContextPath()%>/js/info_manager.js"></script>
<script src="<%=request.getContextPath()%>/js/basetree.js"></script>
<script src="<%=request.getContextPath()%>/js/date.js"></script>
<script src="<%=request.getContextPath()%>/js/date_image.js"></script>
<script src="<%=request.getContextPath()%>/js/date_multiple.js"></script>
<script src="<%=request.getContextPath()%>/js/date_query.js"></script>
<script src="<%=request.getContextPath()%>/js/drop_menu.js"></script>
<script src="<%=request.getContextPath()%>/js/grid_simple.js"></script>
<script src="<%=request.getContextPath()%>/js/pagination.js"></script>
<script src="<%=request.getContextPath()%>/js/submit.js"></script>
<script src="<%=request.getContextPath()%>/js/validation.js"></script>
<script src="<%=request.getContextPath()%>/js/toggle.js"></script>
<script src="<%=request.getContextPath()%>/js/cover.js"></script>
<link href="<%=request.getContextPath()%>/style/pagination.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
var hide;
var show;
var mark="hide";
var ifClick = false;
var pxMove=2;
function changeLeft(){
	hideBgColor();
	if(!ifClick){
		if(mark=="hide"){
			$("#leftMenuContent").css("display", "none");
			hide = setInterval(exeHide, 70);
		}
		else{
			show = setInterval(exeShow, 70);
		}
	}
}
var borderChange = false;
var currentResultTableDivWidth = 880;
function exeHide(){
	ifClick = true;
	var leftMenu = $(".leftMenu");
	var resultTableDiv = $(".resultTableDiv");
	var bigResultCon = $(".bigResultCon");
	if(leftMenu.width()>10){
		leftMenu.width(leftMenu.width()-pxMove);
		bigResultCon.width(bigResultCon.width()+pxMove);
		resultTableDiv.width(resultTableDiv.width()+pxMove);
		currentResultTableDivWidth += pxMove;
		pxMove += 6;
	}
	else{
		clearInterval(hide);
		var arrowImg = $("#arrowImg");
		arrowImg.attr("src", cp+"/images/mainResource/arrow_right.gif");
		mark="show";
		ifClick = false;
		pxMove = 2;
	}
	if(borderChange){
		changeBorder();
	}
}
function exeShow(){
	ifClick = true;
	var leftMenu = $(".leftMenu");
	var resultTableDiv = $(".resultTableDiv");
	var bigResultCon = $(".bigResultCon");
	if(leftMenu.width()<150){
		leftMenu.width(leftMenu.width()+pxMove);
		bigResultCon.width(bigResultCon.width()-pxMove);
		resultTableDiv.width(resultTableDiv.width()-pxMove);
		currentResultTableDivWidth -= pxMove;
		pxMove += 6;
	}
	else{
		clearInterval(show);
		var arrowImg = $("#arrowImg");
		arrowImg.attr("src", cp+"/images/mainResource/arrow_left.gif");
		mark="hide";
		ifClick = false;
		pxMove = 2;
		$("#leftMenuContent").css("display", "inline");
	}
	if(borderChange){
		changeBorder();
	}
}
function changeBorder(){
	var resultTable = $("#resultTable");
	var resultTableDiv = $(".resultTableDiv");
	if(resultTable.width() >= resultTableDiv.width()-2){
		resultTableDiv.css("border-left", "1px");
		resultTableDiv.css("border-left-style", "solid");
		resultTableDiv.css("border-left-color", "#CDCDCD");
		resultTableDiv.css("border-right", "1px");
		resultTableDiv.css("border-right-style", "solid");
		resultTableDiv.css("border-right-color", "#CDCDCD");
	}
	else{
		resultTableDiv.css("border-left", "none");
		resultTableDiv.css("border-right", "none");
	}
}
function showBgColor(){
	var arrow = $(".arrow");
	arrow.css("background", "#CCCCCC");
}
function hideBgColor(){
	var arrow = $(".arrow");
	arrow.css("background", "#FBFBEC");
}
function toggle(obj,menuUuid){
	var ele=document.getElementById("menu_"+menuUuid.substr(25));
	var imgPath = obj.src;
	var ifOpened = "0";
	if(imgPath.indexOf("plus")>0)
		ifOpened = "1";
	$.post(cp+"/ajaxs/get_menu_ifOpened.html",{"ifOpened":ifOpened, "menuUuid":menuUuid},function(data){
		if(imgPath.indexOf("plus")>0){
			obj.src = imgPath.replace("plus","minus");
			ele.style.display="block";
		}
		else{
			obj.src = imgPath.replace("minus","plus");
			ele.style.display="none";
		}
	},"json");
}
$(document).ready(function(){
	$(".DateTimeMultiple").dateTimeMultiple({});
	$(".DateTimeSingle").dateTimeSingle({});
	$(".DateTimeQuery").dateTimeQuery({});
	$(".DropMenu").dropmenu({});
	$(".leftMenu").width(150);
	$("#leftMenuContent").css("display", "inline");
});
function logout(url){
	if(confirm("您确认退出吗？")){
		location.href = url;
	}
}
function bodyClick(){}
</script>
<decorator:head/>
</head>

<body onclick="javascript:bodyClick()">
<div class="header">
<div style="float:left;margin-left:11px;margin-top:7px">
<img src="<%=request.getContextPath()%>/images/mainContent/head.gif" width="38" height="37" border="0" usemap="#Map2" />
<map name="Map2">
	<area shape="rect" coords="0,0,38,37" href="<%=request.getContextPath()%>/homes/edito/index.html" />
</map>
</div>
<div style="float:right">
<table width="200" height="50px" align="right">
	<tr>
		<td align="right" valign="middle"><font color="white"><span onclick="window.open('<%=request.getContextPath()%>/views/resource/human/manage/employee/manage/edit_oneself_password.html','','height=300,width=450,scrollbars=no,resizable=no')" style="cursor:hand;"><s:property value="#session.LOGIN_USER.person.name"/></span>&nbsp;|&nbsp;<span onclick="logout('<%=request.getContextPath()%>/edito/logout.html')" style="cursor:hand;">注销</span></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
</div>
</div>
<div class="main">
<div class="topMenu">
	<ul class="nav">
		<%
		Menu tmp = null;
		StringBuffer sb = new StringBuffer();
		List<Menu> menus = (List<Menu>) request.getSession().getAttribute("root");
		if(menus!=null&&menus.size()>0){
			for(int i = 0;i<menus.size();i++){
				Menu menu = menus.get(i);
				if(menu.getStationName().equals("resource")){
					if(menu.getFocus().equals("1")){
						tmp = menu;
					}
					boolean focus = menu.getFocus().equals("1");
					sb.append("<li class='top1' uuid='").append(menu.getUuid()).append("'>");
					sb.append("<a href='").append(request.getContextPath() + menu.getLink()).append("'>");
					sb.append("<div style='font-size:15px;color:white;font-family:黑体;'>").append(menu.getDescription()).append("&nbsp;&nbsp;</div>");
					sb.append("</a>");
					sb.append("</li>");
				}
			}
		}
		else{//无任何权限
		}
		out.print(sb.toString());
		%>
	</ul>
</div>
<div class="mainContent">
<div class="leftMenu">
<div id="leftMenuContent" style="float:left">
<%
	StringBuffer sb2 = new StringBuffer();
	if (tmp != null) {
		List<Menu> menus2 = (List<Menu>) request.getSession().getAttribute(tmp.getUuid());
		if(menus2!=null){
			for (int i = 0; i < menus2.size(); i++) {
				Menu menu = menus2.get(i);
				loadMenu(sb2, menu, request);
			}
		}
	}
	out.print(sb2.toString());
%> <%!private static void loadMenu(StringBuffer sb, Menu menu, HttpServletRequest request) {
		sb.append("<div style='margin-top:20px;margin-left:20px;text-align:left'>");
		String imgTmp = "";
		String mouseDownFun = "onmousedown='javascript:toggle(this,\"" + menu.getUuid() + "\")'";
		if (menu.getChild().equals("0")) {
			imgTmp += "leaf.gif";
			mouseDownFun = "";
		}
		else {
			if (menu.getOpened() == null || menu.getOpened().equals("0")) {
				imgTmp = "plus.gif";
			}
			else {
				imgTmp = "minus.gif";
			}
		}
		boolean focus = menu.getFocus().equals("1");
		sb.append("<div style='display:inline;float:left'>");
		sb.append("<img src='" + request.getContextPath() + "/images/tree/");
		sb.append(imgTmp);
		sb.append("' ").append(mouseDownFun).append(">");
		sb.append("</div>");
		sb.append("<div id='menu_'"+menu.getUuid().substring(25)+" style='font-size:14px;font-family:黑体;display:inline;margin-left:5px'>");
		sb.append("<a href='").append(request.getContextPath() + menu.getLink()).append("'>");
		sb.append(menu.getDescription());
		sb.append("</a>");
		sb.append("</div>");
		List<Menu> list = null;
		if (!menu.getChild().equals("0")) {
			list = (List<Menu>) request.getSession().getAttribute(menu.getUuid());
		}
		if (list != null) {
			sb.append("<div id='menu_").append(menu.getUuid().substring(25)).append(
					"' style='margin-left:-5px;display:");
			if (menu.getOpened() == null || menu.getOpened().equals("0")) {
				sb.append("none");
			}
			else {
				sb.append("block");
			}
			sb.append("'>");
			sb.append("\r\n\t");
			for (int i = 0; i < list.size(); i++) {
				Menu m = list.get(i);
				loadMenu(sb, m, request);
			}
			sb.append("</div>");
			sb.append("\r\n\t");
		}
		sb.append("</div>");
		sb.append("\r\n\t");
	}%>
</div>
<div class="arrow" onmouseover="showBgColor()" onmouseout="hideBgColor()" onclick="changeLeft()"><img id="arrowImg" src="<%=request.getContextPath()%>/images/mainResource/arrow_left.gif")/></div>
</div>
<div class="content">
	<decorator:body/>
	<br style="clear:both;" />
</div>
<br>
</div>
<br>
<div class="footer">
Copyright&copy;2014 大连元合科技有限公司<br><br>
服务热线 0411-84753258
<br><br>
</div>
</div>
</body>
</html>
