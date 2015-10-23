(function( $ ) {
$.widget("ui.dropmenu",{
	options:{
		value 				: 	"",
		field 				: 	"",
		url 				: 	"",
		size 				: 	9,
		parameterLength 	: 	1,
		searchType 			: 	"",
		constraint		 	: 	"",
		constraintValues	:	"",
		nextSiblingValue	: 	"",
		relationId 			:	"",
		panel 				: 	null,
		inputed 			: 	null,
		table 				: 	null,
		num 				: 	0,
		index 				: 	-1,
		menuItem			:	new Array(),
		path                :   document.location.pathname,
		departmentType      :   ""
	},
	_create : function(){
		var self = this;
		options = self.options;
		options.field = self.element.attr("field") ? self.element.attr("field") : options.field;
		options.url = self.element.attr("actionPath") ? self.element.attr("actionPath") : options.url;
		options.size = self.element.attr("nextSiblingSize") ? self.element.attr("nextSiblingSize") : options.size;
		options.searchType = self.element.attr("searchType") ? self.element.attr("searchType") : options.searchType;
		//options.actionParameter  = self.element.attr("actionParameter") ? self.element.attr("actionParameter") : options.actionParameter;
		options.parameterLength = self.element.attr("parameterLength") ? self.element.attr("parameterLength") : options.parameterLength;
		options.constraint = self.element.attr("constraint") ? self.element.attr("constraint") : options.constraint;
		options.constraintValues = self.element.attr("constraintValues") ? self.element.attr("constraintValues") : options.constraintValues;
		options.nextSiblingValue = self.element.attr("nextSiblingValue") ? self.element.attr("nextSiblingValue") : options.nextSiblingValue;
		options.relationId = self.element.attr("relationId") ? self.element.attr("relationId") : options.relationId;
		options.departmentType = self.element.attr("departmentType") ? self.element.attr("departmentType") : options.departmentType;
		
		self.showPanel();
		self.createInputed();
		
		var inputed = this.options.inputed;

		inputed.change(function(){
			self.clearData();
		})
		inputed.keyup(function(event){
			self.getDropMenu(event);
		})
		inputed.keydown(function(event){
			self.getCurrentDropMenuItem(event);
		})
		/*
		inputed.focus(function(event){
			self.showPanel();
		})
		*/
	},
	createInputed : function (){
		var inputed = $("<input>");
		this.element.after(inputed);
		inputed.autocomplete = "off";
		
		inputed.attr("size",this.options.size);

		inputed.css("border","1px solid sandybrown");  
		inputed.css("padding","1px");  
		inputed.css("margin","0px");  
		inputed.css("background-color","#FFFFFF");
		inputed.css("color","#000000");
		this.options.inputed = inputed;
		
		if(this.element.attr("nextSiblingValue")){
			inputed.val(this.options.nextSiblingValue);
		}
		if(this.element.attr("nextSiblingName")){
			inputed.attr("name",this.element.attr("nextSiblingName"));
			inputed.attr("id",this.element.attr("nextSiblingName"));
		}
		if(this.element.attr("nextSiblingValidate")){
			inputed.attr("validate",this.element.attr("nextSiblingValidate"));
		}
		if(this.element.attr("nextSiblingCategory")){
			inputed.attr("category",this.element.attr("nextSiblingCategory"));
		}
		if(this.element.attr("nextSiblingMsg")){
			inputed.attr("msg",this.element.attr("nextSiblingMsg"));
		}
	},
	showPanel : function (){
		var self = this;
		var options = self.options;
		
		var dropMenuPanel = $("#dropMenuPanel");
		//if(dropMenuPanel.html()!=null){
		//	dropMenuPanel.remove();
		//}
		if(dropMenuPanel.html()==null){
			dropMenuPanel = $("<div id='dropMenuPanel'></div>");
		}
		
		$("body").append(dropMenuPanel);
		
		dropMenuPanel.css("position","absolute");
		dropMenuPanel.css("display","none");
		dropMenuPanel.css("font-size","13px");
		dropMenuPanel.css("margin","0px");
		dropMenuPanel.css("border","1px solid #000000");
		dropMenuPanel.css("background-color","#F0F0F0"); 
		dropMenuPanel.css("cursor","default");
		dropMenuPanel.css("zIndex",1000);
		options.panel = dropMenuPanel;

		var dropMenuTable = $("<table></table>");
		dropMenuTable.css("border-collapse","collapse");
		dropMenuTable.css("border-style","solid");
		dropMenuTable.css("border-color","#D4DDE6");
		dropMenuTable.css("border-width","0px 1px 0px 0px");
		dropMenuTable.css("margin","0px");
		dropMenuTable.css("padding","0px");
		dropMenuTable.css("font-size","13px");

		options.table = dropMenuTable;
		dropMenuPanel.append(dropMenuTable);
	},
	getDropMenu : function (e){
		var self = this;
		options = self.options;
		var event = $.event.fix(e);
		if(options.searchType=="enter"){
			if(event.keyCode==13){
				self.getData(event);
			}
		}
		else{
			if(event.keyCode!=13 && event.keyCode!=9 && event.keyCode!=38 && event.keyCode!=40){
				self.getData(event);
			}
		}
	},
	getData : function (event) {
		var self = this;
		var options = this.options;
		$.ui.dropmenu.menuItem.allItem.clear();
		if(options.table.html()!=""){
			options.table.html("");
		}
		options.num = 0; 
		options.index = -1;
		var queryStr = self.element.next().val();
		queryStr = queryStr.replace(/(^\s*)|(\s*$)/g, "");
		if(queryStr.length>Math.max(0,options.parameterLength-1)){
			$.ajaxSetup({async:false});
			$.post(options.url,{
				field : options.field,
				key : queryStr,
				constraints : options.constraint,
				constraintValues : options.constraintValues,
				path : options.path,
				departmentType : options.departmentType
			},function(data){
				if(data.length>0){
					var obj = event.target;
					options.panel.css("left",$(obj).offset().left);
					options.panel.css("top",$(obj).offset().top + obj.offsetHeight);
					for(var i=0;i<data.length;i++){
						var item = new $.ui.dropmenu.menuItem(self,{ID:data[i]["id"],uuid:data[i]["uuid"],name:data[i]["name"],text:data[i]["text"]});
						self.options.menuItem.push(item);
					}
					options.panel.css("display","block");
					var theight = options.table.height();//计算有些慢，待解决
					if(theight > 292){
						options.panel.height("300px");
						options.panel.css("overflow-y","auto");
					}
					else{
						options.panel.height(theight+1);
					}
					var obj = self.options.inputed;
					var bool = $(window).height() + $(document.documentElement).scrollTop() - $(obj).offset().top - $(obj).height() - options.panel.height();
					if(bool<0){
						if($(obj).offset().top > options.panel.height()){
							options.panel.css("top", $(obj).offset().top + $(obj).height() - $(obj).scrollTop() - $(obj).height() - options.panel.height()-8+'px');
						}
					}
					$("body").bind("mousedown", function(event) {
						if($.contains($("#dropMenuPanel").get(0),event.target)||$("#dropMenuPanel").get(0)==event.target||$(self.options.inputed).get(0)==event.target){
							return;
						}
						self.hideDropmenu();
						return false;
					});
					
				}
				else{
					options.panel.css("display","none");
				}
			},"json");
		}
		else{
			options.panel.css("display","none");
		}
	},
	getCurrentDropMenuItem : function(e){
		var self = this;
		options = self.options;
		var a = e.keyCode;
		if (a==40||a==38||a==13){
			if(a==38){
				var obj;
				if(options.index==-1){
					options.index = options.num-1;
				}
				else if(options.index==0){
					obj = options.table.find("tr").eq(options.index);
					$.ui.dropmenu.menuItem.changeBeforeItemStyle(obj);
					options.index = options.num-1;
				}
				else{
					obj = options.table.find("tr").eq(options.index);
					$.ui.dropmenu.menuItem.changeBeforeItemStyle(obj);
					options.index--;
				}
				obj = options.table.find("tr").eq(options.index);
				$.ui.dropmenu.menuItem.changeCurrentItemStyle(obj);
			}
			else if(a==40){
				var obj;
				if(options.index==-1){
					options.index = 0;
				}
				else if(options.index==options.num-1){
					obj = options.table.find("tr").eq(options.index);
					$.ui.dropmenu.menuItem.changeBeforeItemStyle(obj);
					options.index = 0;
				}
				else{
					obj = options.table.find("tr").eq(options.index);
					$.ui.dropmenu.menuItem.changeBeforeItemStyle(obj);
					options.index++;
				}
				obj = options.table.find("tr").eq(options.index);
				$.ui.dropmenu.menuItem.changeCurrentItemStyle(obj);
			}
			else if(a==13){
				if(options.index!=-1){
					if($.ui.dropmenu.menuItem.allItem.get("DropMenuItem"+options.index)!=null){
						$.ui.dropmenu.menuItem.allItem.get("DropMenuItem"+options.index).dropMenuDown(options.inputed.prev());
						self.hideDropmenu();
					}
				}
			}
		}
	},
	hideDropmenu : function(){
		var panel = this.options.panel;
		panel.css("display","none");
		var table = this.options.table;
		table.html("");
		$("body").unbind("mousedown");
		this.destroy();
	},
	clearData : function(){
		var self = this;
		options = self.options;
		self.element.val("");
		if(self.element.attr("execute")){
			if(options.relationId != ""){
				clearRelationData(options.relationId);
			}
		}
	},
	destroy : function() {
		$.ui.dropmenu.menuItem.allItem.clear();
		for(var a=0;a<this.options.menuItem.length;a++){
			this.options.menuItem[a] = null;
			delete this.options.menuItem[a];
		}
		this.options.menuItem.length = 0;
		if(CollectGarbage){
			CollectGarbage(); 
		}
	}
});
$.extend($.ui.dropmenu, {
	menuItem :	function (dropmenu,data){
		this.init(dropmenu,data);
	}
});
$.extend($.ui.dropmenu.menuItem, {
	id : "",
	uuid : "",
	description  : "",
	itemText : null,
	parent : null,
	allItem : new jQuery.Hashtable(),
	changeCurrentItemStyle : function(ele) {
		ele.css("backgroundColor","#3377CC");
		ele.css("color","#FFFFFF");
	},
	changeBeforeItemStyle : function(ele) {
		ele.css("backgroundColor","#F0F0F0");
		ele.css("color","#000000");
	}
});
$.extend($.ui.dropmenu.menuItem.prototype, {
	init : function(dropmenu,data){
		var self = this;
		self.id = "DropMenuItem"+data.ID;
		self.uuid = data.uuid;
		self.description = data.name;
		self.itemText = data.text;
		self.parent = dropmenu;
		$.ui.dropmenu.menuItem.allItem.add(self.id,self);
		self.addToPanelTable();
	},
	addToPanelTable : function () {
		var self = this;
		self.parent.options.num++;
		var dropMenuTable = this.parent.options.table;
		var tr = $("<tr></tr>");
		tr.css("padding","0px");
		tr.css("margin","0px");
		tr.css("height","13px");
		tr.attr("id",self.id);
		tr.attr("uuid",self.uuid);
		tr.attr("description",self.description);
		tr.mousedown(function(){
			self.dropMenuDown(self.parent.options.inputed.prev());
			self.parent.hideDropmenu();
		});
		tr.mouseover(function(){
			self.dropMenuOver(tr);
		});

		for(var i=0;i<this.itemText.length;i++){
			var td = $("<td></td>");
			td.css("height","13px");
			td.css("padding","0px 5px 0px 5px");
			td.css("margin","0px");
			td.css("border-style","solid");
			td.css("border-color","#D4DDE6");
			td.css("border-width","0px 0px 1px 0px");
			td.css("word-break","keep-all");
			td.css("text-align","left");
			td.html(this.itemText[i]);
			tr.append(td);
		} 
		
		dropMenuTable.append(tr);
	},
	dropMenuDown : function(element) {
		element.next().blur();
		var item = this.parent.options.table.find("tr").eq(this.parent.options.index);
		element.val(item.attr("uuid"));
		element.next().val(item.attr("description"));
		if(element.attr("execute")=="true"){
			$.ajaxSetup({async:false});
			$.post(element.attr("executeUrl"),{
				uuid : element.val(),
				relationId : this.parent.options.relationId
			},function(data){
				updateRelation(data);
			},"json");
		}
	},
	dropMenuOver : function(tr) {
		if(this.parent.options.index==-1){
			this.parent.options.index = parseInt(tr.attr("id").replace(/DropMenuItem/,''));
			$.ui.dropmenu.menuItem.changeCurrentItemStyle(tr);
		}
		else{
			var obj = this.parent.options.table.find("tr").eq(this.parent.options.index);
			$.ui.dropmenu.menuItem.changeBeforeItemStyle(obj);
			this.parent.options.index = parseInt(tr.attr("id").replace(/DropMenuItem/,''));
			$.ui.dropmenu.menuItem.changeCurrentItemStyle(tr);
		}
	}
});
})( jQuery );