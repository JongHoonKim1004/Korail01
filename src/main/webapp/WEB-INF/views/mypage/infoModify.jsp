<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/login.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


</head>

<body>

	<%@ include file="../includes/header.jsp"%>

	<div class="container">
		<div class="col-lg-12">
			<div class="row">
			<div class="col-md-12">
				<div class="card">
					<form action="/mypage/infoModify" method="post" class="form-horizontal" name="frm">
						<sec:csrfInput/>
						<input type="hidden" name="uno" value="${user.uno }">
						<div class="card-header">
							<strong>회원 정보 변경</strong>
						</div>
						<div class="card-body card-block">
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="id" class=" form-control-label">아이디</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="id" name="id" class="form-control" readonly value="${user.id }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="name" class=" form-control-label">이름</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="name" name="name" class="form-control" ${not empty access_Token ? "readonly" : ""} value="${user.name }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="password" class=" form-control-label">비밀번호</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="password" id="password" name="password"
										class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="password_check" class=" form-control-label">비밀번호 확인</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="password" id="password_check" name="password_check"
										class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="email" class=" form-control-label">이메일</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="email" id="email" name="email" 
										class="form-control" ${not empty access_Token ? "readonly" : ""} value="${user.email }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="phone" class=" form-control-label">전화번호</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="phone" name="phone" class="form-control" value="${user.phone }">
								</div>
							</div>
						</div>
						<div class="card-footer">
							<input type="submit" class="btn btn-warning" value="변경하기" onclick="return infoModifyCheck()">
							<input type="button" class="btn btn-primary" value="돌아가기" onclick="location.href='/mypage/main'">
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	
	<script type="text/javascript">
		// 이 페이지에서 submit 누르면 정보 입력 다 되었는지 체크
		function infoModifyCheck(){
			if(document.frm.name.value == ''){
				alert("이름을 입력해주세요");
				frm.name.focus();
				return false;
			}
			if(document.frm.password.value == ''){
				alert("비밀번호를 입력해주세요");
				frm.password.focus();
				return false;
			}
			if(document.frm.password.value != document.frm.password_check.value){
				alert("비밀번호가 일치하지 않습니다");
				frm.password_check.focus();
				return false;
			}
			if(document.frm.email.value == ''){
				alert("이메일을 입력해주세요");
				frm.email.focus();
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>