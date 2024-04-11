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
<link rel="stylesheet" href="/resources/css/reservation.css">

<!-- w3 bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div id="wrap">
		
			<div class="wrap_left">
				<div class="reservation_info">
					<div class="container">
						<h2>예약 정보 확인</h2>
						<div class="form-group">
							<label for="dep_place">출발역</label> <input type="text"
								class="form-control" id="dep_place" readonly name="dep_place" value="${train.dep_place }">
						</div>
						<div class="form-group">
							<label for="arr_place">도착역</label> <input type="text"
								class="form-control" id="arr_place" readonly name="arr_place" value="${train.arr_place }">
						</div>
						<div class="form-group">
							<label for="dep_time">출발 시간</label> <input type="text"
								class="form-control" id="dep_time" readonly name="dep_time" value="${train.formattedDepTime }">
						</div>
						<div class="form-group">
							<label for="arr_time">도착 시간</label> <input type="text"
								class="form-control" id="arr_time" readonly name="arr_time" value="${train.formattedArrTime }">
						</div>
						<div class="form-group">
							<label for="grade">열차 종류</label> <input type="text"
								class="form-control" id="grade" readonly name="grade" value="${train.grade }">
						</div>
						<div class="form-group">
							<label for="seat_id">열차 종류</label> <input type="text"
								class="form-control" id="seat_id" readonly name="seat_id" value="${vo.seat_id }">
						</div>
					</div>
				</div>
			</div>
			<div class="wrap_right">
				<div class="payment">
					<img alt="" src="/resources/img/train/trainAD.png" style="width: 100%; height: 100%;">
				</div>
				<input type="button" value="예약하기" class="submit">
			</div>
		<form action="/train/reservation" method="post" class="form">
			<sec:csrfInput/>
			<input type="hidden" name="tno" value="${vo.tno }">
			<input type="hidden" name="seat_id" value="${vo.seat_id }">
			<input type="hidden" name="user_id" value="${vo.user_id }">
		</form>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	<script type="text/javascript">
		$(".submit").on("click",function(){
			$(".form").submit();
		});
	</script>
</body>
</html>