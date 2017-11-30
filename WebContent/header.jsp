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
		
 		// 회원가입 버튼을 누르는 순간 중복확인하고 새로운 모달창으로 이동하면서 이메일 인증
		$('#loginModal .join').click(function(){
		    var id = $('#id').val();
		    var password = $('#password').val();
		    var nickName = $('#nickName').val();
			
			if(id==""){
				alert('이메일을 입력해주세요.');
			} else if(!/^[a-zA-Z0-9!,@,#,$,%,^,&,*,?,_,~]{10,12}$/.test(password)){
				alert('패스워드는 10~12자리를 사용해야 합니다.');
			} else if(password != $('#passwordConfirm').val()){
				alert('패스워드가 맞지 않습니다.');
			} else if(nickName==""){
				alert('닉네임을 입력해주세요.');
			} else {
				$.ajax({
					type:'post',
					url:'join.do', 
					data:'id='+id+'&password='+password+'&nickName='+nickName, 
					dataType:'text',
					success: function(check){
						if(check=='idOverlap'){
							alert('중복된 이메일입니다. 다른 이메일로 가입해주세요.');
						} else if(check=='nickOverlap'){
							alert('중복된 닉네임입니다. 다른 닉네임으로 가입해주세요.');
						} else if(check=='true'){
							alert('임시 회원가입 성공');
							$('#loginModal .close').click();
							$('#hiddenModal').click();
						} else {
							alert('임시 회원가입 실패');
						}
					},
					error: function(){
						alert('임시 회원가입 중 에러가 발생했습니다.');
					}
				})
			}
		}); 
			
		$('#kakaoModal .join').click(function(){
		    var id = $('#kakaoId').val();
		    var nickName = $('#kakaoNick').val();
			alert(auth);
			if(nickName==""){
				alert('닉네임을 입력해주세요.');
			} else {
				$.ajax({
					type:'post',
					url:'kakaoJoin.do', 
					data:'id='+id+'&nickName='+nickName+'&auth='+kakaoAuth, 
					dataType:'text',
					success: function(check){
						if(check=='idOverlap'){
							alert('중복된 이메일입니다. 다른 이메일로 가입해주세요.');
						} else if(check=='nickOverlap'){
							alert('중복된 닉네임입니다. 다른 닉네임으로 가입해주세요.');
						} else if(check=='true'){
							alert('회원가입 성공');
							location.href="/";
						} else {
							alert('회원가입 실패');
						}
					},
					error: function(){
						alert('회원가입 중 에러가 발생했습니다.');
					}
				})
			}
		}); 
		
		$('#authModal .send').click(function(){
			// 인증 이메일 보내기
			var id = $('#id').val();
			$.ajax({
				type:'post',
				url:'sendMail.do', 
				data:'id='+id, 
				dataType:'text',
				success: function(send){
					if(send=='true'){
						alert('입력하신 이메일로 인증 메일을 발송했습니다.');
					} else {
						alert('인증 메일 발송을 실패했습니다.');
						}
					},
				error: function(){
					alert('인증 메일 발송 중 에러가 발생했습니다.');
				}
			})
		})
			
		$('#authModal .auth').click(function(){
			// 인증 코드 체크 후 일치하면 auth = true 로 변경
			var id = $('#id').val();
			var authNum = $('#authNum').val();
			$.ajax({
				type:'post',
				url:'checkAuthNum.do', 
				data:'id='+id+'&authNum='+authNum, 
				dataType:'text',
				success: function(check){
					if(check=='true'){
						alert('회원가입이 완료되었습니다.');
						location.href="/";
					} else {
						alert('인증코드가 일치하지 않습니다. 다시 확인해주세요.');
						}
					},
				error: function(){
					alert('인증 코드 체크 중 에러가 발생했습니다.');
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
					<li><a href="#">통계</a></li>
					<li><a href="#">랭킹</a></li>
					<li><a href="compareForm.do">전적비교</a></li>
					<li><a href="#">공략/팁</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul>
				<div class="search-bar">
					<input type="text" placeholder="search" required /> 
					<input type="submit" value="" /> 
					<c:if test="${empty loginId}">
						<a href="#" data-toggle="modal" data-target="#loginModal">
							<b>로그인</b>
						</a>
					</c:if>
					<c:if test="${not empty loginId}">
						<b style="color: white;">${loginId} 님</b>
						<a href="javascript:logoutWithKakao()">
							<b>로그아웃</b>
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
							aria-controls="loginTab" role="tab" data-toggle="tab"> 로그인 </a></li>
						<li role="presentation"><a href="#joinTab"
							aria-controls="joinTab" role="tab" data-toggle="tab"> 회원가입 </a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div role="tabpanel">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="loginTab">
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">이메일</label>
									<input type="email" class="form-control" id="loginId" name="id">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">패스워드</label> <input
										type="password" class="form-control" id="loginPassword">
								</div>
								<div>
									<input type="submit" value="로그인" class="btn btn-primary btn-block login" id="loginBtn">
									<br> 
									<a href="javascript:loginWithKakao()"> 
										<img src="images/kakao.jpg" id="kakaoLogin">
									</a>
									<script type="text/javascript">
							    		// 로그인 창을 띄웁니다.
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
     	     											    	   	// 회원가입 안 되어 있으면 가입 모달로
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
									<label for="recipient-name" class="col-form-label">이메일</label>
									<input type="email" class="form-control" id="id" name="id">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">패스워드</label> <input
										type="password" class="form-control" id="password"
										name="password">
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label"> 패스워드
										확인 </label> <input type="password" class="form-control"
										id="passwordConfirm">
								</div>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">닉네임</label>
									<input type="text" class="form-control" id="nickName"
										name="nickName">
								</div>
								<div>
									<button class="btn btn-primary btn-block join">회원가입</button>
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
					<label for="recipient-name" class="col-form-label">이메일 인증</label>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">이메일</label> <input
							type="email" class="form-control" id="id"
							value="blausues@gmail.com" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">인증번호</label> <input
							type="password" class="form-control" id="authNum"
							placeholder="메일로 온 인증번호를 써주세요.">
					</div>
					<div>
						<input type="button" value="인증 이메일 보내기"
							class="btn btn-primary btn-block send"> <input
							type="button" value="인증확인" class="btn btn-primary btn-block auth">
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
					<label for="recipient-name" class="col-form-label">카카오 회원가입</label>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">이메일</label> 
						<input type="email" class="form-control" id="kakaoId">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">닉네임</label> 
						<input type="text" class="form-control" id="kakaoNick">
					</div>
					<div>
						<button class="btn btn-primary btn-block join">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- kakaoModal END -->
</body>
</html>