<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CSV(Comma Separated Values)예제</title>
<script>
 var input='';
 input += '홍 길동, 서울시, 25세\n';
 input += '신사임당, 울산시, 45세';
 
 //한줄씩 자릅니다
 var inputs = input.split('\n');
 
 for (var i=0 ; i <inputs.length; i++ ){
	 //쉼표를 기준으로 자릅니다
	 var result = inputs[i].split(',');
	 for (var j=0 ; j<result.length ; j++) {
		 console.log(result[j].trim());
	 }
 }
</script>
</head>
<body>

</body>
</html>