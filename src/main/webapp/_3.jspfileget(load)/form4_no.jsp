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
	$("button").click (function (e) {
	var data = {name	: $("#name").val(),
				age		: $("#age").val(),
				address	: $("#address").val()
			};
	$("div").load("process.jsp", data);
	})
})
</script>
<style>
body {
	text-align: center
}
</style>
</head>
<body>
  <span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
  <span>나이</span><input type="text" placeholder="나이" id="age" name="age" required><br>
  <span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br> 
  <button type="button">전송</button>
  <div></div>
</body>

</html>