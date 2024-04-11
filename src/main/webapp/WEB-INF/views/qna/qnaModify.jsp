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
<link rel="stylesheet" href="/resources/css/noticeqna.css">
<script type="text/javascript" src="/resources/script/noticeqna.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div id="wrap">
		<%@ include file="../includes/notice_qna.jsp"%>
		<div class="noticeqna_main">
			<h1 align="center">Q & A 수정하기</h1>
			<form name="frm" action="/qna/qnaModify" method="post">
				<sec:csrfInput/>
				<input type='hidden' name='pageNum' value='${cri.pageNum}'>
				<input type='hidden' name='amount' value='${cri.amount}'>
				<input type="hidden" name="qno" value="${qna.qno }">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" name="title"
						value="${qna.title }">
				</div>

				<div class="form-group">
					<label for="comment">내용:</label>
					<textarea class="form-control" rows="5" name="content" style="resize: none; box-sizing: border-box;">${qna.content}</textarea>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">작성자</span>
					</div>
					<input type="text" class="form-control" name="writer"
						value="${qna.writer }" readonly>
				</div>
				<div class="form-group" style="float: right;">
					<input type="submit" value="등록하기" class="btn btn-primary" onclick="qnaModifyCheck()">
					<input type="reset" value="다시 입력하기" class="btn btn-secondary">
					<input type="button" data-oper="list" value="Q&A로" class="btn btn-info" onclick="location.href='/qna/qnaList'">
				</div>
			</form>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var form = $("form[name='frm']");
			$("input[data-oper='list']").on("click",function(e){
				e.preventDefault();
				form.attr("action", "/qna/qnaList").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				form.empty();
				form.append(pageNumTag);
				form.append(amountTag);
				
				form.submit();
			});
		});
	</script>
</body>
</html>