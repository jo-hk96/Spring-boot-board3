<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "icon" type="image/ico" href ="/img/favicon.ico"/>
<link rel ="stylesheet" href ="/css/common.css"/>
</head>
<body>
<main>
   <h2>HOME</h2>
   <div>
   	<h3>로그인</h3>
   	<form action = "/user/login" method = "post">
   	아이디 : <input type = "text" name ="userid" id = "userid" placeholder = "아이디를 입력해주세요">
   	비밀번호 : <input type = "password" name ="passwd" id = "passwd" placeholder = "비밀번호를 입력해주세요">
   	<input type = "submit" name = "login" value = "확인">
   </form>
   </div>
   <hr>	
   <a href ="/Menus/List">메뉴 목록</a><br>
   <a href ="/Menus/WriteForm">새 메뉴 추가</a><br>
   <a href ="/Menus/WriteForm2">새 메뉴 추가2</a>
   <hr>
   <a href ="/Tuser/Ulist">회원리스트</a><br>
   <a href ="/Tuser/NewTuser">회원가입</a><br>
   <hr>
   <a href = "/Board/Blist">게시글 목록</a><br>
   <a href = "/Board/BwriteForm">게시글 작성</a>
   
</main>   
</body>
</html>