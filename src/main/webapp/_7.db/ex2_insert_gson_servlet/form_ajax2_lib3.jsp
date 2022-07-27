<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.container {width: 50%}
</style>
</head>
<body>
<div class="container">
<form id="insert_form">
	<fieldset>
		<legend>데이터 추가</legend>
		<table class="table">
			<tr>
				<th><label>상품명</label></th>
				<td><input type="text" name="name" id="name" class="form-control" required></td>
			</tr>
			<tr>
				<th><label>가격</label></th>
				<td><input type="text" name="price" id="price" class="form-control" required></td>
			</tr>
			<tr>
				<th><label>메이커</label></th>
				<td><input type="text" name="maker" id="maker" class="form-control" required></td>
			</tr>
			<tr>
				<td colspan=2>
					<button type="submit" class="btn btn-primary btn-block">추가</button>			
				</td>
			</tr>
		</table>
	</fieldset>
</form>
</div>

<script>
function selectData(m){
	$("#result").remove()
	var senddata = $("#insert_form").serialize();
	$.ajax({
		type : m,
		url : "${pageContext.request.contextPath}/servlet_gson.bo2",
		data : senddata,
		dataType : "json",
		success : function (return_data) {
			console.log("성공"+return_data);
			
			if(return_data.length > 0) {
				var output = '<div id="result"><table class="table">'
							+'<thead><tr><th>아이디</th><th>상품명</th><th>가격</th><th>메이커</th>'
							+ '<th>수정</th><th>삭제</th></tr></thead>'
							+'<tbody>';
				$(return_data).each(function (index, item) {
					output += '<tr>';
					output += '<td>'+item.id + '</td>';
					output += '<td>'+item.name + '</td>';
					output += '<td>'+item.price.toLocaleString() + '</td>';
					output += '<td>'+item.maker+'</td>';
					output += '<td><button type="button" class="btn btn-warning btn-sm">수정</button></td>';
					output += '<td><button type="button" class="btn btn-danger btn-sm">삭제</button></td>';
					output += '</tr>';
				})//each()
					
			
				output += '</tbody></table></div>';
				$('.container').append(output);
				$('input').val('');
			} else {
				$('.container').append('<div id="result">데이터가 존재하지 않습니다</div>');
			}
		},//success
		error : function (request, status, error) {
			$(".container").append ("<div id='result'> code : "
								+	request.status + "<br>"
								+	"받은 데이터 : "+ request.responseText + "<br>"
								+	"error status "+status+ "<br>"
								+	"error 메세지 : "+ error +"</div>");
		},//error
	})//ajax end
}//getData () end


selectData("get");

//데이터 추가
$("#insert_form").submit(function (event){
	
	//기본 이벤트를 제거합니다
	event.preventDefault();
	
	selectData("post");
})
//수정버튼 클릭
$(document).on('click',"#result tr>td:nth-child(5)>button", function () {
	$('button[type=submit]').css("background","green").text('수정완료');
	
	$('#name').val($(this).parent().prev().prev().prev().text());
	$('#price').val($(this).parent().prev().prev().text());
	$('#maker').val($(this).parent().prev().text());
})

</script>

</body>
</html>