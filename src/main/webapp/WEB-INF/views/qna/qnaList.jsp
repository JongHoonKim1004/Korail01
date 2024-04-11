<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/resources/css/noticeqna.css">

<!-- Bootstrap Core CSS -->
<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/css/bootstrap/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="/resources/css/bootstrap/dataTables.bootstrap.min.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/resources/css/bootstrap/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/css/bootstrap/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/css/bootstrap/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style>
* {
	box-sizing: content-box;
}
</style>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div id="wrap">
		<%@ include file="../includes/notice_qna.jsp"%>
		<div class="noticeqna_main">
			<div class="noticeList_table">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Q & A</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list }" var="qna">
												<tr>
													<td>${qna.qno }</td>
													<td><a class="move" href="${qna.qno }">${qna.title }</a></td>
													<td>${qna.writer }</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${qna.regDate }"></fmt:formatDate></td>
													<td>${qna.readCount }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- paging -->
									<div class="pull-right">
										<ul class="pagination">
											<c:if test="${pageMaker.prev}">
												<li class="paginate_button"><a class=“page-link”
													href="${pageMaker.startPage - 1}">Previous</a></li>
											</c:if>

											<c:forEach var="num" begin="${pageMaker.startPage}"
												end="${pageMaker.endPage}">
												<li class="paginate_button"><a
													class="page-link ${pageMaker.cri.pageNum == num ? 'active' : ''}"
													href="${num}">${num}</a></li>
											</c:forEach>

											<c:if test="${pageMaker.next}">
												<li class="paginate_button"><a class=“page-link”
													href="${pageMaker.endPage + 1}">Next</a></li>
											</c:if>
										</ul>
									</div>
									<!-- /paging -->
									<form id='actionForm' action="/qna/qnaList" method='get'>
										<input type='hidden' name='pageNum'
											value='${pageMaker.cri.pageNum}'> <input
											type='hidden' name='amount' value='${pageMaker.cri.amount}'>
									</form>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>

					<!-- /.col-lg-6 -->
				</div>
			</div>
			<div class="noticeList_btnDiv">
				<!-- 스프링 시큐리티 적용 필요, 일반회원만 작성 가능하도록 -->
				<button class="btn btn-primary"
					onclick="location.href='/qna/qnaWrite'">Q&A 작성</button>
			</div>
			<div class="noticeList_message">${message }</div>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

	<script type="text/javascript">
$(document).ready(function(){		
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
					
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action","/qna/qnaList");
		actionForm.submit();	
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='qno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/qna/qnaView");
		actionForm.submit();
	});
});
</script>

</body>
</html>