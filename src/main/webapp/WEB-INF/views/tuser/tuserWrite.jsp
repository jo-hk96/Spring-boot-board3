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
		<h2>회원가입</h2>
		<form action ="/Tuser/TuserWrite" method="POST">
			<table>
				<tr>
					<td>아이디:</td>
					<td><input type = "text" name ="userid" placeholder = "아이디" Maxlength = "6"/></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type = "password" name ="passwd" placeholder = "비밀번호"/></td>
				</tr>
				<tr>
					<td>유저이름</td>
					<td><input type = "text" name ="username" placeholder = "이름"/></td>
				</tr>
				<tr>
					<td>유저포인트</td>
					<td><input type = "text" name ="upoint" placeholder = "갖고싶은만큼.."/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type = "text" name ="email" placeholder = "이메일 "/></td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "submit" value = "회원가입"/></td>
				</tr>
			</table>
		</form>
	</main>