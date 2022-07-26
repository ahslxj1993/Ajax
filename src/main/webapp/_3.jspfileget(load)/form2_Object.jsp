<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Ajax</title>
<link href="css/form.css" rel="stylesheet" type="text/css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {
	$("form").submit (function (e) {
	e.preventDefault();//기본 이벤트 제거
	//객체 형태로 파라미터 이름과 값을 전달합니다
	var data = {name	: $("#name").val(),
				age		: $("#age").val(),
				address	: $("#address").val()
				};
	$("div").load("process.jsp", data);
	})
})
</script>
</head>
<body>
 <form>
 	<span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
 	<span>나이</span><input type="text" placeholder="나이" id="age" name="age" required><br>
 	<span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br>
 	<input type="submit" value="전송">
 </form>
 <div></div>
</body>
</html>