function Submit() {}

Submit.revertSubmit = function(obj) {
	obj.attr("submit","true");
}

Submit.cancelSubmit = function(obj) {
	obj.attr("submit","false");
}

Submit.excute = function(rangeId) {
	var range = $("#"+rangeId);
	var tmp = $("<div></div>");//存放所有
	tmp.css("display","none");
	var tmpSubmits = [];
	var hiddenInfos = [];
	
	var submits = range.find("*[submit='true']");
	for(var i=0;i<submits.length;i++){
		var submit = submits.eq(i).clone();
		tmpSubmits[tmpSubmits.length] = submit;
		if(submit.attr("iTOType")=="info"){
			var parentDivs = submits.eq(i).parents("*[submit='false']");
			if(parentDivs.length>0){
				hiddenInfos[hiddenInfos.length] = submit;
			}
		}
		submit.prependTo(tmp);
	}
	//清除rangeId中所有拥有submit属性的元素
	var clearSubmits = range.find("*[submit]");
	for(var i=0;i<clearSubmits.length;i++){
		if(!(typeof(clearSubmits.eq(i).attr("ifRemain"))!="undefined" && clearSubmits.eq(i).attr("ifRemain")=="true")){
			clearSubmits.eq(i).remove();
		}
	}
	tmp.prependTo(range);
	//清除tmp中拥有submit属性的元素里的拥有submit属性的子元素
	for(var i=0;i<tmpSubmits.length;i++){
		var submit = tmpSubmits[i];
		submits = submit.find("*[submit]");
		for(var j=0;j<submits.length;j++){
			submits.eq(j).remove();
		}
	}
	for(var i=0;i<tmpSubmits.length;i++){
		var submit = tmpSubmits[i];
		if(submit.attr("iTOType")=="info"){
			var input = submit.find("input[iTOType='operationStatus']");
			if(input){
				var value = input.val();
				if(value=="0"){
					for(var j=0;j<hiddenInfos.length;j++){
						if(hiddenInfos[j] == submit){
							submit.remove();
						}
					}
				}
				else if(value=="1"){
					for(var j=0;j<hiddenInfos.length;j++){
						if(hiddenInfos[j] ==submit){
							input.val("2");
						}
					}
				}
			}
		}
	}
	var data = [];
	var RegExp_Input = /hidden|password|text|checkbox|radio/i;
	var RegExp_SelectTextarea = /select|textarea/i;
	
	var inputs = $("#"+rangeId+" *").filter(function() {
		return this.name &&
			(RegExp_SelectTextarea.test(this.nodeName) ||
				RegExp_Input.test(this.type));
	});
	for(var i=0;i<inputs.length;i++){
		var input = inputs.eq(i);
		if(input.val().trim()!=""){
			if(input.attr("type")=="checkbox" || input.attr("type")=="radio"){
				if(typeof(input.attr("iTOChecked"))!="undefined"){
					if(input.attr("iTOChecked")=="on"){
						data[data.length] = {name:input.attr("name"),value:input.val()};
					}
				}
				else {
					if(input.attr("checked")){
						data[data.length] = {name:input.attr("name"),value:input.val()};
					}
				}
			}
			else {
				data[data.length] = {name:input.attr("name"),value:input.val()};
			}
		}
	}
	var labels = $("#"+rangeId+" *").find("label").filter(".BaseTree,.DateTimeSingle");
	for(var j=0;j<labels.length;j++){
		var label = labels.eq(j);
		if(label.attr("value").trim()!=""){
			data[data.length] = {name:label.attr("name"),value:label.attr("value")};
		}
	}
	tmp.remove();
	return data;
}
