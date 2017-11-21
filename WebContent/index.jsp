<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Leader Board gg</title>
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Google Fonts -->
<link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
<script type="text/javascript">
$(function () {
	var filterList = {
		init: function () {
			// MixItUp plugin
			// http://mixitup.io
			$('#portfoliolist').mixitup({
				targetSelector: '.portfolio',
				filterSelector: '.filter',
				effects: ['fade'],
				easing: 'snap',
				// call the hover effect
				onMixEnd: filterList.hoverEffect()
			});				
		},
		hoverEffect: function () {
			// Simple parallax effect
			$('#portfoliolist .portfolio').hover(
				function () {
					$(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
					$(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');				
				},
				function () {
					$(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
					$(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');								
				}		
			);				
		}
	};
	// Run the show!
	filterList.init();
});	
</script>

</head>
<body>
<%@ include file="header.jsp" %>
<!-- Header Starts Here -->

<p align="cetner">
	<div class="banner">
		<div class="search-bar1">
			<input type="text" placeholder="배틀그라운드 아이디를 입력하세요." required="required"/>
			<input type="submit" value="" />
		</div>
	</div>
</p>
<!-- What New Part starts Here -->
<div class="what-new">
	<div class="container">
		<h3>What's new</h3>
		<div class="blog-news">
			<div class="blog-news-grid">
				<div class="news-grid-left">
					<h4>14</h4>
					<small>of november 2017</small>
				</div>
				<div class="news-grid-right">
					<h4>Kakao Server Open!</h4>
					<p>PLAYERUNKNOWN'S BATTLEGROUNDS가  Kakao 서버에서 오픈되었습니다. 기존 Steam에서 게임을 즐기시는 것 처럼 동일하게 32000으로 게임을 구매 가능합니다.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="blog-news-grid b_n_g">
				<div class="news-grid-left">
					<h4>21</h4>
					<small>of october 2017</small>
				</div>
				<div class="news-grid-right">
					<h4>테스트 및 핵관련 피드백</h4>
					<p>지형넘기 올라가기 등의 기능을 수정중입니다. 곧 만나보실 수 있겠습니다. 핵을 사용하는 유저는 배틀아이를 통해 제재하고 있습니다. </p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="blog-news b_n">
			<div class="blog-news-grid">
				<div class="news-grid-left">
					<h4>16</h4>
					<small>of october 2017</small>
				</div>
				<div class="news-grid-right">
					<h4>향후 업데이트 계획</h4>
					<p>지형물 넘기 기능(이하 파쿠르 기능)은 개발중에 있으며 10월 말 ~ 11월 초에 경험하실 수 있습니다! </p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="blog-news-grid b_n_g">
				<div class="news-grid-left">
					<h4>12</h4>
					<small>of september 2017</small>
				</div>
				<div class="news-grid-right">
					<h4>새로운 월드 및 밸런스 조정</h4>
					<p>안개맵은 플레이어의 시야가 제한되고 낮은 확률로 등장합니다. 게임 밸런스 조정을 위해 석궁 재장전 속도가 35% 증가하였습니다.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>