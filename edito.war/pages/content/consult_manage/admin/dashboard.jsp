<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
<title>招生咨询业务总览</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/jqueryRAF/jquery.requestAnimationFrame.min.js"></script>
<!-- nanoScroller -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/nanoScroller/jquery.nanoscroller.min.js"></script>
<!-- Materialize -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/materialize/js/materialize.min.js"></script>
<!-- d3 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/d3/d3.min.js"></script>
<!-- nvd3 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/nvd3/nv.d3.min.js"></script>
<!-- nanoScroller -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/nanoScroller/nanoscroller.css" />
<!-- FontAwesome -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.min.css" />
<!-- Material Design Icons -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/material-design-icons/css/material-design-icons.min.css" />
<!-- IonIcons -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/ionicons/css/ionicons.min.css" />
<!-- nvd3 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/nvd3/nv.d3.min.css" />
<!-- Google Prettify -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/google-code-prettify/prettify.css" />
<!-- Main -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/_con/css/_con.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/_con/js/_con.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/sortable/Sortable.min.js"></script>

<!--[if lt IE 9]>
    <script src="<%=request.getContextPath()%>/assets/html5shiv/html5shiv.min.js"></script>
<![endif]--> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/flot/jquery.flot.time.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/flot/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/flot/jquery.flot.categories.min.js"></script>
</head>

<body>
 <!-- Stats Panels -->
    <div class="row">
      <div class="col l4 m6 s12">
        <a href="#" class="large card-panel stats-card red lighten-2 red-text text-lighten-5">
          <i class="fa fa-comments-o"></i>
          <span class="count" id="todayNoOfConsultations"></span>
          <div class="name">今日咨询量</div>
        </a>
      </div>
      <div class="col l4 m6 s12">
        <a href="#" class="large card-panel stats-card blue lighten-2 blue-text text-lighten-5">
          <i class="fa fa-send"></i>
          <span class="count" id="todayNoOfFollowUps"></span>
          <div class="name">今日回访量</div>
        </a>
      </div>
      <div class="col l4 m6 s12">
        <a href="#" class="large card-panel stats-card green lighten-2 green-text text-lighten-5">
          <i class="fa fa-spinner"></i>
          <span class="count" id="todayNoOfTodoFollowUps"></span>
          <div class="name">今日待回访</div>
        </a>
      </div>
    </div>
    <!-- /Stats Panels -->
    
    <div class="row sortable">
      <!-- Stacked Area Chart -->
      <div class="col l12 m12 s12 l7">
        <div class="card">
          <div class="title">
            <h5>周工作统计</h5>
          </div>
          <div class="content">
            <div id="weeklySummary" style="height: 300px;"></div>
          </div>
        </div>
      </div>
      <!-- /Stacked Area Chart -->
    </div>
    
    <div class="row sortable">
      <!-- Stacked Area Chart -->
      <div class="col l12 m12 s12 l7">
        <div class="card">
          <div class="title">
            <h5>日工作统计</h5>
          </div>
          <div class="content">
            <div id="dailySummary" style="height: 300px;"></div>
          </div>
        </div>
      </div>
      <!-- /Stacked Area Chart -->
    </div>
    
    <div class="row sortable">
      <!-- Stacked Area Chart -->
      <div class="col l12 m12 s12 l7">
        <div class="card">
          <div class="title">
            <h5>咨询量</h5>
          </div>
          <div class="content">
            <div id="weeklyConsultationSummaryByConsultant" style="height: 300px;"></div>
          </div>
        </div>
      </div>
      <!-- /Stacked Area Chart -->
    </div>
    
    <div class="row sortable">
      <!-- Stacked Area Chart -->
      <div class="col l12 m12 s12 l7">
        <div class="card">
          <div class="title">
            <h5>回访量</h5>
          </div>
          <div class="content">
            <div id="weeklyFollowUpSummaryByConsultant" style="height: 300px;"></div>
          </div>
        </div>
      </div>
      <!-- /Stacked Area Chart -->
    </div>

<script>
    /*
     * Flot Line Chart
     */
    function initFlotLineChart(idName, ticksData, dataArray){
      var chart = $("#" + idName);
      var options = {
        series: {
          lines: {
            show: true,
            lineWidth: 1,
            fill: true, 
            fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }
          },
          points: {
            show: true, 
            lineWidth: 2,
            radius: 3
          },
          shadowSize: 0,
          stack: true
        },
        grid: {
          hoverable: true, 
          clickable: true, 
          tickColor: "#f9f9f9",
          borderWidth: 0
        },
        legend: {
          backgroundOpacity: 0,
          labelBoxBorderColor: "#fff"
        },  
        xaxis: {
          ticks: ticksData,
          font: {
            family: "Roboto,sans-serif",
            color: "#ccc"
          }
        },
        yaxis: {
          ticks:7, 
          tickDecimals: 0,
          font: {color: "#ccc"}
        }
      };
      
      function initFlot() {
        $.plot(chart, dataArray, options);
        chart.find('.legend table').css('width', 'auto')
             .find('td').css('padding', 5);
      }
      initFlot();
      $(window).on('resize', initFlot);
    
      function showTooltip(x, y, contents) {
        $('<div id="tooltip' + idName +'">' + contents + '</div>').css( {
          position: 'absolute',
          display: 'none',
          top: y - 40,
          left: x - 55,
          color: "#fff",
          padding: '5px 10px',
          'border-radius': '3px',
          'background-color': 'rgba(0,0,0,0.6)'
        }).appendTo("body").fadeIn(200);
      }
    
      var previousPoint = null;
      chart.bind("plothover", function (event, pos, item) {
        if (item) {
          if (previousPoint != item.dataIndex) {
            previousPoint = item.dataIndex;
    
            $("#tooltip" + idName +"").remove();
            var x = item.datapoint[0].toFixed(0),
                y = item.datapoint[1].toFixed(0);
    
            showTooltip(item.pageX, item.pageY,
                        item.series.label + ": " + y);
          }
        }
        else {
          $("#tooltip" + idName + "").remove();
          previousPoint = null;
        }
      });
    };
</script>
<script type="text/javascript">
$(function(){
    $.ajax({
        type: "POST",
        dataType: "json",
        url: cp+"/ajaxs/content/consult/manage/admin/dashboard_data.html" ,
        success: function(data){
            $("#todayNoOfConsultations").html(data.dayData["CompletedConsultations"]);
            $("#todayNoOfFollowUps").html(data.dayData["CompletedFollowUps"]);
            $("#todayNoOfTodoFollowUps").html(data.dayData["ToDoFollowUps"]);
            var dataArray = [];
            dataArray.add({data: data.consultationData,
            	           label: "咨询量"});
            dataArray.add({data: data.followUpData,
            	           label: "回访量"});

            initFlotLineChart("weeklySummary", data.ticksData, dataArray);
        },
        error: function(){
            alert("请求失败，请稍后重试!");
        }
    }) 
    
    $.ajax({
        type: "POST",
        dataType: "json",
        url: cp+"/ajaxs/content/consult/manage/admin/query_daily_dashboard_data.html" ,
        success: function(data){
            var dataArray = [];
            dataArray.add({data: data.consultationData,
            	           label: "咨询量"});
            dataArray.add({data: data.followUpData,
            	           label: "回访量"});

            initFlotLineChart("dailySummary", data.ticksData, dataArray);
        },
        error: function(){
            alert("请求失败，请稍后重试!");
        }
    })

    $.ajax({
        type: "POST",
        dataType: "json",
        url: cp+"/ajaxs/content/consult/manage/admin/query_weekly_communication_data_by_consultant.html" ,
        success: function(data){
            initFlotLineChart("weeklyConsultationSummaryByConsultant", data.ticksData, data.consultationData);
            initFlotLineChart("weeklyFollowUpSummaryByConsultant", data.ticksData, data.followUpData);
        },
        error: function(){
            alert("请求失败，请稍后重试!");
        }
    }) 
})
</script>
</body>
