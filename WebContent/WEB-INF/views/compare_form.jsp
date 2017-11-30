<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>전적비교</title>
<script type="text/javascript">
	$(function(){
		// 0이면 첫번째 div에 넣기. 1이면 두번째 div에 넣기. 2이면 꽉 찬 것
		var divImg = 0;
		$('#searchBtn').click(function(){
		// 아이디 검색 버튼을 누르면 ajax로 스팀프로필하고 아이디 존재여부 가져오기 
		// 존재한다면 첫번째 곳에 넣기 
		// 이미 꽉 차있다면(아이디 2개 검색 다 해서 찼으면) 검색 못하게
		// 프로필사진 클릭하면 X뜨면서 삭제할 수 있게?
			if(divImg < 2){
				$.ajax({
					type:'post',
					url:'searchBgId.do', 
					data:'id='+id, 
					dataType:'text',
					success: function(img){
						if(img!=null){
							// 프로필 사진 + 아이디 넣기 
							divImg++;
						} else {
							alert('아이디가 존재하지 않습니다. 다시 검색해주세요.');
							}
						},
					error: function(){
						alert('배틀그라운드 아이디 검색 중 에러가 발생했습니다.');
					}
				});
			} else {
				alert('아이디 두 개를 이미 선택하셨습니다. 비교하기 버튼을 눌러주세요!');
			}
		});
	});
</script>
</head>
<body>
	<h1 align="center">전적비교</h1>
	<br>
	<br>
	<div id="top" class="row">
		<div class="col-md-5" align="right">
			ABP-532<img src="Penguins.jpg" width="80" height="80"><br>
			2100
		</div>
		<div class="col-md-2" align="center">VS</div>
		<div class="col-md-5" align="left">
			<img src="Penguins.jpg" width="80" height="80"> BUDUU<br>
			2000
		</div>
	</div>
	<a href="compare.do"><button>비교하기</button></a>
</body>
</html>