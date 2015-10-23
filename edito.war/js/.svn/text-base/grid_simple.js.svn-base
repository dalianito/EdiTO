(function( $ ) {
$.widget("ui.gridsimple",{
	options	:	{
		width 	: 740,
		height 	: 20,
		colMeta : [],
		rowData : [],
		rowIndex: 0,
		deleteRow : null,
		mark	: true
	},
	_create	:	function(){
		var self = this,
		options = self.options;
		var colMeta = options.colMeta;
		var rowData = options.rowData;
		var object = options.deleteRow;
		var rowIndex = options.rowIndex;
		
		var table = self.element;
		table.attr("cellspacing","0px");
		
		table.children("thead").remove();
		table.children("tbody").remove();
		
		var thead = $("<thead></thead>");
		var tr = $("<tr></tr>");
		tr.attr("height",options.height);
		//是否显示行号
		if(options.mark){
			var th = $("<th>&nbsp;</th>");
			th.attr($.ui.gridsimple.noStyle);
			th.css({backgroundColor:"#DFDFDF"});
			th.css($.ui.gridsimple.font).css($.ui.gridsimple.th_begin_border);
			tr.append(th);
		}
		for(var i=0;i<colMeta.length;i++){
			var th = $("<th>&nbsp;</th>");
			th.html(colMeta[i]["name"]);
			th.attr("width", colMeta[i]["width"]);
			th.attr({align:"center"});

			if(colMeta[i]["sortable"]==true){
				th.attr("class","sort-"+colMeta[i]["type"]);
			}
			if(i==0&&!options.mark){
				th.css($.ui.gridsimple.th_begin_border);
			}
			else{
				th.css($.ui.gridsimple.th_border);
			}
			th.css($.ui.gridsimple.font).css({backgroundColor:"#DFDFDF"});
			if(typeof(colMeta[i]["css"])!="undefined"&&typeof(colMeta[i]["css"]["th"])!="undefined"){
				th.css(colMeta[i]["css"]["th"]);
			}
			tr.append(th);
		}
		thead.append(tr);
		table.prepend(thead);
		//Concurrent.Thread.create(self.appendRows,self);
		self.appendRows(self);
		//self.deleteRow(object);
		//Concurrent.Thread.create(self.alterRowColors);
		//self.alterRowColors();
		self.sort();
	},
	appendRows	:function(obj) {
		var self = obj!=null?obj:this,
		options = self.options;
		var colMeta = options.colMeta;
		var rowData = options.rowData;
		
		var n = 20;
		var y = rowData.length%n;
		var s = (rowData.length-y)/n;
		for(var k=0;k<s;k++){
			self.appendRow20(self,n*k,n*(k+1));
			//var percentage = Math.floor(100 * k / s);
			//Concurrent.Thread.create(function(){$("#progressbar").progressBar(percentage)});
		}
		self.appendRow20(self,n*s,n*s+y);
		//Concurrent.Thread.create(function(){$("#progressbar").progressBar(100)});
		options.rowIndex += rowData.length;
		self.alterRowColors();
	},
	appendRow20	:	function(obj,index1,index2) {
		var self = obj,
		options = self.options;
		var colMeta = options.colMeta;
		var rowData = options.rowData;
		
		var table = self.element;
		var tbody = table.children("tbody");
		if(tbody.length==0){
			tbody = $("<tbody></tbody>");
			table.append(tbody);
		}
		
		for(var j=index1;j<index2;j++){
			//var percentage = Math.floor(100 * j / (rowData.length-1));
			//Concurrent.Thread.create(function(){$("#uploadprogressbar").progressBar(percentage)});
			var tr = $("<tr></tr>");
			tr.attr("height",options.height);
			//是否显示行号
			if(options.mark){
				var td = $("<td>&nbsp;</td>");
				td.html(j+1+options.rowIndex);
				td.attr($.ui.gridsimple.noStyle);
				td.css($.ui.gridsimple.font).css($.ui.gridsimple.td_begin_border);
				tr.append(td);
			}
			var row = rowData[j];
			var m = 0;
			var borderMerge = false;
			for(var k=0;k<row.length;k++,m++){
				var td = $("<td>&nbsp;</td>");
				if(row[k]!=""){
					if(colMeta[m]["type"]=="string"){
						td.html(row[k]);
					}
					else if(colMeta[m]["type"]=="float"){
						td.html(row[k]);
					}
					else if(colMeta[m]["type"]=="int"){
						td.html(row[k]);
					}
					else if(colMeta[m]["type"]=="a"){
						var text = colMeta[m]["displace"].replace(/\{0\}/g, row[k]);
						var a = $(text);
						td.html(a);
					}
					else if(colMeta[m]["type"]=="html"){
						var text = gridSimpleHtmlStringHandler(row[k]);
						var html = $(text);
						td.html(html);
					}
					else if(colMeta[m]["type"]=="datetime"){
						var df1 = new DateFormat("yyyy-MM-dd HH:mm:ss");
						var format = colMeta[m]["format"];
						var date = df1.parse(row[k]);
						var df2 = new DateFormat(format);
						var ds = df2.format(date);
						td.attr("format",format);
						if(colMeta[m]["merge"]){
							var number = colMeta[m]["number"];
							for(var n=0;n<number;n++){
								date = df1.parse(row[k+n+1]);
								var ds2 = df2.format(date);
								ds += colMeta[m]["separator"];
								ds += ds2;
							}
							if(k==0){
								borderMerge = true;
							}
							k += number;
						}
						td.html(ds);
					}
				}
				else if(row[k]=="") {
					td.attr("isNaN","true");
				}
				td.attr("align",colMeta[m]["align"]).attr("width", colMeta[m]["width"]);
				if(k==0 && !options.mark || borderMerge){
					td.css($.ui.gridsimple.td_begin_border);
					borderMerge = false;
				}
				else{
					td.css($.ui.gridsimple.td_border);
				}
				td.css($.ui.gridsimple.font);
				if(typeof(colMeta[m]["css"])!="undefined"&&typeof(colMeta[m]["css"]["td"])!="undefined"){
					td.css(colMeta[m]["css"]["td"]);
				}
				tr.append(td);
			}
			tbody.append(tr);
		}
	},
    deleteRow	:	function(object) {
		$(object).closest('tr').remove(); 
    },
	sort	:	function() {
		var self = this;
		var $sortOrder = 0;   //排序类型 1表示升序，0表示降序
		var $table = self.element;
		$('th', $table).each(function( column ) {
			//处理三种有可能存在的排序字段，比较方法
			var findSortKey;
			if( $(this).is('.sort-string') ) {
				findSortKey = function( $cell ) {
					return $cell.text().toUpperCase();
				}
			}
			else if( $(this).is('.sort-datetime') ) {
				findSortKey = function( $cell ) {
					if($cell.attr("isNaN")=="true") {
						return -2209017600000;
					}
					var text = $cell.text();
					var format = $cell.attr("format");			
					var df = new DateFormat(format);
					var date = df.parse(text);
					return date.getTime();
				}
			}
			else if( $(this).is('.sort-float') ) {
				findSortKey = function( $cell ) {
					var key =  parseFloat($cell.text().replace(/^[^\d.]*/, ''),10)
					return isNaN(key) ? 0 : key;
				}
			}
			else if( $(this).is('.sort-int') ) {
				findSortKey = function( $cell ) {
					var key =  parseInt($cell.text(),10)
					return isNaN(key) ? 0 : key;
				}
			}
			
			//排序
			if( findSortKey ) {
				$(this).addClass('clickable').hover(function() {
					$(this).addClass('hover');
					var $title = $sortOrder == 0 ? '升序' : '降序';
					$(this).attr('title', '按'+  $(this).html() + $title +'排列');
				}, function() {
					$(this).removeClass('hover');
				}).click(function() {
					$sortOrder = $sortOrder == 0 ? 1 : 0;
					var rows = $table.find('tbody > tr').get();
					$.each( rows, function( index, row ) {
						row.sortKey = findSortKey($(row).children('td').eq(column));
					});
					//排序方法
					var col = $(this);
					rows.sort(function( a, b ) {
						if( $sortOrder == 1 ) {
							//升序
							if(col.is('.sort-string')) {
								return a.sortKey.localeCompare(b.sortKey);
							}
							else if(col.is('.sort-datetime')) {
								if(a.sortKey < b.sortKey)   return -1;
								if(a.sortKey > b.sortKey)   return  1;                    
								return 0;
							}
							else if(col.is('.sort-float')) {
								if(a.sortKey < b.sortKey)   return -1;
								if(a.sortKey > b.sortKey)   return  1;                    
								return 0;
							}
							else if(col.is('.sort-int')) {
								if(a.sortKey < b.sortKey)   return -1;
								if(a.sortKey > b.sortKey)   return  1;                    
								return 0;
							}
						}
						else {
							//降序
							if(col.is('.sort-string')) {
								return -a.sortKey.localeCompare(b.sortKey);
							}
							else if(col.is('.sort-datetime')) {
								if(a.sortKey < b.sortKey)   return  1;
								if(a.sortKey > b.sortKey)   return -1;                    
								return 0;
							}
							else if(col.is('.sort-float')) {
								if(a.sortKey < b.sortKey)   return  1;
								if(a.sortKey > b.sortKey)   return -1;                    
								return 0;
							}
							else if(col.is('.sort-int')) {
								if(a.sortKey < b.sortKey)   return  1;
								if(a.sortKey > b.sortKey)   return -1;                    
								return 0;
							}
						}					
					});
					//排序后的对象添加给$table
					$.each( rows, function( index, row ) {
						if(self.options.mark){
							$(row).children('td').eq(0).html(index+1);
						}
						$table.children('tbody').eq(0).append(row);
						row.sortKey = null;
					});
					//显著标明是通过某一列排序的
					$table.find('td').removeClass('sorted')
						.filter(':nth-child('+ (column + 1) +')').addClass('sorted');	
					//重新赋予奇偶行的样式
					self.alterRowColors();
				});
			}
		});
	},
    alterRowColors	:	function() {
        $('tbody tr:odd', this.element).css({backgroundColor:"#EFEFEF"});
        $('tbody tr:even', this.element).css({backgroundColor:"#FFFFFF"});
        return this;
    },
	destroy	:	function() {
		var self = this;
		self.element.removeData();
	}
});
$.extend($.ui.gridsimple, {
	noStyle			:	{width:"20",align:"center"},
	font			:	{fontFamily:"宋体, Verdana, Arial",fontSize:"13px"},
	th_border		:	{borderStyle:"solid",borderColor:"#CDCDCD",borderWidth:"1px 1px 1px 0px"},
	th_begin_border	:	{borderStyle:"solid",borderColor:"#CDCDCD",borderWidth:"1px 1px 1px 1px"},
	td_border		:	{borderStyle:"solid",borderColor:"#CDCDCD",borderWidth:"0px 1px 1px 0px"},
	td_begin_border	:	{borderStyle:"solid",borderColor:"#CDCDCD",borderWidth:"0px 1px 1px 1px"}
});
})( jQuery );
