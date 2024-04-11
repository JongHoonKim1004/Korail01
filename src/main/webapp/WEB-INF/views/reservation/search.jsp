<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/resources/css/search.css">

<!-- Date Range Picker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- w3 bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div id="wrap">
		<div class="search_box">
			<div class="container">
				<h2>열차 좌석 조회</h2>
				<form action="/train/search" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="dep_time" id="dep_time">
					<input type="hidden" name="arr_time" id="arr_time">
					<div class="row">
						<div class="col-md-12">
							<label for="dep_place" class="form-control-label">출발역</label>
							<input type="text" class="form-control" id="dep_place" name="dep_place">
						</div>
						<div class="col-md-12">
							<label for="arr_place" class="form-control-label">도착역</label>
							<input type="text" class="form-control" id="arr_place" name="arr_place">
						</div>
						<div class="col-md-12">
							<label for="dep_place" class="form-control-label">날짜</label>
							<input type="text" class="form-control" id="datefilter" name="datefilter" value="" />
						</div>
					</div>
					<button type="submit" class="btn btn-primary mt-3">검색하기</button>
				</form>
			</div>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	<script type="text/javascript">
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
	</script>
</body>
</html>