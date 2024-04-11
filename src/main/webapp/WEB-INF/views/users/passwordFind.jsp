<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
						<form action="/users/passwordFind" method="post" name="frm">
							<sec:csrfInput />
							<fieldset>
								<div class="form-group">
									<h4>
										아이디와 이메일 주소를 입력하세요.<br>인증번호가 전송됩니다.
									</h4>
									<label for="id">아이디</label> <input class="form-control"
										placeholder="아이디" name="id" id="id" type="text" autofocus>
								</div>
								<div class="form-group">
									<label for="email">이메일</label> <input class="form-control"
										placeholder="이메일" name="email" id="email" type="email"
										autofocus>
								</div>

								<!-- Change this to a button or input when using this as a form -->
								<input type="button" value="인증번호 전송"
									class="btn btn-lg btn-success btn-block" id="sendCode">
								<div class="form-group" id="codeDiv">
									<div class="row">
										<div class="col-md-12">
											<label for="code">인증번호를 입력해주세요.</label> <br>
											<br> <label for="code">인증번호</label> <input type="text"
												name="code" id="code" class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<input type="button" value="인증번호 확인"
												onclick="return checkCode()" class="btn btn-primary">
											<input type="submit" value="비밀번호 찾기"
												onclick="return checkInput()" class="btn btn-primary">
											<input type="hidden" name="checkedEmail">
										</div>
									</div>
								</div>

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
		// 버튼 클릭 전에는 인증번호 입력 창 숨기기
		$("#codeDiv").hide();

		// 버튼 클릭시 이메일 입력 된지 체크 및 입력 확인시 ajax를 통해 이메일 발신
		$("#sendCode").on("click", function(e) {
			if ($("input[name='email']").val() == '') {
				alert("이메일 주소를 입력해주세요.");
				$("input[nmame='email']").focus();
			} else {
				$("#codeDiv").show();
				var email = $("input[name='email']").val();

				$("input[name='id']").attr("readonly", "readonly");
				$("input[name='email']").attr("readonly", "readonly");

				$.ajax({
					type : 'post',
					url : '/email/send',
					contentType : 'text/plain',
					data : email,
					success : function(result) {
						console.log(result);
						alert("인증번호가 전송되었습니다.");
					},
					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			}

		});

		// function checkCode
		// 입력한 인증번호를 ajax 를 통해 비교
		function checkCode() {
			var Code = $("input[name='code']").val();

			$.ajax({
				type : 'post',
				url : '/email/authCode',
				data : {
					inputCode : Code
				},
				success : function(result) {
					if (result) {
						$("input[name='checkedEmail']").val(
								$("input[name='email']"));
						alert("인증 번호가 일치합니다. 비밀번호 찾기 버튼을 눌러주세요");
					} else {
						alert("인증 번호가 일치하지 않습니다. 다시 한번 확인해주세요");
					}
				}
			});
		}
	</script>
</body>
</html>