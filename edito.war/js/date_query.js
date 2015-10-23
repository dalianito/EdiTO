(function( $ ) {
$.widget("ui.dateTimeQuery",{
	options:{
		value		:	null,
		hide		:	false,
		date 		: 	null,
		newImage	:	false,
		label		:	null,
		execute		:	null,
		imageFormat :	"all"
	},
	_create : function(){
		var self = this;
		options = self.options;
		var value = self.element.attr("value");
		if(value == "null"){
			value = "";
		}
		options.value = value ? value:options.value;
		options.hide = self.element.attr("hide") ? self.element.attr("hide"):options.hide;
		options.execute = self.element.attr("execute") ? self.element.attr("execute"):options.execute;
		options.imageFormat = self.element.attr("format") ? self.element.attr("format"):options.imageFormat;
		if(options.value){
			var parseTime = self.parseTimeValue();
			options.date = new Date(Date.parse(parseTime));
		}
		else{
			options.date = new Date();
			options.value = self.getDateString();
			self.element.val(options.value);
		}
		var divContenter = $("<div></div>");
		var leftImg = $("<img>");
		leftImg.attr("src",cp+"/images/date/arrow_left.gif");
		if(options.imageFormat == "all"){
			leftImg.attr("title","前一天");
		}
		else{
			leftImg.attr("title","前一月");
		}
		leftImg.css("cursor","pointer");
		leftImg.click(function(){
			self.getPreDay();
		})
		divContenter.append(leftImg);
		divContenter.append("  ");
		
		var label = $("<label></label>");
		label.text(self.getLabelString());
		label.css("fontSize","11pt");
		label.css("fontWeight","bold");
		divContenter.append(label);
		options.label = label;
		
		divContenter.append("  ");
		var rightImg = $("<img>");
		rightImg.attr("src",cp+"/images/date/arrow_right.gif");
		rightImg.css("cursor","pointer");
		if(options.imageFormat == "all"){
			rightImg.attr("title","后一天");
		}
		else{
			rightImg.attr("title","后一月");
		}
		rightImg.click(function(){
			self.getAfterDay();
		});
		divContenter.append(rightImg);
		divContenter.append("  ");
		if(!options.hide){
			var clickImg = $("<img>");
			clickImg.attr("src",cp+"/images/date/cal_date_picker.gif");
			clickImg.attr("title","单击此处选择日期");
			clickImg.css("cursor","pointer");
			clickImg.click(function(event){
				if(!options.newImage){
					options.dateImage = new $.ui.dateImage();
					options.newImage = true;
				}
				options.dateImage.showPanel(self,event);
			});
			divContenter.append(clickImg);
		}
		self.element.after(divContenter);
		$(document).ready(function(){
			self.execute();
		})
	},
	getPreDay : function(){
		var self = this;
		options = self.options;
		if(options.imageFormat == "all"){
			options.date.setDate(options.date.getDate()-1);
		}
		else{
			options.date.setMonth(options.date.getMonth()-1)
		}
		options.label.text(self.getLabelString());
		options.value = self.getDateString();
		self.element.val(options.value);
		self.execute();
	},
	getAfterDay : function(){
		var self = this;
		options = self.options;
		if(options.imageFormat == "all"){
			options.date.setDate(options.date.getDate()+1);
		}
		else{
			options.date.setMonth(options.date.getMonth()+1)
		}
		options.label.text(self.getLabelString());
		options.value = self.getDateString();
		self.element.val(options.value);
		self.execute();
	},
	parseTimeValue : function(){
		var tempValue = options.value.replace(/-/g, "/");
		var index = tempValue.indexOf("/");
		if(options.imageFormat == "all"){
			return tempValue.substring(index+1)+"/"+tempValue.substring(0,index);
		}
		else{
			return tempValue.substring(index+1)+"/01"+"/"+tempValue.substring(0,index);
		}
	},
	getDateString : function(){
		var self = this;
		options = self.options;
		if(options.imageFormat == "all"){
			return options.date.getFullYear()+"-"+((options.date.getMonth()+1<10)?("0"+(options.date.getMonth()+1)):(options.date.getMonth()+1))+"-"+((options.date.getDate()<10)?("0"+options.date.getDate()):options.date.getDate());
		}
		else{
			return options.date.getFullYear()+"-"+((options.date.getMonth()+1<10)?("0"+(options.date.getMonth()+1)):(options.date.getMonth()+1));
		}
	},
	getLabelString : function(){
		var self = this;
		options = self.options;
		var date = options.date;
		if(options.imageFormat == "all"){
			return date.getFullYear()+"年"+((date.getMonth()+1<10)?("0"+(date.getMonth()+1)):(date.getMonth()+1))+"月"+((options.date.getDate()<10)?("0"+options.date.getDate()):options.date.getDate())+"日"+" "+this.getWeekString(date.getDay());
		}
		else{
			return date.getFullYear()+"年"+((date.getMonth()+1<10)?("0"+(date.getMonth()+1)):(date.getMonth()+1))+"月";
		}
	},
	getWeekString : function(index){
		switch(index){
			case 1:
				return "星期一";
			case 2:
				return "星期二";
			case 3:
				return "星期三";
			case 4:
				return "星期四";
			case 5:
				return "星期五";
			case 6:
				return "星期六";
			case 0:
				return "星期日";
			default:
				return "";
		}	
	},
	updateText : function(imageDate){
		var self = this;
		options = self.options;
		self.options.date.setTime(imageDate);
		self.options.label.text(self.getLabelString());
		options.value = self.getDateString();
		self.element.val(options.value);
		self.execute();
	},
	execute : function(){
		var self = this;
		options = self.options;
		eval(options.execute+"('" +options.value+ "')");
	}
});
})( jQuery );