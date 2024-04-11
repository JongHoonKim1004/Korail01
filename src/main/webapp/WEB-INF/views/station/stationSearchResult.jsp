<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/station.css">

<!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/css/bootstrap/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/css/bootstrap/dataTables.bootstrap.min.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/css/bootstrap/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/bootstrap/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/css/bootstrap/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div id="wrap">
		<div class="station_search_result">
			<div class="station_search_result_title">철도역 검색 결과 </div>
			<div class="staion_result">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">검색 결과</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>번호</th>
											<th>역 이름</th>
											<th>역 주소</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="station">
											<tr>
												<td>${station.sno }</td>
												<td><a href="/station/stationInfo?sno=${station.sno }">${station.name }</a></td>
												<td>${station.addr }</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">
												<button class="stationButton" onclick="location.href='/station/stationSearch'">다른 조건으로 검색하기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
</body>
</html>