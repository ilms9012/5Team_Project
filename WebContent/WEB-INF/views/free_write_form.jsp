<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>�۾��� ȭ��</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	#view {
 	background-color: #d9edf7;
/* 	background-color: #ff7105;  /* ������ */ */
	}
	
    #writecontainer {
      width: 45%;
      margin: 0 auto;     /* ���η� �߾ӿ� ��ġ */
      padding-top: 10%;   /* �׵θ��� ���� ������ �е� ���� */
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
        <label for="subject">����</label>
        <input type="text" class="form-control" id="subject" name="title" placeholder="������ �Է��ϼ���.">
      </div>
      <div class="form-group">
        <label for=content">����</label>
        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">�ۼ��Ϸ�</button>
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
<!-- 	 		<td>���� : </td> -->
<!-- 	 		<td><input type="text" name="title" size="20"></td> -->
<!-- 	 	</tr> -->
<!-- 	 	<tr> -->
<!-- 	 		<td>���� : </td> -->
<!-- 	 		<td><textarea name="content" rows="20" cols="30"></textarea></td> -->
<!-- 	 	</tr> -->
<!-- 	 	<tr> -->
<!-- 	 		<td><input type="submit" value="�ۼ��Ϸ�"></td> -->
<!-- 	 	</tr> -->
<!-- 	</table> -->