(function( $ ) {
$.widget("ui.dateTimeSingle",{
	options:{
		value		: 	null,
		date		: 	null,
		format		: 	"all",
		panel		: 	null,
		panelItem	:	null,
		execute		:	null
	},
	_create : function(){
		var self = this;
		options = self.options;
		options.format = self.element.attr("format") ? self.element.attr("format"):options.format;
		options.value = self.element.attr("value") ? self.element.attr("value"):options.value;
		options.execute = self.element.attr("execute") ? self.element.attr("execute"):options.execute;
		if(options.value){
			options.value = self.parseTimeValue();
			options.date = new Date(Date.parse(options.value));
			self.element.text(self.getDateString(options.date));
		}
		else{
			options.date = new Date();
			self.element.text("-选择日期-");
			self.element.attr("value","");
		}
		self.element.unbind("click");// 防止重复绑定函数
		self.element.bind("click",function(event){
			self.showPanel(event);
		});
	},
	showPanel : function(e){
		var self = this;
		options = self.options;
		if(options.panel ==null){
			if(options.format=="all"){
				self.createAllDatePanel();
			}
			else if(options.format=="part"){
				self.createPartDatePanel();
			}
			options.panelItem = new $.ui.dateTimeSingle.panelItem(self);
		}
		else{
			options.panelItem.tempDate.setTime(options.date.getTime());
			if(options.format=="all"){
				options.panelItem.showAllDateTime();
			}
			else{
				options.panelItem.showPartDateTime();
			}
		}
		var event = $.event.fix(e);
		var obj = event.target;
		
		options.panel.css("left",$(obj).position().left);
		options.panel.css("top" ,$(obj).position().top + $(obj).height()+2);
		options.panel.css("display","block");
		
		$("*").bind("mousedown", function(){
			if(!$.contains($(options.panel).get(0),$(this).get(0))){
				self.hidePanel();
			}
			return false;
		});
		
		options.panelItem.labels.eq(0).bind("click",function(){
			self.canselText();
		});
	},
	createAllDatePanel : function(){
		var self = this;
		options = self.options;
		var datePanel = $("<div></div>");
		datePanel.attr("id","datePanel");
		datePanel.css("border","1px solid #666699");
		datePanel.css("background-color","#C8E3FF");
		datePanel.css("width","186");
		datePanel.css("position","absolute");
		datePanel.css("display","none");
		datePanel.css("zIndex",2);
		var datePanelHtml = '<fieldset id="DateInput">'+
			'<table border="0" cellspacing="0" cellpadding="0">'+
				'<tr border="0" >'+
					'<td align="right" border="0" ><img src="'+cp+'/images/date/left_arrow.gif" style="vertical-align:middle;"/></td>'+
					'<td align="center" border="0" ><input id="yearInput" class="YearInput" maxlength=4></td>'+
					'<td align="left" border="0" ><img src="'+cp+'/images/date/right_arrow.gif" style="vertical-align:middle;"/>&nbsp;年</td>'+
					'<td align="right" border="0" >'+
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
			'<table id="DateInputTable" border="1" cellpadding="0" cellspacing="0" >'+
				'<tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
				'<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'+
			'</table>'+
			'<label id="cansel" style="float:right" onmouseover="this.style.cursor=\'hand\'" onmouseout="this.style.cursor=\'normal\'">取消&nbsp;</label>'+
		'</fieldset>';
		datePanel.html(datePanelHtml)
		options.panel = datePanel;
		self.element.after(datePanel);
	},
	createPartDatePanel : function(){
		var self = this;
		options = self.options;
		var datePanel = $('<div></div>');
		datePanel.attr("id","datePanel");
		datePanel.css("border","1px solid #666699");
		datePanel.css("background-color","#C8E3FF");
		datePanel.css("width","186");
		datePanel.css("position","absolute");
		datePanel.css("display","none");
		datePanel.css("zIndex",2);
		var datePanelHtml =
			'<fieldset id="DateInput">'+
				'<table border="0" cellspacing="0" cellpadding="0">'+
					'<tr>'+
						'<td align="right"><img src="'+cp+'/images/date/left_arrow.gif" style="vertical-align:middle;"/></td>'+
						'<td align="center"><input id="yearInput" class="YearInput" maxlength=4></td>'+
						'<td align="left"><img src="'+cp+'/images/date/right_arrow.gif" style="vertical-align:middle;"/>&nbsp;年</td>'+
					'</tr>'+
				'</table>'+
				'<table border="1">'+
					'<tr><td>  一月</td><td>  二月</td><td>  三月</td><td>  四月</td></tr>'+
					'<tr><td>  五月</td><td>  六月</td><td>  七月</td><td>  八月</td></tr>'+
					'<tr><td>  九月</td><td>  十月</td><td>  十一</td><td>  十二</td></tr>'+
				'</table>'+
			'</fieldset>';
		datePanel.html(datePanelHtml)
		options.panel = datePanel;
		self.element.after(datePanel);
	},
	parseTimeValue : function(){
		options.value = options.value.replace(/-/g, "/");
		var index = options.value.indexOf("/");
		if(options.format=="all"){
			return options.value.substring(index+1)+"/"+options.value.substring(0,index);
		}
		else{
			return options.value.substring(index+1)+"/01/"+options.value.substring(0,index);
		}
	},
	getDateString : function(date){
		var rootDate = date.getFullYear()+"年"+(date.getMonth()+1)+"月";
		if(options.format=="all"){return rootDate+date.getDate()+"日";}
		else {return rootDate;}
	},
	hidePanel : function(){
		options.panel.css("display","none");
		$("*").unbind("mousedown");
	},
	updateText : function(obj,i){
		var self = this;
		options.date.setTime(obj.tempDate.getTime());
		self.element.text(self.getDateString(options.date));
		//self.element.css("position","absolute");
		self.hidePanel();
		if(options.format=="all"){
			self.element.attr("value",options.date.getFullYear()+"-"+((options.date.getMonth()+1<10)?("0"+(options.date.getMonth()+1)):(options.date.getMonth()+1))+"-"+((options.date.getDate()<10)?("0"+options.date.getDate()):options.date.getDate()));
		}
		else{
			self.element.attr("value",options.date.getFullYear()+"-"+((options.date.getMonth()+1<10)?("0"+(options.date.getMonth()+1)):(options.date.getMonth()+1)));
		}
	},
	canselText : function(){
		var self = this;
		self.options.date = new Date();
		self.element.text("-选择日期-");
		self.element.attr("value","");
		self.hidePanel();
	},
	execute : function(){
		var self = this;
		options = self.options;
		eval(options.execute);
	}
});
$.extend($.ui.dateTimeSingle, {
	panelItem	:	function (dateTimeSingle){
		this.init(dateTimeSingle);
	}
});
$.extend($.ui.dateTimeSingle.panelItem, {
	dayCountArray : new Array(31,-1,31,30,31,30,31,31,30,31,30,31)
});
$.extend($.ui.dateTimeSingle.panelItem.prototype, {
	browser		:	"msie",
	parent 		: 	null,
	tempDate 	: 	null,
	tdCells 	: 	null,
	monthField  : 	null,
	inputs	 	: 	null,
	labels	 	: 	null,
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
			self.labels = options.panel.find("label");
			self.images = options.panel.find("img");
			if(options.format=="all"){//年月日
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
			}
			else if(options.format=="part"){//年月
				self.monthField = options.panel.find("table").eq(1).find("td");
				self.inputs.mouseover(function(){
					this.select();
				});
				self.showPartDateTime();
			}
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
			self.images.eq(0).click(function(){
				self.addValue(-1,self.inputs);
			});
			self.images.eq(1).click(function(){
				self.addValue(1,self.inputs);
			});
			self.inputs.bind("keypress",function(){
				if(event.keyCode>57||event.keyCode<48||event.shiftKey) {
					event.keyCode = 0;
				}
			}).bind("keydown",function(event){
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
				if(options.format=="all"){self.showDays();}
				else if(options.format=="part"){self.showMonths();}
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
		//$("#dateInput").css("display","block");
		//this.inputs.eq(0).select();
	},
	showDays : function(){
		var self = this;
		var firstDayIndex = self.getFirstDayIndex();
		var lastDayIndex = firstDayIndex + self.daysInMonth(self.tempDate.getFullYear(), self.tempDate.getMonth());
		for(var i=0;i<37;i++){
			self.tdCells.eq(i).unbind("click");
			self.tdCells.eq(i).removeClass();
			if(i<firstDayIndex||i>=lastDayIndex) {
				self.tdCells.eq(i).html("");
			}
			else {
				self.tdCells.eq(i).html(i+1-firstDayIndex);
				self.tdCells.eq(i).bind("click",{node:i,e:self},self.selectDay);
			}
		}
		self.thCells = options.panel.find("table").eq(1).find("th");
		self.thCells.eq(0).removeClass();
		self.thCells.eq(6).removeClass();
		self.thCells.eq(0).addClass("WeekEndTh");
		self.thCells.eq(6).addClass("WeekEndTh");
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
		self.parent.updateText(self,i);
		if(self.parent.options.execute != null){
			self.parent.execute();
		}
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
		self.parent.updateText(self,i);
		if(self.parent.options.execute != null){
			self.parent.execute();
		}
	}
});
})( jQuery );
