<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="../../includes/adminHeader.jsp" %>


<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<div class="noticeWrite form">
				<div class="card">
                            <div class="card-header">
                                <strong>관리자 상세보기</strong>
                            </div>
                            
                            <div class="card-body card-block">
                                	
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="uno" class=" form-control-label">관리자 번호</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="ano" name="ano" readonly  class="form-control" value="${vo.ano }"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="id" class=" form-control-label">아이디</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="id" name="id" readonly  class="form-control" value="${vo.id }"></div>
                                    </div>
                                    
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="phone" class=" form-control-label">전화번호</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="phone" name="phone" readonly  class="form-control" value="${vo.phone }"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="email" class=" form-control-label">이메일</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="email" name="email" readonly  class="form-control" value="${vo.email }"></div>
                                    </div>
                                    
                                
                            </div>
                            <div class="card-footer">
                               
                                <button type="button" class="btn btn-info btn-sm" onclick="location.href='/admin/adminList'">
                                    <i class="fa fa-list-alt"></i> List
                                </button>
                            </div>
                            
                        </div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp" %>
<script type="text/javascript" src="/resources/script/admin.js"></script>
</body>
</html>