<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../includes/adminHeader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<strong class="card-title">예약 목록</strong>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">노선 번호</th>
								<th scope="col">예약자 명</th>
								<th scope="col">좌석 번호</th>
								<th scope="col">예약 시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="reservation">
								<tr>
									<td>${reservation.rno }</td>
									<td>${reservation.tno }</td>
									<td>${reservation.user_id }</td>
									<td>${reservation.seat_id }</td>
									<td><fmt:formatDate value="${reservation.resDate }" pattern="yyyy년 MM월 dd일"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- paging -->
						<div class="pull-right">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button"><a class="page-link"
										href="${pageMaker.startPage - 1}">Previous</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
									<a class="page-link" href="${num}">${num}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="paginate_button"><a class="page-link"
										href="${pageMaker.endPage + 1}">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- /paging -->
						<form id='actionForm' action="/admin/reservationList" method='get'>
							<input type='hidden' name='pageNum'
								value='${pageMaker.cri.pageNum}'> <input type='hidden'
								name='amount' value='${pageMaker.cri.amount}'>
						</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../includes/adminFooter.jsp"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log("click");

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.attr("action",
											"/admin/reservationList");
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='rno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/admin/reservationView");
											actionForm.submit();
										});
					});
</script>
</body>
</html>