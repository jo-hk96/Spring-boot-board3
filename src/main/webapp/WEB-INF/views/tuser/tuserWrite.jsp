<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "icon" type="image/ico" href ="/img/favicon.ico"/>
<link rel ="stylesheet" href ="/css/common.css"/>

<style>
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
</style>

</head>

	<body>
		<main>
			<h2>회원가입</h2>
			<a href ="/">home</a>
			<form action ="/Tuser/TuserWrite" method="POST">
				<table>
					<tr>
						<td>아이디:</td>
						<td><input type = "text" name ="userid" placeholder = "아이디 최대 12글자" maxlength = "12"/></td>
					</tr>
					<tr>
						<td>비밀번호:</td>
						<td><input type = "password" name ="passwd" id = "passwd" placeholder = "비밀번호"/></td>
					</tr>
					<tr>
						<td>비밀번호확인:</td>
						<td><input type = "password" id = "passwd2" placeholder = "비밀번호확인"/></td>
					</tr>
					<tr>
						<td>유저이름</td>
						<td><input type = "text" name ="username" placeholder = "이름"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type = "text" name ="email" placeholder = "메일끝에는 .com을 붙혀주세용"/></td>
					</tr>
					<tr>
						<td colspan = "2"><input type = "submit" value = "회원가입"/></td>
					</tr>
				</table>
			</form>
		</main>
			 <Script>
				const formEl = document.querySelector("form");
				formEl.addEventListener('submit',function(e){ 

					
					const inputEl1 = document.querySelector('[name ="userid"]');
					if( inputEl1.value.trim().length == 0 || inputEl1.value.trim().length < 6 || inputEl1.value.trim().length > 12){
					alert('아이디는 6~12자 사이입니다.')
					e.stopPropagation();
					e.preventDefault();
					inputEl1.focus();
					return false;
				}

					const inputEl2 =document.querySelector("#passwd");
					const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&#.~_-])[A-Za-z\d@$!%*?&#.~_-]{8,20}$/;
						if(inputEl2.value.trim().length == 0){
							alert('비밀번호가 입력되지 않았습니다.')
							e.stopPropagation();
							e.preventDefault();
							inputEl2.focus();
							return false;
						}else if(!regex.test(inputEl2.value.trim())){
							alert('1개이상의 영대소문 8~20자,특수문자를 포함하여 입력해주세요.')
							e.stopPropagation();
							e.preventDefault();
							inputEl2.focus();
							return false;
						}

					const passwd = document.querySelector("#passwd");//id값
					const passwd2 = document.querySelector("#passwd2");
						if(passwd.value != passwd2.value){
							alert("비밀번호가 일치하지 않습니다.")
							e.stopPropagation();
							e.preventDefault();
							passwd2.focus();
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

					const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
					const inputEl5 =document.querySelector('[name ="email"]');
					if(inputEl5.value.trim() == ''){
						alert('이메일이 입력되지 않았습니다.')
						e.stopPropagation();
						e.preventDefault();
						inputEl5.focus();
						return false;
					}else{
						if (!inputEl5.value.includes('@')) {
				            alert('@를 포함하여 이메일 주소를 입력해주세요.');
				            e.stopPropagation();
				            e.preventDefault();
				            inputEl5.focus();
				            return false;
					} else if(!regEmail.test(inputEl5.value.trim())){
						alert('영어대소문자 상관없이, 특수문자는 하나만 포함가능합니다.')
						e.stopPropagation();
						e.preventDefault();
						inputEl5.focus();
						return false;
					} 
				}
			})
		</Script>
	</body>
</html>
