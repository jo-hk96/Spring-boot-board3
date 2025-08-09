<%@page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<main>
		<h2>게시글 목록</h2>
		<table>
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>제목</td>
				<td>내용</td>
				<td>글쓴이</td>
				<td>게시글 등록 날짜</td>
				<td>조회수</td>
			</tr>
			<tr>
				<td colspan = "6">
					<a href = "/">home</a>
				</td>	
			</tr>
			<c:forEach var = "blist" items = "${boardlist}"> 
				<tr>
					<td>${blist.idx}</td>
					<td>${blist.menu_id}</td>
					<td>${blist.title}</td>
					<td>${blist.content}</td>
					<td>${blist.writer}</td>
					<td>${blist.regdate}</td>
					<td>${blist.hit}</td>
					<td><a href ="/Menus/Delete?menu_id=" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a></td>
					<td><a href ="/Menus/UpdateForm?menu_id=">수정</a></td>
				</tr>
			</c:forEach>
		</table>
	</main>
</body>
</html>