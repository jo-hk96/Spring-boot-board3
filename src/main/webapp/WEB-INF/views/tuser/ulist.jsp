<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel = "icon" type="image/ico" href ="/img/favicon.ico"/>
<link rel ="stylesheet" href ="/css/common.css"/>

<style>
	td{text-align :center;}
	tr:first-child{
		background-color:#333333;
		color :white;
		font-weight: bold;
		/*scss문법 : 별도 라이브러리 필요(스프링에서 자동적용,라이브러리없이)*/
		td {
			border-color:red;
		}
	}
	
	
/*	tr:first-child td{
		border-color:white;
	}
*/
</style>


</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>유저포인트</td>
			<td>가입날짜</td>
			<td>삭제</td>
			<td>수정</td>
		</tr>
		<tr >
			<td colspan = "7">
				<a href = "/">home</a>
			</td>	
		</tr>
		<c:forEach var = "tuser" items = "${tuserList}">
			<tr>
				<td>${tuser.userid}</td>
				<td>${tuser.username}</td>
				<td>${tuser.email}</td>
				<td>${tuser.upoint}</td>
				<td>${tuser.indate}</td>
				<td><a href ="/Tuser/userDelete?userid=${tuser.userid}" onclick = "return confirm('삭제하시겠습니까?')">❌</a></td>
				<td><a href ="/Tuser/TuserUpdate?userid=${tuser.userid}">회원수정</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>