<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>XML 파일을 GET 방식으로 로드하기</title>
<style>
td {
	border: 1px solid gray;
}
td:nth-child(3n){text-align: right}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
$(function() {
	 $("button").click(function() {  //버튼을 클릭하면		
		$.get('item.xml', function(data) { //data에는 item.xml의 내용이 들어 있습니다.
			$("table").remove();//테이블이 존재하면 제거해 계속 추가 되지 않도록 합니다.
			
			var output = "<table class='table'><thead>"			
			   + "<tr><td>id</td><td>name</td><td>price</td>"
			   + "<td>description</td></tr></thead><tbody>"
			
		    // 서버에서 얻어온 데이터에서 셀렉터로 item태그를 찾습니다.
			$(data).find('item') 
			.each(function() {
			//each() : 반복하는 메서드로 item을 찾을때마다 반복해서 아래 문장들을 수행합니다
			//6개의 item태그중 현재 처리중인 item 태그를 this로 접근합니다.
			//$(this)를 사용하여 jQuery객체를 생성합니다
			output += "<tr>"
			+"<td>"+ $(this).attr("id")+"</td>"
			+"<td>"+ $(this).attr("name")+"</td>"
			+"<td>"+ $(this).find("price").text()+"</td>"
			+"<td>"+ $(this).find("description").text()+"</td>"
			/*
			$(this).attr("id") : 속성 id의 값을 구해옵니다
			$(this).find("price") : price 태그를 찾습니다
			$(this).find("price").text() : price 태그 사이의 값을 구해옵니다
			$(this).find("description") : description 태그를 찾습니다
			$(this).find("description").text() : description 태그 사이의 값을 구해옵니다
			*/
		})//each () end
		output += "</tbody></table>"
		$("body").append(output);
		})//get() end
	})//button click () end
})// %() end
</script>
</head>
<body>
<div class="container">
<button class="btn btn-info">XML형식으로 데이터를 가져옵니다</button>
</div>

</body>
</html>