<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>서버의 데이터를 대상 엘리먼트에 삽입하기</title>
<style>
div {
	width: 180px; height: 80px;
	margin : 3px; float: left;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {
	$("#menu1").click(function (){
		//load()메서드를 이용해서 menu.html 문서 전체를 로드하여 
		//id가 message1인 엘리먼트에 넣습니다
		$("#message1").load("menu.html");
	})
	
	$("#menu2").click(function (){
		//load()메서드를 이용해서 menu.html 문서의 내용중 li 엘리먼트만 읽어서 
		//id가 message2인 엘리먼트에 넣습니다
		$("#message2").load("menu.html li");
	})
})
</script>
</head>
<body>
<div>
	<a href="#" id="menu1">메뉴보기 1</a>
	<p>
		<span id="message1"></span>
	</p>
</div>

<div>
	<a href="#" id="menu2">메뉴보기 2</a>
	<p>
		<span id="message2"></span>
	</p>
</div>
</body>
</html>