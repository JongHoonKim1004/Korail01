<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../includes/adminHeader.jsp"%>

<div class="content">
	<div class="animated fadeIn">
		<!-- station -->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">철도역 목록</strong>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">주소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="station">
									<tr>
										<th scope="row">${station.sno }</th>
										<td><a class="move" href="${station.sno }">${station.name}</a></td>
										<td>${station.addr }</td>
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
									<li class="paginate_button"><a
										class="page-link ${pageMaker.cri.pageNum == num ? 'active' : ''}"
										href="${num}">${num}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="paginate_button"><a class="page-link"
										href="${pageMaker.endPage + 1}">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- /paging -->
						<form id='actionForm' action="/admin/stationList" method='get'>
							<input type='hidden' name='pageNum'
								value='${pageMaker.cri.pageNum}'> <input type='hidden'
								name='amount' value='${pageMaker.cri.amount}'>
						</form>
						<div class="col-sm-6">${message }</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /station -->

	</div>
</div>

<%@ include file="../../includes/adminFooter.jsp"%>
<script type="text/javascript">
$(document).ready(function(){		
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
					
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action","/admin/stationList");
		actionForm.submit();	
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='sno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/admin/stationView");
		actionForm.submit();
	});
});
</script>
</body>
</html>