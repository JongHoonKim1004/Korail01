<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../includes/adminHeader.jsp" %>

<div class="content">
	<div class="animated fadeIn">
		<!-- station -->
		<div class="row">
			<div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">관리자 목록</strong>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                          <th scope="col">관리자 번호</th>
                                          <th scope="col">아이디</th>
                                          <th scope="col">전화번호</th>
                                          <th scope="col">이메일</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                	<c:forEach items="${list }" var="admin">
                                		<tr>
                                			<th scope="row">${admin.ano }</th>
                                			<td><a href="/admin/adminView?ano=${admin.ano }">${admin.id }</a></td>
                                			<td>${admin.phone }</td>
                                			<td>${admin.email }</td>
                                		</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                            <div>
                            	${message }
                            </div>
                        </div>
                    </div>
                </div>
		</div>
		<!-- /station -->
	
	</div>
</div>

<%@ include file="../../includes/adminFooter.jsp" %>
</body>
</html>