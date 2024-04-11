<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@ include file="../../includes/adminHeader.jsp" %>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
                               
<div class="container">
	
	<div class="row" style="justify-content: center">
		<h1>노선 호출 API 테스트</h1>
	</div>
	<div style="width: 100%; height: 50px;"></div>
	<div class="row">		
		<div class="col-md-6">
			<div class="card">
                            <div class="card-header">
                                <strong>검색</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="#" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="departureStation" class=" form-control-label">출발역</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="departureStation" name="departureStation" placeholder="출발역" class="form-control"><small>'역' 을 제외하고 입력해주세요</small></div>
                                        <input type="hidden" name="depStation" id="depStation" value=''>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="arriveStation" class=" form-control-label">도착역</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="arriveStation" name="arriveStation" placeholder="도착역" class="form-control"><small>'역' 을 제외하고 입력해주세요</small></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="departureDate" class=" form-control-label">날짜</label></div>
                                        <div class="col-12 col-md-9">
                                        	<input type="text" id="departureDate" name="departureDate" placeholder="날짜" class="form-control">
                                        	<input type="hidden" name="date" id="date" value=''>
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-primary btn-sm" id="submit">
                                    <i class="fa fa-dot-circle-o"></i> 검색하기
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> 다시 입력하시
                                </button>
                            </div>
                        </div>
		</div>
		<div class="col-md-6">
			<div class="api-result">
				
			</div>
		</div>
	</div>
</div>

<%@ include file="../../includes/adminFooter.jsp" %>


<script type="text/javascript" src="/resources/script/apiTest.js"></script>
<script>

//Date Range Picker
$(function() {
  $('input[name="departureDate"]').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    minYear: 1901,
    maxYear: parseInt(moment().format('YYYY'),10)
  }, function(start, end, label) {
	  var startDate = start.format('YYYYMMDD');
	  var inputDate = document.getElementById('date');
	  
      inputDate.setAttribute("value", startDate);
  });
  
  
});


</script>
</body>
</html>