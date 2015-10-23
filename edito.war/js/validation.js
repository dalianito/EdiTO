function Validation() {}
Validation._root = cp + "/validation/";
Validation._sheet = null;
Validation._curRange = null;
Validation._curFileds = null;
Validation._configFile = "";

Validation._failFields = null;
Validation._failMessage = null;
Validation._defaultCssStyle = {};

Validation.init = function(file){
	Validation._configFile = file;
	Validation.initialize();
}

Validation.initialize = function() {
	if (Validation._sheet != null) {
		return;
	}
	var file = Validation._root + Validation._configFile;
	Validation._sheet = ValidationSheetFactory.loadSheet(file);
}

Validation.load = function(xmlRanges){
	var sheet = new ValidationSheet();
	for(var i=0;i<xmlRanges.length;i++){
		var xmlRange = xmlRanges.eq(i);
		var range = new ValidationRange();
		range.setId(xmlRange.attr("id"));
		var xmlFields = xmlRange.children();
		for(var j=0;j<xmlFields.length;j++){
			var xmlField = xmlFields.eq(j);
			var field = new ValidationField();
			field.setName(xmlField.attr("name"));
			field.setDisplayName(xmlField.attr("display-name"));
			field.setRange(range);
			var xmlDepends = xmlField.children();
			for(var k=0;k<xmlDepends.length;k++){
				var xmlDepend = xmlDepends.eq(k);
				var depend = new ValidationDepend();
				depend.setName(xmlDepend.attr("name"));
				for(var m=0;m<5;m++){
					depend.addParam(xmlDepend.attr("param"+m));
				}
				field.addDepend(depend);
			}
			range.addField(field);
		}
		sheet.addRange(range);
	}
	return sheet;
}
function ValidationSheetFactory() {}
ValidationSheetFactory.loadSheet = function(file) {
	var sheet = null;
	$.ajax({
		url: file, 
		type: 'get',
		datatype: 'xml',
		cache: false,
		async: false,
		timeout: 1000, 
		error: function(xml){
			return null;
		}, 
		success: function(xml){
			var xmlRanges = $(xml).find("range");
			sheet = Validation.load(xmlRanges);
		} 
	});
	return sheet;
}

function ValidationSheet() {
	this._ranges = [];

	this.getRanges = function() { return this._ranges; }
	this.setRanges = function(ranges) { this._ranges = ranges; }

	this.findRange = function(id) {
		for (var i = 0; i < this._ranges.length; i++) {
			if (this._ranges[i].getId() == id) {
				return this._ranges[i];
			}
		}
		return null;
	}
	
	this.addRange = function(range) {
		this._ranges[this._ranges.length] = range;
	}
}

function ValidationRange() {
	this._fields = [];
	this._id = null;
	this._showError = null;
	this._onFail = null;
	this._showType = null;

	this.getFields = function() { return this._fields; }
	this.setFields = function(fields) { this._fields = fields; }

	this.getId = function() { return this._id; }
	this.setId = function(id) { this._id = id; }

	this.getShowError = function() { return this._showError; }
	this.setShowError = function(showError) { this._showError = showError; }

	this.getShowType = function() { return this._showType; }
	this.setShowType = function(showType) { this._showType = showType; }

	this.getOnFail = function() { return this._onFail; }
	this.setOnFail = function(onFail) { this._onFail = onFail; }
	
	this.findField = function(name) {
		for (var i = 0; i < this._fields.length; i++) {
			if (this._fields[i].getName() == name) {
				return this._fields[i];
			}
		}
		return null;
	}
	
	this.addField = function(field) {
		this._fields[this._fields.length] = field;
		field.setRange(this);
	}
}

function ValidationField() {
	this._name = null;
	this._depends = [];
	this._displayName = null;
	this._onFail = null;
	this._range = null;

	this.getName = function() { return this._name; }
	this.setName = function(name) { this._name = name; }

	this.getDepends = function() { return this._depends; }
	this.setDepends = function(depends) { this._depends = depends; }

	this.getDisplayName = function() { return this._displayName; }
	this.setDisplayName = function(displayName) { this._displayName = displayName; }

	this.getOnFail = function() { return this._onFail; }
	this.setOnFail = function(onFail) { this._onFail = onFail; }
	
	this.getRange = function() { return this._range; }
	this.setRange = function(range) { this._range = range; }

	this.addDepend = function(depend) {
		this._depends[this._depends.length] = depend;
	}
}

function ValidationDepend() {
	this._name = null;
	this._params = [];

	this.getName = function() { return this._name; }
	this.setName = function(name) { this._name = name; }

	this.getParams = function() { return this._params; }
	this.setParams = function(params) { this._params = params; }

	this.addParam = function(param) {
		this._params[this._params.length] = param;
	}
}

Validation.cancelValidate = function(obj) {
	var elements = obj.find("input[validate='true'],label[validate='true']");
	for(var i=0;i<elements.length;i++){
		elements.eq(i).attr("validate","false");
	}
}

Validation.revertValidate = function(obj) {
	var elements = obj.find("input[validate='false'],label[validate='false']");
	for(var i=0;i<elements.length;i++){
		elements.eq(i).attr("validate","true");
	}
	var submits = obj.find("*[submit='false']");
	for(var j=0;j<submits.length;j++){
		var submit = submits.eq(j);
		Validation.cancelValidate(submit);
	}
}

Validation.removeValidate = function(obj) {
	var elements = obj.find("input[validate='true'],label[validate='true']");
	for(var i=0;i<elements.length;i++){
		elements.eq(i).removeAttr("validate");
	}
}

Validation.getField = function(name) {
	var index = name.indexOf("[");
	if(index > 0){
		name = name.substring(0,index) + name.substring(name.indexOf("]")+1,name.length);
	}
	var field = Validation._curRange.findField(name);
	return field;
}

Validation.pickupField = function(rangeId) {
	Validation._curFileds = [];
	var htmlRange = $("#"+rangeId);
	var elements = htmlRange.find("input[validate='true'],label[validate='true'],textarea[validate='true']");
	for(var i=0;i<elements.length;i++){
		Validation._curFileds[Validation._curFileds.length] = elements.eq(i);
	}
}

Validation.excuteAlarm = function(rangeId,obj){
	var o = $(obj);
	var name = o.attr("name");
	Validation._curRange = Validation._sheet.findRange(rangeId);
	var field = Validation.getField(name);
	var depends = field.getDepends();
	for (var i = 0; i < depends.length; i++) {
		if(depends[i].getName() != "required"&&!Validation.validateDepend(o, depends[i])){
			alert(Validation.getFailString(field, depends[i]));
			o.focus();
		}
	}
}

Validation.excuteValidate = function(rangeId) {
	var sheetRangeId = rangeId;
	if(rangeId.indexOf("_form") != -1){
		sheetRangeId = "form";
	}

	Validation._curRange = Validation._sheet.findRange(sheetRangeId);
	if(Validation._curRange != null){
		var showError = Validation._curRange.getShowError();

		var br = null;
		if (showError == "alert") {
			br = "<br />";
		} else {
			br = "\n";
		}
	}
	Validation._failFields = [];
	Validation._failMessage = [];
	
	Validation.pickupField(rangeId);
	var result = Validation.validateRange();
	if(!result){
		alert(Validation._failMessage.join(br));
		Validation._failFields[0].focus()
		for (var i = 0; i < Validation._failFields.length; i++) {
			var htmlField = Validation._failFields[i];
			htmlField.css("border","1px solid #FF0000");
			htmlField.css("background-color","#FFF000");
		}
	}
	return result;
}

Validation.validateRange = function() {
	var valid = true;
	for(var i=0;i<Validation._curFileds.length;i++){
		var htmlField = Validation._curFileds[i];
		var flag = Validation.validateField(htmlField);
		valid &= flag;
	}
	return valid;
}

Validation.validateField = function(htmlField) {
	var name = htmlField.attr("name");
	var field = Validation.getField(name);
	if(field==null){
		return true;
	}
	var depends = field.getDepends();
	var nextSibling = htmlField.attr("nextSiblingName");
	for (var i = 0; i < depends.length; i++) {
		if (!Validation.validateDepend(htmlField, depends[i])) {
			var result = Validation.getFailString(field, depends[i]);
			Validation._failMessage[Validation._failMessage.length] = result;
			if(typeof(nextSibling) != "undefined"){
				htmlField =htmlField.next();
			}
			var cssStyle = Validation._defaultCssStyle[htmlField.attr("name")];
			if(typeof(cssStyle)=="undefined"){
				Validation._defaultCssStyle[htmlField.attr("name")] = htmlField.get(0).style.cssText;
			}
			Validation._failFields[Validation._failFields.length] = htmlField;
			return false;
		}
	}
	if(typeof(nextSibling) != "undefined"){
		htmlField = htmlField.next();
	}
	var defaultCssStyle = Validation._defaultCssStyle[htmlField.attr("name")];
	if(typeof(defaultCssStyle) != "undefined"){
		htmlField.get(0).style.cssText = defaultCssStyle;
	}
	return true;
}

Validation.validateDepend = function(htmlField, depend) {
	if (depend.getName() == "required") {
		return ValidateMethodFactory.validateRequired(htmlField, depend.getParams());
	} else if (depend.getName() == "integer") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "double") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "real") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "commonChar") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "chineseChar") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "pid") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "postcode") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "phone") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "cell") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "cellorphone") {
		return ValidateMethodFactory.validate(htmlField, depend.getName(), depend.getParams());
	} else if (depend.getName() == "minlength") {
		return ValidateMethodFactory.validateMinLength(htmlField, depend.getParams());
	} else if (depend.getName() == "maxlength") {
		return ValidateMethodFactory.validateMaxLength(htmlField, depend.getParams());
	} else if (depend.getName() == "email") {
		return ValidateMethodFactory.validateEmail(htmlField, depend.getParams());
	} else if (depend.getName() == "integerRange") {
		return ValidateMethodFactory.validateIntegerRange(htmlField, depend.getParams());
	} else if (depend.getName() == "doubleRange") {
		return ValidateMethodFactory.validateDoubleRange(htmlField, depend.getParams());
	} else if (depend.getName() == "equalsField") {
		return ValidateMethodFactory.validateEqualsField(htmlField, depend.getParams());
	} else if (depend.getName() == "ipaddress") {
		return ValidateMethodFactory.validateIpAddress(htmlField, depend.getParams());
	} else {
		return true;
	}
}

Validation.getFailString = function(field, depend) {
	var stringResource = ValidationFailString;
	var dep = depend.getName().toLowerCase();
	var retStr = stringResource[dep];
	//If the specified depend not defined, use the default error string.
	if (typeof retStr != 'string') {
		retStr = stringResource["default"];
		retStr = retStr.replace("{0}", field.getDisplayName());
		return retStr;
	}
	retStr = retStr.replace("{0}", field.getDisplayName());
	if (dep == "minlength" || dep == "maxlength") {
		retStr = retStr.replace("{1}", depend.getParams()[0]);
	} else if ( dep == "equalsfield") {
		var eqField = Validation.getField(depend.getParams()[0]);
		retStr = retStr.replace("{1}", eqField.getDisplayName());
	} else if (dep == "integerrange" || dep == "doublerange") {
		retStr = retStr.replace("{1}", depend.getParams()[0]);
		retStr = retStr.replace("{2}", depend.getParams()[1]);
	}
	return retStr;
}

function ValidateMethodFactory() {}

ValidateMethodFactory.getIntegerValue = function(val) {
	var intvalue = parseInt(val,10);
	return intvalue;
}
ValidateMethodFactory.getFloatValue = function(val) {
	var floatvalue = parseFloat(val);
	return floatvalue;
}

ValidateMethodFactory.validate = function(htmlField,type,params){
	var value = htmlField.val().trim();
	if (value == "") 
		return true;
	var exp = null;
	if(type=="integer"){
		exp = new RegExp("^-?\\d+$");
	}
	else if(type=="double"){
		exp = new RegExp("^-?\\d+\.\\d+$");
	}
	else if(type=="real"){
		exp = new RegExp("^(-?\\d+)(\\.+\\d+)?$");
	}
	else if(type=="commonChar"){
		exp = new RegExp("^[A-Za-z0-9_]*$");
	}
	else if(type=="chineseChar"){
		exp = new RegExp("^[\u4E00-\u9FA5\uF900-\uFA2D]*$");
	}
	else if(type=="postcode"){
		exp = new RegExp("^\\d{6}$");
	}
	else if(type=="pid"){
		exp = new RegExp("^\\d{15}(\\d\\d\\w)?$");
	}
	else if(type=="cell"){
		exp = new RegExp("^\\d{11}$");
	}
	else if(type=="phone"){
		exp = new RegExp("^(0\\d{2,3}-?)?\\d{7,8}$");
	}
	else if(type=="cellorphone"){
		exp = new RegExp("(^\\d{11}$)|(^(0\\d{2,3}-?)?\\d{7,8}$)");
	}
	return exp.test(value);
}

ValidateMethodFactory.validateRequired = function(htmlField, params) {	
	if (htmlField.type == "checkbox" || htmlField.type == "radio") {
		return (htmlField.attr("checked"));
	} else {
		return !(htmlField.attr("value").trim() == "");
	}
}

ValidateMethodFactory.validateMinLength = function(htmlField, params) {
	var value = htmlField.val().trim();
	var v = ValidateMethodFactory.getIntegerValue(params[0]);
	return (value.length >= v);
}

ValidateMethodFactory.validateMaxLength = function(htmlField, params) {
	var value = htmlField.val().trim();
	var v = ValidateMethodFactory.getIntegerValue(params[0]);
	return (value.length <= v);
}

ValidateMethodFactory.validateEmail = function(htmlField, params) {
	var value = htmlField.val().trim();
	return ValidateMethodFactory.__checkEmail(value);
}

ValidateMethodFactory.validateIntegerRange = function(htmlField, params) {
	var value = htmlField.val().trim();
	if (value == "") 
		return true;
	var p0 = ValidateMethodFactory.getIntegerValue(params[0]);
	var p1 = ValidateMethodFactory.getIntegerValue(params[1]);
	if (ValidateMethodFactory.validate(htmlField, "integer", "")) {
		var v = parseInt(value,10);
		return (v >= p0 && v <= p1);
	} else {
		return false;
	}
	return true;
}

ValidateMethodFactory.validateDoubleRange = function(htmlField, params) {
	var value = htmlField.val().trim();
	if (value == "")
		return true;
	var p0 = ValidateMethodFactory.getFloatValue(params[0]);
	var p1 = ValidateMethodFactory.getFloatValue(params[1]);
	if (ValidateMethodFactory.validate(htmlField, "integer", "") || ValidateMethodFactory.validate(htmlField, "double", "")) {
		var v = parseFloat(obj.value);
		return (v >= p0 && v <= p1);
	} else {
		return false;
	}
	return true;
}
ValidateMethodFactory.validateEqualsField = function(htmlField, params) {
	var value = htmlField.val().trim();
	var eqHtmlField = Validation.getField(params[0]);
	if (eqHtmlField != null) {
		return (value == eqHtmlField.val().trim())
	} else {
		return false;	
	}
}

ValidateMethodFactory.validateIpAddress = function(htmlField, params) {
	var value = htmlField.val().trim();
	var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
	var IPArray = value.match(ipDomainPat);
	if (IPArray != null) {
		for (var i = 1; i <= 4; i++) {
			if (IPArray[i] > 254) {
				return false;
			}
		}
		return true;
	}
	else {
		return false;
	}
}

ValidateMethodFactory.__checkEmail = function(emailStr) {
   if (emailStr.length == 0) {                                                              
       return true;                                                                          
   }                                                                                         
   var emailPat=/^(.+)@(.+)$/;                                                               
   var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";                                         
   var validChars="\[^\\s" + specialChars + "\]";                                            
   var quotedUser="(\"[^\"]*\")";                                                            
   var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;                        
   var atom=validChars + '+';                                                                
   var word="(" + atom + "|" + quotedUser + ")";                                             
   var userPat=new RegExp("^" + word + "(\\." + word + ")*$");                               
   var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");                             
   var matchArray=emailStr.match(emailPat);                                                  
   if (matchArray == null) {                                                                 
       return false;                                                                         
   }                                                                                         
   var user=matchArray[1];                                                                   
   var domain=matchArray[2];                                                                 
   if (user.match(userPat) == null) {                                                        
       return false;                                                                         
   }                                                                                         
   var IPArray = domain.match(ipDomainPat);                                                  
   if (IPArray != null) {                                                                    
       for (var i = 1; i <= 4; i++) {                                                        
          if (IPArray[i] > 255) {                                                            
             return false;                                                                   
          }                                                                                  
       }                                                                                     
       return true;                                                                          
   }                                                                                         
   var domainArray=domain.match(domainPat);                                                  
   if (domainArray == null) {                                                                
       return false;                                                                         
   }                                                                                         
   var atomPat=new RegExp(atom,"g");                                                         
   var domArr=domain.match(atomPat);                                                         
   var len=domArr.length;                                                                    
   if ((domArr[domArr.length-1].length < 2) ||                                               
       (domArr[domArr.length-1].length > 3)) {                                               
       return false;                                                                         
   }                                                                                         
   if (len < 2) {                                                                            
       return false;                                                                         
   }                                                                                         
   return true;                                                                              
}                                                                               

var ValidationFailString = {};

ValidationFailString["default"]="域{0}校验失败。";
ValidationFailString["required"]="{0}不能为空。";
ValidationFailString["integer"]="{0}必须是一个整数。";
ValidationFailString["double"]="{0}必须是一个浮点数（带小数点）。";
ValidationFailString["real"]="{0}必须是一个实数。";
ValidationFailString["commonchar"] = "{0}必须是普通英文字符：字母，数字和下划线。";
ValidationFailString["chinesechar"] = "{0}必须是中文字符。";
ValidationFailString["minlength"]="{0}长度不能小于{1}个字符。";
ValidationFailString["maxlength"]="{0}长度不能大于{1}个字符。" ;
ValidationFailString["invalid"]="{0}无效。";
ValidationFailString["integerrange"]="{0}必须在整数{1}和{2}之间。";
ValidationFailString["doublerange"]="{0}必须在浮点数{1}和{2}之间。";
ValidationFailString["pid"]="{0}不是一个有效身份证号。";
ValidationFailString["postcode"]="{0}不是一个有效的邮编。";
ValidationFailString["phone"]="{0}不是一个有效的电话号码。";
ValidationFailString["cell"]="{0}不是一个有效的手机号码。";
ValidationFailString["cellorphone"]="{0}不是一个有效的手机号码或座机号码。";
ValidationFailString["email"]="{0}不是一个有效的Email。";
ValidationFailString["equalsfield"]="{0}必须和{1}一致。";
ValidationFailString["ipaddress"]="{0}不是一个有效的IP地址。";
