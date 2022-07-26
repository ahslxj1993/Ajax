<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Ajax</title>
<link href="css/form.css" rel="stylesheet" type="text/css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
 <form>
 	<span>이름</span><input type="text" placeholder="이름" id="name" name="name" required><br>
 	<span>나이</span><input type="text" placeholder="나이" id="age" name="age" required><br>
 	<span>주소</span><input type="text" placeholder="주소" id="address" name="address" required><br>
 	<input type="submit" value="전송">
 </form>
</body>
</html>