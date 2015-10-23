(function( $ ) {
$.widget("ui.basetree",{
	options:{
		value 		: 	"",
		className 	: 	"",
		nodeLevel 	: 	"last",
		defaultText : 	"-选择-",
		sortField 	: 	"uuid",
		sortType 	: 	"asc",
		rClassName	: 	"",
		parentKey	: 	"",
		parentValue	: 	"",
		parentId	: 	"",
		childKey	: 	"",
		childId		: 	"",
		panel 		: 	null,
		treeItem	: 	new Array(),
		rootNode	: 	null,
		chooseNode	: 	null,
		iframe		: 	null,
		execute		:	null,
		ifHasRelated:	false
	},
	_create : function(){
		var self = this,
		options = self.options;
		options.value = self.element.attr("value") ? self.element.attr("value"):options.value;
		self.element.attr("value") ? self.element.attr("value"): self.element.attr("value",options.value);
		options.nodeLevel = self.element.attr("nodeLevel") ? self.element.attr("nodeLevel"):options.nodeLevel;
		options.className = self.element.attr("JavaClassName");
		options.rClassName = self.element.attr("rJavaClassName");
		options.parentKey = self.element.attr("parentKey");
		options.parentValue = self.element.attr("parentValue");
		options.parentId = self.element.attr("parentId");
		options.childKey = self.element.attr("childKey");
		options.childId = self.element.attr("childId");
		options.defaultText = self.element.attr("defaultText") ? self.element.attr("defaultText") : options.defaultText;
		options.sortField = self.element.attr("sortField") ? self.element.attr("sortField"):options.sortField;
		options.sortType = self.element.attr("sortType") ?  self.element.attr("sortType"):options.sortType;
		options.ifHasRelated = self.element.attr("ifHasRelated") ?  self.element.attr("ifHasRelated"):options.ifHasRelated;
		options.execute = self.element.attr("execute") ? self.element.attr("execute"):options.execute;
		$(self.element).unbind("click");
		$(self.element).bind("click", function(event) {
			self._showPanel(event);
		});
		$(self.element).bind("mouseover", function() {
			window.status = options.className;
		});
		$(self.element).bind("mouseout", function() {
			window.status = "";
		});
		$(self.element).bind("propertychange", function() {
			if(options.value != self.element.attr("value")){
				options.value = self.element.attr("value");
				if(options.value==null || options.value==""){
					self.element.text(options.defaultText);
				}
				else{
					$.post(cp+"/ajaxs/tree/get_tree_description.html",{
						uuid: options.value,
						nodeLevel:options.nodeLevel
					},function(data){
						self.element.text(data);
					});
				}
			}
		});
		if(options.value){
			$.post(cp+"/ajaxs/tree/get_tree_description.html",{
				uuid:options.value,
				nodeLevel:options.nodeLevel
			},function(data){
				self.element.text(data);
			});
		}
		else{
			self.element.text(options.defaultText);
		}
	},
	_showPanel : function(e){
		var baseTreePanel = $("#baseTreePanel");
		if(baseTreePanel.html()!=null){
			baseTreePanel.remove();
		}
		baseTreePanel = $("<div id='baseTreePanel'></div>");
		baseTreePanel.css("position","absolute");
		//baseTreePanel.css("width","500px");
		baseTreePanel.css("display","none");
		baseTreePanel.css("background-color","#E4E9EF");
		baseTreePanel.css("text-align","left");
		baseTreePanel.css("padding","3px");
		baseTreePanel.css("border","#97b1c5 1px solid");
		baseTreePanel.css("z-index","999");
		this.options.panel = baseTreePanel;
		$("body").append(baseTreePanel);
		
		var et = $.event.fix(e);
		var obj = et.target;
		baseTreePanel.css("left",$(obj).offset().left);
		baseTreePanel.css("top",$(obj).offset().top + $(obj).height()+2); 
		
		//此样式使iframe透明
		var iframePanel = $("<iframe style=\"filter:Alpha(Opacity='0');\"></iframe>");
		iframePanel.attr("scrolling","no");
		iframePanel.attr("frameborder","0");
		iframePanel.css("position","absolute");
		iframePanel.css("visibility","inherit");
		iframePanel.css("z-index","-1");
		this.options.iframe = iframePanel;
		baseTreePanel.append(iframePanel);
		
		this.show();
		var self = this;
		$("body").bind("mousedown", function(event) {
			if($.contains($("#baseTreePanel").get(0),event.target)||$("#baseTreePanel").get(0)==event.target){
				return;
			}
			self.hidePanel();
			return false;
		});
		/*
		$("body *").bind("mousedown", function() {
			if((!$.contains($("#baseTreePanel").get(0),$(this).get(0))) && $(this).attr("id")!="baseTreePanel"){
				self.hidePanel();
			}
			return false;
		})
		*/
	},
	hidePanel : function(){
		var panel = this.options.panel;
		panel.css("display","none");
		$("body").unbind("mousedown");
		this.destroy();
		if(this.options.ifHasRelated){
			showRelatedContent();
		}
		if(this.options.execute != null){
			this.execute();
		}
	},
	show : function() {
		var self = this;
		$.ui.basetree.panelItem.allItem.clear();
		self.options.rootNode = new $.ui.basetree.panelItem(self,{uuid:"null",parentUuid:"null",level:0});
		if(self.options.defaultText){
			self.options.chooseNode = new $.ui.basetree.panelItem(self,{uuid:"",text:self.options.defaultText,status:"1",parentUuid:"null",level:0});
		}
		var parentValue;
		if(self.options.parentValue!=null&&self.options.parentValue.length>0)
			parentValue = self.options.parentValue;
		else
			parentValue = $("#"+self.options.parentId).attr("value");
		
		if(self.options.value){
			$.ajaxSetup({async:false});
			$.post(cp+"/ajaxs/tree/get_data_of_init_base_tree.html",{
				className:self.options.className,
				sortField:self.options.sortField,
				sortType:self.options.sortType,
				value:self.options.value,
				rJavaClassName:self.options.rClassName,
				parentKey:self.options.parentKey,
				parentValue:parentValue,
				childKey:self.options.childKey
			},function(data){
				for(var i=0;i<data.length;i++){
					var item = new $.ui.basetree.panelItem(self,{uuid:data[i]["uuid"],text:data[i]["text"],status:data[i]["status"],parentUuid:data[i]["parentUuid"],level:data[i]["level"]});
					self.options.treeItem.push(item);
				}
			},"json");
		}
		else{
			$.ajaxSetup({async:false});
			$.post(cp+"/ajaxs/tree/get_data_of_base_tree.html",{
				className:self.options.className,
				sortField:self.options.sortField,
				sortType:self.options.sortType,
				rJavaClassName:self.options.rClassName,
				parentKey:self.options.parentKey,
				parentValue:parentValue,
				childKey:self.options.childKey
			},function(data){
				for(var i=0;i<data.length;i++){
					var item = new $.ui.basetree.panelItem(self,{uuid:data[i]["uuid"],text:data[i]["text"],status:data[i]["status"],parentUuid:data[i]["parentUuid"],level:0});
					self.options.treeItem.push(item);
				}
			},"json");
		}
		self.options.panel.append($.ui.basetree.panelItem.allItem.get(self.options.className+"null").present());
		self.options.panel.css("display","block");
		self.movePanel();
	},
	movePanel : function(){
		var self = this;
		options = self.options;
		if(options.panel.height() > 292){
			options.panel.height("300px");
			options.panel.css("padding-right","17px"); 			// 防止scrollBar在ie6上挡住content靠右边的字，scrollBar为17px 
			options.panel.css("overflow-y","auto");
			options.iframe.width(options.panel.width()+25);		//加上overflow的宽度
			options.iframe.height(options.panel.height()+(options.panel.attr("scrollHeight")-options.panel.attr("offsetHeight")));
			//options.panel.width(options.panel.width()+'px');
		}
		else{
			options.iframe.width(options.panel.width()+10);		//因为BaseTree有3px的padding,导致iframe边框不齐,宽度加10
			options.iframe.height(options.panel.height());
		}
		options.iframe.css("left","-2px");
		options.iframe.css("right","-2px");
		
		var obj = self.element;
		//$("body").height();
		var bool = $(window).height() + $(document.documentElement).scrollTop() - $(obj).offset().top - $(obj).height() - options.panel.height();
		if(bool<0){
			if($(obj).offset().top > options.panel.height()){
				options.panel.css("top", $(obj).offset().top + $(obj).height() - $(obj).scrollTop() - $(obj).height() - options.panel.height()-8+'px');
			}
		}
	},
	updateText : function(node){
		var self  = this;
		if(self.options.nodeLevel == "last"){
			self.element.text(node.text);
			if(self.options.childId!=null&&self.options.childId.length>0){
				$("#"+self.options.childId).attr("value","");
				$("#"+self.options.childId).text(self.options.defaultText);
			}
		}
		else if(self.options.nodeLevel == "all"){
			self.element.text(node.text);
			var parentNode = $.ui.basetree.panelItem.allItem.get(node.parentId);
			var rootId = self.options.className+"null";
			while(parentNode.id!=rootId){
				self.element.text(parentNode.text+" "+self.element.text());
				parentNode = $.ui.basetree.panelItem.allItem.get(parentNode.parentId);
			}
			if(self.options.childId!=null&&self.options.childId.length>0){
				$("#"+self.options.childId).attr("value","");
				$("#"+self.options.childId).text(self.options.defaultText);
			}
		}
		self.options.value = node.uuid;
		self.element.attr("value",self.options.value);
		this.hidePanel();
	},
	destroy : function() {
		$.ui.basetree.panelItem.allItem.clear();
		this.options.rootNode = null;
		this.options.chooseNode = null;
		for(var a=0;a<this.options.treeItem.length;a++){
			this.options.treeItem[a] = null;
			delete this.options.treeItem[a];
		}
		this.options.treeItem.length = 0;
		if(CollectGarbage){
			CollectGarbage(); 
		}
	},
	destroyTree : function() {
		$.Widget.prototype.destroy.call(this);
	},
	execute : function(){
		var self = this;
		options = self.options;
		eval(options.execute+"('" +options.value+ "')");
	}
});
$.extend($.ui.basetree, {
	imgPath		:	cp+'/images/tree/',
	panelItem	:	function (basetree,data){
		this.init(basetree,data);
	}
});
$.extend($.ui.basetree.panelItem, {
	state : {
		collapsed	:	0,
		leaf		:	1,
		expanded	:	2,
		blank		:	3
	},
	icons			:	[$.ui.basetree.imgPath+'plus.gif',$.ui.basetree.imgPath+'leaf.gif',$.ui.basetree.imgPath+'minus.gif',$.ui.basetree.imgPath+'blank.png'],
	allItem			:	new jQuery.Hashtable(),
	updateText		: 	function(p){
		var node = $.ui.basetree.panelItem.allItem.get(p);
		node.parent.updateText(node);
		//p.updateText();
		//p.data.node.parent.updateText(p.data.node);
	},
	toggle			:	function(id) {
		var node = $.ui.basetree.panelItem.allItem.get(id)
		node.toggle(node);
	}
});
$.extend($.ui.basetree.panelItem.prototype, {
	parent : null,
	uuid : null,
	id : "",
	text : "",
	status : "",
	parentId : "",
	childNodes : null,
	level : 0,
	init : function(basetree,data){
		var self = this;
		self.parent = basetree;
		self.uuid = data.uuid;
		self.id = self.parent.options.className + self.uuid;
		self.text = data.text;
		self.status = data.status;
		self.parentId = self.parent.options.className + data.parentUuid;
		self.childNodes = new Array();
		self.level = data.level;
		if($.ui.basetree.panelItem.allItem.get(self.parentId)){
			$.ui.basetree.panelItem.allItem.get(self.parentId).addNode(self);
		}
		$.ui.basetree.panelItem.allItem.add(self.id,self);
	},
	addNode : function (node) {
		this.childNodes.push(node);
	},
	removeChildNodes : function () {
		for(var i=0;i<this.childNodes.length;i++){
			if(this.childNodes[i].childNodes.length>0){
				this.childNodes[i].removeChildNodes();
			}
			$.ui.basetree.panelItem.allItem.remove(this.childNodes[i].id);
		}
	},
	present : function(){
		var cont_bt = $("<div id='"+this.id+"_CONT_BT'></div>");
		for(var i=0;i<this.childNodes.length;i++){
			var obj = this.childNodes[i];
			var out_bt = $("<div id='"+obj.id+"_OUT_BT'></div>");
			cont_bt.append(out_bt);
			for(var j = 0; j < this.childNodes[i].level; j++){
				var blank = $("<img style='vertical-align:middle;width:13px' src='"+$.ui.basetree.panelItem.icons[$.ui.basetree.panelItem.state.blank]+"'/>");
				out_bt.append(blank);
			}
			out_bt.append(blank);
			var imgs = "<img style='vertical-align:middle;width:13px' id='"+obj.id+"_ICON_BT' src='"+$.ui.basetree.panelItem.icons[obj.status]+"'";
			if(obj.status == 0 || obj.status ==2){
				imgs += "onclick='$.ui.basetree.panelItem.toggle(\""+obj.id+"\")'";
			}
			imgs += "/>";
			var img = $(imgs);
			out_bt.append(img);
			var a = $("<a href='javascript:$.ui.basetree.panelItem.updateText(\""+obj.id+"\")'>"+obj.text+"</a>");
			out_bt.append(a);
			if(obj.childNodes.length>0){
				//str += obj.present();
				var child = obj.present();
				out_bt.append(child);
			}
		}
		return cont_bt;
	},
	toggle : function(obj){
		if(obj.status == $.ui.basetree.panelItem.state.collapsed){
			obj.expand();
		}
		else{
			obj.collapse();
		}
	},
	collapse : function() {
		this.status = $.ui.basetree.panelItem.state.collapsed;
		$("#"+this.id +"_ICON_BT").attr("src",$.ui.basetree.panelItem.icons[this.status]);
		$("#"+this.id +"_CONT_BT").remove();
		this.removeChildNodes();
		this.childNodes = [];
		this.parent.movePanel();
	},
	expand : function() {
		this.status = $.ui.basetree.panelItem.state.expanded;
		$("#"+this.id +"_ICON_BT").attr("src",$.ui.basetree.panelItem.icons[this.status]);
		var parentId = this.id;
		var basetree = this.parent;
		var level = parseInt(this.level)+1;
		
		var parentValue;
		if(self.options.parentValue!=null&&self.options.parentValue.length>0)
			parentValue = self.options.parentValue;
		else
			parentValue = $("#"+self.options.parentId).attr("value");

		$.ajaxSetup({async:false});
		$.post(cp+"/ajaxs/tree/get_data_of_base_tree.html",{
			className:this.parent.options.className,
			sortField:this.parent.options.sortField,
			sortType:this.parent.options.sortType,
			value:this.uuid,
			rJavaClassName:this.parent.options.rClassName,
			parentKey:this.parent.options.parentKey,
			parentValue:parentValue,
			childKey:this.parent.options.childKey
		},function(data){
			for(var i=0;i<data.length;i++){
				new $.ui.basetree.panelItem(basetree,{uuid:data[i]["uuid"],text:data[i]["text"],status:data[i]["status"],parentUuid:data[i]["parentUuid"],level:level});
			}
			var treeItemPanel = $("#"+parentId +"_OUT_BT");
			treeItemPanel.append($.ui.basetree.panelItem.allItem.get(parentId).present());
		},"json"); 
		this.parent.movePanel();
	}
});
})( jQuery );
$(document).ready(function(){
	$("label").filter(".BaseTree").basetree({})
});
function showRelatedContent(){}
