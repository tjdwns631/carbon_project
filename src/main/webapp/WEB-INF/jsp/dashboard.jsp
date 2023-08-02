<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="row">
			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h3 class="mb-0">연간 배출량</h3>
						<h3 class="mb-0">연간 배출량</h3>
						<h3 class="mb-0">연간 배출량</h3>
						<h3 class="mb-0">연간 배출량</h3>
						<canvas id="areaChart" height=130px></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<canvas id="barChart" height=130px></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-7 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<select class="pl" name="job">
								<option value="">연도선택</option>
								<option value="2015">2015년</option>
								<option value="2016">2016년</option>
								<option value="2017">2017년</option>
								<option value="2018">2018년</option>
								<option value="2019">2019년</option>
								<option value="2020">2020년</option>
							</select>
						</h4>
						<canvas id="d_bar_chart" height=90px></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-5 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<canvas id="pie"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">총 배출량</h6>
								</div>
							</div>
						</div>
									<h2 class="mb-0">1,996,276</h2>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">순 배출량</h6>
								</div>
							</div>
						</div>
									<h2 class="mb-0">1,575,198</h2>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">직접 배출량</h6>
								</div>
							</div>
						</div>
									<h3 class="mb-0">10,031,192</h3>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-9">
								<div class="d-flex align-items-center align-self-start">
									<h6 class="text-muted font-weight-normal" style="margin-top: 7px;">간접 배출량</h6>
								</div>
							</div>
									<h3 class="mb-0">965,084</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script>
	$(function() {
		$("#barChart").empty(); // 초기화 후 재생성
		dashboard_barchart('barChart');

		$("#areaChart").empty(); // 초기화 후 재생성
		dashboard_linechart('areaChart');

		$("#d_bar_chart").empty(); // 초기화 후 재생성
		dashboard_d_barchart('d_bar_chart');

		$("#pie").empty(); // 초기화 후 재생성
		dashboard_pie_chart('pie');
	})
</script>
</html>