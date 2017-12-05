<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>전적비교</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
								$('#avatar'+playerNum).append('<a href="#"><img src="'+avatar+'" width="60" height="60" title="누르면 삭제됩니다."></a>');
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
			var p = $(this).parent().parent().attr('id');
			$(this).parent().parent().prev().empty();
			$(this).parent().parent().next().empty();
			$(this).parent().parent().empty();
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
						placeholder="배틀그라운드 닉네임을 입력하세요." size="40px;">
				</div>
				<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
				<button id="compareBtn" class="btn btn-primary">비교</button>
			</form>
		</div>
	</div>
</body>
</html>