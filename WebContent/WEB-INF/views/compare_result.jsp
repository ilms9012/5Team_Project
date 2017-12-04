<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>전적비교</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="js/RadarChart.js"></script>
    <style>
        body {
          overflow: auto;
          margin-left: 20px;
          margin-right: 20px;
          font-size: 14px;
          font-family: "Helvetica Neue", Helvetica;
        }

        #chart {
          position: static;
          top: 50px;
          left: 100px;
        }   
        #top {
        	font: bold;
        	font-size: 20px;
        }
        #rightRow {
        	text-align: right;
        }
        #centerRow {
        	text-align: center;
        	width: 20%
        }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 값이 더 높으면 색칠색칠
		for(var i=1; i<71; i+=3){
			var left = $('td:eq('+(i-1)+')').text();
			var right = $('td:eq('+(i+1)+')').text();
// 			alert(left + '/' + right)
			if(left > right) {
				$('td:eq('+(i-1)+')').css('background', 'mistyrose');
			} else if(left < right) {
				$('td:eq('+(i+1)+')').css('background', 'mistyrose');
			}
		}
	//////////////////////////////////////////////////////////////////	
	
	for(var i=0; i<3; i++){

// 	alert('${statInfo1[0].rating}');
// 	alert(i);
// 	alert('${statInfo1[i].rating}');
	
	var w = 200;
		h = 200;

	var colorscale = d3.scale.category10();

	//Legend titles
	var LegendOptions = ['${statInfo1[0].nickname}','${statInfo2[0].nickname}'];

	//Data
	var d = [
			  [
				{axis:"승률",value:'${statInfo1[i].win_Ratio}'},
				{axis:"K/D",value:'${statInfo1[i].kill_Death_Ratio}'},
				{axis:"평균딜",value:'${statInfo1[i].damage_Per_Game}'},
				{axis:"헤드샷",value:'${statInfo1[i].headshot_Kill_Ratio}'},
				{axis:"생존시간",value:'${statInfo1[i].time_Survived_Per_Game}'},
				{axis:"최다킬",value:'${statInfo1[i].round_Most_Kill}'}
			  ],[
				{axis:"승률",value:'${statInfo2[i].win_Ratio}'},
				{axis:"K/D",value:'${statInfo2[i].kill_Death_Ratio}'},
				{axis:"평균딜",value:'${statInfo2[i].damage_Per_Game}'},
				{axis:"헤드샷",value:'${statInfo2[i].headshot_Kill_Ratio}'},
				{axis:"생존시간",value:'${statInfo2[i].time_Survived_Per_Game}'},
				{axis:"최다킬",value:'${statInfo2[i].round_Most_Kill}'}
			  ]
			];

	//Options for the Radar chart, other than default
	var mycfg = {
	  w: w,
	  h: h,
	  maxValue: 0.6,
	  levels: 6,
	  ExtraWidthX: 300
	}

	//Call function to draw the Radar chart
	//Will expect that data is in %'s
	RadarChart.draw("#chart"+(i+1), d, mycfg);

	////////////////////////////////////////////
	/////////// Initiate legend ////////////////
	////////////////////////////////////////////

	var svg = d3.select('#body')
		.selectAll('svg')
		.append('svg')
		.attr("width", w+100)
		.attr("height", h)

	//Create the title for the legend
	var text = svg.append("text")
		.attr("class", "title")
		.attr('transform', 'translate(90,0)') 
		.attr("x", w - 70)
		.attr("y", 10)
		.attr("font-size", "12px")
		.attr("fill", "#404040")
		.text("텍스트지롱");
			
	//Initiate Legend	
	var legend = svg.append("g")
		.attr("class", "legend")
		.attr("height", 100)
		.attr("width", 200)
		.attr('transform', 'translate(90,20)') 
		;
		//Create colour squares
		legend.selectAll('rect')
		  .data(LegendOptions)
		  .enter()
		  .append("rect")
		  .attr("x", w - 65)
		  .attr("y", function(d, i){ return i * 20;})
		  .attr("width", 10)
		  .attr("height", 10)
		  .style("fill", function(d, i){ return colorscale(i);})
		  ;
		//Create text next to squares
		legend.selectAll('text')
		  .data(LegendOptions)
		  .enter()
		  .append("text")
		  .attr("x", w - 52)
		  .attr("y", function(d, i){ return i * 20 + 9;})
		  .attr("font-size", "11px")
		  .attr("fill", "#737373")
		  .text(function(d) { return d; })
		  ;	
		
		////////////////////////////////////////////////////
		$('#asiaBtn').click(function(){
			$('#gameServer').attr('value', 0);
			form.submit();
		});
		$('#kJBtn').click(function(){
			$('#gameServer').attr('value', 1);
			form.submit();
		});
	}
	});

</script>

</head>
<body>
<%@ include file="header.jsp" %>
<!-- 게임서버 0이면 아시아서버, 1이면 한국/일본서버 -->
<c:forEach items="${statInfo1}" var="s1">
	<c:if test="${not empty s1.avatar}">
		<c:set var="avatar1" value="${s1.avatar}"/>
	</c:if>
</c:forEach>
<c:forEach items="${statInfo2}" var="s2">
	<c:if test="${not empty s2.avatar}">
		<c:set var="avatar2" value="${s2.avatar}"/>
	</c:if>
</c:forEach>
<h1 align="center">전적비교</h1>
	<br>
	<form action="compare.do" method="post">
		<input type="hidden" name="nickname1" value="${statInfo1[0].nickname}">
		<input type="hidden" name="nickname2" value="${statInfo2[0].nickname}">
		<input type="hidden" name="gameServer" id="gameServer">
		
		<button id="asiaBtn" class="btn btn-primary">ASIA</button>
		<button id="kJBtn" class="btn btn-primary">KR/JP</button>
	</form>
	<br>
	<div id="top" class="row">
		<div class="col-md-5" align="right">
			${statInfo1[0].nickname}
			<img src="${avatar1}" width="60" height="60">
		</div>
		<div class="col-md-2" align="center">VS</div>
		<div class="col-md-5" align="left">
			<img src="${avatar2}" width="60" height="60">
			${statInfo2[0].nickname}
		</div>
	</div>
	<br>
	<hr>
	<c:if test="${gameServer eq 0}">
		<h1>아시아 서버</h1>
	</c:if>
	<c:if test="${gameServer eq 1}">
		<h1>한국/일본 서버</h1>
	</c:if>
	<c:forEach begin="0" end="2" var="i" >
		<div class="col-md-3" style="margin-left: 5px; margin-right: 5px;">
			<c:if test="${i%3 eq 0}">
				<h1>솔로</h1>
			</c:if>
			<c:if test="${i%3 eq 1}">
				<h1>듀오</h1>
			</c:if>
			<c:if test="${i%3 eq 2}">
				<h1>스쿼드</h1>
			</c:if>
			<div id="chart${i+1}" align="center"></div>
			<br>
			<br>
			<hr>
			<br>
			<br>
			<div id="table" align="center">
				<table class="table table-hover table-bordered">
					<thead class="thead-dark">
						<tr>
							<th id="rightRow">${statInfo1[0].nickname}</th>
							<th id="centerRow">VS</th>
							<th>${statInfo2[0].nickname}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="rightRow">${statInfo1[i].rating}</td>
							<td id="centerRow">레이팅</td>
							<td id="leftRow">${statInfo2[i].rating}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].win_Ratio}</td>
							<td id="centerRow">승률</td>
							<td id="leftRow">${statInfo2[i].win_Ratio}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].top10_Ratio}</td>
							<td id="centerRow">TOP10 ratio</td>
							<td id="leftRow">${statInfo2[i].top10_Ratio}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].kill_Death_Ratio}</td>
							<td id="centerRow">K/D</td>
							<td id="leftRow">${statInfo2[i].kill_Death_Ratio}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].damage_Per_Game}</td>
							<td id="centerRow">평균딜</td>
							<td id="leftRow">${statInfo2[i].damage_Per_Game}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].headshot_Kill_Ratio}</td>
							<td id="centerRow">헤드샷</td>
							<td id="leftRow">${statInfo2[i].headshot_Kill_Ratio}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].time_Survived_Per_Game}</td>
							<td id="centerRow">생존시간</td>
							<td id="leftRow">${statInfo2[i].time_Survived_Per_Game}</td>
						</tr>
						<tr>
							<td id="rightRow">${statInfo1[i].round_Most_Kill}</td>
							<td id="centerRow">최다킬</td>
							<td id="leftRow">${statInfo2[i].round_Most_Kill}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:forEach>
</body>
</html>