<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "icon" type="image/ico" href ="/img/favicon.ico"/>
<link rel ="stylesheet" href ="/css/common.css"/> 

<Style>
	td{
		padding: 10px;
		width: 700px;
		text-align :center;
		
	}
	td:nth-of-type(1){
		width:200px
	}
	input {width:100%;}
	input[type=submit]{width:100px;}
</Style>

</head>
<body>
	<main>
		<h2>새 메뉴 추가</h2>
		<form action ="/Menus/write2" method="POST">
			<table>
				<tr>
					<td>메뉴 이름:</td>
					<td><input type = "text" name ="menu_name" placeholder = "이름"/> </td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "submit" value = "등록"/> </td>
				</tr>
			</table>
		</form>
	</main>
<script>
	//const formEl = document.querySelectorAll("form")[0]; 1 번째 폼
	const formEl = document.querySelector("form");//form태그 찾기
	
		formEl.addEventListener('submit',function(e){ // submit 이벤트발생 
		
			const inputEl1 =document.querySelector('[name ="menu_name"]');
			if(inputEl1.value.trim() == ''){
				alert('메뉴이름이 입력되지 않았습니다.')
				e.stopPropagation();
				e.preventDefault();				
				return false;
			}
			
		})
</script>	
	
</body>
</html>