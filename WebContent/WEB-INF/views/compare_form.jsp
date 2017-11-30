<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
	// 아이디 검색 버튼을 누르면 ajax로 스팀프로필하고 아이디 존재여부 가져오기 
	// 존재한다면 첫번째 곳에 넣기 
		$('#searchBtn').click(function(){
		// 이미 꽉 차있다면(아이디 2개 검색 다 해서 찼으면) 검색 못하게
		// 프로필사진 클릭하면 X뜨면서 삭제할 수 있게? 				
			$.ajax({
				type:'post',
				url:'searchId.do', 
				data:'id='+id, 
				dataType:'text',
				success: function(img){
					if(img!=null){
						// 프로필 사진 + 아이디 넣기 
					} else {
						alert('아이디가 존재하지 않습니다. 다시 검색해주세요.');
						}
					},
				error: function(){
					alert('배틀그라운드 아이디 검색 중 에러가 발생했습니다.');
				}
			})
		})
	})
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
</body>
</html>