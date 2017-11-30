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
		// 0�̸� player1�� �ֱ�. 1�̸� player2�� �ֱ�. 2�̸� �� �� ��
		var playerNum = 1;
		$('#searchBtn').click(function() {
			// ���̵� �˻� ��ư�� ������ ajax�� �����ʻ����ϰ� ���̵� ���翩�� �������� 
			// �����ϸ� �ְ� �̹� �� ���ִٸ�(���̵� 2�� �˻� �� �ؼ� á����) �˻� ���ϰ�
			var nickname = $('#nickname').val();
			if (playerNum < 3 && nickname != null) {
				$.ajax({
					type : 'post',
					url : 'searchAvatar.do',
					data : 'nickname=' + nickname,
					dataType : 'text',
					success : function(avatar) {
						alert(avatar);
						if (avatar != 'null') {
							// ������ ���� + ���̵� �ֱ�
							alert('����!');
							$('#avatar'+playerNum).append('<img src="'+avatar+'" width="60" height="60">');
							$('#nickname'+playerNum).append('<label>'+nickname+'</label>');
							playerNum++;
						} else {
							alert('���̵� �������� �ʽ��ϴ�. �ٽ� �˻����ּ���.');
						}
					},
					error : function() {
						alert('��Ʋ�׶��� ���̵� �˻� �� ������ �߻��߽��ϴ�.');
					}
				});
			} else {
				alert('���̵� �� ���� �̹� �����ϼ̽��ϴ�. ���ϱ� ��ư�� �����ּ���!');
			}
		});
		// �����ʻ��� Ŭ���ϸ� ������ �� �ְ�
		$(document).on('mouseover', 'img', function(){
			$('img').click(function(){
				var p = $(this).parent().attr('id');
				$(this).parent().next().empty();
				$(this).parent().empty();
				if(p == 'avatar1' && playerNum == 3){
					// 2 ������ 1�� �Űܾ� ��
					alert($('#avatar2').children().html());
					$('#avatar1').append("$('#avatar2').children().html()");
					$('#nickname1').append("$('#nickname2').children().html()");
					$('#avatar2').children().empty();
					$('#nickname2').children().empty();
				}
				playerNum--;
			});
		});
	});
</script>
</head>
<body>
	<h1 align="center">������</h1>
	<br>
	<br>
	<input type="text" id="nickname"><button id="searchBtn">�˻�</button>
	<div id="top" class="row">
		<div class="col-md-5" align="right">
			<div id="avatar1"></div>
			<div id="nickname1"></div>
			<br>
		</div>
		<div class="col-md-2" align="center">VS</div>
		<div class="col-md-5" align="left" id="player2">
			<div id="avatar2"></div>
			<div id="nickname2"></div>
			<br>
		</div>
	</div>
	<a href="compare.do"><button>���ϱ�</button></a>
</body>
</html>