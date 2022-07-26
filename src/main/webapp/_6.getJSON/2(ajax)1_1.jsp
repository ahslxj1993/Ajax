<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
#error {color:green}
#com {color:blue}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/*
 $.ajax(object)
  url : 요청전송 url,
  type: 전송방식 (get(기본) 또는 post),
  data : 전송할 자료들,
  dataType : return data의 Type(에이잭스 성공 후 돌려받은 자료의 형을 정의 - "json","xml","html"),
  success : HTTP 요청이 성공한 경우 실행할 함수 정의,
  error : HTTP 요청이 실패한 경우 실행할 함수 정의,
  complete : 요청의 실패, 성공과 상관 없이 완료될 경우 실행할 함수 정의
 */
 
 $(function () {
	 $("button").click (function () { //버튼클릭시 펑션
		 $.ajax({
			 url : "item.json",
			 dataType : "json",
			 success : function (return_data) {
				 
			 }
		 });//ajax end
	 })//click end
 })
</script>
</head>
<body>
<div class="container">
<button class="btn btn-info"></button>
</div>
</body>
</html>