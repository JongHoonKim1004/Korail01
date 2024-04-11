<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="name" var="username" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/noticeqna.css">

<script type="text/javascript" src="/resources/script/noticeqna.js"></script>

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

	<div id="wrap">
		<%@ include file="../includes/notice_qna.jsp"%>
		<div class="noticeqna_main">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<form action="/qna/qnaWrite" method="post" class="form-horizontal">
							<sec:csrfInput/>
							<div class="card-header">
								<strong>Q&A 작성하기</strong>
							</div>
							<div class="card-body card-block">


								<div class="row form-group">
									<div class="col col-md-3">
										<label for="title" class=" form-control-label">제목</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="title" name="title" placeholder="Text"
											class="form-control">
									</div>
								</div>

								<div class="row form-group">
									<div class="col col-md-3">
										<label for="content" class=" form-control-label">내용</label>
									</div>
									<div class="col-12 col-md-9">
										<textarea name="content" id="content" rows="9"
											class="form-control"></textarea>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="writer" class=" form-control-label">작성자</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="writer" name="writer"
											placeholder="Text" class="form-control" readonly
											style="resize: none;" value="${id }">
									</div>
								</div>

							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary btn-sm" onclick="return qnaWriteCheck()">
									<i class="fa fa-dot-circle-o"></i> 등록하기
								</button>
								<button type="reset" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> 다시 작성하기
								</button>
								<button type="button" class="btn btn-danger btn-sm"
									onclick="location.href='/qna/qnaList'">
									<i class="fa fa-tasks"></i> 목록으로
								</button>
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

</body>
</html>