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

	<div class="row">
		<div class="content">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">나의 Q&A</strong>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">


								<table class="table">
									<thead>
										<tr>
											<th scope="col">Q&A 번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>
											<th scope="col">답변수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dtoList }" var="dto">
											
												<tr>
													<td>${dto.qna.qno }</td>
													<td><a href="/mypage/qnaView?qno=${dto.qna.qno }">${dto.qna.title }</a></td>
													<td>${dto.qna.writer }</td>
													<td><fmt:formatDate value="${dto.qna.regDate }"
															pattern="yyyy년 MM월 dd일" /></td>
													<td>${dto.qna.readCount }</td>
													<td>${dto.reply.size() }</td>
												</tr>
											
										</c:forEach>
									</tbody>
								</table>



								<button class="btn btn-primary"
									onclick="location.href='/mypage/main'">메인 페이지로</button>
							</div>
						</div>
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