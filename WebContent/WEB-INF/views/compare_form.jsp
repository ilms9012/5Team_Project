<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>������</title>
<script type="text/javascript">
	$(function(){
		// 0�̸� ù��° div�� �ֱ�. 1�̸� �ι�° div�� �ֱ�. 2�̸� �� �� ��
		var divImg = 0;
		$('#searchBtn').click(function(){
		// ���̵� �˻� ��ư�� ������ ajax�� �����������ϰ� ���̵� ���翩�� �������� 
		// �����Ѵٸ� ù��° ���� �ֱ� 
		// �̹� �� ���ִٸ�(���̵� 2�� �˻� �� �ؼ� á����) �˻� ���ϰ�
		// �����ʻ��� Ŭ���ϸ� X�߸鼭 ������ �� �ְ�?
			if(divImg < 2){
				$.ajax({
					type:'post',
					url:'searchBgId.do', 
					data:'id='+id, 
					dataType:'text',
					success: function(img){
						if(img!=null){
							// ������ ���� + ���̵� �ֱ� 
							divImg++;
						} else {
							alert('���̵� �������� �ʽ��ϴ�. �ٽ� �˻����ּ���.');
							}
						},
					error: function(){
						alert('��Ʋ�׶��� ���̵� �˻� �� ������ �߻��߽��ϴ�.');
					}
				});
			} else {
				alert('���̵� �� ���� �̹� �����ϼ̽��ϴ�. ���ϱ� ��ư�� �����ּ���!');
			}
		});
	});
</script>
</head>
<body>
	<h1 align="center">������</h1>
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
	<a href="compare.do"><button>���ϱ�</button></a>
</body>
</html>