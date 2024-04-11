<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/noticeqna.css">
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div id="wrap">
		<%@ include file="../includes/notice_qna.jsp"%>
		<div class="noticeqna_main">
			<div class="card">
				<form action="#" method="post" class="form-horizontal">
					<div class="card-header">
						<strong>Basic Form</strong> Elements
					</div>
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
								<input type="text" id="title" name="title"
									class="form-control" readonly value="${vo.title }">
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="content" class=" form-control-label">내용</label>
							</div>
							<div class="col-12 col-md-9">
								<textarea name="content" id="content" rows="9"
									class="form-control" readonly style="resize: none;">${vo.content}</textarea>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-primary btn-sm" data-oper="list" onclick="location.href='/notice/noticeList'">
							<i class="fa fa-dot-circle-o"></i> List
						</button>
					</div>
				</form>
				<form id='operForm' action="/notice/noticeList" method='get'>
					<input type='hidden' name='pageNum' value='${cri.pageNum}'>
					<input type='hidden' name='amount' value='${cri.amount}'>
				</form>
			</div>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	
<script type="text/javascript">
$(document).ready(function() {
  var operForm = $("#operForm"); 
  $("button[data-oper='list']").on("click", function(e){
    operForm.attr("action","/notice/noticeList");
    operForm.submit();
  });  
});
</script>
</body>
</html>