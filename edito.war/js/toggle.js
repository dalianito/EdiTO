function Toggle() {}

Toggle.toggleChildOfCheckbox = function(obj) {
	var checkbox = $(obj);
	var childId = checkbox.attr("childId");
	if(childId){
		var child = $("#"+childId);
		var checked = checkbox.attr("checked");
		if(checked==null||checked==false) {
			Submit.cancelSubmit(child);
			Validation.cancelValidate(child);
			child.css("display","none");
		}
		else if(checked==true) {
			Submit.revertSubmit(child);
			Validation.revertValidate(child);
			var display = child.css("display");
			child.css("display",display&&display!="none"?display:"block");
		}
	}
	else{
		alert(checkbox.attr("name") + "'s childId is undefined");
	}
}

Toggle.toggleChildOfRadio = function(obj) {
	var curSelectedRadio = $(obj);
	var preSelectedRadio = null;
	var name = curSelectedRadio.attr("name");
	var radios = $("input[name='"+name+"']");
	for(var i=0;i<radios.length;i++){
		preSelectedRadio = radios.eq(i);
		if(preSelectedRadio.attr("selected")=="true"){//取出切换前被选中的radio
			break;
		}
	}
	if(preSelectedRadio!=curSelectedRadio){//判断radio是否切换了选项
		Toggle.hideChildOfRadio(preSelectedRadio);
		Toggle.showChildOfRadio(curSelectedRadio);
	}
}

Toggle.showChildOfRadio = function(radio) {
	var childId = radio.attr("childId");
	if(childId){
		var child = $("#"+childId);
		Submit.revertSubmit(child);
		Validation.revertValidate(child);
		var position = child.attr("position");
		child.css("display",position&&position!="none"?position:"block");
	}
	var childId2 = radio.attr("childId2");
	if(childId2){
		var child2 = $("#"+childId2);
		Submit.revertSubmit(child2);
		Validation.revertValidate(child2);
		var display = child2.css("display");
		child2.css("display",display&&display!="none"?display:"block");
	}
	radio.attr("selected","true");
}

Toggle.hideChildOfRadio = function(radio) {
	var childId = radio.attr("childId");
	if(childId){
		var child = $("#"+childId);
		Submit.cancelSubmit(child);
		Validation.cancelValidate(child);
		child.css("display","none");
	}
	var childId2 = radio.attr("childId2");
	if(childId2){
		var child2 = $("#"+childId2);
		Submit.cancelSubmit(child2);
		Validation.cancelValidate(child2);
		child2.css("display","none");
	}
	radio.attr("selected","false");
}




