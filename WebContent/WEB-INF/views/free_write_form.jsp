<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>글쓰기 화면</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	#view {
 	background-color: #d9edf7;
/* 	background-color: #ff7105;  /* 오렌지 */ */
	}
	
    #writecontainer {
      width: 45%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
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
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
  </style>
<body>
<%@ include file="header.jsp" %>

	<div class="container" id="writecontainer">
		<table border="1"
			class="table table-striped table-bordered table-hover">
			<thead>
			<tr align="center" id="view">
				<td colspan="2" id="view"><b>WRITE</b></td>
			</tr>
			</thead>
			</table>
		<form action="freeWrite.do" method="post">
			<div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="subject" name="title" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">작성완료</button>
		</form>
	</div>
	<br>
	<br>
	<br>
	<%@ include file="footer.jsp" %>
</body>
</html>


<!-- <table> -->
<!-- 	 	<tr> -->
<!-- 	 		<td>제목 : </td> -->
<!-- 	 		<td><input type="text" name="title" size="20"></td> -->
<!-- 	 	</tr> -->
<!-- 	 	<tr> -->
<!-- 	 		<td>내용 : </td> -->
<!-- 	 		<td><textarea name="content" rows="20" cols="30"></textarea></td> -->
<!-- 	 	</tr> -->
<!-- 	 	<tr> -->
<!-- 	 		<td><input type="submit" value="작성완료"></td> -->
<!-- 	 	</tr> -->
<!-- 	</table> -->