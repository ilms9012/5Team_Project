<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>�������</title>
<script type="text/javascript">
	window.onload = function(){
		var result = '${result}';
		if(result=='true'){
			alert('�� ������ �Ϸ�Ǿ����ϴ�.');
		}else{
			alert('�� ������ �����Ͽ����ϴ�.');
		}
		location.href="board.do";
	}
</script>
</head>
<body>

</body>
</html>