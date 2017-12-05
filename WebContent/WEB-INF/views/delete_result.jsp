<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>삭제결과</title>
<script type="text/javascript">
	window.onload = function(){
		var result = '${result}';
		if(result=='true'){
			alert('글 삭제가 완료되었습니다.');
		}else{
			alert('글 삭제가 실패하였습니다.');
		}
		location.href="board.do";
	}
</script>
</head>
<body>

</body>
</html>