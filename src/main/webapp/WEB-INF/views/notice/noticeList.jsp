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
<style>
* {
	box-sizing: content-box !important;
}
</style>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/noticeqna.css">
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

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
							<div class="panel-heading">공지사항</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th style="width: 350px;">제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list }" var="notice">
												<tr>
													<td>${notice.nno }</td>
													<td><a class="move" href="${notice.nno }">${notice.title }</a></td>
													<td>${notice.writer }</td>
													<td><fmt:formatDate value="${notice.regDate }"
															pattern="yyyy-MM-dd" /></td>
													<td>${notice.readCount }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- paging -->
									<div class="pull-right">
										<ul class="pagination">
											<c:if test="${pageMaker.prev}">
												<li class="paginate_button"><a class=“page-link” href="${pageMaker.startPage - 1}">Previous</a></li>
											</c:if>

											<c:forEach var="num" begin="${pageMaker.startPage}"
												end="${pageMaker.endPage}">
												<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
											</c:forEach>

											<c:if test="${pageMaker.next}">
												<li class="paginate_button"><a class=“page-link” href="${pageMaker.endPage + 1}">Next</a></li>
											</c:if>
										</ul>
									</div>
									<!-- /paging -->
									<form id='actionForm' action="/notice/noticeList" method='get'>
										<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
										<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
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

		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	
<script>
$(document).ready(function(){		
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
					
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action","/notice/noticeList");
		actionForm.submit();	
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='nno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/notice/noticeView");
		actionForm.submit();
	});
});
</script>

</body>
</html>