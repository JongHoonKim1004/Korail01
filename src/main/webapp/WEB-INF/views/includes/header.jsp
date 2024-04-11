<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- header -->
<header>
	<div class="header">
		<div class="logo">
			<a href="/" target="_self"><img alt=""
				src="/resources/img/nav/korail.png"></a>
		</div>
		<div class="loginNav">
			<ul>

				<li class="loginNav_li"><a href="/qna/qnaList">Q&A</a></li>

				<sec:authentication property="name" var="name" />
				<!-- 권한에 관계없이 로그인 한 사람만 출력 -->
				<sec:authorize access="isAuthenticated()">
					<li class="loginNav_li"><c:out value="${name} 님" /></li>
					<!-- 일반회원만 출력 -->
					<sec:authorize access="hasRole('ROLE_USER')">
						<c:choose>

							<c:when test="${empty sessionScope.access_Token }">
								<!-- 로그인 한 사람중 카카오 로그인으로 로그인 하지 않은 경우 출력 -->
								<li class="loginNav_li"><a href="/users/logout">로그아웃</a></li>
								<!-- /로그인 한 사람중 카카오 로그인으로 로그인 하지 않은 경우 출력 -->
							</c:when>

							<c:otherwise>
								<!-- 로그인 한 사람중 카카오 로그인으로 로그인하여 액세스 토큰이 세션에 존재하는 경우 출력 -->
								<li class="loginNav_li"><a
									href="https://kauth.kakao.com/oauth/logout?client_id=86ae0f597d243b1233b4eab0ffc4965f&logout_redirect_uri=http://localhost:8282/users/kakaoLogout">로그아웃</a></li>
								<!-- /로그인 한 사람중 카카오 로그인으로 로그인하여 액세스 토큰이 세션에 존재하는 경우 출력 -->
							</c:otherwise>

						</c:choose>
						<li class="loginNav_li"><a href="/mypage/main">마이페이지</a></li>
					</sec:authorize>
					<!-- /일반회원만 출력 -->

					<!--  관리자만 출력 -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="loginNav_li"><a href="/admin/logout">로그아웃</a></li>
						<li class="loginNav_li"><a href="/admin/Dashboard">관리자
								페이지</a></li>
					</sec:authorize>
					<!--  /관리자만 출력 -->
				</sec:authorize>
				<!-- /권한에 관계없이 로그인 한 사람만 출력 -->

				<!-- 로그인 되지 않은 사람만 출력 -->
				<sec:authorize access="!isAuthenticated()">
					<li class="loginNav_li"><a href="/users/login">로그인</a></li>
					<li class="loginNav_li"><a href="/users/register">회원가입</a></li>
					<li class="loginNav_li"><a href="/notice/noticeList">공지사항</a></li>
				</sec:authorize>
				<!-- /로그인 되지 않은 사람만 출력 -->
			</ul>
		</div>
		<div class="header_blank"></div>
		<div class="nav" style="display: block;">
			<ul>
				
				<a href="/station/stationSearch">
					<li class="nav_li">철도역 검색</li>
				</a>
				<a href="/train/search">
					<li class="nav_li">승차권 예매</li>
				</a>
				<a href="/notice/noticeList">
					<li class="nav_li">공지사항</li>
				</a>
				<a href="/qna/qnaList">
					<li class="nav_li">Q&A</li>
				</a>
			</ul>
		</div>
	</div>
</header>