<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.mixitup.min.js"></script>

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
		
		function addImage(pk) {
		    alert("addImage: " + pk);
		}
		
 		// 회원가입 버튼을 누르는 순간 중복확인하고 새로운 모달창으로 이동하면서 이메일 인증 ㄱㄱ
		$('#myModal .join').click(function (e) {
		    e.preventDefault();
		    addImage(5);
		    // jquery 충돌나서 여기 에러뜨는 것 같은데 ㅠㅠ 
		    $('#myModal').modal('hide');
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
					<li><a href="#">통계</a></li>
					<li><a href="#">랭킹</a></li>
					<li><a href="#">전적비교</a></li>
					<li><a href="#">공략/팁</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul>
				<div class="search-bar">
					<input type="text" placeholder="search" required /> 
					<input type="submit" value="" />
					<a href="#" data-toggle="modal" data-target="#myModal"><b>로그인</b></a>
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
	
<!-- Modal START -->	
	<div class="modal modal-mystyle fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
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
								로그인
							</a>
						</li>
						<li role="presentation">
							<a href="#joinTab" aria-controls="joinTab" role="tab" data-toggle="tab">
								회원가입
							</a>
						</li>
					</ul>
				</div>
				<div class="modal-body">
					<div role="tabpanel">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="loginTab">
								<form action="#" method="post">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">이메일</label>
										<input type="email" class="form-control" id="recipient-name">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">패스워드</label>
										<input type="password" class="form-control" id="recipient-name">
									</div>
									<div>
										<input type="submit" value="로그인" class="btn btn-primary btn-block login">
										<br>
										<a href="#"><img src="images/kakao.jpg" id="kakaoImg"></a>
									</div>
								</form>
							</div>
							<div role="tabpanel" class="tab-pane" id="joinTab">
								<form action="" method="post">
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">이메일</label>
										<input type="email" class="form-control" id="recipient-name">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">패스워드</label>
										<input type="password" class="form-control" id="recipient-name">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">
											패스워드 확인
										</label> 
										<input type="password" class="form-control" id="recipient-name">
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">닉네임</label>
										<input type="text" class="form-control" id="recipient-name">
									</div>
									<div>
										<input type="submit" value="회원가입" class="btn btn-primary btn-block join">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Modal END -->
</body>
</html>