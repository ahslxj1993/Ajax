<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
/*
.done () : 요청이 성공적으로 처리되었을대 발생하는 이벤트 메서드입니다.
.fail () : 요청이 실패했을때 발생하는 이벤트 메서드 입니다.
.always () : 요청에 대한 처리가 (성공했든 실패했든) 완료되었을때 발생하는 이벤트 메서드 입니다.
 */
$(function () {
	$('button').click(function () { //버튼을 클릭하면
		
		$.getJSON('item.json')
		.done (function (data, textStatus){
			console.log("done");
		})//done end
		.fail (function (request, status){
			console.log ("code :"+request.status
						+ "\n 받은 데이터 :"+request.responseText
						+ "\n error status : "+status)
		})//fail end
		.always (function () {
			$("body").append("<div>에이잭스가 완료되었습니다</div>");
			console.log("always");
		}) //always end
		
		console.log("2");
	})//click end
})//ready end
</script>
</head>
<body>
<button class="btn btn-info">JSON 데이터를 불러옵니다.</button>
</body>
</html>