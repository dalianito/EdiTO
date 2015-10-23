(function( $ ) {
$.widget("ui.timeImage",{
	options:{
		date 		: 	null,
		panel 		: 	null,
		parent  	: 	null,
		panelItem   :	null,
		iframe		:	null
	},
	_create : function(){
	},
	showPanel : function(parent){
		var self = this;
		options = self.options;
		options.parent = parent;
		options = self.options;
		options.date = options.parent.options.date;
		if(options.panel == null){
			self.createDatePanel();
			options.panelItem = new $.ui.dateImage.panelItem(self);
		}
		else{
			options.panelItem.tempDate = new Date(options.date.getTime());
			options.panelItem.showAllDateTime();
		}
		var leftMenu = $("#leftMenu");
		options.panel.css("left",leftMenu.left);
		options.panel.css("top",leftMenu.top);
		options.panel.css("display","block");
//		options.iframe.css("left",left);
//		options.iframe.css("top",top+obj.offsetHeight+7);
//		options.iframe.css("display","block");
//		$("*").bind("mousedown", function(){
//			if(!$.contains($(options.panel).get(0),$(this).get(0))){
//				self.hidePanel();
//			}
//			return false;
//		});
	},
	createDatePanel : function(){
		var self = this;
		options = self.options;
		var datePanel = $("<div></div>");
		datePanel.attr("id","datePanel");
		datePanel.css("border","1px solid #666699");
		datePanel.css("background-color","#C8E3FF");
		datePanel.css("width","186");
		datePanel.css("position","absolute");
		datePanel.css("display","none");
		datePanel.css("z-index","2");
		var datePanelHtml = "";
			datePanelHtml = '<fieldset id="DateInput">'+
			'<table cellspacing="0" cellpadding="0">'+
				'<tr>'+
					'<td align="right"><img src="'+cp+'/images/date/left_arrow.gif" style="vertical-align:middle;"/></td>'+
					'<td align="center"><input id="yearInput" class="YearInput" maxlength=4></td>'+
					'<td align="left"><img src="'+cp+'/images/date/right_arrow.gif" style="vertical-align:middle;"/>&nbsp;年</td>'+
					'<td align="right">'+
						'<select>'+
							'<option>1</option>'+
							'<option>2</option>'+
							'<option>3</option>'+
							'<option>4</option>'+
							'<option>5</option>'+
							'<option>6</option>'+
							'<option>7</option>'+
							'<option>8</option>'+
							'<option>9</option>'+
							'<option>10</option>'+
							'<option>11</option>'+
							'<option>12</option>'+
						'</select>'+
					'&nbsp;月</td>'+
				'</tr>'+
			'</table>'+
			'<table id="DateInputTable" border="1" cellpadding="0" cellspacing="0">'+
				'<tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
			'</table>'+
			'</fieldset>';
		datePanel.append(datePanelHtml);
		options.panel = datePanel;
		options.parent.element.after(datePanel);
	},
	updateText : function(obj){
		this.options.parent.updateText(obj.tempDate.getTime());
	}
});
$.extend($.ui.timeImage, {
	panelItem	:	function (timeImage){
		this.init(timeImage);
	}
});
$.extend($.ui.dateImage.panelItem, {
	dayCountArray : new Array(31,-1,31,30,31,30,31,31,30,31,30,31)
});
$.extend($.ui.dateImage.panelItem.prototype, {
	browser		:	"msie",
	parent 		: 	null,
	tempDate 	: 	null,
	tdCells 	: 	null,
	monthField  : 	null,
	inputs	 	: 	null,
	images		:	null,
	yearMin 	: 	1900,
	yearMax 	: 	2100,
	nowYear		:   null,
	nowMonth	:	null,
	nowDate		:	null,
	init : function(dateTimeSingle){
		if(this.tempDate==null){
			var self = this;
			if(!$.browser.msie){
				self.browser = "ff";
			}
			self.parent = dateTimeSingle;
			self.tempDate = new Date(options.date.getTime());
			var today = new Date();
			self.nowYear = today.getFullYear();
			self.nowMonth = today.getMonth();
			self.nowDate = today.getDate();
			self.inputs = options.panel.find("input");
			self.images = options.panel.find("img");
			self.tdCells = options.panel.find("table").eq(1).find("td");
			self.tdCells.css("height","13px");
			self.tdCells.css("text-align","center");
			self.tdCells.css("padding","0px");
			self.tdCells.css("margin","0px");
			self.thCells = options.panel.find("table").eq(1).find("th");
			self.thCells.css("height","13px");
			self.thCells.css("text-align","center");
			self.thCells.css("padding","0px");
			self.thCells.css("margin","0px");
			self.trCells = options.panel.find("table").eq(1).find("tr");
			self.trCells.css("height","15px");
			self.trCells.css("text-align","center");
			self.trCells.css("padding","1px");
			self.trCells.css("margin","0px");
			self.monthField = options.panel.find("select").eq(0);
			self.monthField.change(function(){
				var days = self.daysInMonth(self.tempDate.getFullYear(),this.selectedIndex);
				if(days < self.tempDate.getDate()){
					self.tempDate.setDate(days);
				}
				self.tempDate.setMonth(this.selectedIndex);
				self.showDays();
			});
			self.inputs.mouseover(function(){
				self.inputs.select();
				self.checkField();
			});
			self.showAllDateTime();
			self.images.eq(0).click(function(){
				self.addValue(-1,self.inputs);
			});
			self.images.eq(1).click(function(){
				self.addValue(1,self.inputs);
			});
			if(self.browser =="msie"){
				self.inputs.bind("propertychange",function(){
					self.checkField();
				});
			}
			else{
				self.inputs.bind("input",function(){
					self.checkField();
				});
			}
			self.inputs.keypress(function(event){
				if(event.keyCode>57||event.keyCode<48||event.shiftKey) 
					event.keyCode=0;
			});
			self.inputs.keydown(function(event){
				switch(event.keyCode){
					case 38: self.addValue(1,self.inputs);event.keyCode=16;break;
					case 40: self.addValue(-1,self.inputs);event.keyCode=16;break;
					case 13: event.keyCode=9;break;
					case 32: event.keyCode=9;break;
				}
			});
		}
	},
	checkField : function(){
		var self = this;
		var inputItem = self.inputs.eq(0);
		if(inputItem.val()){
			var value = parseInt(inputItem.val(),10);
			if(value>self.yearMax){
				inputItem.val(self.yearMax);
				value = self.yearMax;
			}
			else if(inputItem.val().charAt(0)=='0'&&value!=0) {
				inputItem.val(value);
			}
			else if(inputItem.val().length>3 && value<self.yearMin){
				inputItem.val(self.yearMin);
				value = self.yearMin;
			}
			if(value!=self.tempDate.getFullYear()&&inputItem.val().length>3) {
				var days = self.daysInMonth(value,self.tempDate.getMonth());
				if(days < self.tempDate.getDate()){
					self.tempDate.setDate(days);
				}
				self.tempDate.setFullYear(value);
				self.showDays();
			}
		}
	},
	addValue : function(increment,field){
		var value = parseInt(field.val(),10)+increment;
		if(isNaN(value)) value=0;
		else if(value>this.maxValue) value=this.maxValue;
		else if(value<0) value=this.maxValue;
		field.val(value);
		if(this.browser =="ff"){
			this.checkField();
		}
	},
	getFirstDayIndex : function(){
		return (this.tempDate.getDay()-this.tempDate.getDate()+36)%7;
	},
	daysInMonth : function(theYear,theMonth){
		if (theMonth!= 1) return $.ui.dateTimeSingle.panelItem.dayCountArray[theMonth];
		if ((theYear % 4 != 0) || ((theYear % 100 == 0) && (theYear % 400 != 0)))
		return 28;
		return 29;
	},
	showAllDateTime : function(){
		this.inputs.val(this.tempDate.getFullYear());
		this.monthField.find("option").eq(this.tempDate.getMonth()).attr("selected",true);
		this.showDays();
	},
	showDays : function(){
		var self = this;
		var firstDayIndex = self.getFirstDayIndex();
		var lastDayIndex = firstDayIndex + self.daysInMonth(self.tempDate.getFullYear(), self.tempDate.getMonth());
		for(var i=0;i<37;i++){
			self.tdCells.eq(i).removeClass();
			if(i<firstDayIndex||i>=lastDayIndex) {
				self.tdCells.eq(i).html("");
				self.tdCells.eq(i).unbind("click");
			}
			else{
				self.tdCells.eq(i).unbind("click");
				self.tdCells.eq(i).html(i+1-firstDayIndex);
				self.tdCells.eq(i).bind("click",{node:i,e:self},self.selectDay);
			}
		}
		self.tdCells.eq(self.tempDate.getDate() + firstDayIndex-1).addClass("Selected");

		if(self.tempDate.getFullYear() == self.nowYear && self.tempDate.getMonth() == self.nowMonth){
			if(self.tempDate.getDate() == self.nowDate){
				self.tdCells.removeClass("Selected");
			}
			self.tdCells.eq(self.nowDate + firstDayIndex-1).addClass("Today");
		}
		for(var i=0;i<self.tdCells.length;i++){
			if(i%7==0||i%7==6){
				if(i==self.tempDate.getDate()+firstDayIndex-1){
					continue;
				}
				if(self.tdCells.eq(i).html()!=""){
					self.tdCells.eq(i).addClass("WeekEnd");
				}
			}
		}
	},
	selectDay : function(temp){
		var i = temp.data.node;
		var self = temp.data.e;
		self.tdCells.removeClass("Selected");
		self.tdCells.eq(i).addClass("Selected");
		self.tempDate.setDate(self.tdCells.eq(i).text());
		self.parent.updateText(self);
	},
	showPartDateTime : function(){
		this.inputs.val(options.date.getFullYear());
		this.showMonths();
	},
	showMonths : function(){
		var self = this;
		for(var i=0;i<12;i++){
			self.monthField.eq(i).unbind("click");
			self.monthField.eq(i).removeClass("Selected");
			self.monthField.eq(i).val(i);
			self.monthField.eq(i).bind("click",{node:i,e:self},self.selectMonth);
		}
		self.monthField.eq(options.date.getMonth()).addClass("Selected");
	},
	selectMonth : function(temp){
		var i = temp.data.node;
		var self = temp.data.e;
		self.tempDate.setMonth(self.monthField.eq(i).val());
		self.parent.updateText(self);
	}
});
})( jQuery );