<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="row" >
		<div class="col-md-8 col-xl-8 grid-margin stretch-card" style="margin: 0 auto;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" id="board_title">제목</h4>
					<div class="d-flex py-4">
						<div class="preview-list w-100">
							<div class="preview-item p-0">
								<div class="preview-item-content d-flex flex-grow">
									<div class="flex-grow">
										<div class="d-flex d-md-block d-xl-flex justify-content-between">
											<h6 class="preview-subject" id="board_writer">작성자 작성자명</h6>
											<p class="text-muted text-small" id="board_date">날짜</p>
										</div>
										<p class="text-muted" id="board_info"> 조회수 몇명 추천수 0 댓글 0 </p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<p class="text-muted" id="board_content">글 내용 내용 내용</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style= margin-top:20px;>
		<div class="col-md-8 col-xl-8 grid-margin stretch-card" style="margin: 0 auto;">
			<div class="card">
				<div class="card-body">
					<ul style= "list-style:none;">
						<li style="margin-bottom:10px;">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
						<li style="margin-bottom:10px;">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
						<li style="margin-bottom:10px;">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
						<li style="margin-bottom:10px;">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
						<li style="margin-bottom:10px;">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
						<li style="margin-bottom:10px;">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 20px;">
		<div class="col-md-8 col-xl-8 grid-margin stretch-card" style="margin: 0 auto;">
			<div class="card">
				<div class="card-body">

					<form method="post" action="/comment">
						<p>
							<label>댓글 쓰기</label>
						</p>
						<p>
							<textarea rows="5" cols="50" name="content"></textarea>
						</p>
						<p>
							<button type="button" id="comment" class="btn btn-inverse-primary btn-fw">댓글 작성</button>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
$(function(){
	board_getlist();
	console.log(${board_idx})	
})

function board_getlist(){
	  $.post('/board/board_getlistAjax_action.do', {'board_idx' : ${board_idx}}, function (json) {
		  console.log(json);
		  var timestamp = json.list.board_date
		  var date = new Date(timestamp);
		  
          if((date.getMonth()+1) <10){
              now_month = "0"+ (date.getMonth()+1);
          }else{
              now_month = (date.getMonth()+1);
          }
          if((date.getDate()) <10){
              now_day = "0"+ (date.getDate());
          }else{
              now_day = (date.getDate());
          }
		  
		  $("#board_title").empty();
		  $("#board_title").html(json.list.board_title);
		  $("#board_writer").empty();
		  $("#board_writer").html(json.list.memberdto.member_name);
		  $("#board_date").empty();
		  $("#board_date").html(date.getFullYear() +"-"+now_month+"-"+now_day+" "+date.getHours()+":"+date.getMinutes());
		  $("#board_info").empty();
		  $("#board_info").html("조회수 "+json.list.board_hits+" 추천수 "+"0" +" 댓글 "+"0");
		  $("#board_content").empty();
		  $("#board_content").html(json.list.board_content);
		  
		  
      }, "json");
}
</script>
</body>
</html>
