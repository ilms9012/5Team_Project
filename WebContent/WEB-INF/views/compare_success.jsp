<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>������</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

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
          position: relative;
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
		// ���� �� ������ ��ĥ��ĥ~
		for(var i=1; i<23; i+=3){
			var left = $('td:eq('+(i-1)+')').text();
			var right = $('td:eq('+(i+1)+')').text();
			alert(left + '/' + right);
			if(left > right) {
				$('td:eq('+(i-1)+')').css('background', 'mistyrose');
			} else {
				$('td:eq('+(i+1)+')').css('background', 'mistyrose');
			}
		}
	});
</script>

</head>
<body>
<!-- ����, ��� ����!!!!!!!! ajax�� ���ص� �ɵ�? -->
	<h1 align="center">������</h1>
	<br>
	<br>
	<div id="top" class="row">
		<div class="col-md-5" align="right">
			ABP-532<img src="Penguins.jpg" width="80" height="80"><br>
			2100
		</div>
		<div class="col-md-2" align="center">VS</div>
		<div class="col-md-5" align="left">
			<img src="Penguins.jpg" width="80" height="80"> BUDUU<br>
			2000
		</div>
	</div>
	<br>
	<hr>
	<div id="body" align="center">
		<div id="chart"></div>
	</div>
	<script type="text/javascript" src="js/script.js"></script>
	<br>
	<br>
	<hr>
	<br>
	<br>
	<div id="table" align="center">

		<table class="table table-hover table-bordered" style="width: 50%;">
			<thead class="thead-dark">
				<tr>
					<th id="rightRow">ABP-532</th>
					<th id="centerRow">VS</th>
					<th>BUDUU</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="rightRow">2100</td>
					<td id="centerRow">������</td>
					<td id="leftRow">2000</td>
				</tr>
				<tr>
					<td id="rightRow">10%</td>
					<td id="centerRow">�·�</td>
					<td id="leftRow">8%</td>
				</tr>
				<tr>
					<td id="rightRow">33%</td>
					<td id="centerRow">TOP10 ratio</td>
					<td id="leftRow">47%</td>
				</tr>
				<tr>
					<td id="rightRow">3.5</td>
					<td id="centerRow">K/D</td>
					<td id="leftRow">2.0</td>
				</tr>
				<tr>
					<td id="rightRow">350</td>
					<td id="centerRow">��յ�</td>
					<td id="leftRow">200</td>
				</tr>
				<tr>
					<td id="rightRow">10%</td>
					<td id="centerRow">��弦</td>
					<td id="leftRow">15%</td>
				</tr>
				<tr>
					<td id="rightRow">14�� 22��</td>
					<td id="centerRow">�����ð�</td>
					<td id="leftRow">16�� 30��</td>
				</tr>
				<tr>
					<td id="rightRow">11</td>
					<td id="centerRow">�ִ�ų</td>
					<td id="leftRow">8</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>