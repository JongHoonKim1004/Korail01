<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../includes/adminHeader.jsp"%>


<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<div class="noticeWrite form">
				<div class="card">
					<div class="card-header">
						<strong>공지사항 ${vo.nno }</strong>
					</div>
					<form action="/admin/noticeDelete" method="post"
						class="form-horizontal">
						<sec:csrfInput />
						<input type="hidden" value="${vo.nno }" name="nno">
						<div class="card-body card-block">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">공지사항 번호</label>
								</div>
								<div class="col-12 col-md-9">
									<p class="form-control-static">${vo.nno }</p>
								</div>
							</div>

							<div class="row form-group">
								<div class="col col-md-3">
									<label for="title" class=" form-control-label">제목</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="title" name="title" readonly
										placeholder="공지사항 제목을 입력하세요" class="form-control"
										value="${vo.title }">
								</div>
							</div>

							<div class="row form-group">
								<div class="col col-md-3">
									<label for="writer" class="form-control-label">작성자</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="writer" name="writer" readonly
										class="form-control" value="${vo.writer }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="content" class=" form-control-label">내용</label>
								</div>
								<div class="col-12 col-md-9">
									<textarea name="content" id="content" rows="9" readonly
										style="resize: none" placeholder="공지사항 내용을 입력하세요"
										class="form-control">${vo.content }</textarea>
								</div>
							</div>



						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-primary btn-sm"
								data-oper="modify">
								<i class="fa fa-pencil"></i> Modify
							</button>

							<button type="submit" class="btn btn-danger btn-sm"
								onclick="return adminDeleteCheck()" data-oper="remove">
								<i class="fa fa-ban"></i> Delete
							</button>
							<button type="button" class="btn btn-info btn-sm"
								data-oper="list">
								<i class="fa fa-list-alt"></i> List
							</button>
						</div>
					</form>
				</div>
				<form id='operForm' action="/admin/noticeModify" method='get'>
					<input type='hidden' id="nno" name='nno' value='${vo.nno}'>
					<input type='hidden' name='pageNum' value='${cri.pageNum}'>
					<input type='hidden' name='amount' value='${cri.amount}'>
				</form>
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp"%>
<script type="text/javascript" src="/resources/script/admin.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/admin/noticeModify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#nno").remove();
			operForm.attr("action", "/admin/noticeList");
			operForm.submit();

		});

		$("button[data-oper='remove']").on("click", function(e) {
			operForm.attr("action", "/admin/noticeDelete").submit();

		});
	});
</script>
</body>
</html>