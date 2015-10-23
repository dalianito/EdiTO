/**
 * $.cover({
 * 		XMLHTTPRequest : obj,		ajax对象XMLHTTPRequest(即 JQuery 中 $.post()的返回值)
 * 		ifCancel : bool,					是否显示“取消等待”按钮，true显示
 * 		seconds : num						激活“取消等待”按钮所需时间
 * });
 */
jQuery.cover = function(config) {
	var cover = new Cover(config);
	cover.coverPage();
}
function Cover(config) {
	this.xmlHttpReq;
	if (config.XMLHTTPRequest != null && typeof (config.XMLHTTPRequest) != "undefined")
		this.xmlHttpReq = config.XMLHTTPRequest;
	this.ifCancel = false;
	if (config.ifCancel)
		this.ifCancel = config.ifCancel;
	this.seconds = 3;
	if (config.seconds)
		this.seconds = config.seconds;
	var timer = null;
}
Cover.prototype.initCover = function() {
	if (typeof ($("#coverBg").id) == "undefined") {
		var coverDlgDivStr = "<div id='coverDlg'>"
				+ "<div id='coverDlgContent'></div>";
		if (this.ifCancel)
			coverDlgDivStr += "<div style='text-align: center;'><input type='button' DISABLED='true' id='coverDlgCancelButton' style='color:#a0a0a0;'></div>";
		coverDlgDivStr += "</div>";
		var coverBgDivStr = $("<iframe id='coverBg'></iframe>");
		$(document.body).append(coverDlgDivStr);//遮盖层对话框（对话框内容coverDlgContent & 取消等待按钮 coverDlgCancelButton）
		$(document.body).append(coverBgDivStr);//遮盖层背景coverBg
		var ajaxObj = this.xmlHttpReq;
		var btnText = "等待中";
		var btnText2 = "取消等待";
		$("#coverDlgCancelButton").val(btnText + "(" + this.seconds + ")");
		//ajax 执行完，自动关闭遮盖层
		$(document.body).unbind();
		$(document.body).ajaxStop( function() {
			closeCover(btnText);
		});
		// 点击”取消等待“按钮，关闭遮盖层，中止ajax
		if (this.ifCancel) {
			var button = $("#coverDlgCancelButton");
			button.bind("click", function() {
				closeCover(btnText);
				if (ajaxObj != null && typeof (ajaxObj) != "undefined")
					abortAjax(ajaxObj);
			});
		}
		// ”取消“按钮倒计时
		var wait = this.seconds; // 设置秒数(单位秒)
		var secs = 0;
		for ( var i = 1; i <= wait; i++) {
			timer = window.setTimeout("cancelTimer(" + i + ", " + wait + ", '"
					+ btnText + "', '" + btnText2 + "')", i * 1000);
		}
	}
}
Cover.prototype.coverPage = function() {
	this.initCover();
	var cDlg = $("#coverDlg");
	var cDlgCon = $("#coverDlgContent");
	var cBg = $("#coverBg");
	var bodyHeight = $("body").height();
	var bodyWidth = document.documentElement.clientWidth;
	var objWH = getDlgWh("coverDlg");
	cBg.css( {
		width : bodyWidth,
		height : bodyHeight,
		display : "block"
	});
	var tbT = objWH.split("|")[0] + "px";
	var tbL = objWH.split("|")[1] + "px";
	cDlg.css( {
		top : tbT,
		left : tbL,
		display : "block"
	});
	cDlgCon.html("<div><font color='#009900'>大概需要几秒钟，请耐心等待……<\/font>"
			+ "<br><img src='" + cp + "/images/loading.gif'><\/div>");
	$(window).scroll( function() {
		resetBg(cBg)
	});
	$(window).resize( function() {
		resetBg(cBg)
	});
}
/**
 * 获取遮盖层对话框位置
 */
function getDlgWh(obj) {
	var st = document.documentElement.scrollTop;// 滚动条距顶部的距离
	var sl = document.documentElement.scrollLeft;// 滚动条距左边的距离
	var ch = document.documentElement.clientHeight;// 屏幕的高度
	var cw = document.documentElement.clientWidth;// 屏幕的宽度
	var objH = $("#" + obj).height();// 浮动对象的高度
	var objW = $("#" + obj).width();// 浮动对象的宽度
	var objT = Number(st) + (Number(ch) - Number(objH)) / 2;
	var objL = Number(sl) + (Number(cw) - Number(objW)) / 2;
	return objT + "|" + objL;
}
/**
 * 重设遮盖层对话框位置
 */
function resetBg(cBg) {
	if (cBg.css("display") == "block") {
		var bH2 = $("body").height();
		var bW2 = document.documentElement.clientWidth;
		cBg.css( {
			width : bW2,
			height : bH2
		});
		var objV = getDlgWh("coverDlg");
		var tbT = objV.split("|")[0] + "px";
		var tbL = objV.split("|")[1] + "px";
		$("#coverDlg").css( {
			top : tbT,
			left : tbL
		});
	}
}
/**
 * 关闭遮盖层，即返回初始状态
 */
function closeCover(btnText) {
	$("#coverBg").css("display", "none");
	$("#coverDlg").css("display", "none");
	$("#coverDlgCancelButton").attr("disabled", true);
	$("#coverDlgCancelButton").val(btnText);
	$("#coverDlgCancelButton").css("color", "#a0a0a0");
	clearTimeout(timer);
}
/**
 * 	中止ajax， 即XMLHTTPRequest返回初始状态 
 */
function abortAjax(ajaxObj) {
	ajaxObj.abort();
}
/**
 *  ”取消等待“按钮改变内容
 */
function buttonChange(text) {
	$("#coverDlgCancelButton").val(text);
	$("#coverDlgCancelButton").css("color", "#000000");
	$("#coverDlgCancelButton").attr("disabled", false);
}
/**
 *  “取消等待”按钮，倒数计时
 */
function cancelTimer(num, wait, text, text2) {
	if (num == wait) {
		buttonChange(text2);
	}
	else {
		secs = wait - num;
		$("#coverDlgCancelButton").val(text + "(" + secs + ")");
	}
}