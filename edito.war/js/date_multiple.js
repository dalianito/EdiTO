(function( $ ) {
$.widget("ui.dateTimeMultiple",{
	options:{
		value			:	null,
		date 			: 	null,
		format 			: 	"Hms",
		formatStr		:	new Array(),
		dayCountArray 	: 	new Array(31,-1,31,30,31,30,31,31,30,31,30,31),
		yearInput 		: 	null,
		monthSelect 	: 	null,
		daySelect 		: 	null,
		hourSelect 		: 	null,
		minitSelect 	: 	null,
		secondSelect	:	null,
		dateImage		:   null,
		newImage		:   false,
		imageFormat 	:	"all"
	},
	_create : function(){
		var self = this;
		options = self.options;
		options.format = self.element.attr("format") ? self.element.attr("format"):options.format;
		options.formatStr = options.format.toString().split("");
		options.value = self.element.attr("value") ? self.element.attr("value"):options.value;
		if(options.value){
			var parseTime = self.parseTimeValue();
			options.date = new Date(Date.parse(parseTime));
		}
		else{
			options.date = new Date();
			options.value = self.getDateString();
			self.element.val(options.value);
		}
		var contener = $("<div style='display:inline;position:relative;'></div>");
		var yearInput= $("<input>");
		yearInput.attr("class","YearInput");
		yearInput.val(options.date.getFullYear());
		yearInput.attr("maxLength",4);
		contener.append(yearInput);
		yearInput.change(function(){
			self.replaceHiddenValueYear();
		});
		yearInput.click(function(){
			$(this).select();
		});
		contener.append("年 ");
		options.yearInput = yearInput;
		
		var monthSelect = self.createCommonSelect(contener,"month");
		monthSelect.find("option").eq(options.date.getMonth()).attr("selected",true);
		monthSelect.change(function(){
			self.replaceHiddenValueMonth();
		});
		contener.append("月 ");
		options.monthSelect = monthSelect;
				
		var daySelect = self.createCommonSelect(contener,"day");
		daySelect.find("option").eq(options.date.getDate()-1).attr("selected",true);
		daySelect.change(function(){
			self.replaceHiddenValueDay();
		});
		contener.append("日 ");
		options.daySelect = daySelect;
		
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
		contener.append(clickImg);
		
		for(var i=0;i<options.formatStr.length;i++){
			if(options.formatStr[i]=="H"){
				var hourSelect = self.createCommonSelect(contener,"hour");
				hourSelect.change(function(){
					self.replaceHiddenValueHour();
				});
				hourSelect.find("option").eq(options.date.getHours()).attr("selected",true);
				contener.append("时 ");
				options.hourSelect = hourSelect;
			}
			else if(options.formatStr[i]=="m"){
				var minitSelect = self.createCommonSelect(contener,"minut");
				minitSelect.change(function(){
					self.replaceHiddenValueMinut();
				});
				minitSelect.find("option").eq(options.date.getMinutes()/5).attr("selected",true);
				contener.append("分 ");
				options.minitSelect = minitSelect;
				var minutsNowValue = (minitSelect.val()<10)?("0"+(minitSelect.val())):(minitSelect.val());
				options.date.setMinutes(minutsNowValue);
				self.element.val(self.getDateString());
			}
			else if(options.formatStr[i]=="s"){
				var secondSelect = self.createCommonSelect(contener,"second");
				secondSelect.change(function(){
					self.replaceHiddenValueSecond();
				});
				secondSelect.find("option").eq(options.date.getSeconds()).attr("selected",true);
				contener.append("秒 ");
				options.secondSelect = secondSelect;
			}
		}
		self.element.after(contener);
	},
	getDateString : function(){
		options = this.options;
		return options.date.getFullYear()+"-"+((options.date.getMonth()+1<10)?("0"+(options.date.getMonth()+1)):(options.date.getMonth()+1))+"-"+((options.date.getDate()<10)?("0"+options.date.getDate()):options.date.getDate())+" "+((options.date.getHours()<10)?("0"+options.date.getHours()):options.date.getHours())+":"+options.date.getMinutes()+":"+options.date.getSeconds();
	},
	parseTimeValue : function(){
		options.value = options.value.replace(/-/g, "/");
		var index = options.value.indexOf("/");
		var indexBlank = options.value.indexOf(" ");
		return options.value.substring(index+1,indexBlank)+"/"+options.value.substring(0,index)+options.value.substring(indexBlank);
	},
	createCommonSelect : function(con,pramater){
		var self = this;
		var a = $("<select></select>");
		if(pramater=="month"){
			for(var i=1;i<=12;i++){
				var option = $("<option></option>");
				option.text(i);
				option.val(i);
				a.append(option);
			}
		}
		else if(pramater=="day"){
			var days = self.daysInMonth(options.date.getFullYear(),options.date.getMonth());
			for(var i=1;i<=days;i++){
				var option = $("<option></option>");
				option.text(i);
				option.val(i);
				a.append(option);
			}
		}
		else if(pramater=="hour"){
			for(var i=0;i<=23;i++){
				var option = $("<option></option>");
				option.text(i);
				option.val(i);
				a.append(option);
			}
		}
		else if(pramater=="minut"){
			for(var i=0;i<=59;i+=5){
				var option = $("<option></option>");
				option.text(i);
				option.val(i);
				a.append(option);
			}
		}
		else if(pramater=="second"){
			for(var i=0;i<=59;i++){
				var option = $("<option></option>");
				option.text(i);
				option.val(i);
				a.append(option);
			}
		}
		con.append(a);
		return a;
	},
	daysInMonth : function(theYear,theMonth){
		var self = this;
		var options = self.options;
		if (theMonth!= 1) return options.dayCountArray[theMonth];
		if ((theYear % 4 != 0) || ((theYear % 100 == 0) && (theYear % 400 != 0)))
			return 28;
		return 29;
	},
	replaceHiddenValueYear : function(){
		var self = this;
		options = self.options;
		var obj = options.yearInput;
		if(obj.val().length==4 && obj.val()>=1900 && obj.val()<=2100){
			var value = self.element.val();
			self.element.val(obj.val() + value.substring(4));
			var monthSelect = self.options.monthSelect;
			if(monthSelect.val()=="2"){
				var daySelect = self.options.daySelect;
				self.createNewDaySelect(daySelect,obj.val(),monthSelect.val()-1);
			}
		}
		else{
			alert("年份格式为四位数，并且范围在1900～2100之间，请检查后正确输入");  
		}
		options.date.setYear(obj.val());
		self.element.val(self.getDateString());
	},
	replaceHiddenValueMonth : function(){
		var self = this;
		options = self.options;
		var obj = options.monthSelect;
		var value = self.element.val();
		var monthNowValue = (obj.val()<10)?("0"+(obj.val())):(obj.val());
		var daySelect = self.options.daySelect;
		if(self.options.dayCountArray[monthNowValue-1]!=daySelect.find("option").length){
			var yearInput = self.options.yearInput;
			self.createNewDaySelect(daySelect,yearInput.val(),monthNowValue-1);
			//daySelect.find("option").eq(0).attr("selected",true);
		}
		options.date.setMonth(monthNowValue-1);
		self.element.val(self.getDateString());
	},
	replaceHiddenValueDay : function(){
		var self = this;
		options = self.options;
		var obj = options.daySelect;
		var value = self.element.val();
		var dayNowValue = (obj.val()<10)?("0"+(obj.val())):(obj.val());
		options.date.setDate(dayNowValue);
		self.element.val(self.getDateString());
	},
	replaceHiddenValueHour : function(){
		var self = this;
		options = self.options;
		var obj = options.hourSelect;
		var value = self.element.val();
		var hourNowValue = (obj.val()<10)?("0"+(obj.val())):(obj.val());
		options.date.setHours(obj.val());
		self.element.val(self.getDateString());
	},
	replaceHiddenValueMinut : function(){
		var self = this;
		options = self.options;
		var obj = options.minitSelect;
		var value = self.element.val();
		var minutsNowValue = (obj.val()<10)?("0"+(obj.val())):(obj.val());
		options.date.setMinutes(minutsNowValue);
		self.element.val(self.getDateString());
	},
	replaceHiddenValueSecond : function(){
		var self = this;
		options = self.options;
		var obj = options.secondSelect;
		var value = self.element.val();
		var secondNowValue = (obj.val()<10)?("0"+(obj.val())):(obj.val());
		options.date.setSeconds(secondNowValue);
		self.element.val(self.getDateString());
	},
	createNewDaySelect : function(oldDayElement,yearNow,monthNow){
		var self = this;
		options = self.options;
		var oldDays = oldDayElement.find("option").length;
		var newDays = self.daysInMonth(yearNow,monthNow);
		if(oldDays<newDays){
			for(var i=oldDays+1;i<=newDays;i++){
				var option = $("<option></option>");
				option.text(i);
				option.val(i);
				oldDayElement.append(option);
			}
		}
		else{
			for(var i=0;i<oldDays-newDays;i++){
				oldDayElement.find("option").eq(newDays).remove();
			}
			if(options.date.getDate()>newDays){
				oldDayElement.find("option").eq(newDays-1).attr("selected",true);
				options.date.setDate(newDays);
			}
		}
	},
	updateText : function(imageDate){
		var self = this;
		self.options.date.setTime(imageDate);
		var year = self.options.date.getFullYear();
		var month = self.options.date.getMonth();
		if(self.options.daySelect.find("option").length!=self.daysInMonth(year,month)){
			self.createNewDaySelect(self.options.daySelect,year,month);
		}
		self.options.yearInput.val(year);
		self.options.monthSelect.find("option").eq(month).attr("selected",true);
		var day = self.options.date.getDate();
		setTimeout(function() {
			self.options.daySelect.find("option").eq(day-1).attr("selected",true);
		}, 1);
		self.element.val(self.getDateString());
	}
});
})( jQuery );