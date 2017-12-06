<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>글내용 확인</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
#comments1 {
	width: 80%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; 
}

#view {
 	background-color: #d9edf7;
/* 	background-color: #ff7105;  /* 오렌지 */ */
}

#left {
/* 	background-color: #EAEAEA; */
	background-color: #E1E1E1;
}

#alert {
	width: 70%;
	margin: 0 auto;
}

#readcontainer {
	width: 60%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	padding-top: 10%; 
}
#write {
      text-align: right;
    }
</style>
<script type="text/javascript">
	function del_func() {
		var result = confirm('글을 삭제할까요?');
		if (result == true) {
			location.href = "freeDelete.do?boardNum=${board.boardNum}";
			return true;
		}
		return false
	}

	function reply_del_func(replyNum) {
		var result = confirm('댓글을 삭제할까요?');
		if (result == true) {
			location.href = "freeReplyDelete.do?replyNum=" + replyNum;
			return true;
		}
		return false
	}

	$(function() {
		$("#btnReply").click(function() {
			var content = $("#content").val();
			var boardNum = "${board.boardNum}"
			var param = "content=" + content + "&boardNum=" + boardNum;
			$.ajax({
				type : "post",
				url : "freeReply.do",
				data : param,
				dataType : 'text',
				success : function(result) {
					location.href = "freeReply.do?boardNum=" + boardNum;
				},
				error : function() {
					alert('댓글 등록');
					location.href = "freeRead.do?boardNum=" + boardNum;
				}
			});
			return false;
		});
	})
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<div id="readcontainer">
		<table border="1"
			class="table table-striped table-bordered table-hover">
			<thead>
			<tr align="center" id="view">
				<td colspan="2" id="view"><b>VIEW</b></td>
			</tr>
			</thead>
			<tr>
				<th id="left">제목</th>
				<td>${board.title}</td>
			</tr>
			<tr>
				<th id="left">작성자</th>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<th id="left">조회수</th>
				<td>${board.readCount}</td>
			</tr>
			<tr>
				<th id="left">작성일시</th>
				<td>${board.writeDate}</td>
			</tr>
			<tr>
				<th id="left">내용</th>
				<td>${board.content}</td>
			</tr>
			<tr>
				<th id="left">추천수</th>
				<td>${board.hit}</td>
			</tr>
		</table>
		<p align="center">
			<a href="freeBoard.do"><button type="button" class="btn btn-info">목록</button></a>
			&nbsp;&nbsp;
			<c:if test="${sessionScope.loginNick == board.writer}">
				<a href="freeUpdateForm.do?boardNum=${board.boardNum}"
					class="btn btn-info">수정</a>
		&nbsp;&nbsp;
		<a onclick="del_func()" href="#" class="btn btn-info">삭제</a>
			</c:if>
			<c:if test="${sessionScope.loginNick != board.writer}">
				<a href="freeRecommendForm.do?boardNum=${board.boardNum}" class="btn btn-info">추천</a>
			</c:if>
		</p>
		<div class="comments1" id="comments1">
			<div class="well">
				<h4>COMMENT</h4>
				<form>
					<div class="form-group">
						<textarea class="form-control" rows="3" name="content"
							id="content"></textarea>
					</div>
					<button type="submit" class="btn btn-primary" id="btnReply">댓글
						등록</button>
				</form>
			</div>
			<hr>
		</div>

		<!-- 	============================================================= -->
		<br>
		
		<c:if test="${not empty freeReplyPage.boardList}">
			<table border="1"
			class="table table-striped table-bordered table-hover">
			<tr align="center">
				<td colspan="2"><b>댓글 목록</b></td>
			</tr>
			</table>
			<c:forEach items="${freeReplyPage.boardList}" var="replyVO">
					<h4>ID : <strong>[ ${replyVO.writer} ]</strong></h4>
					<div class="alert alert-info" id="alert">
	    			→ ${replyVO.content}&nbsp;&nbsp;&nbsp;
	    			<c:if test="${sessionScope.loginNick == replyVO.writer}">
	    					<input type="hidden" name="replyNum" id="replyNum">
							<a onclick="reply_del_func(${replyVO.replyNum})" href="#" class="btn btn-info">삭제</a>
					</c:if>
					</div>
					<br>
			</c:forEach>
			<br>
			<br>
			<br>
			<center>
				<div id="paging">
					<font size="4">
					<c:forEach
							begin="${freeReplyPage.startPage}" end="${freeReplyPage.endPage}" var="p"
							step="1">
							<c:if test="${freeReplyPage.currentPage == p}">${p}</c:if>
							<c:if test="${freeReplyPage.currentPage != p}">
								<a href="freeRead.do?boardNum=${board.boardNum}&page=${p}">${p}
								</a>
							</c:if>
						</c:forEach>
					</font>
				</div>
			</center>
			<br>
			<br>
		</c:if>


	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>