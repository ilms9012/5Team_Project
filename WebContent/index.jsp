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
			<input type="text" placeholder="��Ʋ�׶��� ���̵� �Է��ϼ���." required="required"/>
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
					<p>PLAYERUNKNOWN'S BATTLEGROUNDS��  Kakao �������� ���µǾ����ϴ�. ���� Steam���� ������ ���ô� �� ó�� �����ϰ� 32000���� ������ ���� �����մϴ�.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="blog-news-grid b_n_g">
				<div class="news-grid-left">
					<h4>21</h4>
					<small>of october 2017</small>
				</div>
				<div class="news-grid-right">
					<h4>�׽�Ʈ �� �ٰ��� �ǵ��</h4>
					<p>�����ѱ� �ö󰡱� ���� ����� �������Դϴ�. �� �������� �� �ְڽ��ϴ�. ���� ����ϴ� ������ ��Ʋ���̸� ���� �����ϰ� �ֽ��ϴ�. </p>
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
					<h4>���� ������Ʈ ��ȹ</h4>
					<p>������ �ѱ� ���(���� ���� ���)�� �����߿� ������ 10�� �� ~ 11�� �ʿ� �����Ͻ� �� �ֽ��ϴ�! </p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="blog-news-grid b_n_g">
				<div class="news-grid-left">
					<h4>12</h4>
					<small>of september 2017</small>
				</div>
				<div class="news-grid-right">
					<h4>���ο� ���� �� �뷱�� ����</h4>
					<p>�Ȱ����� �÷��̾��� �þ߰� ���ѵǰ� ���� Ȯ���� �����մϴ�. ���� �뷱�� ������ ���� ���� ������ �ӵ��� 35% �����Ͽ����ϴ�.</p>
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