<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>id</th>
			<th>pwd</th>
			<th>이름</th>
		</tr>	
	</thead>
	<tbody id="t">
		
	</tbody>
</table>
</body>
<script>
	$(function(){
		//select_week_chart();
		view_lineChart();
		$("#t").append('<tr>'+
				'<td>1</td>'+'<td>1</td>'+'<td>1</td>'+'<td>1</td>'+
				'</tr>')
	});
	
	function select_week_chart() {
	    $.post('/test/memberAjax.do',{}, function(json) {
	    	console.log(json);
			    }, "json");
	}
	
    function view_lineChart() { // '주간 출입현황' 조회 처리
        $.post('/test/memberAjax.do', {}, function (json) {
        	console.log(json);
        	console.log("test");
            $("#t").empty(); // 초기화 후 재생성
            $("#t").append('');
            
        }, "json");
    }
</script>
</html>