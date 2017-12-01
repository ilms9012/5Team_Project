<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
	var kakaoAuth;
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
		
		Kakao.init('331aad78e1d25a226f305f41ebe4b7e2');
		
 		// ȸ������ ��ư�� ������ ���� �ߺ�Ȯ���ϰ� ���ο� ���â���� �̵��ϸ鼭 �̸��� ����
		$('#loginModal .join').click(function(){
		    var id = $('#id').val();
		    var password = $('#password').val();
		    var nickName = $('#nickName').val();
			
			if(id==""){
				alert('�̸����� �Է����ּ���.');
			} else if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{10,12}$/.test(password)){
				alert('�н������ 10~12�ڸ��� ����ؾ� �մϴ�.');
			} else if(password != $('#passwordConfirm').val()){
				alert('�н����尡 ���� �ʽ��ϴ�.');
			} else if(nickName==""){
				alert('�г����� �Է����ּ���.');
			} else {
				$.ajax({
					type:'post',
					url:'join.do', 
					data:'id='+id+'&password='+password+'&nickName='+nickName, 
					dataType:'text',
					success: function(check){
						if(check=='idOverlap'){
							alert('�ߺ��� �̸����Դϴ�. �ٸ� �̸��Ϸ� �������ּ���.');
						} else if(check=='nickOverlap'){
							alert('�ߺ��� �г����Դϴ�. �ٸ� �г������� �������ּ���.');
						} else if(check=='true'){
							alert('�ӽ� ȸ������ ����');
							$('#loginModal .close').click();
							$('#hiddenModal').click();
						} else {
							alert('�ӽ� ȸ������ ����');
						}
					},
					error: function(){
						alert('�ӽ� ȸ������ �� ������ �߻��߽��ϴ�.');
					}
				})
			}
		}); 
			
		$('#kakaoModal .join').click(function(){
		    var id = $('#kakaoId').val();
		    var nickName = $('#kakaoNick').val();
			alert(auth);
			if(nickName==""){
				alert('�г����� �Է����ּ���.');
			} else {
				$.ajax({
					type:'post',
					url:'kakaoJoin.do', 
					data:'id='+id+'&nickName='+nickName+'&auth='+kakaoAuth, 
					dataType:'text',
					success: function(check){
						if(check=='idOverlap'){
							alert('�ߺ��� �̸����Դϴ�. �ٸ� �̸��Ϸ� �������ּ���.');
						} else if(check=='nickOverlap'){
							alert('�ߺ��� �г����Դϴ�. �ٸ� �г������� �������ּ���.');
						} else if(check=='true'){
							alert('ȸ������ ����');
							location.href="/";
						} else {
							alert('ȸ������ ����');
						}
					},
					error: function(){
						alert('ȸ������ �� ������ �߻��߽��ϴ�.');
					}
				})
			}
		}); 
		
		$('#authModal .send').click(function(){
			// ���� �̸��� ������
			var id = $('#id').val();
			$.ajax({
				type:'post',
				url:'sendMail.do', 
				data:'id='+id, 
				dataType:'text',
				success: function(send){
					if(send=='true'){
						alert('�Է��Ͻ� �̸��Ϸ� ���� ������ �߼��߽��ϴ�.');
					} else {
						alert('���� ���� �߼��� �����߽��ϴ�.');
						}
					},
				error: function(){
					alert('���� ���� �߼� �� ������ �߻��߽��ϴ�.');
				}
			})
		})
			
		$('#authModal .auth').click(function(){
			// ���� �ڵ� üũ �� ��ġ�ϸ� auth = true �� ����
			var id = $('#id').val();
			var authNum = $('#authNum').val();
			$.ajax({
				type:'post',
				url:'checkAuthNum.do', 
				data:'id='+id+'&authNum='+authNum, 
				dataType:'text',
				success: function(check){
					if(check=='true'){
						alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
						location.href="/";
					} else {
						alert('�����ڵ尡 ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���.');
						}
					},
				error: function(){
					alert('���� �ڵ� üũ �� ������ �߻��߽��ϴ�.');
				}
			})
		})
		return false;
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

#kakaoLogin {
    display: block;
    width: 100%;
    height: auto;
}

</style>

</head>
<body>
	<div class="header" style="padding-top: 11px; padding-bottom: 11px;">
		<div class="container" style="margin-left: 0; margin-right: 0;">
			<div class="logo" style="width: 350px;">
				<a href="index.jsp"> <img src="images/logo.png" width="54%"
					height="18%" alt="">
				</a>
			</div>
			<span class="menu"></span>
			<div class="navigation">
				<ul class="navig cl-effect-3">
					<li><a href="#">���</a></li>
					<li><a href="#">��ŷ</a></li>
					<li><a href="compareForm.do">������</a></li>
					<li><a href="#">����/��</a></li>
					<li><a href="#">�����Խ���</a></li>
				</ul>
				<div class="search-bar">
					<input type="text" placeholder="search" required /> 
					<input type="submit" value="" /> 
					<c:if test="${empty loginId}">
						<a href="#" data-toggle="modal" data-target="#loginModal">
							<b>�α���</b>
						</a>
					</c:if>
					<c:if test="${not empty loginId}">
						<b style="color: white;">${loginId} ��</b>
						<a href="javascript:logoutWithKakao()">
							<b>�α׾ƿ�</b>
						</a>
						<script type="text/javascript">
							function logoutWithKakao() {
								Kakao.Auth.logout(function() {
									setTimeout(function() {
										location.href="logout.do";
									}, 100);
								});
							}
						</script>
					</c:if>
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
	<div class="modal modal-mystyle fade" id="loginModal" tabindex="-1"
		role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-mystyle">
			<div class="modal-content modal-mystyle">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li role="presentation" class="active"><a href="#loginTab"
							aria-controls="loginTab" role="tab" data-toggle="tab"> �α��� </a></li>
						<li role="presentation"><a href="#joinTab"
							aria-controls="joinTab" role="tab" data-toggle="tab"> ȸ������ </a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div role="tabpanel">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="loginTab">
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">�̸���</label>
									<input type="email" class="form-control" id="loginId" name="id">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">�н�����</label> <input
										type="password" class="form-control" id="loginPassword">
								</div>
								<div>
									<input type="submit" value="�α���" class="btn btn-primary btn-block login" id="loginBtn">
									<br> 
									<a href="javascript:loginWithKakao()"> 
										<img src="images/kakao.jpg" id="kakaoLogin">
									</a>
									<script type="text/javascript">
							    		// �α��� â�� ���ϴ�.
							    		function loginWithKakao() {
							      			Kakao.Auth.login({
     											success: function(authObj) {
     												$('#kakaoLogin').replaceWith
     												('<button class="btn btn-lg" style="background: rgb(255, 235, 0); '+
     												'border-color: rgb(255, 235, 0); '+
     												'color: rgb(60, 30, 30); display: block; width: 100%;">'+
     												'<i class="fa fa-spinner fa-spin"></i> <b>Loading<b></button>');
     												Kakao.API.request({
     													url: '/v1/user/me',
     											        success: function(res) {
     											    	   	$.ajax({
     	     													type:'post',
     	     													url:'kakaoLogin.do', 
     	     													data: 'info='+JSON.stringify(res), 
     	     													dataType:'json',
     	     													success: function(rs) {
     	     														kakaoAuth = rs.auth;
     	     											    	   	// ȸ������ �� �Ǿ� ������ ���� ��޷�
     	     											    	    if(rs.check=='false') {
     	     											    	    	$('#loginModal .close').click();
     	     											    	    	$('#hiddenKakaoModal').click();
     	     											    	    	$('#kakaoId').replaceWith
     	     											    	    	('<input type="email" class="form-control" '+
     	     											    	    	'id="kakaoId" value="'+ rs.id +'" readonly="readonly">');
     	     											    	    } else {
     	     											    	    	location.href="/";
     	     											    	    }
     	     											        },
     	     											        error: function(error) {
     	     											        	alert(JSON.stringify(error));
     	     											        }
     	     												})
     											        },
     											        fail: function(error) {
     											        	alert(JSON.stringify(error));
     											        }
     												});
     											},
     											fail: function(err) {
         											alert(JSON.stringify(err));
     											}	
   											});
							    		};
									</script>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="joinTab">
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">�̸���</label>
									<input type="email" class="form-control" id="id" name="id">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">�н�����</label> <input
										type="password" class="form-control" id="password"
										name="password">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label"> �н�����
										Ȯ�� </label> <input type="password" class="form-control"
										id="passwordConfirm">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">�г���</label>
									<input type="text" class="form-control" id="nickName"
										name="nickName">
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
	<input type="hidden" data-toggle="modal" data-target="#authModal"
		id="hiddenModal">
	<!-- authModeal START -->
	<div class="modal modal-mystyle fade" id="authModal" tabindex="-1"
		role="dialog" aria-labelledby="authModealLabel" aria-hidden="true">
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
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">�̸���</label> <input
							type="email" class="form-control" id="id"
							value="blausues@gmail.com" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">������ȣ</label> <input
							type="password" class="form-control" id="authNum"
							placeholder="���Ϸ� �� ������ȣ�� ���ּ���.">
					</div>
					<div>
						<input type="button" value="���� �̸��� ������"
							class="btn btn-primary btn-block send"> <input
							type="button" value="����Ȯ��" class="btn btn-primary btn-block auth">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- authModeal END -->
	<input type="hidden" data-toggle="modal" data-target="#kakaoModal"
		id="hiddenKakaoModal">	
	<!-- kakaoModal START -->
	<div class="modal modal-mystyle fade" id="kakaoModal" tabindex="-1"
		role="dialog" aria-labelledby="kakaoModealLabel" aria-hidden="true">
		<div class="modal-dialog modal-mystyle">
			<div class="modal-content modal-mystyle">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<label for="recipient-name" class="col-form-label">īī�� ȸ������</label>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">�̸���</label> 
						<input type="email" class="form-control" id="kakaoId">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">�г���</label> 
						<input type="text" class="form-control" id="kakaoNick">
					</div>
					<div>
						<button class="btn btn-primary btn-block join">ȸ������</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- kakaoModal END -->
</body>
</html>