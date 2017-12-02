<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>������</title>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
body {
	overflow: auto;
	margin: 0 auto;
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica;
}

#top {
	font: bold;
	font-size: 20px;
}
img:hover{
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
								$('#avatar'+playerNum).append('<img src="'+avatar+'" width="60" height="60">');
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
			var p = $(this).parent().attr('id');
			$(this).parent().next().empty();
			$(this).parent().empty();
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
			}
		});
	});
</script>
</head>
<body>
	<h1 align="center">������</h1>
	<br>
	<br>
	<input type="text" id="searchNick"><button id="searchBtn">�˻�</button>
	<div id="top" class="row">
		<div class="col-md-5" align="right">
			<div id="avatar1"></div>
			<div id="player1"></div>
			<br>
		</div>
		<div class="col-md-2" align="center">VS</div>
		<div class="col-md-5" align="left">
			<div id="avatar2"></div>
			<div id="player2"></div>
			<br>
		</div>
	</div>
	<form action="compare.do" method="post">
		<input type="hidden" name="nickname1" id="nickname1">
		<input type="hidden" name="nickname2" id="nickname2">
		<input type="hidden" name="gameServer" id="gameServer">
		<button id="compareBtn">���ϱ�</button>
	</form>
</body>
</html>