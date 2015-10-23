/**
 * childIndex属性 info的索引
 * childNumber属性 info的个数
 * operationStatus 0:create; 1:update; 2:delete
 */
/**新建大于等于0条的info*/
function createInfoStar(outerDivId, htmlText, operationStatus, args){
	var outerDiv = $("#"+outerDivId);
	if(outerDiv.attr("childIndex")==undefined){
		outerDiv.attr("childIndex",0);
	}
	if(outerDiv.attr("childNumber")==undefined){
		outerDiv.attr("childNumber",0);
	}
	htmlText = htmlText.replace(/OUTERDIVID/g,outerDivId);
	//htmlText = htmlText.replace(/OPERATIONSTATUS/g,operationStatus);
	htmlText = htmlText.replace(/NUMBER/g,parseInt(outerDiv.attr("childIndex"),10)+1);
	for (var i=args.length-1; i>=0; i--) {
		var re = eval("/VALUE"+i+"/");
		htmlText = htmlText.replace(re,args[i]);
	}
	outerDiv.append(htmlText);
	var lastChild = outerDiv.children(":last-child");
	lastChild.attr("iTOType","info");
	lastChild.attr("submit","true");
	lastChild.find("*[value='OPERATIONSTATUS']").attr("iTOType","operationStatus");
	lastChild.find("input[value='OPERATIONSTATUS']").val(operationStatus);
	/**childIndex：info的索引；childNumber：info的数量*/
	outerDiv.attr("childIndex",parseInt(outerDiv.attr("childIndex"),10)+1);
	outerDiv.attr("childNumber",parseInt(outerDiv.attr("childNumber"),10)+1);

	$("#"+outerDivId+" label").filter(".BaseTree").basetree({})
	$("#"+outerDivId+" input").filter(".DropMenu").dropmenu({})
	$("#"+outerDivId+" input").filter(".datepicker").datepicker({
		changeMonth:true,
		changeYear:true,
		autoSize: true,
	})
}

/**新建确保至少有一条的info*/
function createInfoPlus(outerDivId,htmlText,operationStatus,args){
	var outerDiv = $("#"+outerDivId);
	if(outerDiv.attr("childIndex")==undefined){
		outerDiv.attr("childIndex",0);
	}
	if(outerDiv.attr("childNumber")==undefined){
		outerDiv.attr("childNumber",0);
	}
	htmlText = htmlText.replace(/OUTERDIVID/g,outerDivId);
	//htmlText = htmlText.replace(/OPERATIONSTATUS/g,operationStatus);
	htmlText = htmlText.replace(/NUMBER/g,parseInt(outerDiv.attr("childIndex"),10)+1);
	for (var i=args.length-1; i>=0; i--) {
		var re = eval("/VALUE"+i+"/");
		htmlText = htmlText.replace(re,args[i]);
	}
	outerDiv.append(htmlText);
	var lastChild = outerDiv.children(":last-child");
	lastChild.attr("iTOType","info");
	lastChild.attr("submit","true");
	lastChild.find("*[value='OPERATIONSTATUS']").attr("iTOType","operationStatus");
	lastChild.find("input[value='OPERATIONSTATUS']").val(operationStatus);
	/**childIndex：info的索引；childNumber：info的数量*/
	outerDiv.attr("childIndex",parseInt(outerDiv.attr("childIndex"),10)+1);
	outerDiv.attr("childNumber",parseInt(outerDiv.attr("childNumber"),10)+1);
	if(outerDiv.css("display") == "none"){
		outerDiv.css("display","block");
	}
	$("#"+outerDivId+" label").filter(".BaseTree").basetree({})
	$("#"+outerDivId+" input").filter(".DropMenu").dropmenu({})
	$("#"+outerDivId+" label").filter(".DateTimeSingle").dateTimeSingle({})
} 

/**移除大于等于0条的info*/
function removeInfoStar(button,outerDivId){
	var outerDiv = $("#"+outerDivId);
	var childNumber = outerDiv.attr("childNumber");
	var childNum = parseInt(childNumber,10);
	var infoObj = $(button).parents("*[iTOType='info']");
	var input = infoObj.find("input[iTOType='operationStatus']");
	if (input.val()==0) {
		infoObj.remove();
	}
	else if(input.val()==1){
		input.val("2");
		infoObj.css("display","none");
		Validation.removeValidate(infoObj);
	}
	outerDiv.attr("childNumber",childNum-1);
}

/**移除确保至少有一条的info*/
function removeInfoPlus(button,outerDivId){
	var outerDiv = $("#"+outerDivId);
	var childNumber = outerDiv.attr("childNumber");
	var childNum = parseInt(childNumber,10);
	var infoObj = $(button).parents("*[iTOType='info']");
	var input = infoObj.find("input[iTOType='operationStatus']");
	if (childNum > 1) {
		if (input.val()==0) {
			infoObj.remove();
		}
		else if (input.val()==1) {
			input.val("2");
			infoObj.css("display","none");
			Validation.removeValidate(infoObj);
		}
		outerDiv.attr("childNumber",childNum-1);
	}
	else{
		alert("必须且至少保留一个选项！");
	}
}
