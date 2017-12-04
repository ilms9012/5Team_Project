<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="css/skechybootstrap.min.css" rel='stylesheet'
	type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����˻� ���</title>
<style type="text/css">
#buttons {
	position: relative;
	left: 1100px;
	padding: 2px;
}

#stat-table {
	width: 90%;
	margin: auto;
}

#avatar-div {
	margin-left: 47%;
}

#avatar {
	width: 80px;
	height: 80px;
}
</style>
</head>
<body>
	<div id="avatar-div">
		<img id="avatar" src="${statInfo[0].avatar}">
	</div>
	<p style="text-align: center; font-size: 40px;""text-primary">${statInfo[0].nickname}</p>
	<div id="buttons" class="btn-group" data-toggle="buttons" >
		<button type="button" class="btn btn-success">Asia</button>
		<button type="button" class="btn btn-info">KR/JP</button>
	</div>
	<div></div>
	<c:forEach begin="0" end="2" var="i">
		<div
			style="float: left; width: 33%; padding: 2px;">
			<table id="stat-table"
				class="table table-striped table-hover table-bordered">
				<thead class="thead-dark">
					<tr>
						<c:if test="${i eq 0}">
							<th colspan="3">Solo ${statInfo[i+serverMode].wins}�� ${statInfo[i+serverMode].losses}�� �·�${statInfo[i+serverMode].win_Ratio}</th>
						</c:if>
						<c:if test="${i eq 1}">
							<th colspan="3">Duo ${statInfo[i+serverMode].wins}�� ${statInfo[i+serverMode].losses}�� �·�${statInfo[i+serverMode].win_Ratio}</th>
						</c:if>
						<c:if test="${i eq 2}">
							<th colspan="3">Squad ${statInfo[i+serverMode].wins}�� ${statInfo[i+serverMode].losses}�� �·�${statInfo[i+serverMode].win_Ratio}</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<tr class="table-active">
						<td>${statInfo[i+serverMode].kill_Death_Ratio}<br>K/D
						</td>
						<td>${statInfo[i+serverMode].damage_Per_Game}<br>��յ���
						</td>
						<td>${statInfo[i+serverMode].headshot_Kill_Ratio}<br>��弦
							����
						</td>
					</tr>
					<tr class="table-active">
						<td>${statInfo[i+serverMode].time_Survived_Per_Game}<br>�����ð�
						</td>
						<td>${statInfo[i+serverMode].round_Most_Kill}<br>�ִ�ų
						</td>
						<td>${statInfo[i+serverMode].top10_Ratio}<br>TOP10 rate
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</c:forEach>
</body>
</html>