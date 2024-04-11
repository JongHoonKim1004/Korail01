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
						<strong class="card-title">마이페이지</strong>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">유저 정보</strong>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="card">
													<div class="card-body card-block">
														<div class="row form-group">
															<div class="col col-md-3">
																<label class=" form-control-label">회원번호</label>
															</div>
															<div class="col-12 col-md-9">
																<p class="form-control-static">${user.uno }</p>
															</div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3">
																<label class=" form-control-label">아이디</label>
															</div>
															<div class="col-12 col-md-9">
																<p class="form-control-static">${user.id }</p>
															</div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3">
																<label class=" form-control-label">이름</label>
															</div>
															<div class="col-12 col-md-9">
																<p class="form-control-static">${user.name }</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="card">
													<div class="card-body card-block">
														<div class="row form-group">
															<div class="col col-md-3">
																<label class=" form-control-label">이메일</label>
															</div>
															<div class="col-12 col-md-9">
																<p class="form-control-static">${user.email }</p>
															</div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3">
																<label class=" form-control-label">전화번호</label>
															</div>
															<div class="col-12 col-md-9">
																<p class="form-control-static">${user.phone }</p>
															</div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3">
																<label class=" form-control-label">회원가입일</label>
															</div>
															<div class="col-12 col-md-9">
																<p class="form-control-static">
																	<fmt:formatDate value="${user.regDate }"
																		pattern="yyyy년 MM월 dd일" />
																</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<form action="/mypage/usersModify" method="post">
													<sec:csrfInput />
													<input type="hidden" name="uno" value="${user.uno }">
													<input type="hidden" name="id" value="${user.id }">
													<input type="hidden" name="name" value="${user.name }">
													<input type="hidden" name="email" value="${user.email }">
													<input type="hidden" name="phone" value="${user.phone }">
													<input type="hidden" name="regDate"
														value="${user.regDate }"> <input type="submit"
														class="btn btn-primary" value="정보 수정하기">
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<hr>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">나의 예약</strong>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div class="card">
													<div class="card-body card-block">
														<table class="table">
															<thead>
																<tr>
																	<th scope="col">예약번호</th>
																	<th scope="col">출발역</th>
																	<th scope="col">도착역</th>
																	<th scope="col">출발 시간</th>
																	<th scope="col">열차 등급</th>
																	<th scope="col">좌석 번호</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${dtoList }" var="dto">
																	<tr>
																		<td><a href="/mypage/reservationView?rno=${dto.reservationVO.rno }">${dto.reservationVO.rno }</a></td>
																		<td>${dto.trainVO.dep_place }</td>
																		<td>${dto.trainVO.arr_place }</td>
																		<td>${dto.trainVO.formattedDepTime }</td>
																		<td>${dto.trainVO.grade }</td>
																		<td>${dto.reservationVO.seat_id }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button class="btn btn-primary"
									onclick="location.href='/mypage/reservationList?user_id=${user.id}'">자세히
									보기</button>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong class="card-title">나의 Q&A</strong>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<div class="card">
													<div class="card-body card-block">
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
																<c:forEach items="${qnaList }" var="qna">
																	<c:forEach items="${replyCountList }" var="count">
																		<tr>
																			<td>${qna.qno }</td>
																			<td><a href="/mypage/qnaView?qno=${qna.qno }">${qna.title }</a></td>
																			<td>${qna.writer }</td>
																			<td><fmt:formatDate value="${qna.regDate }" pattern="yyyy년 MM월 dd일"/></td>
																			<td>${qna.readCount }</td>
																			<td>${count }</td>
																		</tr>
																	</c:forEach>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<button class="btn btn-primary"
									onclick="location.href='/mypage/qnaList?writer=${user.id}'">자세히
									보기</button>
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