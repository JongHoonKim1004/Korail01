<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/index.css">

<!-- Date Range Picker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


</head>

<body>
	<%@ include file="includes/header.jsp"%>

	<!-- index -->
	<div id="wrap">
		<div class="wrap_left">
			<div class="index_promotion">
				<a href="#"><img alt=""
					src="/resources/img/index/index_banner1.png"></a>
			</div>
			<div class="index_discount">
				<ul>
					<li><a href="#"><img alt=""
							src="/resources/img/index/BnrDisplay_201710230150378540.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/BnrDisplay_201710230147548250.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/BnrDisplay_201710230155082130.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/BnrDisplay_202204130440538430.png"></a></li>
				</ul>
			</div>
			<div class="index_guide">
				<img alt="" src="/resources/img/index/tit_guide.gif">
				<ul>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img2.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img4.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img6.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img7.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img8.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img9.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img10.gif"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/guide_img11.gif"></a></li>
				</ul>
			</div>
			<div class="index_sns">
				<img alt="" src="/resources/img/index/sns_title.png">
				<ul>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_blog.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_facebook.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_instagram.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_twitter.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_youtube.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_blank.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_blank.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_blank.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_blank.png"></a></li>
					<li><a href="#"><img alt=""
							src="/resources/img/index/sns_blank.png"></a></li>
				</ul>
			</div>
		</div>
		<div class="wrap_right">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<form action="/train/search" method="post" name="frm" class="form">
							<input type="hidden" name="dep_time" id="dep_time"> <input
								type="hidden" name="arr_time" id="arr_time">
							<sec:csrfInput />
							<div class="card">
								<div class="card-header">
									<strong>빠른 표 검색</strong>
								</div>
								<div class="card-body card-block">
									<div class="form-group">
										<label for="dep_place" class=" form-control-label">출발역</label><input
											type="text" id="dep_place" name="dep_place"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="arr_place" class=" form-control-label">도착역</label><input
											type="text" id="arr_place" name="arr_place"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="datefilter" class=" form-control-label">도착역</label><input
											type="text" id="datefilter" name="datefilter"
											class="form-control">
									</div>
								</div>
								<div class="card-footer">
									<button type="submit" class="btn btn-primary btn-sm">
										검색하기
									</button>
									
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="includes/footer.jsp"%>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script type="text/javascript">
		$(function() {
			//Amount
			$('#amount').change(function() {
				if ($(this).val() <= 0) {
					alert("더 이상 줄일 수 없습니다");
					$(this).val(1);
				}
			});

			//Date Range Picker
			$(function() {
				// DateRangePicker
				$('input[name="datefilter"]').daterangepicker({
					singleDatePicker : true,
					showDropdowns : true,
					minYear : 1901,
					maxYear : parseInt(moment().format('YYYY'), 10)
				}, function(start, end, label) {
					var startDate = start.format('YYYYMMDD');
					var endDate = start.add(1, 'days').format('YYYYMMDD');
					var dep_time = $("input[name='dep_time']");
					var arr_time = $("input[name='arr_time']");

					console.log(endDate);
					dep_time.val(startDate + "000000");
					arr_time.val(endDate + "000000");
					console.log(typeof (arr_time.val()));
				});

			});

		});
	</script>
</body>

</html>