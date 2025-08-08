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
		<h2>회원수정</h2>
		<form action ="/Tuser/update" method="POST">
			<table>
				<tr>
					<td>아이디:</td>
					<td><input type = "text" name ="userid" placeholder = "아이디수정" Maxlength = "10" value="${user.userid}"/></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type = "text" name ="passwd" placeholder = "비밀번호" value="${user.passwd}"/></td>
				</tr>
				<tr>
					<td>유저이름</td>
					<td><input type = "text" name ="username" placeholder = "이름" value="${user.passwd}"/></td>
				</tr>
				<tr>
					<td>유저포인트</td>
					<td><input type = "text" name ="upoint"  value="${user.upoint}" title= "유저포인트는 변경하실수없습니다" readonly/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type = "text" name ="email" placeholder = "이메일" value="${user.email}"/></td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "submit" value = "회원수정" /></td>
				</tr>
			</table>
		</form>
	</main>
	
	
	
	
</body>


</html>