<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/login.css">

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

	<%@ include file="../includes/header.jsp"%>

	<div class="container">
		<div class="col-lg-12">
			<div class="row">
			<div class="col-md-12">
				<div class="card">
						<div class="card-header">
							<strong>예약 상세보기</strong>
						</div>
						<div class="card-body card-block">
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="rno" class=" form-control-label">예약 번호</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="rno" name="rno" class="form-control" readonly value="${dto.reservationVO.rno }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="dep_place" class=" form-control-label">출발역</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="dep_place" name="dep_place" class="form-control" readonly value="${dto.trainVO.dep_place }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="arr_place" class=" form-control-label">도착역</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="arr_place" name="arr_place" class="form-control" readonly value="${dto.trainVO.arr_place }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="dep_time" class=" form-control-label">출발 시간</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="dep_time" name="dep_time" class="form-control" readonly value="${dto.trainVO.formattedDepTime }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="arr_time" class=" form-control-label">도착 시간</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="arr_time" name="arr_time" class="form-control" readonly value="${dto.trainVO.formattedArrTime }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="grade" class=" form-control-label">열차 등급</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="grade" name="grade" class="form-control" readonly value="${dto.trainVO.grade }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="seat_id" class=" form-control-label">좌석</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="seat_id" name="seat_id" class="form-control" readonly value="${dto.reservationVO.seat_id }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="resDate" class=" form-control-label">예약일</label>
								</div>
								<div class="col-12 col-md-9">
									<fmt:formatDate value="${dto.reservationVO.resDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" var="formatDate"/>
									<input type="text" id="resDate" name="resDate" class="form-control" readonly value="${formatDate }">
								</div>
							</div>
						</div>
						<form action="/mypage/cancelReservation" method="post" id="frm">
							<sec:csrfInput/>
							<input type="hidden" name="rno" value="${dto.reservationVO.rno }"> 
						
						<div class="card-footer">
							<input type="submit" class="btn btn-danger" value="취소하기" >
							<input type="button" class="btn btn-primary" value="돌아가기" onclick="location.href='/mypage/main'">
						</div>
						</form>
				</div>
			</div>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	
</body>
</html>