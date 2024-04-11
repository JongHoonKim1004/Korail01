<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크 - Korail</title>
<link rel="stylesheet" href="/resources/css/login.css">
<script type="text/javascript" src="/resources/script/users.js"></script>
</head>
<body>
<div class="idCheck">
	<h1 align="center">아이디 중복 체크</h1>
	<form action="/users/idCheck" name="frm">
		<div class="idcheck-input" align='center'>
		<input type="text" name="id" id="id" value=${id }>
		<input type="submit" value="중복 확인">
		<input type="hidden" name="reid" id="" value="">
		<c:if test="${result == 0 }">
			<p>사용 가능한 아이디입니다</p>
			<input type="button" value="사용하기" class="cancel" onclick="idok()">
		</c:if>
		<c:if test="${result >= 1 }">
			<p>
				중복된 아이디입니다. 다시 입력해주세요.
			</p>
		</c:if>
	</div>
	</form>
</div>
</body>
</html>