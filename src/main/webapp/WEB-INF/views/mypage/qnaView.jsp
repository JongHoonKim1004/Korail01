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
						<div class="card-header">
							<strong>회원 정보 변경</strong>
						</div>
						<div class="card-body card-block">
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="qno" class=" form-control-label">Q&A 번호</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="qno" name="qno" class="form-control"
										readonly value="${dto.qna.qno }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="title" class=" form-control-label">제목</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="title" name="title" class="form-control"
										readonly value="${dto.qna.title }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="content" class=" form-control-label">내용</label>
								</div>
								<div class="col-12 col-md-9">
									<textarea name="content" id="content" rows="9" readonly
										style="resize: none;" class="form-control">${dto.qna.content }</textarea>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="regDate" class=" form-control-label">Q&A
										등록일</label>
								</div>
								<div class="col-12 col-md-9">
									<fmt:formatDate value="${dto.qna.regDate }" var="formatDate" />
									<input type="text" id="regDate" name="regDate"
										class="form-control" readonly value="${formatDate }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="readCount" class=" form-control-label">조회수</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="readCount" name="readCount"
										class="form-control" readonly value="${dto.qna.readCount }">
								</div>
							</div>

						</div>
						<div class="card-footer">
							<input type="button" class="btn btn-danger" value="돌아가기"
								onclick="location.href='/mypage/qnaList?writer=${dto.qna.writer}'">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 댓글 -->
				<div class="container"
					style="margin-top: 100px; margin-bottom: 50px; padding: 0;">
					<h2>Q & A 답글</h2>
					<ul class="list-group">
						<c:choose>
							<c:when test="${empty dto.reply }">
								<li class="list-group-item">
									<div style="width: 100%; height: 20px; font-size: 12px;">
										<div style="float: left; width: 50%;">답글</div>
										<div style="float: right; width: 50%; text-align: right;">
											<fmt:formatDate value=""
												pattern="yyyy-MM-dd" />
										</div>
									</div>
									<div
										style="width: 100%; height: 40px; line-height: 40px; font-size: 16px;">답글이 없습니다</div>
								</li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${dto.reply }" var="reply">
									<li class="list-group-item">
										<div style="width: 100%; height: 20px; font-size: 12px;">
											<div style="float: left; width: 50%;">답글</div>
											<div style="float: right; width: 50%; text-align: right;">
												<fmt:formatDate value="${reply.regDate }"
													pattern="yyyy-MM-dd" />
											</div>
										</div>
										<div
											style="width: 100%; height: 40px; line-height: 40px; font-size: 16px;">${reply.reply }</div>
									</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>

				</div>
				<!-- /댓글 -->
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