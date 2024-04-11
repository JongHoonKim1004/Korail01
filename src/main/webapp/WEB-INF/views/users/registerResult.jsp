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
<link rel="stylesheet" href="/resources/css/login.css">
<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/css/bootstrap/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/css/bootstrap/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/css/bootstrap/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div class="wrap">
		<div class="panel panel-primary" style="text-align: center;">
			<div class="panel-heading">회원가입이 완료되었습니다</div>
			<div class="panel-body"
				style="height: 500px; font-size: 30px; padding-top: 100px;">
				회원가입을 축하드립니다. <br> 많은 이용 부탁드립니다.
				<div class="result-buttonDiv"
					style="font-size: 16px; margin-top: 50px;">
					<button class="result-btn" onclick="location.href='/users/login'">로그인</button>
					<button class="result-btn" onclick="location.href='/'">홈으로</button>
				</div>
			</div>
			<div class="panel-footer">아이디 : ${result}</div>
		</div>
	</div>


		<%@ include file="../includes/footer.jsp"%>

		<!-- jQuery -->
		<script src="/resources/script/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="/resources/script/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="/resources/script/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="/resources/script/sb-admin-2.js"></script>
</body>
</html>