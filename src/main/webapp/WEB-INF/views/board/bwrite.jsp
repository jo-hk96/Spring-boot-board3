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
			<h2>게시글 작성</h2>
			<a href ="/">메뉴로 돌아가기</a>
			<form action ="/Tuser/TuserWrite" method="POST">
				<table>
					<tr>
						<td>메뉴선택:</td>
							<td><select name = "menu_id" id="menu_id">
								<option value = "">메뉴를 선택해주세요</option>
									<c:forEach var = "menu" items ="${menu}">
										<option value = "${menu.menu_id}">${menu.menu_name}</option>
									</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<td>제목:</td>
						<td><input type = "text" name ="title" maxlength = "20"/></td>
					</tr>
					<tr>
						<td>내용:</td>
						<td><textarea style="text-align: left" rows ="5" cols = "30" name = "content" id ="content"></textarea></td>
					</tr>
					<tr>	
						<td>유저이름</td>
						<td><input type = "text" name ="username" placeholder = "이름"/></td>
					</tr>
					<tr>
						<td colspan = "2"><input type = "submit" value = "게시글 등록 하기"/></td>
					</tr>
				</table>
			</form>
		</main>
			
	</body>
</html>
