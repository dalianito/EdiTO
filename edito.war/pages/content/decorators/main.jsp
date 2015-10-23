<!DOCTYPE html>
<!--[if lt IE 7]>  <html class="lt-ie7"> <![endif]-->
<!--[if IE 7]>     <html class="lt-ie8"> <![endif]-->
<!--[if IE 8]>     <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html> <!--<![endif]-->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ito.edito.schema.Menu"%>
<%@ page import="java.util.ArrayList"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
<title><decorator:title default="EdiTO" /></title>
<script>var cp = "<%=request.getContextPath()%>";</script>
<script>var up = "<%=request.getSession().getAttribute("UPLOAD_URL")%>";</script>

<link href="<%=request.getContextPath()%>/style/bootstrap.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/bootstrap-theme.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/content/jquery.1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/js/content/jquery-migrate-1.2.1.js"></script>
<script src="<%=request.getContextPath()%>/js/content/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/content/moment.js"></script>
<script src="<%=request.getContextPath()%>/js/content/moment-locale-zh-cn.js"></script>
<script src="<%=request.getContextPath()%>/js/content/transition.js"></script>
<script src="<%=request.getContextPath()%>/js/content/collapse.js"></script>
<script src="<%=request.getContextPath()%>/js/content/bootstrap-datetimepicker.js"></script>
<link href="<%=request.getContextPath()%>/style/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/fullcalendar.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/style/fullcalendar.print.css" rel="stylesheet" media="print" />
<script src="<%=request.getContextPath()%>/js/content/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/js/content/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath()%>/js/content/zh-cn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/content/prettify.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/content/lhgcore.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/content/lhgcalendar.min.js"></script>
<link href="<%=request.getContextPath()%>/style/prettify.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/style/lhgcalendar.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/style/content/jquery-ui.css" type="text/css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/style/content/jquery-ui.theme.css" type="text/css" rel="stylesheet"/>
<script src="<%=request.getContextPath()%>/js/Concurrent.Thread.js"></script>
<script src="<%=request.getContextPath()%>/js/content/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/content/datepicker-zh-CN.js"></script>
<script src="<%=request.getContextPath()%>/js/hashtable.js"></script>
<script src="<%=request.getContextPath()%>/js/dateformat.js"></script>
<script src="<%=request.getContextPath()%>/js/json2.js"></script>
<script src="<%=request.getContextPath()%>/js/iscript.js"></script>
<script src="<%=request.getContextPath()%>/js/content/info_manager.js"></script>
<script src="<%=request.getContextPath()%>/js/basetree.js"></script>
<script src="<%=request.getContextPath()%>/js/drop_menu.js"></script>
<script src="<%=request.getContextPath()%>/js/grid_simple.js"></script>
<script src="<%=request.getContextPath()%>/js/pagination.js"></script>
<script src="<%=request.getContextPath()%>/js/submit.js"></script>
<script src="<%=request.getContextPath()%>/js/content/validation.js"></script>
<script src="<%=request.getContextPath()%>/js/toggle.js"></script>
<script src="<%=request.getContextPath()%>/js/cover.js"></script>
<script src="<%=request.getContextPath()%>/js/content/bootstrap-editable.min.js"></script>
<link href="<%=request.getContextPath()%>/style/bootstrap-editable.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/pagination.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/bootstrap-style_content.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/style/bootstrap-style-main.css" rel="stylesheet" type="text/css">


<script language="JavaScript" type="text/JavaScript">
	var hide;
	var show;
	var mark = "hide";
	var ifClick = false;
	var pxMove = 2;
	function changeLeft() {
		hideBgColor();
		if (!ifClick) {
			if (mark == "hide") {
				$("#leftMenuContent").css("display", "none");
				hide = setInterval(exeHide, 70);
			} else {
				show = setInterval(exeShow, 70);
			}
		}
	}
	var borderChange = false;
	var currentResultTableDivWidth = 880;
	function exeHide() {
		ifClick = true;
		var leftMenu = $(".leftMenu");
		var resultTableDiv = $(".resultTableDiv");
		var bigResultCon = $(".bigResultCon");
		if (leftMenu.width() > 10) {
			leftMenu.width(leftMenu.width() - pxMove);
			bigResultCon.width(bigResultCon.width() + pxMove);
			resultTableDiv.width(resultTableDiv.width() + pxMove);
			currentResultTableDivWidth += pxMove;
			pxMove += 6;
		} else {
			clearInterval(hide);
			var arrowImg = $("#arrowImg");
			arrowImg.attr("src", cp + "/images/mainResource/arrow_right.gif");
			mark = "show";
			ifClick = false;
			pxMove = 2;
		}
		if (borderChange) {
			changeBorder();
		}
	}
	function exeShow() {
		ifClick = true;
		var leftMenu = $(".leftMenu");
		var resultTableDiv = $(".resultTableDiv");
		var bigResultCon = $(".bigResultCon");
		if (leftMenu.width() < 150) {
			leftMenu.width(leftMenu.width() + pxMove);
			bigResultCon.width(bigResultCon.width() - pxMove);
			resultTableDiv.width(resultTableDiv.width() - pxMove);
			currentResultTableDivWidth -= pxMove;
			pxMove += 6;
		} else {
			clearInterval(show);
			var arrowImg = $("#arrowImg");
			arrowImg.attr("src", cp + "/images/mainResource/arrow_left.gif");
			mark = "hide";
			ifClick = false;
			pxMove = 2;
			$("#leftMenuContent").css("display", "inline");
		}
		if (borderChange) {
			changeBorder();
		}
	}
	function changeBorder() {
		var resultTable = $("#resultTable");
		var resultTableDiv = $(".resultTableDiv");
		if (resultTable.width() >= resultTableDiv.width() - 2) {
			resultTableDiv.css("border-left", "1px");
			resultTableDiv.css("border-left-style", "solid");
			resultTableDiv.css("border-left-color", "#CDCDCD");
			resultTableDiv.css("border-right", "1px");
			resultTableDiv.css("border-right-style", "solid");
			resultTableDiv.css("border-right-color", "#CDCDCD");
		} else {
			resultTableDiv.css("border-left", "none");
			resultTableDiv.css("border-right", "none");
		}
	}
	function showBgColor() {
		var arrow = $(".arrow");
		arrow.css("background", "#CCCCCC");
	}
	function hideBgColor() {
		var arrow = $(".arrow");
		arrow.css("background", "#FBFBEC");
	}
	function toggle(obj, menuUuid) {
		var ele = document.getElementById("menu_" + menuUuid.substr(25));
		var imgPath = obj.src;
		var ifOpened = "0";
		if (imgPath.indexOf("plus") > 0)
			ifOpened = "1";
		$.post(cp + "/ajaxs/get_menu_ifOpened.html", {
			"ifOpened" : ifOpened,
			"menuUuid" : menuUuid
		}, function(data) {
			if (imgPath.indexOf("plus") > 0) {
				obj.src = imgPath.replace("plus", "minus");
				ele.style.display = "block";
			} else {
				obj.src = imgPath.replace("minus", "plus");
				ele.style.display = "none";
			}
		}, "json");
	}
	$(document).ready(function() {
		$(".DropMenu").dropmenu({});
		$(".leftMenu").width(150);
		$("#leftMenuContent").css("display", "inline");
		
		$.datepicker.setDefaults( $.datepicker.regional[ "zh-CN" ] );
	    $(".datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        autoSize: true,
	        yearRange: "c-30:c+30",
        }); 
	});
	function logout(url) {
		if (confirm("您确认退出吗？")) {
			location.href = url;
		}
	}
</script>
<decorator:head />
</head>

<body>

	<nav class="navbar header navbar-default navbar-fixed-top">
	<div>
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/homes/edito/index.html"> <img alt="主页" src="<%=request.getContextPath()%>/images/mainContent/head.gif">
			</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<%
					Menu tmp = null;
				            StringBuffer sb = new StringBuffer();
				            List<Menu> menus = (List<Menu>) request.getSession().getAttribute(
				                    "root");
				            if (menus != null && menus.size() > 0) {
				                for (int i = 0; i < menus.size(); i++) {
				                    Menu menu = menus.get(i);
				                    if (menu.getStationName().equals("content")) {
				                        if (menu.getFocus().equals("1")) {
				                            tmp = menu;
				                        }
				                        if (menu.getFocus().equals("1")) {
				                            sb.append("<li class='active' uuid='")
				                                    .append(menu.getUuid()).append("'>");
				                        } else {
				                            sb.append("<li uuid='").append(menu.getUuid())
				                                    .append("'>");
				                        }
				                        sb.append("<a href='")
				                                .append(request.getContextPath()
				                                        + menu.getLink()).append("' ");
				                        sb.append("style='font-size:15px;font-family:黑体;'>")
				                                .append(menu.getDescription());
				                        sb.append("</a>");
				                        sb.append("</li>");
				                    }
				                }
				            } else {//无任何权限
				            }
				            out.print(sb.toString());
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=request.getContextPath()%>/views/resource/human/manage/employee/manage/edit_oneself_password.html" target="_blank"
						>您好,<s:property
								value="#session.LOGIN_USER.person.name" />
								</a></li>
								<li><a href="<%=request.getContextPath()%>/edito/logout.html">注销</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<s:if test="fullWidthViewContent">
	<!-- Full Width -->
	   <div class="main container-fluid">
           <decorator:body />
       </div>
    </s:if>
    <s:else>
	<div class="main">
			<div class="col-sm-3 col-md-2 sidebar">
					<%
						StringBuffer navMenuStringBuffer = new StringBuffer();
					            if (tmp != null) {
					                List<Menu> menus2 = (List<Menu>) request.getSession()
					                        .getAttribute(tmp.getUuid());
					                navMenuStringBuffer.append("<ul class='nav nav-sidebar'>");
					                if (menus2 != null) {
					                    for (int i = 0; i < menus2.size(); i++) {
					                        Menu menu = menus2.get(i);
					                        loadMenu(navMenuStringBuffer, menu, request);
					                    }
					                }
					                navMenuStringBuffer.append("</ul>");
					            }
					            out.print(navMenuStringBuffer.toString());
					%>
					<%!private static void loadMenu(StringBuffer sb, Menu menu,
            HttpServletRequest request) {
        
        sb.append("<li");
        if (menu.getFocus().equals("1")){
            sb.append(" class='active'");
        }
        sb.append(" style='font-size:16px;font-family:黑体;'>");
        sb.append("<a href='")
                .append(request.getContextPath() + menu.getLink()).append("'>");
        sb.append(menu.getDescription());
        sb.append("</a>");
        //End of current level menu

        List<Menu> list = null;
        if (!menu.getChild().equals("0")) {
            list = (List<Menu>) request.getSession().getAttribute(menu.getUuid());
            if (list != null) {
                sb.append("<ul");
                if (menu.getOpened() == null || menu.getOpened().equals("0")) {
                  sb.append("none");
                } else {
                    sb.append("block");
                }
                sb.append("'>");
                for (int i = 0; i < list.size(); i++) {
                    Menu m = list.get(i);
                    loadMenu(sb, m, request);
                }
                sb.append("</ul>");
            }
        }

        sb.append("</li>");
    }%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<decorator:body />
			</div>
			<br>
	</div>
	</s:else>
</body>
</html>
