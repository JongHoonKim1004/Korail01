<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../includes/adminHeader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<strong class="card-title">노선 목록</strong>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">출발역</th>
								<th scope="col">도착역</th>
								<th scope="col">출발 시간</th>
								<th scope="col">도착 시간</th>
								<th scope="col">열차 종류</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="train">
								<tr>
									<td><a href="/admin/trainView?tno=${train.tno }">${train.tno }</a></td>
									<td>${train.dep_place }</td>
									<td>${train.arr_place }</td>
									<td>${train.dep_time }</td>
									<td>${train.arr_time }</td>
									<td>${train.grade }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../includes/adminFooter.jsp"%>
</body>
</html>