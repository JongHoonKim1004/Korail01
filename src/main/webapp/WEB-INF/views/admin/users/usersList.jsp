<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../includes/adminHeader.jsp"%>

<div class="content">
	<div class="animated fadeIn">
		<!-- station -->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong class="card-title">회원 목록</strong>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">회원번호</th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="users">
									<tr>
										<th scope="row">${users.uno }</th>
										<td>${users.id }</td>
										<td><a class="move" href="${users.uno}">${users.name}</a></td>
										<td>${users.phone }</td>
										<td>${users.email }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${users.regDate }"></fmt:formatDate></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- paging -->
						<div class="container">
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="paginate_button"><a class="page-link" href="${pageMaker.startPage - 1}">Previous</a></li>
								</c:if>
								
								<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
									<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' }"><a class="page-link" href="${num}">${num }</a></li>
								</c:forEach>								
								
								<c:if test="${pageMaker.next }">
									<li class="paginate_button"><a class="page-link" href="${pageMaker.endPage + 1}">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- /paging -->
						<form id='actionForm' action="/admin/usersView" method='get'>
							<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						</form>
						<div>${message }</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /station -->

	</div>
</div>

<%@ include file="../../includes/adminFooter.jsp"%>

<script>
$(document).ready(function(){		
	var actionForm = $("#actionForm");
	
	$(".page-link").on("click", function(e){
		e.preventDefault();
		console.log("click");
					
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.attr("action", "/admin/usersList");
		actionForm.submit();	
	});
	
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='uno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action","/admin/usersView");
		actionForm.submit();
	});
});


</script>
</body>
</html>