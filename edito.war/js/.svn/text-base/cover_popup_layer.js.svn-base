var cover = null;

function addCover(coverIdHTML, top, left, height, width) {
	cover = null;
	discover();
	cover = new Cover(window, document, coverIdHTML, top, left, height, width);
	cover.init();	
	// 添加数据
	addCoverData();
}

/**
 * 删除弹出的div
 * @return
 */
function discover(){
	var coverdiv = document.getElementById("coverContainer");
	if(coverdiv!=null){
		coverdiv.outerHTML = "";
		handlerCover();
	}
}

function handlerCover(){
	
}

function addCoverData(){
	
}
 
 /**
  * 
  * @param win
  * @param doc
  * @param coverIdHTML 要在cover中显示的textarea 的value
  * @param top 弹出的div到浏览器top的距离
  * @param left
  * @return
  */
function Cover(win, doc, coverIdHTML, top, left, height, width) {
	this.win = win;
	this.doc = doc;
	this.doc.window = this.win;
	this.coverIdHTML = coverIdHTML;
	this.height = height==null?100:height;
	this.width = width==null?800:width;
	this.top = top;
	this.left = left;
}

Cover.prototype.init = function() {
	this.container = this.doc.createElement("div");
	this.doc.body.appendChild(this.container);
	this.container.id = "coverContainer";

	this.coverLightBox = this.doc.createElement("div");
	this.container.appendChild(this.coverLightBox);
	this.coverLightBox.id = "coverLightBox";
	this.coverLightBox.style.display = "none";
	this.coverLightBox.style.background = "#000000";
	this.coverLightBox.style.position = "absolute";
	this.coverLightBox.style.zIndex = 17;
	this.coverLightBox.style.left = 0;
	this.coverLightBox.style.top = 0;		
	$("#" + this.coverLightBox.id).width(document.body.scrollWidth);
	$("#" + this.coverLightBox.id).height(Math.max(document.body.scrollHeight, window.screen.availHeight - 140));
	$("#" + this.coverLightBox.id).fadeTo("normal", 0.7);

	this.lightBox = this.doc.createElement("div");
	this.container.appendChild(this.lightBox);
	this.lightBox.id = "lightBox";
	this.lightBox.style.display = "none";
	this.lightBox.style.background = "#fcfcfc";
	this.lightBox.style.position = "absolute";
	this.lightBox.style.zIndex = 18;
	this.lightBox.style.height=this.height;
	this.lightBox.style.width=this.width;
	this.lightBox_top = this.doc.createElement("div");
	this.lightBox.appendChild(this.lightBox_top);
	this.lightBox_top.id = "lightBox_top";
	this.lightBox_top.style.position = "relative";
	this.lightBox_top.style.zIndex = 18;
	this.lightBox_top.style.height = 26;
	this.lightBox_top.style.width = this.lightBox.style.width;
	this.lightBox_top.style.backgroundColor = "#dfe9f5";

	this.close_img_div = this.doc.createElement("div");
	this.lightBox_top.appendChild(this.close_img_div);
	this.close_img_div.style.position = "relative";
	this.close_img_div.style.align = "right";
	this.close_img_div.style.paddingLeft = (parseInt(this.lightBox.style.width)-20)+"px";

	this.lightBox_close_img = this.doc.createElement("img");
	this.close_img_div.appendChild(this.lightBox_close_img);
	this.lightBox_close_img.id = "lightBox_close_img";
	this.lightBox_close_img.src = cp+"/images/button/b_close_3.gif";
	this.lightBox_close_img.onclick = function (){
		var coverdiv = this.parentNode.parentNode.parentNode.parentNode;
		coverdiv.outerHTML = "";
		handlerCover();
	}
	this.lightBox_close_img.style.cursor = "hand";
	this.lightBox_close_img.style.filter = "chroma(color=#FFFFFF)";

	// 将textarea的value复制到lightBox中
	this.lightBox_content = this.doc.createElement("div");
	this.lightBox_content.innerHTML = "<form name='formCover' id='formCover'>"+this.coverIdHTML+"</form>";
	this.lightBox.appendChild(this.lightBox_content);

	this.lightBox_bottom = this.doc.createElement("div");
	this.lightBox.appendChild(this.lightBox_bottom);
	this.lightBox_bottom.id = "lightBox_bottom";
	this.lightBox_bottom.style.position = "relative";
	this.lightBox_bottom.style.zIndex = 18;
	this.lightBox_bottom.style.height = 13;
	this.lightBox_bottom.style.width = this.lightBox.style.width;
	this.lightBox_bottom.style.backgroundColor = "#dfe9f5";
	
	this.coverLightBox.style.display = "block";
	this.lightBox.style.display = "block";
	this.lightBox.firstChild.nextSibling.style.display = "block";

	this.top = this.top==null?(document.body.clientHeight - parseInt(document.getElementById("lightBox").offsetHeight)) / 2:this.top;
	this.left = this.left==null?(document.body.clientWidth - parseInt(document.getElementById("lightBox").offsetWidth)) / 2:this.left;
	this.lightBox.style.top = this.top + document.body.scrollTop;
	this.lightBox.style.left = this.left;
	
	this.lightBox.focus();
	
	window.onresize = function(){
		if(this.coverLightBox != null && this.lightBox != null){
			$("#" + this.coverLightBox.id).width(document.body.scrollWidth);
			$("#" + this.coverLightBox.id).height(Math.max(document.body.scrollHeight, window.screen.availHeight - 140));

			this.lightBox.style.top = (document.body.clientHeight - 140 - parseInt(this.lightBox.style.height)) / 2 + parseInt(document.body.scrollTop);
			this.lightBox.style.left = (document.body.clientWidth - parseInt(this.lightBox.style.width)) / 2 + parseInt(document.body.scrollLeft);
		}
	}
	
// ------------------------ 拖动 -------------------------------

	var Drag={
	　　"obj":null,
	　　"init":function(handle,dragBody,e){
	　　　　if(e==null){
	　　　　　　handle.onmousedown=Drag.start;
	　　　　}
	　　　　handle.root=dragBody;
	　　　　
	　　　　if(isNaN(parseInt(handle.root.style.left)))handle.root.style.left="0px";
	　　　　if(isNaN(parseInt(handle.root.style.top)))handle.root.style.top="0px";// 确保后来能够取得top值
	　　　　handle.root.onDragStart=new Function();
	　　　　handle.root.onDragEnd=new Function();
	　　　　handle.root.onDrag=new Function();
	　　　　if(e!=null){
	　　　　　　var handle=Drag.obj=handle;
	　　　　　　e=Drag.fixEvent(e);
	　　　　　　var top=parseInt(handle.root.style.top);
	　　　　　　var left=parseInt(handle.root.style.left);
	　　　　　　handle.root.onDragStart(left,top,e.pageX,e.pageY);
	　　　　　　handle.lastMouseX=e.pageX;
	　　　　　　handle.lastMouseY=e.pageY;
	　　　　　　document.onmousemove=Drag.drag;
	　　　　　　document.onmouseup=Drag.end;
	　　　　}
	　　},
	　　"start":function(e){
	　　　　var handle=Drag.obj=this;
			handle.style.cursor = "move";
	　　　　e=Drag.fixEvent(e);
	　　　　var top=parseInt(handle.root.style.top);
	　　　　var left=parseInt(handle.root.style.left);
	　　　　// alert(left)
	　　　　// 一般情况下lefttop在初始的时候都为0
	　　　　handle.root.onDragStart(left,top,e.pageX,e.pageY);
	　　　　handle.lastMouseX=e.pageX;
	　　　　handle.lastMouseY=e.pageY;
	　　　　document.onmousemove=Drag.drag;
	　　　　document.onmouseup=Drag.end;
	　　　　return false;
	　　},　　
	　　"drag":function(e){//这里的this为document所以拖动对象只能保存在Drag.obj里
	　　　　e=Drag.fixEvent(e);
	　　　　var handle=Drag.obj;
	　　　　var mouseY=e.pageY;
	　　　　var mouseX=e.pageX;
	　　　　var top=parseInt(handle.root.style.top);
	　　　　var left=parseInt(handle.root.style.left);// 这里的top和left是handle.root距离浏览器边框的上边距和左边距
	　		var height=parseInt(document.getElementById("lightBox").offsetHeight);
　　　　		var width=parseInt(document.getElementById("lightBox").offsetWidth);// 这里的height和width是handle.root的高度和宽度
　　　　		// 这里的clientHeight和clientWidth是window的高度和宽度(+滚动条隐藏的部分)
　　　　		var clientHeight=document.body.clientHeight + document.body.scrollTop;// scrollTop防止出现窗口模式bug
　　　　		var clientWidth=document.body.clientWidth + document.body.scrollLeft;

	　　　　var currentLeft,currentTop;

			if(left>=0 && left + width <= clientWidth){
			　　currentLeft=left+mouseX-handle.lastMouseX;
			}
			else if(left<0){
				currentLeft = 0;
				Drag.end;
			}
			else if( left + width > clientWidth){
				currentLeft = clientWidth - width;
				Drag.end;
			}

			if(top>=0 && top + height <= clientHeight){
	　　　　		currentTop=top+(mouseY-handle.lastMouseY);
	　　　　}
			else if(top < 0){
				currentTop = 0;
				Drag.end;
			}
			else if(top + height > clientHeight){
				currentTop = clientHeight - height;
				Drag.end;
			}

	　　　　// 上一瞬间的上边距加上鼠标在两个瞬间移动的距离得到现在的上边距
	　　　　
	　　　　handle.root.style.left=currentLeft+"px";
	　　　　handle.root.style.top=currentTop+"px";
	　　　　
	　　　　// 更新当前的位置
	　　　　
	　　　　handle.lastMouseX=mouseX;
	　　　　handle.lastMouseY=mouseY;
	　　　　
	　　　　// 保存这一瞬间的鼠标值用于下一次计算位移
	　　　　
	　　　　handle.root.onDrag(currentLeft,currentTop,e.pageX,e.pageY);// 调用外面对应的函数
	　　　　return false;
	　　},
	　　"end":function(){
	　　　　document.onmousemove=null;
	　　　　document.onmouseup=null;
	　　　　Drag.obj.root.onDragEnd(parseInt(Drag.obj.root.style.left),parseInt(Drag.obj.root.style.top));
			Drag.obj.style.cursor = "auto";
	　　　　Drag.obj=null;
	　　},
	　　"fixEvent":function(e){//格式化事件参数对象
	　　　　if(typeof (e)=="undefined")e=window.event;
	　　　　if(typeof (e.layerX) =="undefined")e.layerX=e.offsetX;
	　　　　if(typeof (e.layerY) =="undefined")e.layerY=e.offsetY;
	　　　　if(typeof (e.pageX) =="undefined")e.pageX=e.clientX+document.body.scrollLeft-document.body.clientLeft;
	　　　　if(typeof (e.pageY) =="undefined")e.pageY=e.clientY+document.body.scrollTop-document.body.clientTop;
	　　　　return e;
	　　}
	};
	
	Drag.init(this.lightBox_top,this.lightBox);
}
