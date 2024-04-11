<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@ include file="../includes/adminHeader.jsp" %>

<div class="content">
	<div class="animated fadeIn">
		<div class="content">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<div class="card border border-secondary">
						<form action="/logout" method="post">
							<sec:csrfInput/>
							<div class="card-header">
								<strong class="card-title">로그아웃</strong>
							</div>
							<div class="card-body">
								<p class="card-text">로그아웃 하시겠습니까?</p>
								<button type="submit" class="btn btn-warning">로그아웃</button>
							</div>
						</form>
					</div>	
				</div>
				<div class="col-lg-4"></div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/adminFooter.jsp" %>
</body>
</html>