<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h3 class="mb-0">게시판</h3>
					<p class="card-description">
						<code>테스트 게시판</code>
					</p>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>탭(카테고리)</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 5%;">1</td>
									<td style="width: 15%;">정보</td>
									<td style="width: 30%;">제목1</td>
									<td style="width: 15%;">관리자</td>
									<td style="width: 15%;">2023.08.08</td>
									<td style="width: 10%;">12</td>
									<td style="color: blue; width: 10%;">20</td>
								</tr>
							</tbody>
						</table>
						<div class="paging_con_a" style="display: flex; justify-content: center; align-items: center; margin-top: 40px;">
							<a style='margin-right: 1rem; color: #fff; font-weight: bold; text-decoration: underline;' href=''>1</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			data();
		});

		function data() {
			$.post('/board/date.do', {}, function(json) {
				console.log(json);
			}, "json");
		}
	</script>
</body>
</html>