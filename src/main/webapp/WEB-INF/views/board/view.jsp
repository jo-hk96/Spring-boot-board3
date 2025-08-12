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
	h2{text-align:center;}
	
	/*게시글 작성*/
	 #table {
  td {
     padding : 10px;
  }
  td:nth-of-type(1) { 
     text-align: center;  
     width : 200px; 
     background : #666;
     color : white;
     font-weight: bold;   
     border : 1px solid white;    
  } 
  td:nth-of-type(2) { width : 600px; }
  
  
  td:nth-of-type(3) {   text-align: center;  
     width : 200px; 
     background : #666;
     color : white;
     font-weight: bold;   
     border : 1px solid white;   }
  
  tr:last-child > td { 
      background: white; 
      border: 1px solid black
  }
  
  input                  { width : 100%; } 
  input[type=submit]     { width : 110px;  } 
  input[name=userid]     { width : 25%;  } 
  #goList                { width : 100px;  } 
  #dupCheck, #dupCheck2  { width : 100px; }
  
  .red                   { color:red; }
  .green                 { color:green; }
  textarea               {
      height : 200px;
      width  : 100%;      
  }
 }
	textarea{text-align:left}
</style>
</head>
	<body>
		<main>
			<!-- 메뉴리스트 -->
			<%@include file="/WEB-INF/include/menus.jsp" %>
			<h2>${menuDTO.menu_name} 게시글</h2>
			<form action ="/Board/Blist" method="POST">
				<table id = "table">
					<tr>
						<td>글번호:</td>
						<td>${boardview.idx}</td>
						<td>제목:</td>
						<td>${boardview.title}</td>
					</tr>
					<tr>
						<td>작성자 이름:</td>
						<td>${boardview.writer}</td>
						<td>작성일:</td>
						<td>${boardview.regdate}</td>
					</tr>
					<tr>
						<td>조회수:</td>
						<td colspan = "3">${boardview.hit}</td>
					</tr>
					<tr>
						<td>내용:</td>
						<td colspan = "3"><div id = "content" style = "height:250px ">${boardview.content}</div></td>
					</tr>
					<tr>
						<td colspan = "4">
							<a href = "/Board/WriteForm?menu_id=${menuDTO.menu_id}">새글쓰기</a>
							<a href = "/Board/UpdateForm?idx=${boardview.idx}&menu_id=${menuDTO.menu_id}">수정</a>
							<a href = "/Board/delete?idx=${boardview.idx}&menu_id=${menuDTO.menu_id}">삭제</a>
							<a href = "/Board/Blist?menu_id=${menuDTO.menu_id}">목록</a>
							<a href = "/">HOME</a>
						</td>
					</tr>
				</table>
			</form>
		</main>
		<script>
			//목록으로 돌아가기
			const goListEl = document.getElementById('goList')
			goListEl.onclick = function(){
				location.href = '/Board/Blist?menu_id=${menuDTO.menu_id}'
			}
		</script>
	</body>
</html>
