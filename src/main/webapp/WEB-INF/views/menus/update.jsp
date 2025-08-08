<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<h2>메뉴 수정</h2>
		<form action ="/Menus/Update" method="POST">
			<table>
				<tr>
					<td>메뉴 아이디:</td>
					<td><input type = "text" name ="menu_id" maxlength = "6" value="${menu.menu_id}" readonly/> </td>
				</tr>
				<tr>
					<td>메뉴 이름:</td>
					<td><input type = "text" name ="menu_name" placeholder = "이름" value="${menu.menu_name}"/> </td>
				</tr>
				<tr>
					<td>메뉴 순서:</td>
					<td><input type = "text" name ="menu_seq" placeholder = "순서" value="${menu.menu_seq}"/> </td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "submit" value = "수정"/> </td>
				</tr>
			</table>
		</form>
	</main>
<script>
	//const formEl = document.querySelectorAll("form")[0]; 1 번째 폼
	const formEl = document.querySelector("form");//form태그 찾기
	
		formEl.addEventListener('submit',function(e){ // submit 이벤트발생 
			//alert('ok')
			const inputEl1 =document.querySelector('[name ="menu_id"]');
			if(inputEl1.value.trim() == ''){
				alert('메뉴아이디가 입력되지 않았습니다.')
				e.stopPropagation();//이벤트 버블링 방지
				e.preventDefault();//이벤트를 취소
				inputEl1.focus();
				return false;
			}
			const inputEl2 =document.querySelector('[name ="menu_name"]');
			if(inputEl2.value.trim() == ''){
				alert('메뉴이름이 입력되지 않았습니다.')
				e.stopPropagation();
				e.preventDefault();				
				return false;
			}
			const inputEl3 =document.querySelector('[name ="menu_seq"]');
			if(inputEl3.value.trim() == ''){
				alert('메뉴번호가 입력되지 않았습니다.')
				e.stopPropagation();
				e.preventDefault();				
				return false;	
			}
		})
</script>
</body>
</html>