<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../css/ex1.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function (){
	$("button").click(function () { //변경 버튼을 클릭하면
		$("button").text('로딩완료').css('color','red');
		
		//<p>태그 영역에 "sample1.txt"의 내용을 불러옵니다.
		$("p").load("sample1.txt");
		
		$("pre").load("sample1.txt");
	})
})
</script>
</head>
<body>
<button>변경</button>
<p>변경전 : 줄이 안바뀌어요</p>
<br>
<pre>변경전 : 줄이 바뀝니다.(입력한대로 출력됩니다)</pre>
</body>
</html>