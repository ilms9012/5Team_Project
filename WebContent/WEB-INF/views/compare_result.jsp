<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>ÀüÀûºñ±³</title>
<link rel="stylesheet" href="css/bootstrap.css">

<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="js/RadarChart.js"></script>
<style>
body {
	overflow: auto;
	margin: 0;
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
	width: 23%;
	margin-left: 5px;
	margin-right: 5px;
}
svg {
	width: 400;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		// °ªÀÌ ´õ ³ôÀ¸¸é »öÄ¥»öÄ¥
		for (var i = 1; i < 71; i += 3) {
			var left = $('td:eq(' + (i - 1) + ')').text();
			var right = $('td:eq(' + (i + 1) + ')').text();
			left = parseFloat(left);
			right = parseFloat(right);
			if (left > right) {
				$('td:eq(' + (i - 1) + ')').css('background', 'mistyrose');
				$('td:eq(' + (i - 1) + ')').css('font-weight', 'bold');
			} else if (left < right) {
				$('td:eq(' + (i + 1) + ')').css('background', 'mistyrose');
				$('td:eq(' + (i + 1) + ')').css('font-weight', 'bold');
			}
		}
	});
</script>

</head>
<body>
<%@ include file="header.jsp"%>
<div class="container">
	<c:forEach items="${statInfo1}" var="s1">
		<c:if test="${not empty s1.avatar}">
			<c:set var="avatar1" value="${s1.avatar}" />
		</c:if>
	</c:forEach>
	<c:forEach items="${statInfo2}" var="s2">
		<c:if test="${not empty s2.avatar}">
			<c:set var="avatar2" value="${s2.avatar}" />
		</c:if>
	</c:forEach>
	
	<div style="margin-left: 30px; margin-right: 30px;">
		<br>
		<form action="compare.do" method="post">
			<input type="hidden" name="nickname1" value="${statInfo1[0].nickname}"> 
			<input type="hidden" name="nickname2" value="${statInfo2[0].nickname}"> 
			<c:if test="${gameServer eq 0}">
				<button type="submit" name="gameServer" value="0" class="btn btn-info">AS</button>
				<button type="submit" name="gameServer" value="1" class="btn btn-primary">KR/JP</button>
			</c:if>
			<c:if test="${gameServer eq 1}">
				<button type="submit" name="gameServer" value="0" class="btn btn-primary">AS</button>
				<button type="submit" name="gameServer" value="1" class="btn btn-info">KR/JP</button>
			</c:if>
		</form>
		<br><hr>
		<div id="top" class="row">
			<div class="col-md-5" align="right" style="color: rgb(45, 121, 172);">
				<b>${statInfo1[0].nickname}</b>&nbsp;&nbsp;
				<img src="${avatar1}" width="60" height="60">
			</div>
			<div class="col-md-2" align="center">
				<label class="control-label" style="font-size: 35px;">VS</label>
			</div>
			<div class="col-md-5" align="left" style="color: rgb(225, 107, 0);">
				<img src="${avatar2}" width="60" height="60">
				&nbsp;&nbsp;<b>${statInfo2[0].nickname}</b>
			</div>
		</div>
		<br><br><br>
		<hr>
		<c:forEach begin="0" end="2" var="i">
			<div class="col-md-4">
				<c:if test="${i%3 eq 0}">
					<h3>SOLO</h3>
				</c:if>
				<c:if test="${i%3 eq 1}">
					<h3>DUO</h3>
				</c:if>
				<c:if test="${i%3 eq 2}">
					<h3>SQUAD</h3>
				</c:if>
				<br>
				<div id="chart${i+1}" align="center">
					<script type="text/javascript">
						var w = 200;
						h = 200;

						var colorscale = d3.scale.category10();

	 					//Legend titles
	 					var LegendOptions = [ '${statInfo1[0].nickname}',
	 							'${statInfo2[0].nickname}' ];

			 			//Data		
	 					var d = [ [ {
	 						axis : "½Â·ü",
	 						value : '${statInfo1[i].win_Ratio*0.01}'
	 					}, {
	 						axis : "K/D",
	 						value : '${statInfo1[i].kill_Death_Ratio*0.03}'
	 					}, {
	 						axis : "Æò±Õµô",
	 						value : '${statInfo1[i].damage_Per_Game*0.001}'
	 					}, {
	 						axis : "»ýÁ¸½Ã°£",
	 						value : '${statInfo1[i].time_Survived_Per_Game*0.0005}'
	 					}, {
	 						axis : "Çìµå¼¦",
	 						value : '${statInfo1[i].headshot_Kill_Ratio}'
	 					}, {
	 						axis : "ÃÖ´ÙÅ³",
	 						value : '${statInfo1[i].round_Most_Kill*0.05}'
	 					} ], [ {
	 						axis : "½Â·ü",
	 						value : '${statInfo2[i].win_Ratio*0.01}'
	 					}, {
			 				axis : "K/D",
	 						value : '${statInfo2[i].kill_Death_Ratio*0.03}'
	 					}, {
			 				axis : "Æò±Õµô",
	 						value : '${statInfo2[i].damage_Per_Game*0.001}'
	 					}, {
	 						axis : "»ýÁ¸½Ã°£",
	 						value : '${statInfo2[i].time_Survived_Per_Game*0.0005}'
	 					}, {
	 						axis : "Çìµå¼¦",
				 			value : '${statInfo2[i].headshot_Kill_Ratio}'
			 			}, {
	 						axis : "ÃÖ´ÙÅ³",
	 						value : '${statInfo2[i].round_Most_Kill*0.05}'
	 					} ] ];

	 					//Options for the Radar chart, other than default
			 			var mycfg = {
	 						w : w,
	 						h : h,
			 				maxValue : 0.6,
	 						levels : 6,
	 						ExtraWidthX : 300
	 					}

	 					//Call function to draw the Radar chart
	 					//Will expect that data is in %'s
	 					RadarChart.draw("#chart${i+1}", d, mycfg);

						////////////////////////////////////////////
						/////////// Initiate legend ////////////////
						////////////////////////////////////////////

						var svg = d3.select('#body').selectAll('svg').append('svg').attr(
								"width", w + 100).attr("height", h)

						//Create the title for the legend
						var text = svg.append("text").attr("class", "title").attr(
								'transform', 'translate(90,0)').attr("x", w - 70).attr("y",
								10).attr("font-size", "12px").attr("fill", "#404040").text(
								"ÅØ½ºÆ®Áö·Õ");

						//Initiate Legend	
						var legend = svg.append("g").attr("class", "legend").attr("height",
								100).attr("width", 200).attr('transform',
								'translate(90,20)');
						//Create colour squares
						legend.selectAll('rect').data(LegendOptions).enter().append("rect")
								.attr("x", w - 65).attr("y", function(d, i) {
									return i * 20;
								}).attr("width", 10).attr("height", 10).style("fill",
										function(d, i) {
											return colorscale(i);
										});
						//Create text next to squares
						legend.selectAll('text').data(LegendOptions).enter().append("text")
								.attr("x", w - 52).attr("y", function(d, i) {
									return i * 20 + 9;
								}).attr("font-size", "11px").attr("fill", "#737373").text(
										function(d) {
											return d;
										});
					</script>
				</div>
				<br> <br>
				<hr>
				<br> <br>
				<div id="table" align="center">
					<table class="table table-bordered">
						<c:if test="${i%3 eq 0}">
							<tr style="background-color: #F34A53">
						</c:if>
						<c:if test="${i%3 eq 1}">
							<tr style="background-color: #FAE3B4">
						</c:if>
						<c:if test="${i%3 eq 2}">
							<tr style="background-color: #AAC789">
						</c:if>
								<th id="rightRow">${statInfo1[0].nickname}</th>
								<th id="centerRow">VS</th>
								<th>${statInfo2[0].nickname}</th>
							</tr>
						<tbody>
							<tr>
								<td id="rightRow">${statInfo1[i].rating}</td>
								<td id="centerRow">·¹ÀÌÆÃ</td>
								<td id="leftRow">${statInfo2[i].rating}</td>
							</tr>
							<tr>
								<td id="rightRow">${statInfo1[i].win_Ratio} %</td>
								<td id="centerRow">½Â·ü</td>
								<td id="leftRow">${statInfo2[i].win_Ratio} %</td>
							</tr>
							<tr>
								<td id="rightRow">${statInfo1[i].top10_Ratio} %</td>
								<td id="centerRow">TOP10</td>
								<td id="leftRow">${statInfo2[i].top10_Ratio} %</td>
							</tr>
							<tr>
								<td id="rightRow">${statInfo1[i].kill_Death_Ratio}</td>
								<td id="centerRow">K/D</td>
								<td id="leftRow">${statInfo2[i].kill_Death_Ratio}</td>
							</tr>
							<tr>
								<td id="rightRow">${statInfo1[i].damage_Per_Game}</td>
								<td id="centerRow">Æò±Õµô</td>
								<td id="leftRow">${statInfo2[i].damage_Per_Game}</td>
							</tr>
							<tr>
								<td id="rightRow">
									<fmt:formatNumber value="${statInfo1[i].headshot_Kill_Ratio*100}" pattern=".0"/>
									 %
								</td>
								<td id="centerRow">Çìµå¼¦</td>
								<td id="leftRow">
									<fmt:formatNumber value="${statInfo2[i].headshot_Kill_Ratio*100}" pattern=".0"/>
									 %
								</td>
							</tr>
							<tr>
								<td id="rightRow">
									<fmt:parseNumber value="${statInfo1[i].time_Survived_Per_Game/60}" integerOnly="true"/>ºÐ 
									<fmt:parseNumber value="${statInfo1[i].time_Survived_Per_Game%60}" integerOnly="true"/>ÃÊ
								</td>
								<td id="centerRow">»ýÁ¸</td>
								<td id="leftRow">
									<fmt:parseNumber value="${statInfo2[i].time_Survived_Per_Game/60}" integerOnly="true"/>ºÐ 
									<fmt:parseNumber value="${statInfo2[i].time_Survived_Per_Game%60}" integerOnly="true"/>ÃÊ
								</td>
							</tr>
							<tr>
								<td id="rightRow">${statInfo1[i].round_Most_Kill}</td>
								<td id="centerRow">ÃÖ´ÙÅ³</td>
								<td id="leftRow">${statInfo2[i].round_Most_Kill}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>