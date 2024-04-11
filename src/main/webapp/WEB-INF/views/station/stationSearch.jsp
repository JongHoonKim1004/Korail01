<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Korail</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/station.css">


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

	<div class="station_search">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<strong>철도역 검색</strong>
					</div>
					<div class="card-body card-block">
						<div class="row">
							<div class="col-lg-12">
								<div style="margin: 100px 0;"></div>
								<div class="col-md-12 form-group">
									<form action="/station/searchName" method="post">
										<sec:csrfInput/>
										<div class="col-md-12">
											<div class="row form-group">
												<div class="col-md-5">
													<label for="name" class=" form-control-label">역
														이름으로 검색</label>
												</div>
												<div class="col-md-7">
													<div class="input-group">
														<input type="text" id="name" name="name"
															placeholder="'역' 을 빼고 입력해주세요" class="form-control">
														<div class="input-group-btn">
															<button class="btn btn-primary" type="submit">검색</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div style="margin: 100px 0;"></div>
								<div class="col-md-12 form-group">
									<form action="/station/searchLocation" method="post">
										<sec:csrfInput/>
										<div class="col-md-12">
											<div class="row form-group">
												<div class="col-md-5">
													<label for="location" class=" form-control-label">역
														위치로 검색</label>
												</div>
												<div class="col-md-7">
													<div class="input-group">
														<input type="text" id="location" name="location"
															class="form-control">
														<div class="input-group-btn">
															<button class="btn btn-primary" type="submit">검색</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div style="margin: 100px 0;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>