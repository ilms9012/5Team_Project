<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap2.min.css" rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전적검색 결과</title>
</head>
<body>
	<div class="card text-white bg-dark">
		<div class="card-body">
			<blockquote class="card-blockquote">
				      <p>${statInfo[0].nickname}</p>
				      <p>${statInfo[0].rating}
			</blockquote>
		</div>
	</div>
	<h2>결과</h2>
	<c:forEach items="${statInfo}" begin="0" end="2" var="statInfo">
			${statInfo.rating}
	</c:forEach>
</body>
</html>