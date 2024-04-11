<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../../includes/adminHeader.jsp"%>

<div class="wrap">
	<div class="continer">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<form action="/admin/newTrain" method="post"
						class="form-horizontal">
						<sec:csrfInput/>
						<div class="card-header">
							<strong>새 노선 등록</strong> 신중하게 진행하세요
						</div>
						<div class="card-body card-block">

							<div class="row form-group">
								<div class="col col-md-3">
									<label for="dep_place" class=" form-control-label">출발역</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="dep_place" name="dep_place"
										placeholder="출발역" class="form-control"><small
										class="form-text text-muted">'역' 을 제외하고 적어주세요</small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="arr_place" class=" form-control-label">도착역</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="arr_place" name="arr_place"
										placeholder="도착역" class="form-control"><small
										class="form-text text-muted">'역' 을 제외하고 적어주세요</small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="dep_time" class=" form-control-label">출발 시간</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="dep_time" name="dep_time"
										placeholder="출발 시간" class="form-control"><small
										class="form-text text-muted">'YYYYMMDDHHmmss' 형식으로
										적어주세요</small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="arr_time" class=" form-control-label">도착 시간</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="arr_time" name="arr_time"
										placeholder="도착 시간" class="form-control"><small
										class="form-text text-muted">'YYYYMMDDHHmmss' 형식으로
										적어주세요</small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="grade" class=" form-control-label">열차 종류</label>
								</div>
								<div class="col-12 col-md-9">
									<select name="grade" id="grade" class="form-control">
										<option value="KTX">KTX</option>
										<option value="새마을호">새마을호</option>
										<option value="무궁화호">무궁화호</option>
										<option value="누리로">누리로</option>
										<option value="AREX 직통">AREX 직통</option>
										<option value="KTX-산천(A)">KTX-산천(A)</option>
										<option value="ITX-새마을">ITX-새마을</option>
										<option value="ITX-청춘">ITX-청춘</option>
										<option value="KTX-산천(B)">KTX-산천(B)</option>
										<option value="SRT">SRT</option>
									</select>
								</div>
							</div>


						</div>
						<div class="card-footer">
							<button type="submit" class="btn btn-primary btn-sm">
								<i class="fa fa-dot-circle-o"></i> Submit
							</button>
							<button type="reset" class="btn btn-danger btn-sm">
								<i class="fa fa-ban"></i> Reset
							</button>
						</div>
					</form>
				</div>
				<div class="row">
					${message }
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../includes/adminFooter.jsp"%>
</body>
</html>