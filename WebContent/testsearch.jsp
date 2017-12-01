<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="css/skechybootstrap.min.css" rel='stylesheet'
	type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전적검색 결과</title>
<style type="text/css">
#buttons {
	position: relative;
	left: 1000px;
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
		<img id="avatar" src="https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/1c/1c2e2c11bd0bdf34f21a213febf046d283ad62cc.jpg">
	</div>
<p style="text-align: center; font-size: 40px;" "text-primary">ABP-532</p>
	<div id="buttons" class="btn-group" data-toggle="buttons">
		<button type="button" class="btn btn-success">Asia</button>
		<button type="button" class="btn btn-info">KR/JP</button>
	</div>
	<table id="stat-table"
		class="table table-striped table-hover table-bordered">
		<thead class="thead-dark">
			<tr>
				<c:forEach begin="0" end="2" var="i">
					<c:if test="${i eq 0}">
						<th colspan="3">Solo 승 패</th>
					</c:if>
					<c:if test="${i eq 1}">
						<th colspan="3">Duo 승 패</th>
					</c:if>
					<c:if test="${i eq 2}">
						<th colspan="3">Squad 승 패</th>
					</c:if>
				</c:forEach>
			</tr>
		</thead>
		<tbody>
			<tr class="table-active">
				<c:forEach begin="0" end="2">
					<td>asd<br>K/D
					</td>
					<td>asd<br>평균딜량
					</td>
					<td>asd<br>헤드샷 비율
					</td>
				</c:forEach>
			</tr>
			<tr class="table-active">
				<c:forEach begin="0" end="2">
					<td>asd<br>생존시간
					</td>
					<td>asd<br>최다킬
					</td>
					<td>asd<br>TOP10 rate
					</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
</body>
</html>