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
</div>

<script>
	function getData(){
		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/dept_lib_bean",
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
			complete : function () {
				$(".container").append("<div id='com'>Ajax가 완료되었습니다</div>");
			},//complete
		})//ajax end
	}//getData () end


getData();
</script>
</body>
</html>