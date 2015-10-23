(function( $ ) {
$.widget("ui.treelist",{
	options:{
		value 		  : 	"",
		className 	  : 	"",			/*className is used to receive javaclass caming from label*/
		currentId	  :		"",
		sortField 	  : 	"uuid",
		sortType 	  : 	"asc",
		divBlock	  :		null,		/*this var is a Jq object which is the div area contains treelist*/
		treeItem	  : 	new Array(),
		rootNode	  : 	null,
		chooseNode	  : 	null,
		setCheckLv :		0,
		checkedUuidTable:		new jQuery.Hashtable()
	},
	// 将label中的键值传入Jquery的自定义封装插件中
	// 初始化各个变量
	_create : function(){
		var self 			= this,
		options 			= self.options;
		options.currentId	= self.element.attr("id");
		options.value 		= self.element.attr("value") ? self.element.attr("value"):options.value;
		self.element.attr("value") ? self.element.attr("value"): self.element.attr("value",options.value);
		options.className 	= self.element.attr("JavaClassName");
		options.sortField 	= self.element.attr("sortField") ? self.element.attr("sortField"):options.sortField;
		options.sortType 	= self.element.attr("sortType") ?  self.element.attr("sortType"):options.sortType;
		options.setCheckLv  = self.element.attr("setCheckLv") ?  self.element.attr("setCheckLv"):options.setCheckLv;
		
		$(self.element).unbind("click");
		if(options.checkedUuidTable.size()>0){
			options.checkedUuidTable.clear();
		}
		if(options.value.length > 0){
			var values = options.value.split(",");
			for(var i = 0; i < values.length; i++){
				options.checkedUuidTable.add(values[i],values[i]);
			}
		}
		self._showTreeList(self.element.attr("id"));
		
		/*
		$(self.element).bind("mouseover", function() {
			window.status = options.className;
		});
		$(self.element).bind("mouseout", function() {
			window.status = "";
		});
		
		var drgUuid = $("#drgUuid").val();
		$.ajaxSetup({async:false});
		$.post(cp+"/ajaxs/cardio/disease/manage/get_test_group.html"
			,{drgUuid:drgUuid}
			,function(data){
				if(options.checkedUuidTable.size()>0){
					options.checkedUuidTable.clear();
				}
				for(var i=0; i<data.length; i++){
					options.checkedUuidTable.add(data[i]["Uuid"],data[i]["Uuid"]);
				}
			}
			,"json"
		);
		*/
	},

	/*
	 * 该方法用于显示树形列表，并将属性列表注入到相应的div块中
	 */
	_showTreeList : function(did){
		//清空已有的内容，插入新的内容
		var treeList = $("#treeList");
		if(treeList.html()!=null){
			treeList.remove();
		}
		treeList = $("<div id='treeL	ist'></div>");
		this.options.divBlock = treeList;
		$('#'+did).append(treeList);
		
		this.show();// 显示当前对象的数据
	},
	
	// 连接数据库，根据对象拿取数据库的值,初始化树形列表
	show : function() {
		var self = this;
		$.ui.treelist.listItem.allItem.clear();
		// 根节点创建
		self.options.rootNode = new $.ui.treelist.listItem(self,{uuid:"null",parentUuid:"null",level:0});
		
		$.ajaxSetup({async:false});
		$.post(cp+"/ajaxs/tree/get_data_of_base_tree.html",{
			className:self.options.className,
			sortField:self.options.sortField,
			sortType:self.options.sortType
		},function(data){
			var rootId=self.options.className+"null";
			for(var i=0;i<data.length;i++){
				// 将值插入到树形结构中
				var item = new $.ui.treelist.listItem(self,{uuid:data[i]["uuid"],text:data[i]["text"],status:data[i]["status"],parentUuid:data[i]["parentUuid"],level:0,parentId:rootId});
				self.options.treeItem.push(item);
			}
		},"json");
		
		self.options.divBlock.append($.ui.treelist.listItem.allItem.get(self.options.className+"null").present(false));
		self.options.divBlock.css("display","block");
		self.movePanel();
	},
	movePanel : function(){
		var self = this;
		options = self.options;
		var obj = self.element;
		var bool = $(window).height() + $(document.documentElement).scrollTop() - $(obj).offset().top - $(obj).height() - options.divBlock.height();
		if(bool<0){
			if($(obj).offset().top > options.divBlock.height()){
				options.divBlock.css("top", $(obj).offset().top + $(obj).height() - $(obj).scrollTop() - $(obj).height() - options.divBlock.height()-8+'px');
			}
		}
	},
	
	destroy : function() {
		$.ui.treelist.listItem.allItem.clear();
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
	}
});
// 定义ui.treelist中的变量，在treeList中定义listItem类
$.extend($.ui.treelist, {
	imgPath		:	cp+'/images/tree/',
	listItem	:	function (treelist,data){
		this.init(treelist,data);
	}
});
/*
 * 方法描述：该方法用于追加定义treelist中listItem的变量 变量： state：设置listItem的状态（相当于一个多选框选项） load
 * ：判断当前节点下的子点数据是否已经加载过 icons：根据状态定义状态图片
 * allItem：用于存入树形节点的对象以（key:id,value:object）的形式存储 方法： 1. toggle:
 * function:根据传入的id调取相应的对象，并触发该对象的toggle方法。
 * @param：id--根据传入的对象id从hashtable中拿取相应对象 2. clickToLoadAll
 * function:根据传入的id调取相应的对象，并触发该对象的clickToLoadAll方法。
 * @param：cid--根据传入的对象id从hashtable中拿取相应对象
 */

$.extend($.ui.treelist.listItem, {
	state : {
		collapsed	:	0,
		leaf		:	1,
		expanded	:	2,
		blank		:	3
	},
	load			:	false,
	icons			:	[$.ui.treelist.imgPath+'arrow_right.gif',$.ui.treelist.imgPath+'arrow_leaf.gif',$.ui.treelist.imgPath+'arrow_down.gif',$.ui.treelist.imgPath+'blank.png'],
	allItem			:	new jQuery.Hashtable(),
	toggle			:	function(id) {
		var node = $.ui.treelist.listItem.allItem.get(id)
		node.toggle(node);
	},
	clickToLoadAll	:	function(cid) {
		// 获取页面元素id并进行标签元素定位和判断
		var labelObj=$("#selectTreeInfo").find("input[id$='" + cid + "']");
		var node = $.ui.treelist.listItem.allItem.get(cid);
		node.clickToLoadAll(node);
		changeCheckeds(labelObj);
	}
});
// 定义listItem变量属性,listItem 用于实现树形结构
$.extend($.ui.treelist.listItem.prototype, {
	parent     : null,
	uuid       : null,
	id         : "",
	text       : "",
	status     : "",
	parentId   : "",
	childNodes : null,
	level      : 0,
	
	init : function(treelist,data){
		var self = this;
		self.parent = treelist;
		self.uuid = data.uuid;
		self.id = self.parent.options.className + self.uuid;
		self.lid= self.id;// the label id used to put in input label
		self.text = data.text;
		self.status = data.status;
		self.parentId = data.parentId;
		self.childNodes = new Array();
		self.level = data.level;
		
		// 如果数据有父属性，则将子节点加入到父节点下,并将id拼凑成符合规则的id。规则为所有祖先id_当前节点id
		if($.ui.treelist.listItem.allItem.get(self.parentId)){
			var tmpParentId=$.ui.treelist.listItem.allItem.get(self.parentId).id;
			self.id=tmpParentId+"_"+self.uuid;
			self.parentId=tmpParentId;
			
			$.ui.treelist.listItem.allItem.get(self.parentId).addNode(self);
		}
		$.ui.treelist.listItem.allItem.add(self.id,self);
	},
	addNode : function (node) {
		this.childNodes.push(node);
	},
	removeChildNodes : function () {
		for(var i=0;i<this.childNodes.length;i++){
			if(this.childNodes[i].childNodes.length>0){
				this.childNodes[i].removeChildNodes();
			}
			$.ui.treelist.listItem.allItem.remove(this.childNodes[i].id);
		}
	},
	matchUuid: function(){
		
		return this.parent.options.checkedUuidTable.containsValue(this.uuid);
	},
	/* 
	 * 生成html页面和页面样式
	 */
	present : function(hide){
		var startFrom = this.parent.options.setCheckLv;
		var ifChecked = false;
		// 只写入，不显示
		if(hide)
			var cont_bt =$("<div id='"+this.id+"_CONT_BT' style='display:none'></div>");
		// 写入html并显示
		else
			var cont_bt =$("<div id='"+this.id+"_CONT_BT' style='display:block'></div>");
		var sPid=this.uuid;			// sPid，String类型的parentId
		for(var i=0;i<this.childNodes.length;i++){
			var obj = this.childNodes[i];
			ifChecked=obj.matchUuid();
			var sCid=obj.uuid;		// string 类型的子数据uuid
			var sLid= obj.id		// string 类型的label标签id = 父数据标签id+子数据uuid
			
			var out_bt = $("<div id='"+obj.id+"_OUT_BT'></div>");
			cont_bt.append(out_bt);
			for(var j = 0; j < this.childNodes[i].level; j++){
				// 添加blank图片
				var blank = $("<img style='vertical-align:middle;width:13px' " +
						"src='"+$.ui.treelist.listItem.icons[$.ui.treelist.listItem.state.blank]+"'/>");
				out_bt.append(blank);
			}
			out_bt.append(blank);
			var imgs = "<img style='vertical-align:middle;width:13px' id='"+obj.id+"_ICON_BT' " +
					"src='"+$.ui.treelist.listItem.icons[obj.status]+"'";
			if(obj.status == 0 || obj.status ==2){
				imgs += "onclick='$.ui.treelist.listItem.toggle(\""+obj.id+"\")'";
			}
			imgs += "/>";
			var img = $(imgs);
			out_bt.append(img);
			// 写好html格式，放入字符串
			if(obj.level<=startFrom){
				alert("obj.level:" + obj.level);
				alert("startFrom" + startFrom);
				var tmpStr=obj.text;
				out_bt.append(tmpStr);
			}
			else{
				var tmpStr="<input type='checkbox' id='"+sLid+"'  parentId='" + sPid + "' " + "value='"+sCid+"'" + 
					"onclick='javascript:$.ui.treelist.listItem.clickToLoadAll(\""+obj.id+"\")' text='"+obj.text+"'";
				if(ifChecked){
					tmpStr+=" checked ";
				}
				if(obj.status == 0 || obj.status ==2){
					tmpStr+="hasChildren='true' >"+obj.text+"</input>";			
				}
				else{
					tmpStr+="hasChildren='false' >"+obj.text+"</input>";
				}
				var input =$(tmpStr);
				out_bt.append(input);
			}
			
		}
		return cont_bt;
	},
	//判断是否需要加载当前节点下的所有子孙选项
	clickToLoadAll : function(obj){
		
		// 如果当前节点含有子节点并且数据没有加载则迭代加载所有子节点。
		if(obj.status!=1){
			if(!this.load){
				this.loadChildren(true);
				for(var i=0;i<obj.childNodes.length;i++){
					obj.childNodes[i].clickToLoadAll(obj.childNodes[i]);
				}
				this.load=true;
			}
			//否则检测当前节点的子节点是否含有未加载的子节点，找到他们并将其全部加载
			else{
				for(var i=0;i<obj.childNodes.length;i++){
					obj.childNodes[i].clickToLoadAll(obj.childNodes[i]);
				}
			}
		}
		
	},
	toggle : function(obj){
		if(obj.status == $.ui.treelist.listItem.state.collapsed){
			obj.expand();
		}
		else{
			obj.collapse();
		}
	},
	collapse : function() {
		this.status = $.ui.treelist.listItem.state.collapsed;
		$("#"+this.id +"_ICON_BT").attr("src",$.ui.treelist.listItem.icons[0]);
		$("#"+this.id +"_CONT_BT").css("display","none");
	},
	//显示已经折叠菜单
	expand : function() {
		var ifHide=false
		var ifChecked=false;
		// 判断是否已经加载数据,若数据没有加载则加载数据并写入html
		if(!this.load){
			this.load=true;
			this.status = $.ui.treelist.listItem.state.expanded;
			$("#"+this.id +"_ICON_BT").attr("src",$.ui.treelist.listItem.icons[this.status]);
			this.loadChildren(ifHide,ifChecked);
			
			/////////////
			
			
			this.parent.movePanel();
		}
		// 数据若已经加载，则打开隐藏菜单
		else{
			this.status = $.ui.treelist.listItem.state.expanded;
			$("#"+this.id +"_ICON_BT").attr("src",$.ui.treelist.listItem.icons[this.status]);
			$("#"+this.id +"_CONT_BT").css("display","block");
		}
	},

	//加载当前选项下的所有子节点（不含孙节点）。
	loadChildren  :	function(ifHide)	{
		var parentId = this.id;
		var treelist = this.parent;
		var level = parseInt(this.level)+1;
		$.ajaxSetup({async:false});
		$.post(cp+"/ajaxs/tree/get_data_of_base_tree.html",{
			className:this.parent.options.className,
			sortField:this.parent.options.sortField,
			sortType:this.parent.options.sortType,
			value:this.uuid,
		},function(data){
			for(var i=0;i<data.length;i++){
				new $.ui.treelist.listItem(treelist,{uuid:data[i]["uuid"],text:data[i]["text"],status:data[i]["status"],parentUuid:data[i]["parentUuid"],level:level,parentId:parentId});
			}
			
			var treeItemPanel = $("#"+parentId +"_OUT_BT");
			treeItemPanel.append($.ui.treelist.listItem.allItem.get(parentId).present(ifHide));
			
		},"json"); 
	},	
});
})( jQuery );
$(document).ready(function(){
	$("div").filter(".SelectTree").treelist({})
});

/** 
* 选中或取消 触发对象（obj）、其父节点及其下级目标（id = targetDivId）
*/
function changeCheckeds(obj){
	changeChildChecks(obj);
	changeParentChecks(obj, "selectTreeInfo");
	
}

/** 
* 选择或取消所有子节点
*/
function changeChildChecks(obj){
	if($(obj).attr("checked")){
		$("input[id^='" + $(obj).attr("id") + "_']").attr("checked", true);
	}
	else {
		$("input[id^='" + $(obj).attr("id") + "_']").attr("checked", false);
	}
}

/** 
* 选择或取消父节点
*/
function changeParentChecks(obj, targetDivId){
	if($(obj).attr("parentId") != "" && $(obj).attr("parentId") != null){
		var targetDiv = $("#"+targetDivId);
		var brotherChecks = targetDiv.find("*[parentId='" + $(obj).attr("parentId") + "']");
		var brotherCheckeds = targetDiv.find("*[parentId='" + $(obj).attr("parentId") + "'][checked='true']");
		if(brotherChecks.length == brotherCheckeds.length){
			$("input[id$='" + $(obj).attr("parentId") + "']").attr("checked", true);
		}
		else {
			$("input[id$='" + $(obj).attr("parentId") + "']").attr("checked", false);
		}
		changeParentChecks($("input[id$='" + $(obj).attr("parentId") + "']"), targetDivId);
	}
}