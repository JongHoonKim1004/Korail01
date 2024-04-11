<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../../includes/adminHeader.jsp"%>

<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<form action="/admin/stationDelete" method="post">
			<sec:csrfInput/>
			<input type="hidden" name="sno" value="${vo.sno }">
			<input type="hidden" name="name" value="${vo.name }">
			<input type="hidden" name="addr" value="${vo.addr }">
			<input type="hidden" name="latitude" value="${vo.latitude }">
			<input type="hidden" name="longitude" value="${vo.longitude }">
			<input type="hidden" name="url" value="${vo.url }">
			<input type="hidden" name="info" value="${vo.info }">
			
			<div class="col-md-12">
				<div class="card">
					<img class="card-img-top" src="${vo.url }"
						alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title mb-3">${vo.name }</h4>
						<p class="card-text">주소 : ${vo.addr }</p>
						<p class="card-text">
							${vo.info }
						</p>
					</div>
					<div class="card-footer">
						<div id="map" style="width: 100%; height: 500px;"></div>
						
					</div>
				</div>
				<button onclick="location.href='/admin/stationList'" type="button" class="btn btn-primary">목록으로</button>
				<input type="submit" class="btn btn-danger" value="삭제하기" onclick="return adminDeleteCheck()">
			</div>

			</form>
		</div>
		<!-- .row -->
	</div>
	<!-- .animated -->
</div>
<!-- .content -->


<%@ include file="../../includes/adminFooter.jsp"%>
<script type="text/javascript" src="/resources/script/admin.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d678173bf545a554b3910f7f60dd7c6d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude} ), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
</body>
</html>