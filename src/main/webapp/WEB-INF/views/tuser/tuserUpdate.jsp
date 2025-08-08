<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "icon" type="image/ico" href ="/img/favicon.ico"/>
<link rel ="stylesheet" href ="/css/common.css"/> 

<Style>
	td{
		padding: 10px;
		width: 700px;
		text-align :center;
		
	}
	td:nth-of-type(1){
		width:200px
	}
	input {width:100%;}
	input[type=submit]{width:100px;}
</Style>
</head>
<body>
	<main>
		<h2>회원수정</h2>
		<a href ="/">home</a>
		<form action ="/Tuser/update" method="POST">
		
		
			<table>
				<tr>
					<td>아이디:</td>
					<td><input type = "text" name ="userid" placeholder = "아이디수정" Maxlength = "10" value="${user.userid}"/></td>
				</tr>
				<tr>
					<td>이전 비밀번호 입력:</td>
					<td><input type = "password" id ="Befpasswd" /></td>
				</tr>
				<tr>
					<td>비밀번호:</td>
					<td><input type = "password" name ="passwd" id ="passwd" /></td>
				</tr>				
				<tr>
					<td>비밀번호 확인:</td>
					<td><input type = "password" id ="passwd2" /></td>
				</tr>				
				<tr>
					<td>유저포인트</td>
					<td><input type = "text" name = "uponit" value = "${user.upoint}" readonly/></td>
				</tr>
				<tr>
					<td>유저이름</td>
					<td><input type = "text" name ="username" placeholder = "이름" value="${user.username}" readonly/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type = "text" name ="email" placeholder = "이메일" value="${user.email}" readonly/></td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "submit" value = "회원수정" /></td>
				</tr>
			</table>
		</form>
	</main>
	<Script>
				const formEl = document.querySelector("form");
				formEl.addEventListener('submit',function(e){ 
					const passwd = document.querySelector("#passwd");//id값
					
					const inputEl1 = document.querySelector('[name ="userid"]');
					if(inputEl1.value.trim().length < 6 || inputEl1.value.trim().length > 12){
					alert('아이디는 6~12자 사이입니다.')
					e.stopPropagation();
					e.preventDefault();
					inputEl1.focus();
					return false;
					}
	
					const befpwd =document.querySelector("#Befpasswd");
						if(befpwd.value.trim().length == 0){
							alert('이전 비밀번호가 입력되지 않았습니다.')
							e.stopPropagation();
							e.preventDefault();
							inputEl2.focus();
							return false;
						}else if('${user.passwd}' != befpwd.value){
							alert('이전 비밀번호가 일치하지않습니다.')
							e.stopPropagation();
							e.preventDefault();
							inputEl2.focus();
							return false;

						}
	
							
						
						
						
						const passwd2 = document.querySelector("#passwd2");
							if(passwd.value != passwd2.value){
								alert("비밀번호가 일치하지 않습니다.")
								e.stopPropagation();
								e.preventDefault();
								passwd2.focus();
								return false;
							}
							
						
					const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&#.~_-])[A-Za-z\d@$!%*?&#.~_-]{8,20}$/;
						if(inputEl2.value.trim().length == 0){
							alert('비밀번호가 입력되지 않았습니다.')
							e.stopPropagation();
							e.preventDefault();
							inputEl2.focus();
							return false;
						}else if(!regex.test(inputEl2.trim())){
							alert('1개이상의 영대소문 8~20자,특수문자를 포함하여 입력해주세요.')
							e.stopPropagation();
							e.preventDefault();
							inputEl2.focus();
							return false;
						}
	
				
						
						
						const inputEl4 =document.querySelector('[name ="username"]');
						if(inputEl4.value.trim() == ''){
							alert('이름이 입력되지 않았습니다.')
							e.stopPropagation();
							e.preventDefault();
							inputEl4.focus();
							return false;
						}

					const inputEl5 =document.querySelector('[name ="email"]');
					const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
					if(inputEl5.value.trim() == ''){
						alert('이메일이 입력되지 않았습니다.')
						e.stopPropagation();
						e.preventDefault();
						inputEl5.focus();
						
					} else if(!regEmail.test(inputEl5.value)){
						alert('영어대소문자 상관없이, 특수문자는 하나만 포함가능합니다.')
						e.stopPropagation();
						e.preventDefault();
						inputEl5.focus();
						return false;
					} 
			})
		</Script>
</body>


</html>