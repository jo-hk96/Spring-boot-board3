<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
 #table {
  margin-bottom : 150px; 
  td {
     text-align : center;
     padding    : 10px;
     border     : 1px solid silver; 
     
     input[type="text"]   { width : 100%;  }
     textarea             { width : 100%;  height: 250px; }
      
     &:nth-of-type(1) {
         width             :  150px;
         background-color  :  black;
         color             :  white;
     }
     &:nth-of-type(2) { width : 250px; }
     &:nth-of-type(3) {
         width             :  150px;
         background-color  :  black;
         color             :  white;
     }
     &:nth-of-type(4) { width : 250px;  }
  }  
  
  tr:nth-of-type(3) td:nth-of-type(2) {
     text-align : left;
  }
  
  tr:nth-of-type(4) td:nth-of-type(2) {
     height     : 250px;
     width      : 600px; 
     text-align : left;
     vertical-align: baseline;      
  }
  
  tr:last-of-type  td {
     background: white;
     color :     black; 
  }
   
 }
 
 /* class="btn btn-dark btn-sm" */
 a.btn.btn-dark.btn-sm:hover {
    text-decoration: none;    
 }

</style>

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
			<form action ="/Board/Update" method="Post">
			<input type ="hidden" name = "idx" value="${board.idx}"/>
			<input type="hidden" name="menu_id" value="${board.menu_id}" />
			<h2>${menuDTO.menu_name} 게시글</h2>
				<table id = "table">
					<tr>
						<td>작성자 이름:</td>
						<td><input type = "text" id ="writer" value="${board.writer}"></td>
						<td>제목:</td>
						<td><input type = "text" id = "title" value ="${board.title}"></td>
					</tr>
					<tr>
						<td>내용:</td>
						<td colspan = "3"><textarea id = "content">${board.content}</textarea></div></td>
					</tr>
					<tr>
						<td colspan = "4">
							<input class = "btn btn-dark btn-sm" type="submit" value="수정"/> &nbsp;&nbsp;
							<a class = "btn btn-dark btn-sm" href = "/Board/Blist?menu_id=${board.menu_id}">목록</a> &nbsp;&nbsp;
							<a class ="btn btn-dark btn-sm" href="/">Home</a>
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
