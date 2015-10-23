/**为String对象添加去掉两边空格的方法*/
String.prototype.trim= function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
function editInstance(uuid,url){
	var f = document.getElementById("form");
	f.action = cp + url;
	f.target = "_self";
	f.uuid.value=uuid;
	f.submit();
}
var popup = 0;
function showInstance(uuid,resultCode,url,height,width){
	popup++;
	window.open("about:blank","popup"+popup,"height="+height+",width="+width+",top=0,left=0,scrollbars=yes,resizable=yes");
	var f = document.getElementById("form");
	f.action = cp + url;
	f.target = "popup"+popup;
	f.uuid.value = uuid;
	f.resultCode.value = resultCode;
	f.submit();
}
var picNum = 0;
function showPicture(url){
	var fileName = url.substring(url.lastIndexOf("/")+1);
	if(url.indexOf(".dcm")!=-1){
		var jreFlag = 1;
		try {
			var jreVersion = deployJava.getJREs() + "";
			if(jreVersion == null || jreVersion.length == 0) {
				jreFlag = 2;
			}
			else if(jreVersion.indexOf("1.6") == -1) {
				jreFlag = 3;
			}
		}
		catch(e) {}
		
		if(jreFlag == 2) {
			alert("您系统中没有安装Java运行环境，请在弹出窗口中点击运行，然后根据提示进行安装，安装成功后请再次点击该文件链接！");
			location.href = "/download/jre.exe";
		}
		else if(jreFlag == 3) {
			alert("您系统中的Java运行环境版本不正确，请在弹出窗口中点击运行，然后根据提示进行安装，安装成功后请再次点击该文件链接！");
			location.href = "/download/jre.exe";
		}
		else {
			location.href = "/jnlpServlet?jnlpName=dicom&param="+url;
		}
	}
	else {
		popup++;
		window.open(url,"picture"+picNum,"height=600,width=800,top=0,left=0,scrollbars=no,resizable=yes");		
	}
}
/**随访时间*/
function DateDiff(nowDate,lastDate){
	var aDate,oDate1,oDate2,iDays;  
	aDate = nowDate.split("-");  
	oDate1 = new Date(aDate[1]+ '-'+aDate[2]+'-'+aDate[0]);     
	aDate = lastDate.split("-");  
	oDate2 = new Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);  
	if(oDate1-oDate2<0) {
		iDays="";
		alert("请假结束时间不得早于开始时间！");
	}
	else{
		iDays = parseInt(Math.abs(oDate1-oDate2)/1000/60/60/24);   
	}  
	return iDays;  
}
/**上传文件*/
var index = 1;
function addFile(divCon, size){
	if(size == null){
		size = "34";
	}
	var fileDiv = $("#"+divCon);
	fileDiv.css("display", "block");
	var innerDiv = $("<div></div>");
	var innerDivId = "innerDiv"+index;
	innerDiv.attr("id", innerDivId);
	innerDiv.attr("class", "innerDiv");
	var fileInfoDiv = $("<div></div>");
	fileInfoDiv.css("margin-top", "10px");
	var fileBuffer = "<input type='file' name='file' style='height:20px;background-color:#ffffff' size='"+size+"' validate='true'>";
	fileBuffer += "&nbsp;<font color='#996633'>*</font>&nbsp;";
	fileBuffer += "<input type='button' value='删除' onclick='removeFile(\""+innerDivId+"\")'>";
	fileInfoDiv.html(fileBuffer);
	var progressBarBack = $("<div></div>");
	progressBarBack.attr("class", "progressBarBack");
	progressBarBack.css("display", "none");
	progressBarBack.css("width", "450px");
	progressBarBack.css("height", "12px");
	progressBarBack.css("border", "solid 1px #999999");
	progressBarBack.css("margin-top", "10px");
	var progressBar = $("<div></div>");
	progressBar.attr("class", "progressBar");
	progressBar.css("display", "none");
	progressBar.css("height", "12px");
	progressBarBack.append(progressBar);
	var progressInfo = $("<div></div>");
	progressInfo.attr("class", "progressInfo");
	progressInfo.css("display", "none");
	progressInfo.css("margin-top", "10px");
	innerDiv.append(fileInfoDiv);
	innerDiv.append(progressBarBack);
	innerDiv.append(progressInfo);
	fileDiv.append(innerDiv);
	index++;
}
function removeFile(elementId){
	$("#"+elementId).remove();
}
