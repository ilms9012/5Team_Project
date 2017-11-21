<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	});
</script>

</head>
<body>
	<div class="header">
		<div class="container">
			<div class="logo">
				<a href="index.jsp">
					<img src="images/logo.png" width="60%" height="20%" alt="">
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
					<li>
						<a href="#">
							<button><font color="black">Login</font></button>
						</a>
					</li>
				</ul>
				<div class="search-bar">
					<input type="text" placeholder="search" required /> 
					<input type="submit" value="" />
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
</body>
</html>