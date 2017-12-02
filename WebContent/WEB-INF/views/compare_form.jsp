<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>전적비교</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
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
		// 0이면 player1에 넣기. 1이면 player2에 넣기. 2이면 꽉 찬 것
		$('#searchBtn').click(function() {
			// 아이디 검색 버튼을 누르면 ajax로 프로필사진하고 아이디 존재여부 가져오기 
			// 존재하면 넣고 이미 꽉 차있다면(아이디 2개 검색 다 해서 찼으면) 검색 못하게
			
			var searchNick = $('#searchNick').val();
			
			if(playerNum < 3 && searchNick != null) {
				// 같은 아이디 두 번 입력 못하게
				if(playerNum == 2 && searchNick == $('#player1').children().text()) {
					alert('비교할 다른 아이디를 입력해주세요!');
				} else {
					$.ajax({
						type : 'post',
						url : 'searchAvatar.do',
						data : 'nickname=' + searchNick,
						dataType : 'text',
						success : function(avatar) {
							if (avatar != 'null') {
								// 프로필 사진 + 아이디 넣기
								$('#avatar'+playerNum).append('<img src="'+avatar+'" width="60" height="60">');
								$('#player'+playerNum).append('<label>'+searchNick+'</label>');
								playerNum++;
							} else {
								alert('아이디가 존재하지 않습니다. 다시 검색해주세요.');
							}
						},
						error : function() {
							alert('배틀그라운드 아이디 검색 중 에러가 발생했습니다.');
						}
					});
				}
			} else {
				alert('아이디 이미 2개 선택하셨습니다. 비교하기 버튼을 눌러주세요!');
			}
		});
		// 프로필사진 클릭하면 삭제할 수 있게
		$(document).on('click','img', function(){
			var p = $(this).parent().attr('id');
			$(this).parent().next().empty();
			$(this).parent().empty();
			if(p == 'avatar1' && playerNum == 3){
				// 2 값들을 1로 옮겨야 함
				$('#avatar2').children().appendTo('#avatar1');
				$('#player2').children().appendTo('#player1');
			} 
			playerNum--;
		});
		// 비교하기 버튼 눌렀을 때
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
				alert('아이디를 선택해주세요!');
			}
		});
	});
</script>
</head>
<body>
	<h1 align="center">전적비교</h1>
	<br>
	<br>
	<input type="text" id="searchNick"><button id="searchBtn">검색</button>
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
		<button id="compareBtn">비교하기</button>
	</form>
</body>
</html>