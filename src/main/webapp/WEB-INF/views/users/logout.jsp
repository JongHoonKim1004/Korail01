<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/login.css">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

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

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div class="content" style="background:white;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<div class="card border border-secondary">
						<form action="/logout" method="post">
							<sec:csrfInput/>
							<div class="card-header">
								<strong class="card-title">로그아웃</strong>
							</div>
							<div class="card-body">
								<p class="card-text">로그아웃 하시겠습니까?</p>
								<button type="submit" class="btn btn-warning">로그아웃</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-4"></div>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>