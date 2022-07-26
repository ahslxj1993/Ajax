<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {
	$("button").click(function () {
		$("#container").load("resource1.html");
	})
})
</script>
</head>
<body>
<button>서버로부터 데이터 가져오기</button>
<div id="container">데이터 가져오기 전</div>
</body>
</html>