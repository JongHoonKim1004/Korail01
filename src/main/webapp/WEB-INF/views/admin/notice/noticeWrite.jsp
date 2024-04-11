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
                                <strong>공지사항 작성</strong>
                            </div>
                            <form action="/admin/noticeWrite" method="post" class="form-horizontal" name="frm">
                            	<sec:csrfInput/>
                            	<input type='hidden' name='pageNum' value='${cri.pageNum}'>
								<input type='hidden' name='amount' value='${cri.amount}'>
                            <div class="card-body card-block">
                                
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="title" class=" form-control-label">제목</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="title" name="title" placeholder="공지사항 제목을 입력하세요" class="form-control"></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="writer" class="form-control-label">작성자</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="writer" name="writer" readonly class="form-control" value="${username }"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="content" class=" form-control-label">내용</label></div>
                                        <div class="col-12 col-md-9"><textarea name="content" id="content" rows="9" placeholder="공지사항 내용을 입력하세요" class="form-control"></textarea></div>
                                    </div>
                                    
                                    
                                
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm" onclick="return adminBoardCheck()">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                            </div>
                            </form>
                        </div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp" %>

<script type="text/javascript" src="/resources/script/admin.js"></script>
</body>
</html>