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
			<h2>${menuDTO.menu_name}게시글 작성하기</h2>
			<form action ="/Board/Write" method="POST">
				<input type ="hidden" name = "menu_id" value="${menuDTO.menu_id}"/>
				<table id = "table">
					<tr>
						<td>제목:</td>
						<td><input type = "text" name ="title" id = "title"/></td>
					</tr>
					<tr>
						<td>작성자 이름:</td>
						<td><input type = "text" name ="writer" id = "writer" value ="${login_id}" readonly/></td>
					</tr>
					<tr>
						<td>내용:</td>
						<td><textarea name = "content" id = "content"></textarea></td>
					</tr>
					<tr>
						<td colspan = "2">
							<input type = "submit" value = "게시글 등록 하기"/>
							<input type = "button" value = "목록으로 돌아가기" id = "goList" />
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
			//유효성검사
			const formEl = document.querySelectorAll("form")[0];
			const titleEl = document.querySelector('[name="title"]') //'[name = "title"]' id :("#title")
			const writerEl = document.querySelector('[name="writer"]')
			const contentEl = document.querySelector('#content')
			formEl.addEventListener('submit',function(e){
				if(titleEl.value == ''){
					alert('제목을 입력되지 않았습니다.')
					e.preventDefault();//폼제출막기
					titleEl.focus();//제목입력칸으로 이동
				}
				if(writerEl.value == ''){
					alert('작성자가 입력되지 않았습니다')
					e.preventDefault();
					writerEl.focus();
				}
				if(contentEl.value == ''){
					alert('내용을 입력해주세요')
					e.preventDefault();
					contentEl.focus();
				}
			})
		</script>
	</body>
</html>
