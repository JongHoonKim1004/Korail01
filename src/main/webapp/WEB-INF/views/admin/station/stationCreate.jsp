<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@ include file="../../includes/adminHeader.jsp" %>

<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<div class="card">
                            <div class="card-header">
                                <strong>새 철도역 등록</strong> 신중하게 진행해주세요
                            </div>
                            <form action="/admin/stationCreate" method="post" class="form-horizontal">
                            <sec:csrfInput/>
                            <div class="card-body card-block">
                            	<div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">철도역 이름</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="name" placeholder="이름" class="form-control"></div>
                                </div>    
                                 	   
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">주소</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="addr" placeholder="주소" class="form-control"></div>
                                    
                                </div>
                                
                                <div class="row form-group">
                                	<div class="col col-md-3"></div>
                                    <div class="col-12 col-md-9">
                                    	<button class="btn btn-info">주소 찾기</button>
                                    </div>
                                </div>
                                <div class="row form-group">
                                	철도역 위치
                                </div>
                                <div class="row form-group">
                                	<div id="map" style="width:100%;height:500px;"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="latitude" class=" form-control-label">위도</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="latitude" name="latitude" placeholder="위도" readonly class="form-control"></div>
                                </div>    
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="longitude" class=" form-control-label">경도</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="longitude" name="longitude" placeholder="경도" readonly class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="url" class=" form-control-label">사진 url</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="url" name="url" placeholder="철도역 사진 경로" class="form-control"></div>
                                </div> 
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="info" class=" form-control-label">철도역 이름</label></div>
                                    <div class="col-12 col-md-9"><textarea cols="4" id="info" name="info" placeholder="철도역 간단한 설명" class="form-control"></textarea></div>
                                </div> 
                            </div>
                            
                            
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                                <button type="button" class="btn btn-info btn-sm" onclick="location.href='/admin/stationList'">
                                    <i class="fa fa-list-alt"></i> List
                                </button>
                            </div>
                            </form>
                        </div>			
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d678173bf545a554b3910f7f60dd7c6d"></script>

<script>
var latitude = document.getElementById('latitude');
var longitude = document.getElementById('longitude');

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.268926833992175, 126.99991544266095), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    latitude.setAttribute("value", latlng.getLat());
    longitude.setAttribute("value", latlng.getLng());
    
});
</script>


</body>
</html>