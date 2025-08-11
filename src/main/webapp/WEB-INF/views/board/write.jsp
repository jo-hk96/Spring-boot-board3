<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "icon" type="image/ico" href ="/img/favicon.ico"/>
<link rel ="stylesheet" href ="/css/common.css"/>

<style>
	td , textarea{
		padding: 10px;
		width: 700px;
		text-align :center;
		
	}
	td:nth-of-type(1){
		width:200px
	}
	input {width:100%;}
	input[type=submit]{width:100px;}
</style>

</head>

	<body>
		<main>
		
			<!-- 메뉴리스트 -->
			<%@include file="/WEB-INF/include/menus.jsp" %>
			
			<h2>${menuDTO.menu_name}게시글 작성하기</h2>
			<a href ="/">메뉴로 돌아가기</a>
			<form action ="/Board/Write" method="POST">
				<input type ="hidden" name = "menu_id" value="${menuDTO.menu_id}"/>
				<table>
					<tr>
						<td>제목:</td>
						<td><input type = "text" name ="title"/></td>
					</tr>
					<tr>
						<td>작성자 이름:</td>
						<td><input type = "text" name ="writer"/></td>
					</tr>
					<tr>
						<td>내용:</td>
						<td><textarea name = "content" ></textarea></td>
					</tr>
					<tr>
						<td colspan = "2"><input type = "submit" value = "게시글 등록 하기"/></td>
					</tr>
				</table>
			</form>
		</main>
			
	</body>
</html>
