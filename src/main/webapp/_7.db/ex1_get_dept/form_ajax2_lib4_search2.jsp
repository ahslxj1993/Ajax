<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>버튼을 클릭하면 Ajax 실행하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
#error {color:green}
#com {color:blue}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
<div class="container">
<h3 class="mt-5">검색할 부서 번호를 입력하세요</h3>
<form class="mb-3">
	<div class="row">
	<input type="search" name="deptno" required pattern="[0-9]{2}" class="form-control col-8 ml-3">
	<button class="btn btn-info">검색</button>
	</div>
</form>
</div>

<script>
	function getData(go, senddata){
		console.log(senddata);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/"+go,
			data : {"deptno":senddata},
			dataType : "json",
			success : function (return_data) {
				console.log("성공"+return_data);
				
				if(return_data.length > 0) {
					var output = '<div id="result"><table class="table">'
								+'<thead><tr><th>부서번호</th><th>부서명</th><th>지역</th></tr></thead>'
								+'<tbody>';
					$(return_data).each(function (index, item) {
						output += '<tr>';
						output += '<td>'+item.deptno + '</td>';
						output += '<td>'+item.dname + '</td>';
						output += '<td>'+item.loc + '</td>';
						output += '</tr>';
					})//each()
						
				
					output += '</tbody></table></div>';
					$('.container').append(output);
				} else {
					$('.container').append('<div>데이터가 존재하지 않습니다</div>');
				}
			},//success
			error : function (request, status, error) {
				$(".container").append ("<div id='error'> code : "
									+	request.status + "<br>"
									+	"받은 데이터 : "+ request.responseText + "<br>"
									+	"error status "+status+ "<br>"
									+	"error 메세지 : "+ error +"</div>");
			},//error
		})//ajax end
	}//getData () end


getData('dept_lib');
	
$("form").submit(function (e){
	e.preventDefault();
	$('#result').remove();
	var senddata = $("input[name='deptno']").val();
	getData('dept_lib_search',senddata);
	
})//form submit end
</script>
</body>
</html>