<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@ include file="../../includes/adminHeader.jsp" %>

<div class="content">
	<div class="animated fadeIn">
		<div class="container">
			<div class="card">
                            <div class="card-header">
                                <strong>새 관리자 등록</strong>
                            </div>
                            <form action="/admin/adminCreate" method="post" class="form-horizontal" name="frm">
                            <sec:csrfInput/>
                            <div class="card-body card-block">
                            	<div class="row form-group">
                                    <div class="col col-md-3"><label for="id" class=" form-control-label">관리자 아이디</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="id" name="id" placeholder="관리자 아이디" class="form-control"></div>
                                </div>    
                                 	   
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="password" class=" form-control-label">관리자 비밀번호</label></div>
                                    <div class="col-12 col-md-9"><input type="password" id="password" name="password" placeholder="관리자 비밀번호" class="form-control"></div>
                                </div>
                                
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="phone" class=" form-control-label">전화번호</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="phone" name="phone" placeholder="전화번호"  class="form-control"></div>
                                </div>    
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="email" class=" form-control-label">이메일</label></div>
                                    <div class="col-12 col-md-9"><input type="email" id="email" name="email" placeholder="이메일"  class="form-control"></div>
                                </div>
                                
                            </div>
                            
                            
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm" onclick="return adminRegisterCheck()">
                                    <i class="fa fa-dot-circle-o"></i> Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> Reset
                                </button>
                                <button type="button" class="btn btn-info btn-sm" onclick="location.href='/admin/adminList'">
                                    <i class="fa fa-list-alt"></i> List
                                </button>
                            </div>
                            </form>
                        </div>			
		</div>
	</div>
</div>


<%@ include file="../../includes/adminFooter.jsp" %>


</body>
</html>