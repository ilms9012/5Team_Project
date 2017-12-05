<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>������</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
body {
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica;
}

#top {
	font: bold;
	font-size: 20px;
	height: 100px;
}

img:hover {
	opacity: 0.3;
}

</style>
<script type="text/javascript">
	$(function() {
		var playerNum = 1;
		// 0�̸� player1�� �ֱ�. 1�̸� player2�� �ֱ�. 2�̸� �� �� ��
		$('#searchBtn').click(function() {
			// ���̵� �˻� ��ư�� ������ ajax�� �����ʻ����ϰ� ���̵� ���翩�� �������� 
			// �����ϸ� �ְ� �̹� �� ���ִٸ�(���̵� 2�� �˻� �� �ؼ� á����) �˻� ���ϰ�
			var searchNick = $('#searchNick').val();
			
			if(playerNum < 3 && searchNick != null) {
				// ���� ���̵� �� �� �Է� ���ϰ�
				if(playerNum == 2 && searchNick == $('#player1').children().text()) {
					alert('���� �ٸ� ���̵� �Է����ּ���!');
				} else {
					$.ajax({
						type : 'post',
						url : 'searchAvatar.do',
						data : 'nickname=' + searchNick,
						dataType : 'text',
						success : function(avatar) {
							if (avatar != 'null') {
								// ������ ���� + ���̵� �ֱ�
								$('#avatar'+playerNum).append('<a href="#"><img src="'+avatar+'" width="60" height="60" title="������ �����˴ϴ�."></a>');
								$('#player'+playerNum).append('<label>'+searchNick+'</label>');
								playerNum++;
							} else {
								alert('���̵� �������� �ʽ��ϴ�. �ٽ� �˻����ּ���.');
							}
						},
						error : function() {
							alert('��Ʋ�׶��� ���̵� �˻� �� ������ �߻��߽��ϴ�.');
						}
					});
				}
			} else {
				alert('���̵� �̹� 2�� �����ϼ̽��ϴ�. ���ϱ� ��ư�� �����ּ���!');
			}
		});
		// �����ʻ��� Ŭ���ϸ� ������ �� �ְ�
		$(document).on('click','img', function(){
			var p = $(this).parent().parent().attr('id');
			$(this).parent().parent().prev().empty();
			$(this).parent().parent().next().empty();
			$(this).parent().parent().empty();
			if(p == 'avatar1' && playerNum == 3){
				// 2 ������ 1�� �Űܾ� ��
				$('#avatar2').children().appendTo('#avatar1');
				$('#player2').children().appendTo('#player1');
			} 
			playerNum--;
		});
		// ���ϱ� ��ư ������ ��
		$('#compareBtn').click(function(){
			if(playerNum == 3){
				var nickname1 = $('#player1').children().text();
				var nickname2 = $('#player2').children().text();
				var gameServer = $('#gameServer').children().text();
				$('#nickname1').attr('value', nickname1);
				$('#nickname2').attr('value', nickname2);
				$('#gameServer').attr('value', 0);
				form.submit();
			} else {
				alert('���̵� �������ּ���!');
				return false;
			}
		});
	});
</script>
</head>
<body>
<%@ include file="header.jsp"%>
	<div class="container">
		<br><br><br><br><br>
		<div id="top" class="row">
			<div class="col-md-5" align="right">
				<span id="player1"></span>&nbsp;&nbsp;
				<span id="avatar1"></span>
				<br>
			</div>
			<div class="col-md-2" align="center" style="padding: 0;">
				<label class="control-label" style="font-size: 35px;">VS</label>
			</div>
			<div class="col-md-5" align="left">
				<span id="avatar2"></span>&nbsp;&nbsp;
				<span id="player2"></span>
				<br>
			</div>
		</div>
		<br><br><br>
		<hr>
		<div align="center">
			<form action="compare.do" method="post" class="form-inline">
				<input type="hidden" name="nickname1" id="nickname1"> 
				<input type="hidden" name="nickname2" id="nickname2"> 
				<input type="hidden" name="gameServer" id="gameServer">
				<div class="form-group">
					<input type="text" id="searchNick" class="form-control"
						placeholder="��Ʋ�׶��� �г����� �Է��ϼ���." size="40px;">
				</div>
				<button type="button" id="searchBtn" class="btn btn-primary">�˻�</button>
				<button id="compareBtn" class="btn btn-primary">��</button>
			</form>
		</div>
	</div>
</body>
</html>