<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail - 검색 결과</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/searchResult.css">

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

	<div id="wrap" style="height: auto;">
		<div class="col-md-12">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-title">검색 결과</div>
					<c:forEach items="${result }" var="train">
						<div class="card">
							<div class="card-body" style="text-align: center;">
								<h4 class="card-title">
									${train.dep_place }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>→</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${train.arr_place }
								</h4>
								<p class="card-text">
									${train.formattedDepTime } 발, ${train.formattedArrTime } 착<br>${train.grade }
									열차
								</p>
								<button class="btn btn-primary" id="${train.tno }"
									onclick="searchSeat(${train.tno})">예약 검색</button>
							</div>
						</div>
					</c:forEach>
					<button type="button" class="btn btn-secondary" onclick="location.href='/train/search'">다른 조건으로 검색</button>
				</div>
				<div class="col-lg-6">
					<div id="seatTable">
						<h1>좌석배치표</h1>

						<div class="seatTable">
							<div class="seatTable_front">정면</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="1A">
										<br>1A
									</div>
									<div class="seat left_seat" id="1B">
										<br>1B
									</div>
									<div class="seat right_seat" id="1D">
										<br>1D
									</div>
									<div class="seat right_seat" id="1C">
										<br>1C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="2A">
										<br>2A
									</div>
									<div class="seat left_seat" id="2B">
										<br>2B
									</div>
									<div class="seat right_seat" id="2D">
										<br>2D
									</div>
									<div class="seat right_seat" id="2C">
										<br>2C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="3A">
										<br>3A
									</div>
									<div class="seat left_seat" id="3B">
										<br>3B
									</div>
									<div class="seat right_seat" id="3D">
										<br>3D
									</div>
									<div class="seat right_seat" id="3C">
										<br>3C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="4A">
										<br>4A
									</div>
									<div class="seat left_seat" id="4B">
										<br>4B
									</div>
									<div class="seat right_seat" id="4D">
										<br>4D
									</div>
									<div class="seat right_seat" id="4C">
										<br>4C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="5A">
										<br>5A
									</div>
									<div class="seat left_seat" id="5B">
										<br>5B
									</div>
									<div class="seat right_seat" id="5D">
										<br>5D
									</div>
									<div class="seat right_seat" id="5C">
										<br>5C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="6A">
										<br>6A
									</div>
									<div class="seat left_seat" id="6B">
										<br>6B
									</div>
									<div class="seat right_seat" id="6D">
										<br>6D
									</div>
									<div class="seat right_seat" id="6C">
										<br>6C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="7A">
										<br>7A
									</div>
									<div class="seat left_seat" id="7B">
										<br>7B
									</div>
									<div class="seat right_seat" id="7D">
										<br>7D
									</div>
									<div class="seat right_seat" id="7C">
										<br>7C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="8A">
										<br>8A
									</div>
									<div class="seat left_seat" id="8B">
										<br>8B
									</div>
									<div class="seat right_seat" id="8D">
										<br>8D
									</div>
									<div class="seat right_seat" id="8C">
										<br>8C
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="seat left_seat" id="9A">
										<br>9A
									</div>
									<div class="seat left_seat" id="9B">
										<br>9B
									</div>
									<div class="seat right_seat" id="9D">
										<br>9D
									</div>
									<div class="seat right_seat" id="9C">
										<br>9C
									</div>
								</div>
							</div>
							<div class="seatTable_back">후면</div>
						</div>
						<form action="/train/reservationConfirm" method="post">
							<sec:csrfInput />
							<input type="hidden" name="tno"> <input type="hidden"
								name="seat_id">
							<!-- 나중에 user_id 자동으로 들어가도록 -->
							<input type="hidden" name="user_id" value="${id }"> <input
								type="submit" value="다음으로" class="submit">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	<script type="text/javascript" src="/resources/script/reservation.js"></script>
	<script type="text/javascript">
var seat = $(".seat");
var tnoInput = $("input[name='tno']");
var seatInput = $("input[name='seat_id']");
var userInput = $("input[name='user_id']");

var reservationSelect = false;
//searchSeat
function searchSeat(tno){
	if(reservationSelect){
		$("div").find(".reserved").removeClass("reserved");
		$("div").find(".selected").removeClass("selected");
		reservationSelect = false;
	}
	
	tnoInput.val(tno);
	reservationService.reservationSearch(tno, function(result){
		if(result.length == 0){
			return;
		} else {
			for(var i = 0 ; i < result.length ; i++){
				console.log(result[i]);
				for(var j = 0 ; j < seat.length ; j++){
					if(seat.eq(j).attr("id") == result[i]){
						seat.eq(j).addClass("reserved");
						
					}
				}
			}
		}
	});
	reservationSelect = true;
}

//reserved onclick
seat.on("click", function(){
	if($(this).hasClass("reserved")){
		alert("이미 예약된 자리입니다.");
	}
});

// 좌석 결정
var seatCount = 0;
seat.on("click", function(){
	if(reservationSelect){
		if($(this).hasClass("selected")){
			seatCount--;
			console.log("seaatCount: " + seatCount);
			seatInput.val("");
			$(this).removeClass("selected");
		} else if(!($(this).hasClass("selected")) && seatCount == 1){
			$("div").find(".selected").removeClass("selected");
			$(this).addClass("selected");
			console.log("seaatCount: " + seatCount);			
			seatInput.val("");
			seatInput.val($(this).attr("id"));
		} else if(seatCount == 0){
			$(this).addClass("selected");
			seatInput.val($(this).attr("id"));
			seatCount++;
			console.log("seaatCount: " + seatCount);
		}
	} else {
		alert("예약을 먼저 선택해주세요.");
	}
});
</script>
</body>
</html>