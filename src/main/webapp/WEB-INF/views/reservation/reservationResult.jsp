<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Korail</title>
  <link rel="stylesheet" href="/resources/css/reset.css">
  <link rel="stylesheet" href="/resources/css/common.css">
  <link rel="stylesheet" href="/resources/css/reservationResult.css">
  
</head>
<body>
<%@ include file="../includes/header.jsp" %>

<div id="wrap">
  <div class="reservation_success">
    <div class="success_title">
      예약이 완료되었습니다.
    </div>
    <div class="success_table">
      <table>
        <!-- 여기에 예약정보 입력 -->
      </table>
      <div class="success_btn">
        <input type="button" class="mainpage_btn" onclick="location.href='/'" value="메인 페이지로">
      </div>
    </div>
  </div>
</div>



<%@ include file="../includes/footer.jsp" %>
</body>
</html>