<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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
			<h1 align="center">Q & A</h1>
			<form action="/qna/qnaDelete" method="post">
				<sec:csrfInput />
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">번호</span>
					</div>
					<input type="text" class="form-control" name="qno"
						value="${qna.qno }" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" name="title"
						value="${qna.title }" readonly>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" name="writer"
						value="${qna.writer }" readonly>
				</div>
				<div class="form-group">
					<label for="content">내용:</label>
					<textarea class="form-control" rows="5" id="content"
						style="resize: none; width: 718px;" readonly>${qna.content}</textarea>
				</div>
				<div class="form-group" style="float: right; width: 100%;">
					<button class="btn btn-info" type="button"
						onclick="location.href='/qna/qnaList'" data-oper='list'>Q&A로</button>
					<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="principal"/>
							<c:if test="${principal.users.id eq qna.writer }">
								<button class="btn btn-danger" type="submit" data-oper='remove'>삭제하기</button>
								<button class="btn btn-warning" type="button"
									onclick="location.href='/qna/qnaModify?qno=${qna.qno}'"
									data-oper='modify'>수정하기</button>
							</c:if>
					</sec:authorize>
					
					
				</div>
			</form>
			<form id='operForm' action="/qna/qnaList" method='get'>
				<input type='hidden' id="qno" name='qno' value='${qna.qno}'>
				<input type='hidden' name='pageNum' value='${cri.pageNum}'>
				<input type='hidden' name='amount' value='${cri.amount}'>
			</form>
			
			<!-- 댓글 -->
			<div class="container" style="margin-top:100px; padding: 0;">
				<h2>Q & A 답글</h2>
				<ul class="list-group">
					<li class="list-group-item">
						<div style="width: 100%; height: 20px; font-size: 12px;">
							<div style="float: left; width: 50%;">답글</div>
							<div style="float: right; width: 50%; text-align: right;">
								올린시간</div>
						</div>
						<div style="width: 100%; height: 40px; line-height: 40px; font-size: 16px;">내용</div>
					</li>
				</ul>
				<div class="panel-footer"></div>
			</div>
			<!-- /댓글 -->
		</div>

	</div>



	<%@ include file="../includes/footer.jsp"%>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/qna/qnaModify").submit();
			});

			$("button[data-oper='list']").on("click", function(e) {

				operForm.find("#qno").remove();
				operForm.attr("action", "/qna/qnaList");
				operForm.submit();

			});

			$("button[data-oper='remove']").on("click", function(e) {
				operForm.attr("action", "/qna/qnaDelete").submit();

			});
		});
	</script>
	<script type="text/javascript" src="/resources/script/reply.js"></script>
	<script type="text/javascript">
		//댓글 관련 스크립트
		$(document).ready(function(){
			var qnoValue = ${qna.qno};
			var replyUL = $(".list-group");
			
			console.log(qnoValue);
			console.log(replyUL);
			
			showList(1);

			//showList
			function showList(page){
				console.log("working");
				replyService.getList({qno: qnoValue, page: page || 1}, function(replyCnt, list){
					if(page == -1){
						pageNum = Math.ceil(replyCnt/10.0);
						showList(pageNum);
						return;
					}
					
					var str = "";
					if(list == null || list.length == 0){
						replyUL.html("");
						return;
					}
					
					for(var i = 0, len = list.length || 0 ; i < len ; i++){
						str += '<li class="list-group-item">';
						str += '<div style="width: 100%; height: 20px; font-size: 12px;">';
						str += '<div style="float: left; width: 50%;">답글' + list[i].rno + '</div>';	
						str += '<div style="float: right; width: 50%; text-align: right;">' + replyService.displayTime(list[i].regDate) + '</div>'	
						str += '</div>';
						str += '<div style="width: 100%; height: 40px; line-height: 40px; font-size: 16px;">' + list[i].reply + '</div>';
						str += '</li>';						
					}
					
					replyUL.html(str);
					showReplyPage(replyCnt);
				}); //end function
			} // end showList
			
			
			
			// reply paging
			var pageNum = 1;
		    var replyPageFooter = $(".panel-footer");
		     function showReplyPage(replyCnt){
		     
			      var endNum = Math.ceil(pageNum / 10.0) * 10;  
			      var startNum = endNum - 9; 
			      
			      var prev = startNum != 1;
			      var next = false;
			      
			      if(endNum * 10 >= replyCnt){
			        endNum = Math.ceil(replyCnt/10.0);
			      }
			      
			      if(endNum * 10 < replyCnt){
			        next = true;
			      }
			      
			      var str = "<ul class='pagination pull-right'>";
			      
			      if(prev){
			        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			      }
			      
			      for(var i = startNum ; i <= endNum; i++){
			        
			        var active = pageNum == i? "active":"";
			        
			        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			      }
			      
			      if(next){
			        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
			      }
			      
			      str += "</ul></div>";
			      
			      console.log(str);
			      
			      replyPageFooter.html(str);
		    } // end reply paging
		    
		    //paging event
		    replyPageFooter.on("click", "li a", function(e){
		    	e.preventDefault();
		    	var targetPageNum = $(this).attr("href");
		    	
		    	pageNum = targetPageNum;
		    	
		    	showList(pageNum);
		    });
		    //end paging event
		});
	</script>
</body>
</html>