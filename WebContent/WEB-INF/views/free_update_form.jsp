<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>수정하기 화면</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	#view {
	background-color: #d9edf7;
	/* 	background-color: #ff7105;  /* 오렌지 */
	*/
}

#updatecontainer {
	width: 45%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */
}

#list {
	text-align: center;
}

#write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: #b3c6ff;
}

.table>thead>tr>th {
	text-align: center;
}

.table-hover>tbody>tr:hover {
	background-color: #e6ecff;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
	/* 위 속성들을 한 줄로 표기하기 */
	/* -webkit-animation: blink 1.5s ease infinite; */
}

/* 애니메이션 지점 설정하기 */
/* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
@
keyframes blink {
	from {color: white;
}

30%
{
color
:
 
yellow
;
}
to {
	color: red;
	font-weight: bold;
}
/* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
}
  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container" id="updatecontainer">
<table border="1"
			class="table table-striped table-bordered table-hover">
			<thead>
			<tr align="center" id="view">
				<td colspan="2" id="view"><b>UPDATE</b></td>
			</tr>
			</thead>
			</table>
<form action="freeUpdate.do" method="post">
		<div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="subject" name="title" value="${original.title}">
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3">${original.content}</textarea>
      </div>
      <input type="hidden" name="boardNum" value="${original.boardNum}">
      <button type="submit" class="btn btn-primary">수정완료</button>
		</form>
	</div>
</form>
</div>
<br>
<br>
<br>
<%@ include file="footer.jsp" %>
</body>
</html>