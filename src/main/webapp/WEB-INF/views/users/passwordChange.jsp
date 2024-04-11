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
						<h3 class="panel-title">로그인</h3>
					</div>
					<div class="panel-body">
						<form action="/users/passwordChange" method="post" name="frm">
							<sec:csrfInput/>
							<fieldset>
								<div class="form-group">
									<h4>변경할 비밀번호를 입력해주세요.</h4>
									<label for="password">비밀번호</label>
									<input class="form-control" placeholder="비밀번호를 입력하세요" name="password" id="password"
										type="password"> 
								</div>
								<div class="form-group">
									<label for="password_check">비밀번호 확인</label>
									<input class="form-control" placeholder="한번 더 비밀번호를 입력하세요" name="password_check" id="password_check"
										type="password"> 
								</div>

								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" value="인증번호 전송"
									class="btn btn-lg btn-success btn-block" onclick="return passwordCheck()">
								
								
							</fieldset>
						</form>
						
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
	<script type="text/javascript">
		// 비밀번호 input 입력확인 및 일치 여부 확인
		function passwordCheck(){
			if(document.frm.password.value == ''){
				alert("비밀번호를 입력하세요.");
				frm.password.focus();
				return false;
			}
			if(document.frm.password_check.value == ''){
				alert("비밀번호 확인을 입력하세요.");
				frm.password.focus();
				return false;
			}
			if(document.frm.password.value == document.frm.password_check.value){
				alert("비밀번호가 일치하기 않습니다.");
				frm.password.focus();
				return false;
			}
			
			return true;
		}
	</script>	

</body>
</html>