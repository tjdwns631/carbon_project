<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<button id="writeform" type="submit" class="btn btn-inverse-primary btn-fw"  style="width: 10%;display: inline-block">글쓰기</button>
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
							<%-- 	<c:choose>
									<c:when test="${empty board_list}">
										<tr>
											<td colspan="7" style="text-align:center">데이터가 없습니다</td>
										</tr>
									</c:when>
									<c:when test="${!empty board_list }">
										<c:forEach items="${board_list }" var="list" varStatus="idx">
											<tr>
												<td style="width: 5%;"><c:out value="${idx.index+1}" /></td>
												<td style="width: 15%;">${list.tb_categorydto.cate_name}</td>
												<td style="width: 30%;">${list.board_title}</td>
												<td style="width: 15%;">${list.memberdto.member_name}</td>
												<td style="width: 15%;">${list.board_date}</td>
												<td style="width: 10%;">${list.board_hits}</td>
												<td style="color: blue; width: 10%;">0</td>
											</tr>
										</c:forEach>									
									</c:when>
								</c:choose> --%>
							</tbody>
						</table>
						<div style="margin-top:30px;">
							<form id="searchbox" name="searchbox" method="post">
								<div class="form-group" style="width: 10%; display: inline-block ">
									<select class="form-control form-control-sm" id="exampleFormControlSelect3">
										<option value="title">제목</option>
										<option value="writer">작성자</option>
									</select>
								</div>
								<div class="form-group" style="width: 40%;display: inline-block">
									<input type="text" class="form-control form-control-sm" placeholder="검색어를 입력해 주세요" aria-label="검색어를 입력해 주세요">
								</div>
							  <button type="submit" class="btn btn-inverse-primary btn-fw"  style="width: 10%;display: inline-block">검색</button>
							</form>
						</div>
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
			$("#writeform").on("click",function(){
				location.href = "${pageContext.request.contextPath}/board/board_write.do";
			})
			//data();
		});

		function data() {
			$.post('/board/date.do', {}, function(json) {
				console.log(json);
			}, "json");
		}
		
	</script>
	
</body>
</html>