<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�Խ��� ���</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	#container {
  		padding-right: 15px;
		padding-left: 15px;
 		margin-right: auto;
 		margin-left: auto;
	}

    #boardcontainer {
      width: 80%;
      margin: 0 auto;     /* ���η� �߾ӿ� ��ġ */
      padding-top: 10%;   /* �׵θ��� ���� ������ �е� ���� */
    }
    
    #view {
 		background-color: #d9edf7; 
/* 		background-color: #ff7105; */
	}

	#left {
/* 		background-color: #EAEAEA; */
		background-color: #E1E1E1;
	}
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap ���� */
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
      /* �� �Ӽ����� �� �ٷ� ǥ���ϱ� */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* �ִϸ��̼� ���� �����ϱ� */
    /* �ͽ��÷η� 10 �̻�, �ֽ� ��� ���������� ���� */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="contatiner">
<div id="boardcontainer">
	<table class="table table-striped table-bordered table-hover">
		<tr align="center">
				<td colspan="6" id="view"><b>����/�� ���</b></td>
				</tr>
		<tr id="left">
			<td align="center" ><b>�۹�ȣ</b></td>
			<td align="center"><b>����</b></td>
			<td align="center"><b>�ۼ���</b></td>
			<td align="center"><b>�ۼ���</b></td>
			<td align="center"><b>��ȸ��</b></td>
			<td align="center"><b>��õ��</b></td>
		</tr>
		<c:if test="${empty boardPage.boardList}">
			<tr>
				<td colspan="6">�ۼ��� �Խñ��� �������� �ʽ��ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${not empty boardPage.boardList}">
			<c:forEach items="${boardPage.boardList}" var="boardVO">
				<tr>
					<td>${boardVO.boardNum}</td>
					<td><a href="read.do?boardNum=${boardVO.boardNum}">
							${boardVO.title} <c:if test="${boardVO.replyCount > 0}">
								<span style="color: #ff7105; font-size: 15;">[${boardVO.replyCount}] 
								</span>
							</c:if>
							<c:if test="${boardVO.hit>=10}">
                  <span class="hit"> ��õ!</span>
                </c:if>
					</a></td>
					<td>${boardVO.writer}</td>
					<td><fmt:formatDate value="${boardVO.writeDate}" type="both"
							dateStyle="short" timeStyle="short" /></td>
					<td>${boardVO.readCount}</td>
					<td>${boardVO.hit}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br>
	 <div id="paging">
		<!-- 	�ϴ� ������ ��ũ �κ� -->
			<c:forEach begin="${boardPage.startPage}" end="${boardPage.endPage}"
				var="p" step="1">
				<a href="board.do?page=${p}">${p} </a>
			</c:forEach>
	</div>
	<div id="write">
	<a href="writeForm.do"><button type="button" class="btn btn-info">�۾���</button></a>
	</div>
	</div>
	</div>
	<br>
	<br>
	<%@ include file="footer.jsp" %>
</body>
</html>