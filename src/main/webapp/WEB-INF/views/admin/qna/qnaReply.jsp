<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="name" var="username"/>    
<%@ include file="../../includes/adminHeader.jsp" %>


<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<div class="noticeWrite form">
				<div class="card">
                            <div class="card-header">
                                <strong>Q&A 답변 작성</strong>
                            </div>
                            <form action="/admin/qnaReply" method="post" class="form-horizontal">
                            	<sec:csrfInput/>
                            	<input type="hidden" value="${vo.qno }" name="qno">
                            	<input type="hidden" value="${cri.pageNum }" name="pageNum">
                            	<input type="hidden" value="${cri.amount }" name="amount">
                            <div class="card-body card-block">
                                	<div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Q&A 번호</label></div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${vo.qno }</p>
                                        </div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="title" class=" form-control-label">Q&A 제목</label></div>
                                        <div class="col-12 col-md-9"><input type="text"  readonly  class="form-control" value="${vo.title }"></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="writer" class="form-control-label">Q&A 작성자</label></div>
                                        <div class="col-12 col-md-9"><input type="text"  readonly class="form-control" value="${vo.writer }"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="content" class=" form-control-label">Q&A 내용</label></div>
                                        <div class="col-12 col-md-9"><textarea  rows="9"  style="resize: none" readonly class="form-control">${vo.content }</textarea></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="reply" class=" form-control-label">답글</label></div>
                                        <div class="col-12 col-md-9"><textarea  rows="4"  style="resize: none" name="reply" class="form-control"></textarea></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="writer" class="form-control-label">답글 작성자</label></div>
                                        <div class="col-12 col-md-9"><input type="text" name="replyer"  class="form-control" value="${username }"></div>
                                    </div>
                                
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-pencil"></i> Reply
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                                <button type="button" class="btn btn-info btn-sm" onclick="location.href='/admin/qnaList'">
                                    <i class="fa fa-list-alt"></i> List
                                </button>
                            </div>
                            </form>
                        </div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp" %>
</body>
</html>