<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전적검색 결과</title>
<style type="text/css">
#buttons {
	position: relative;
	left: 1100px;
	padding: 2px;
}

#stat-table {
	width: 90%;
	margin: auto;
	text-align: center;
}

#avatar-div {
	margin-left: 47%;
}

#avatar {
	width: 80px;
	height: 80px;
}
#update-button {
	margin: auto;
}
#thead{
	text-align: center;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		for(var i=1;i<7;i++){
			
			
		}
	})
	
</script>
</head>
<body>
<%@ include file="header.jsp"%>
	<div id="avatar-div">
		<img id="avatar" src="${statInfo[0].avatar}">
	</div>
	<p style="text-align: center; font-size: 40px;">${statInfo[0].nickname}</p>
	<form action="update.do">
	<button id="update-button" type="submit" name="nickname" value="${statInfo[0].nickname}">전적갱신</button>
	</form>
	<div id="buttons" class="btn-group" data-toggle="buttons">
		<form action="DBSearch.do">
			<button type="submit" name="serverMode" value="0"
				class="btn btn-success">Asia</button>
			<button type="submit" name="serverMode" value="3"
				class="btn btn-info">KR/JP</button>
			<input type="hidden" name="nickname" value="${statInfo[0].nickname}">	
		</form>
	</div>
	<div></div>
	<c:forEach begin="0" end="2" var="i">
		<div style="float: left; width: 33%; padding: 2px;">
			<table id="stat-table"
				class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<c:if test="${i eq 0}" >
							<th colspan="3" style="background-color: #F34A53;text-align: center;">Solo ${statInfo[i+serverMode].wins}승
								${statInfo[i+serverMode].losses}패
								승률${statInfo[i+serverMode].win_Ratio}%</th>
						</c:if>
						<c:if test="${i eq 1}">
							<th colspan="3" style="background-color: #FAE3B4;text-align: center;">Duo ${statInfo[i+serverMode].wins}승
								${statInfo[i+serverMode].losses}패
								승률${statInfo[i+serverMode].win_Ratio}%</th>
						</c:if>
						<c:if test="${i eq 2}">
							<th colspan="3" style="background-color: #AAC789;text-align: center;">Squad ${statInfo[i+serverMode].wins}승
								${statInfo[i+serverMode].losses}패
								승률${statInfo[i+serverMode].win_Ratio}%</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<tr class="table-active">
						<td><strong>${statInfo[i+serverMode].kill_Death_Ratio}</strong><br>K/D
						</td>
						<td><strong><fmt:parseNumber value="${statInfo[i+serverMode].damage_Per_Game}" integerOnly="true"/></strong><br>평균딜량
						</td>
						<td><strong><fmt:formatNumber value="${statInfo[i+serverMode].headshot_Kill_Ratio*100}" pattern=".0"/>%</strong><br>헤드샷비율
						</td>
					</tr>
					<tr class="table-active">
						<td><strong><fmt:parseNumber value="${statInfo[i+serverMode].time_Survived_Per_Game/60}" integerOnly="true"/>분</strong><br><strong>평균 생존시간</strong>
						</td>
						<td><strong>${statInfo[i+serverMode].round_Most_Kill}</strong><br><strong>최다킬</strong>
						</td>
						<td><strong><fmt:formatNumber value="${statInfo[i+serverMode].top10_Ratio}" pattern=".0"/>%</strong><br><strong>TOP10 rate</strong>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</c:forEach>
</body>
</html>