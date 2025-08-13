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
	#table{
		  td{
			padding: 10px;
			text-align:center;
			}
		td:nth-of-type(1){width :100px;}
		td:nth-of-type(2){width :400px; text-align:left;}
		td:nth-of-type(3){width :100px;}
		td:nth-of-type(4){width :100px;}
		td:nth-of-type(5){width :100px;}
		tr:first-child{
			background:#333;
			color:white;
			font-weight:700;
			td{
				border-color:silver;
			}
			& > td:nth-of-type(2){text-align:center;}
		}
		tr:nth-child(2){
		text-align :right;
		}
	}
	h2{text-align:center;}
	
	
	</style>
</head>
<body>
	<main>
	<!-- 메뉴목록 -->
	<%@include file = "/WEB-INF/include/menus.jsp" %>
		<h2>${menuDTO.menu_name} 게시글 목록</h2>
		<table id="table">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>게시글 등록 날짜</td>
				<td>조회수</td>
			</tr>
			<tr>
				<td colspan = "5">
					<a href = "/">메인화면</a>
				</td>	
			</tr>
			<tr>
			    <td colspan="5">
			      <a href="/Board/WriteForm?menu_id=${menuDTO.menu_id}">${menuDTO.menu_name} 게시글 쓰기</a>	 
			    </td>
		   </tr>
			<c:forEach var = "blist" items = "${boardList}"> 
				<tr>
					<td>${blist.idx}</td>
					<td>
						<a href = "/Board/View?idx=${blist.idx }&menu_id=${menuDTO.menu_id}">
							${blist.title}
						</a>
					</td>
					<td>${blist.writer}</td>
					<td>${blist.regdate}</td>
					<td>${blist.hit}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이지 번호 목록 -->
		<%@include file = "/WEB-INF/include/paging.jsp" %>
	</main>
</body>
</html>