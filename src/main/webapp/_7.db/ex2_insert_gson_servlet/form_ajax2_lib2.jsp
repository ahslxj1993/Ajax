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
//get방식은 전송시 데이터 가져오기,  post 방식은 전송시 삽입 또는 삭제 또는 수정과 데이터 가져오기
function selectData(method, label){
	$("#result").remove()
	if(label == '추가' || label == '수정완료'){
		var senddata = $("#insert_form").serialize()+ "&label="+label;
	} else if (label == '삭제'){
		var senddata = {id : $('input:hidden').val(), label : label};
	}
	
	$.ajax({
		type : method, // "get" or "post"
		url : "${pageContext.request.contextPath}/servlet_gson.bo2",
		data : senddata, //보낼 데이터
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
		complete : function () {
			console.log ('complete');
			$('input[type=hidden]').remove();
		} //complete
	})//ajax end
}//selectData () define end

//초기화면에 데이터 표시
selectData("get");

//데이터 추가 또는 수정
$("#insert_form").submit(function (event){
	
	//기본 이벤트를 제거합니다
	event.preventDefault();
	
	//폼안의 button을 찾아 텍스트 노드를 구합니다
	var label = $(this).find('button').text();
	selectData('post',label);
	
	if(label == '수정완료'){
		$('button:submit').text('추가').removeClass('btn-success').addClass('btn-primary');
		$('button.btn-danger').prop("disabled",false); //수정완료 버튼을 클릭하면 삭제버튼 사용가능합니다.
	}
}) //submit end

//수정버튼 클릭
$('body').on('click',".btn.btn-warning", function () {
	//클릭한 수정 버튼의 tr객체를 구합니다
	var tr = $(this).parent().parent();
	
	//tr객체의 첫번째 자식 td의 텍스트 노드값을 구합니다
	var id = tr.find('td:nth-child(1)').text();
	//tr객체의 두번째 자식 td의 텍스트 노드값을 구합니다
	var name = tr.find('td:nth-child(2)').text();
	//tr객체의 세번째 자식 td의 텍스트 노드값을 구합니다
	var price = tr.find('td:nth-child(3)').text();
	//tr객체의 네번째 자식 td의 텍스트 노드값을 구합니다
	var maker = tr.find('td:nth-child(4)').text();
	
	$('#name').val(name);
	$('#price').val(price);
	$('#maker').val(maker);
	
	//추가 버튼이 수정완료버튼으로 label과 색상을 바꿉니다.
	$('button:submit').text('수정완료').removeClass('btn-primary').addClass('btn-success');
	
	//수정버튼을 여러번 누른 경우 아래의 문장으로 input:hidden 태그가 여러개 생길 수 있어 제거 합니다 
	$('input:hidden').remove();
	
	//id값을 폼안의 버튼 뒤에 보이지 않게 추가합니다.
	$('button:submit').after("<input type='hidden' name='id' value='"+id+"'>");
	
	//수정클릭시 수정 완료버튼을 클릭전까지는 삭제버튼을 비활성화로 만듭니다
	$('button.btn-danger').prop('disabled',true);
})

//삭제버튼 클릭
$('body').on('click','.btn.btn-danger',function () {
	if (confirm('정말 삭제하시겠습니까?')) {
		var tr = $(this).parent().parent();
		var id = tr.find('td:nth-child(1)').text();
		$('button:submit').after("<input type='hidden' name='id' value='"+id+"'>");
		selectData('post',"삭제");
	}
})

</script>

</body>
</html>