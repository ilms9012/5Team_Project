<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
<script src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!-- Google Fonts -->
<link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">
	$(function() {
		var filterList = {
			init : function() {
				// MixItUp plugin
				// http://mixitup.io
				$('#portfoliolist').mixitup({
					targetSelector : '.portfolio',
					filterSelector : '.filter',
					effects : [ 'fade' ],
					easing : 'snap',
					// call the hover effect
					onMixEnd : filterList.hoverEffect()
				});
			},

			hoverEffect : function() {
				// Simple parallax effect
				$('#portfoliolist .portfolio').hover(function() {
					$(this).find('.label').stop().animate({
						bottom : 0
					}, 200, 'easeOutQuad');
					$(this).find('img').stop().animate({
						top : -30
					}, 500, 'easeOutQuad');
				}, function() {
					$(this).find('.label').stop().animate({
						bottom : -40
					}, 200, 'easeInQuad');
					$(this).find('img').stop().animate({
						top : 0
					}, 300, 'easeOutQuad');
				});
			}
		};
		// Run the show!
		filterList.init();
	
		$('#loginBtn').click(function(){
			alert('����');
			$('#loginModal .close').click();
			$('#hiddenModal').click();
		})
		
 		// ȸ������ ��ư�� ������ ���� �ߺ�Ȯ���ϰ� ���ο� ���â���� �̵��ϸ鼭 �̸��� ����
		$('#loginModal .join').click(function(){
		    var id = $('#id').val();
		    var password = $('#password').val();
		    var nickName = $('#nickName').val();
			
			if(id==""){
				alert('�̸����� �Է����ּ���.');
			} else if(password==""){
				alert('�н����带 �Է����ּ���.');
			} else if(password != $('#passwordConfirm').val()){
				alert('�н����尡 ���� �ʽ��ϴ�.');
			} else if(nickName==""){
				alert('�г����� �Է����ּ���.');
			} else {
				$.ajax({
					type:'post',
					url:'joinCheck.do', 
					data:'id='+id+'&nickName='+nickName, 
					dataType:'text',
					success: function(check){
						if(check=='idOverlap'){
							alert('�ߺ��� �̸����Դϴ�. �ٸ� �̸��Ϸ� �������ּ���.');
						} else if(check=='nickOverlap'){
							alert('�ߺ��� �г����Դϴ�. �ٸ� �г������� �������ּ���.');
						} else {
							$.ajax({
								type:'post',
								url:'join.do', 
								data:'id='+id+'&password='+password+'&nickName='+nickName, 
								dataType:'text',
								success: function(join){
									alert(join);
									if(join=='true'){
										alert('�ӽ� ȸ������ ����');
										$('#loginModal').modal('hide');
										$('#authModal').modal('show');
									} else {
										alert('�ӽ� ȸ������ ����');
									}
								},
								error: function(){
									alert('�ӽ� ȸ������ �� ������ �߻��߽��ϴ�.');
								}
							})
						}
					},
					error: function(){
						alert('�ߺ�üũ �� ������ �߻��߽��ϴ�.');
					}
				})
			} 
			return false;
		})
	});
</script>

<style type="text/css">

.modal.modal-mystyle { 
	text-align: center; 
} 

@media screen and (min-width: 768px) { 
  .modal.modal-mystyle:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-mystyle {
	width: 25%;
	height: 70%;
	margin: 0;
	padding: 0;
	display: inline-block;
	text-align: left;
 	vertical-align: middle; 
}

.modal-content.modal-mystyle {
	height: auto;
	min-height: 30%;
	border-radius: 0;
}

#kakaoImg {
    display: block;
    width: 100%;
    height: auto;
}

</style>

</head>
<body>
	<div class="header" style="padding-top: 11px; padding-bottom: 11px;">
		<div class="container" style="margin-left: 0; margin-right:0;">
			<div class="logo" style="width: 350px;">
				<a href="index.jsp">
					<img src="images/logo.png" width="54%" height="18%" alt="">
				</a>
			</div>
			<span class="menu"></span>
			<div class="navigation">
				<ul class="navig cl-effect-3">
					<li><a href="#">���</a></li>
					<li><a href="#">��ŷ</a></li>
					<li><a href="#">������</a></li>
					<li><a href="#">����/��</a></li>
					<li><a href="#">�����Խ���</a></li>
				</ul>
				<div class="search-bar">
					<input type="text" placeholder="search" required /> 
					<input type="submit" value="" />
					<a href="#" data-toggle="modal" data-target="#loginModal"><b>�α���</b></a>
				</div>
				<div class="clearfix"></div>
				<script>
					$("span.menu").click(function() {
						$(".navigation").slideToggle("slow", function() {
							// Animation complete.
						});
					});
				</script>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
<!-- loginModal START -->	
	<div class="modal modal-mystyle fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-mystyle">
			<div class="modal-content modal-mystyle">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li role="presentation" class="active">
							<a href="#loginTab" aria-controls="loginTab" role="tab" data-toggle="tab">
								�α���
							</a>
						</li>
						<li role="presentation">
							<a href="#joinTab" aria-controls="joinTab" role="tab" data-toggle="tab">
								ȸ������
							</a>
						</li>
					</ul>
				</div>
				<div class="modal-body">
					<div role="tabpanel">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="loginTab">
<!-- 								<form action="login.do" method="post"> -->
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">�̸���</label>
										<input type="email" class="form-control" id="loginId" name="id">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">�н�����</label>
										<input type="password" class="form-control" id="loginPassword">
									</div>
									<div>
										<input type="submit" value="�α���" class="btn btn-primary btn-block login" id="loginBtn">
										<br>
										<a href="#"><img src="images/kakao.jpg" id="kakaoImg"></a>
									</div>
<!-- 								</form> -->
							</div>
							<div role="tabpanel" class="tab-pane" id="joinTab">
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">�̸���</label>
									<input type="email" class="form-control" id="id" name="id">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">�н�����</label>
									<input type="password" class="form-control" id="password" name="password">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">
										�н����� Ȯ��
									</label> 
									<input type="password" class="form-control" id="passwordConfirm">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">�г���</label>
									<input type="text" class="form-control" id="nickName" name="nickName">
								</div>
								<div>
									<button class="btn btn-primary btn-block join">ȸ������</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- loginModal END -->
	<input type="hidden" data-toggle="modal" data-target="#authModal" id="hiddenModal">
<!-- authModeal START -->
	<div class="modal modal-mystyle fade" id="authModal" tabindex="-1" role="dialog"
		aria-labelledby="authModealLabel" aria-hidden="true">
		<div class="modal-dialog modal-mystyle">
			<div class="modal-content modal-mystyle">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<label for="recipient-name" class="col-form-label">�̸��� ����</label>
				</div>
				<div class="modal-body">
					<form action="auth.do" method="post">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">�̸���</label>
							<input type="email" class="form-control" id="id" value="blausues@gmail.com" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">������ȣ</label>
							<input type="password" class="form-control" id="authNum" placeholder="���Ϸ� �� ������ȣ�� ���ּ���.">
						</div>
						<div>
							<input type="submit" value="����Ȯ��" class="btn btn-primary btn-block auth">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- authModeal END -->
</body>
</html>