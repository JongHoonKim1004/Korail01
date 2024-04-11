<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../includes/adminHeader.jsp"%>


<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<div class="noticeWrite form">
				<div class="card">
					<div class="card-header">
						<strong>Q & A</strong>
					</div>
					<form action="/admin/qnaDelete" method="post"
						class="form-horizontal">
						<input type="hidden" name="qno" value="${vo.qno }">
						<sec:csrfInput />
						<div class="card-body card-block">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">Q&A 번호</label>
								</div>
								<div class="col-12 col-md-9">
									<p class="form-control-static">${vo.qno }</p>
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
								data-oper='reply'>
								<i class="fa fa-pencil"></i> Reply
							</button>
							<button type="submit" class="btn btn-danger btn-sm"
								onclick="return adminDeleteCheck()">
								<i class="fa fa-ban"></i> Delete
							</button>
							<button type="button" class="btn btn-info btn-sm"
								data-oper='list'>
								<i class="fa fa-list-alt"></i> List
							</button>
						</div>
					</form>
					<form id='operForm' action="/admin/qnaList" method='get'>
						<input type='hidden' id="qno" name='qno' value='${vo.qno}'>
						<input type='hidden' name='pageNum' value='${cri.pageNum}'>
						<input type='hidden' name='amount' value='${cri.amount}'>
					</form>
				</div>
				<div class="card">
					<div class="card-header">
						Q & A 답글
					</div>
					<div class="card-body card-block">
						<!-- 댓글 -->
						<div class="col-lg-12">
							<ul class="list-group">
								<li class="list-group-item">
									<div style="width: 100%; height: 20px; font-size: 12px;">
										<div style="float: left; width: 50%;">답글</div>
										<div style="float: right; width: 50%; text-align: right;">
											올린시간</div>
									</div>
									<div
										style="width: 100%; height: 40px; line-height: 40px; font-size: 16px;">내용</div>
								</li>
							</ul>
							<div class="panel-footer"></div>
						</div>
						<!-- /댓글 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp"%>
<script type="text/javascript" src="/resources/script/admin.js"></script>
<script type="text/javascript" src="/resources/script/reply.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var operForm = $("#operForm");
				$("button[data-oper='reply']").on(
						"click",
						function(e) {
							operForm.attr("action", "/admin/qnaReply").attr(
									"method", "get").submit();
						});

				$("button[data-oper='list']").on("click", function(e) {

					operForm.find("#qno").remove();
					operForm.attr("method", "get");
					operForm.attr("action", "/admin/qnaList");
					operForm.submit();

				});

				$("button[data-oper='remove']").on("click", function(e) {
					operForm.attr("action", "/admin/qnaDelete").submit();

				});
			});
</script>
<script type="text/javascript">
		//댓글 관련 스크립트
		$(document).ready(function(){
			var qnoValue = ${vo.qno};
			var replyUL = $(".list-group");
			
			console.log(qnoValue);
			console.log(replyUL);
			
			//showList
			function showList(page){
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
						str += '<div style="width: 100%; height: auto; line-height: 40px; font-size: 16px;">' + list[i].reply + '</div>';
						str += '</li>';						
					}
					
					replyUL.html(str);
					showReplyPage(replyCnt);
				}); //end function
			} // end showList
			
			showList(1);
			
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