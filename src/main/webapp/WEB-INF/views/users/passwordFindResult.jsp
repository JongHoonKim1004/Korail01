<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
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

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">비밀번호 변경 성공</h3>
					</div>
					<div class="panel-body">
							<fieldset>
								<div class="form-group">
									<label for="id">비밀번호 변경이 성공적으로 되었습니다.</label><br>
									
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="button" value="로그인 페이지로" onclick="location.href='/login'"
									class="btn btn-lg btn-success btn-block">
								<input type="button" value="아이디 찾기" onclick="location.href='/users/idFind'"
									class="btn btn-lg btn-danger btn-block">
							</fieldset>
						
					</div>
				</div>
			</div>
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