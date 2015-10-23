function Binding(){}
Binding.count = 1;
Binding.retrieveData = new jQuery.Hashtable();
Binding.compareData = new jQuery.Hashtable();
Binding.statisticData = new jQuery.Hashtable();
Binding.addRetrieveEqualBinding = function (add,cid,des,args){
	var jadd = $(add);
	var jmain = jadd.prev("span");
	var binding = jmain.find("*[binding]");
	var value = binding.attr("value").trim();
	if(value==""){
		alert("请您填选数据后再添加！");
		return;
	}
	var index = Binding.count++;
	var jbinding = $("<div></div>");
	jbinding.attr("jid",index);
	var jdes = $("<label></label>");
	jdes.html(des+"：");
	var jcmain = jmain.clone();
	var jdelete = $("<a href='javascript:void(0)'>删除</a>");
	jdelete.bind("click",{jbinding:jbinding},Binding.deleteRetrieveBinding);
	jbinding.append(jdes).append(jcmain).append(jdelete);
	$("#"+cid).append(jbinding);
	var data = new Array();
	data.push({name:"binding(EqualBinding[" + index + "]).table",value:args["table"]});
	data.push({name:"binding(EqualBinding[" + index + "]).field",value:args["field"]});
	data.push({name:"binding(EqualBinding[" + index + "]).type",value:args["type"]});
	data.push({name:"binding(EqualBinding[" + index + "]).value",value:value});
	Binding.retrieveData.add(index,data);
}
Binding.addRetrieveIntervalBinding = function (add,cid,des,args){
	var jadd = $(add);
	var jmain = jadd.prev("span");
	var bindings = jmain.find("*[binding='interval']");
	var minValue = bindings.eq(0).attr("value");
	var maxValue = bindings.eq(1).attr("value");
	if(minValue==""&&maxValue==""){
		alert("请您至少填选其中一项数据后再添加！");
		return;
	}
	var index = Binding.count++;
	var jbinding = $("<div></div>");
	jbinding.attr("jid",index);
	var jdes = $("<label></label>");
	jdes.html(des+"：");
	var jcmain = jmain.clone();
	jcmain.find("input[type='text']").attr("disabled","true");
	var jdelete = $("<a href='javascript:void(0)'>删除</a>");
	jdelete.bind("click",{jbinding:jbinding},Binding.deleteRetrieveBinding);
	jbinding.append(jdes).append(jcmain).append(jdelete);
	$("#"+cid).append(jbinding);
	var data = new Array();
	var values = new Array();
	values.push(minValue==""?"-∞":minValue);
	values.push(maxValue==""?"+∞":maxValue);
	data.push({name:"binding(IntervalBinding[" + index + "]).table",value:args["table"]});
	data.push({name:"binding(IntervalBinding[" + index + "]).field",value:args["field"]});
	data.push({name:"binding(IntervalBinding[" + index + "]).type",value:args["type"]});
	data.push({name:"binding(IntervalBinding[" + index + "]).value",value:JSON.stringify(values)});
	Binding.retrieveData.add(index,data);
}
Binding.addRetrieveMultiComplexBinding = function (add,cid,des,args){
	var jadd = $(add);
	var jmain = jadd.prev("span");
	var bindings = jmain.find("*[binding]");
	var values = new Array();
	var isNull = true;
	var flag = 0;
	var v = null;
	for(var i=0;i<bindings.length;i++){
		var binding = bindings.eq(i);
		var value = binding.attr("value").trim();
		if(binding.attr("binding")=="equal"){
			v = new Array();
			if(value!=""){
				isNull = false;
				v.push(value);
				values.push(v);
			}
			else{
				v.push("");
				values.push(v);
			}
		}
		else if(binding.attr("binding")=="interval"){
			if(flag==0){
				flag = 1;
				v = new Array();
				if(value!=""){
					isNull = false;
					v.push(value);
				}
				else{
					v.push("-∞");
				}
			}
			else{
				flag = 0;
				if(value!=""){
					isNull = false;
					v.push(value);
				}
				else{
					v.push("+∞");
				}
				values.push(v);
			}
		}
	}
	if(isNull){
		if(bindings.eq(0).attr("binding")=="equal"){
			alert("请您填选数据后再添加！");
		}
		else{
			alert("请您至少填选其中一项数据后再添加！");
		}
		return;
	}
	var index = Binding.count++;
	var jbinding = $("<div></div>");
	jbinding.attr("jid",index);
	var jdes = $("<label></label>");
	jdes.html(des+"：");
	var jcmain = jmain.clone();
	jcmain.find("input[type='text']").attr("disabled","true");
	var jdelete = $("<a class='delete' href='javascript:void(0)'>删除</a>");
	jdelete.bind("click",{jbinding:jbinding},Binding.deleteRetrieveBinding);
	jbinding.append(jdes).append(jcmain).append(jdelete);
	$("#"+cid).append(jbinding);
	var data = new Array();
	data.push({name:"binding(MultiComplexBinding[" + index + "]).table",value:args["table"]});
	data.push({name:"binding(MultiComplexBinding[" + index + "]).field",value:JSON.stringify(args["field"])});
	data.push({name:"binding(MultiComplexBinding[" + index + "]).type",value:JSON.stringify(args["type"])});
	data.push({name:"binding(MultiComplexBinding[" + index + "]).value",value:JSON.stringify(values)});
	data.push({name:"binding(MultiComplexBinding[" + index + "]).bridgeTable",value:args["bridgeTable"]});
	data.push({name:"binding(MultiComplexBinding[" + index + "]).bridgeField",value:args["bridgeField"]});
	data.push({name:"binding(MultiComplexBinding[" + index + "]).group",value:index});
	Binding.retrieveData.add(index,data);
}
Binding.addRetrieveAndMultiComplexBinding = function (and,cid,args){
	var jandChoice = $("<div style='position:absolute;text-align:left;background-color:#CCCCFF;border:solid 2px black;z-index:4;width:360px;'></div>");
	var jcontainer = $("#"+cid);
	var jbindings = jcontainer.children();
	for(var i=0;i<jbindings.length;i++){
		var jbinding = jbindings.eq(i);
		var jcbinding = jbinding.clone();
		jcbinding.find("a").remove();
		var jradio = $("<input type='radio' name='and' />");
		jradio.attr("enabled","true");
		jradio.attr("jid",jbinding.attr("jid"));
		jandChoice.append(jradio).append(jcbinding.html());
		jandChoice.append("<br>");
	}
	var jconfirm = $("<input type='button' value='确定'/>");
	jconfirm.bind("click",{jandChoice:jandChoice,and:and,args:args},Binding.addRetrieveAndMultiComplexBindingConfirm);
	var jcancel = $("<input type='button' value='取消'/>");
	jcancel.bind("click",{jandChoice:jandChoice},Binding.addRetrieveAndMultiComplexBindingCancel);
	var jtoolbar = $("<div style='text-align:center;background-color:#CCCCFF;width:360px;'></div>");
	jtoolbar.append(jconfirm).append(jcancel);
	jandChoice.append("<br>");
	jandChoice.append(jtoolbar);
	$("body").append(jandChoice);
	jandChoice.css("left","720").css("top","350");
}
Binding.addRetrieveAndMultiComplexBindingConfirm = function (event){
	var data = event.data;
	var and = $(data.and);
	var jmain = and.prev("a").prev("span");
	var bindings = jmain.find("*[binding]");
	var values = new Array();
	var isNull = true;
	var flag = 0;
	var v = null;
	for(var i=0;i<bindings.length;i++){
		var binding = bindings.eq(i);
		var value = binding.attr("value").trim();
		if(binding.attr("binding")=="equal"){
			v = new Array();
			if(value!=""){
				isNull = false;
				v.push(value);
				values.push(v);
			}
			else{
				v.push("");
				values.push(v);
			}
		}
		else if(binding.attr("binding")=="interval"){
			if(flag==0){
				flag = 1;
				v = new Array();
				if(value!=""){
					isNull = false;
					v.push(value);
				}
				else{
					v.push("-∞");
				}
			}
			else{
				flag = 0;
				if(value!=""){
					isNull = false;
					v.push(value);
				}
				else{
					v.push("+∞");
				}
				values.push(v);
			}
		}
	}
	if(isNull){
		alert("请您至少填选其中一项数据后再添加！");
		return;
	}
	var jandChoice = data.jandChoice;
	var jradio = jandChoice.find("input[type='radio'][name='and'][checked='true']");
	var jid = jradio.attr("jid");
	var jbinding = $("div[jid='"+jid+"']");
	var jdelete = jbinding.children("a");
	jdelete.before("并且 ");
	var jcmain = jmain.clone();
	jcmain.find("input[type='text']").attr("disabled","true");
	jdelete.before(jcmain);
	Binding.addRetrieveAndMultiComplexBindingCancel(event);
	var andData = Binding.retrieveData.get(jid);
	var index = Binding.count++;
	var args = data.args;
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).table",value:args["table"]});
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).field",value:JSON.stringify(args["field"])});
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).type",value:JSON.stringify(args["type"])});
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).value",value:JSON.stringify(values)});
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).bridgeTable",value:args["bridgeTable"]});
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).bridgeField",value:args["bridgeField"]});
	andData.push({name:"binding(MultiComplexBinding[" + index + "]).group",value:jid});
}
Binding.addRetrieveAndMultiComplexBindingCancel = function (event){
	var data = event.data;
	var jandChoice = data.jandChoice;
	jandChoice.css("display","none");
	jandChoice.remove();
}
Binding.deleteRetrieveBinding = function (event){
	var data = event.data;
	var jbinding = data.jbinding;
	var jid = jbinding.attr("jid");
	Binding.retrieveData.remove(jid);
	jbinding.remove();
}
Binding.addRetrieveDisplayBinding = function(displays){
	var data = new Array();
	for (var i=0;i<displays.length;i++) {
		var index = Binding.count++;
		var argsString = displays.eq(i).attr("args");
		var args = JSON.parse(argsString);
		data.push({name:"binding(DisplayBinding[" + index + "]).table",value:args["table"]});
		data.push({name:"binding(DisplayBinding[" + index + "]).field",value:args["field"]});
		data.push({name:"binding(DisplayBinding[" + index + "]).type",value:args["type"]});
		data.push({name:"binding(DisplayBinding[" + index + "]).description",value:args["description"]});
	}
	return data;
}
Binding.addStatisticBinding = function (add,cid,des,args){
	var jadd = $(add);
	var jmain = jadd.prev("span");
	var index = Binding.count++;
	var jbinding = $("<div></div>");
	jbinding.attr("jid",index);
	var jdes = $("<label></label>");
	jdes.html(des+"：");
	
	var data = new Array();
	data.push({name:"binding(Binding[" + index + "]).table",value:args["table"]});
	data.push({name:"binding(Binding[" + index + "]).field",value:args["field"]});
	data.push({name:"binding(Binding[" + index + "]).type",value:args["type"]});
	var binding = jmain.find("*[binding]");
	var value = binding.attr("value");
	if(value==undefined){
		data.push({name:"binding(Binding[" + index + "]).description",value:des});
	}
	else if(value.trim()==""){
		alert("请您填选数据后再添加！");
		return;
	}
	else{
		data.push({name:"binding(Binding[" + index + "]).value",value:value});
		var tagName = binding.attr("tagName");
		if(tagName=="LABEL"){
			data.push({name:"binding(Binding[" + index + "]).description",value:des+" "+binding.text()});
		}
		else if(tagName=="INPUT"){
			data.push({name:"binding(Binding[" + index + "]).description",value:des+" "+ binding.next().attr("value")});
		}
	}
	var jcmain = jmain.clone();
	var jdelete = $("<a href='javascript:void(0)'>删除</a>");
	jdelete.bind("click",{jbinding:jbinding},Binding.deleteStatisticBinding);
	jbinding.append(jdes).append(jcmain).append(jdelete);
	$("#"+cid).append(jbinding);

	Binding.statisticData.add(index,data);
}
Binding.deleteStatisticBinding = function (event){
	var data = event.data;
	var jbinding = data.jbinding;
	var jid = jbinding.attr("jid");
	Binding.statisticData.remove(jid);
	jbinding.remove();
}
Binding.addCompareBinding = function (add,cid,des,args){
	var jadd = $(add);
	var jmain = jadd.prev("span");
	var binding = jmain.find("*[binding]");
	var value = binding.attr("value").trim();
	if(value==""){
		alert("请您填选数据后再添加！");
		return;
	}
	var index = Binding.count++;
	var jbinding = $("<div></div>");
	jbinding.attr("jid",index);
	var jdes = $("<label></label>");
	jdes.html(des+"：");
	var jcmain = jmain.clone();
	var jdelete = $("<a href='javascript:void(0)'>删除</a>");
	jdelete.bind("click",{jbinding:jbinding},Binding.deleteCompareBinding);
	jbinding.append(jdes).append(jcmain).append(jdelete);
	$("#"+cid).append(jbinding);
	var data = new Array();
	data.push({name:"binding(Binding[" + index + "]).table",value:args["table"]});
	data.push({name:"binding(Binding[" + index + "]).field",value:args["field"]});
	data.push({name:"binding(Binding[" + index + "]).type",value:args["type"]});
	data.push({name:"binding(Binding[" + index + "]).value",value:value});
	var tagName = binding.attr("tagName");
	if(tagName=="LABEL"){
		data.push({name:"binding(Binding[" + index + "]).description",value:des+" "+binding.text()});
	}
	else if(tagName=="INPUT"){
		data.push({name:"binding(Binding[" + index + "]).description",value:des+" "+value});
	}
	Binding.compareData.add(index,data);
}
Binding.deleteCompareBinding = function (event){
	var data = event.data;
	var jbinding = data.jbinding;
	var jid = jbinding.attr("jid");
	Binding.compareData.remove(jid);
	jbinding.remove();
}