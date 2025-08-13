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
</head>
<body>
<main>
   <h2>HOME</h2>
   <div>
	   <c:if test = "${sessionScope.login_id == null}">
	   	<h3>로그인</h3>
	   	<form action = "/user/login" method = "post">
		   	아이디 : <input type = "text" name ="userid" id = "userid" placeholder = "아이디를 입력해주세요">
		   	비밀번호 : <input type = "password" name ="passwd" id = "passwd" placeholder = "비밀번호를 입력해주세요">
		   	<input type = "submit" name = "login" value = "로그인">
		   <a href ="/Tuser/NewTuser">회원가입</a>
	   </form>
	   </c:if>
	   <c:if test = "${not empty error}">
	   		<script>
	   			alert('${error}');
	   		</script>
	   	</c:if>
	   <c:if test="${sessionScope.login_id != null}">
	   		<span>반갑습니다! ${sessionScope.login_id}님!</span>
	   		<a href = "/user/logout">로그아웃</a>
	   </c:if>
   </div>
   <hr>
   <c:if test = "${login_id == null || login_id != 'sky'}">
	<span>관리자 메뉴입니다.관리자로 로그인해주세요</span>
   </c:if>
   
   
   <c:if test = "${login_id == 'sky' }">
   <a href ="/Menus/List">메뉴 목록</a><br>
   <a href ="/Menus/WriteForm">새 메뉴 추가</a><br>
   <a href ="/Menus/WriteForm2">메뉴이름으로 메뉴추가</a><br>
   <a href ="/Tuser/Ulist">회원리스트</a>
   </c:if>
   <hr>
   <c:if test = "${login_id == null }">
   <a href = "#" onclick = "alertlist()" > 게시글 목록 </a><br>
   <a href = "#" onclick = "alertlist()" > 새 게시글 추가 </a>
   </c:if> 
   
   <c:if test = "${login_id != null }">
   <a href = "/Board/Blist?menu_id=MENU01">게시글 목록</a><br>
   <a href = "/Board/WriteForm?menu_id=MENU01">새 게시글 추가</a>
	</c:if>
	<script>
		function alertlist(){
			alert('로그인 후 이용이 가능합니다')
			
		}
	</script>
	
	<hr>
	<a href = "/BoardPaging/Blist?nowpage=1&menu_id=MENU01">게시글 목록(페이징)</a><br>
  	<a href = "/BoardPaging/WriteForm?nowpage=1&menu_id=MENU01">새 게시글 추가(페이징)</a>
	
</main>   
</body>
</html>