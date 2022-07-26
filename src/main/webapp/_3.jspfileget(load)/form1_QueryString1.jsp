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
	var data_name = "name="+$("#name").val();//쿼리스트링 작성시 매개변수와 "="사이에 공백없이 작성합니다
	var data_age = "age="+$("#age").val();
	var data_address = "address="+$("#address").val();
	var data = data_name+"&"+data_age+"&"+data_address
	//쿼리스트링 형식으로 파라미터의 이름과 값으 형태로 전달합니다.
		//$('div').load("proecess.jsp", "name=love&age=21&address=서울시");
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