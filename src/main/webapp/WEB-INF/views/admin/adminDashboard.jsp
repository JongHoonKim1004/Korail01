<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/adminHeader.jsp" %>


        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- Widgets  -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-1">
                                        <i class="ti-reload"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count">${trainCount }</span> 개</div>
                                            <div class="stat-heading">노선 수</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-2">
                                        <i class="fa fa-check"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count">${reservationCount }</span> 개</div>
                                            <div class="stat-heading">예약 수</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-3">
                                        <i class="fa fa-group"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count">${usersCount }</span> 명</div>
                                            <div class="stat-heading">유저 수</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-five">
                                    <div class="stat-icon dib flat-color-4">
                                        <i class="fa fa-comments"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="text-left dib">
                                            <div class="stat-text"><span class="count">${qnaCount }</span> 개</div>
                                            <div class="stat-heading">Q&A 수</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Widgets -->
               
                <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">Orders </h4>
                                </div>
                                <div class="card-body--">
                                    <div class="table-stats order-table ov-h">
                                        <table class="table ">
                                            <thead>
                                                <tr>
                                                    <th class="serial">번호</th>
                                                    <th>노선 번호</th>
                                                    <th>예약자 명</th>
                                                    <th>좌석 번호</th>
                                                    <th>예약일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${reservationList }" var="reservation">
                                                	<tr>
                                                		<td class="serial">${reservation.rno }</td>
                                                		<td>${reservation.tno }</td>
                                                		<td>${reservation.user_id }</td>
                                                		<td>${reservation.seat_id }</td>
                                                		<td><fmt:formatDate value="${reservation.resDate }" pattern="yyyy년 MM월 dd일"/></td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div> <!-- /.table-stats -->
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-12 -->

                        
                    </div>
                </div>
                <!-- /.orders -->

                <!-- Calender Chart Weather  -->
                <div class="row">
                    <div class="col-md-12 col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                
                                <div class="calender-cont widget-calender">
                                    <div id="calendar"></div>
                                </div>
                            </div>
                        </div><!-- /.card -->
                    </div>

                    
                    <div class="col-lg-6 col-md-6">
                        <div class="card weather-box">
                            <h4 class="weather-title box-title">Weather</h4>
                            <div class="card-body">
                                <div class="weather-widget">
                                    <div class="container">
                                    	<div class="row">
                                    		<div class="col-md-6">
                                    			<div id="weather" class="weather-one"></div>
                                    			<div id="weather_name"></div>
                                    		</div>
                                    		<div class="col-md-6">
                                    			<div id="weather_img"></div>
                                    		</div>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.card -->
                    </div>
                </div>
                <!-- /Calender Chart Weather -->
                <!-- Modal - Calendar - Add New Event -->
                <div class="modal fade none-border" id="event-modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add New Event</strong></h4>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#event-modal -->
                <!-- Modal - Calendar - Add Category -->
                <div class="modal fade none-border" id="add-category">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add a category </strong></h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="pink">Pink</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        

    
    <%@ include file="../includes/adminFooter.jsp" %>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.5.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // OpenWeatherMap API 예시 URL (실제 키와 좌표를 사용하세요)
        var url = 'https://api.openweathermap.org/data/2.5/weather?q=suwon&appid=3caadb77b5fd4a09ce681bb82ebf3487';

        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            success: function(data) {
                // 날씨 데이터 처리
                console.log(data);
                var temp = data.main.temp - 273.15; // 켈빈을 섭씨로 변환
                $('#weather').html('현재 온도: ' + temp.toFixed(0) + '°C');
                
                // 기상 상태에 따른 아이콘 넣기
                var weather = data.weather[0].main;
                if(weather == 'Clear'){
                	$("#weather_img").html("<img alt='' src='/resources/img/weather/Clear.png'>");
                } else if(weather == 'Clouds'){
                	$("#weather_img").html("<img alt='' src='/resources/img/weather/Cloud.png'>");
                } else if(weather == 'Thunderstorm'){
                	$("#weather_img").html("<img alt='' src='/resources/img/weather/Thunderstorm.png'>");
                } else if(weather == 'Rain'){
                	$("#weather_img").html("<img alt='' src='/resources/img/weather/Rain.png'>");
                } else if(weather == 'Snow'){
                	$("#weather_img").html("<img alt='' src='/resources/img/weather/Snow.png'>");
                } else if(weather == 'Haze'){
                	$("#weather_img").html("<img alt='' src='/resources/img/weather/Haze.png'>");
                }
                
                //위치에 따른 도시명 표시
                var location = data.name;
                $("#weather_name").html(location);
            },
            error: function(error) {
                console.log("오류 발생", error);
                $('#weather').html('날씨 정보를 불러오는 데 실패했습니다.');
            }
        });
    });
    </script>
</body>
</html>
