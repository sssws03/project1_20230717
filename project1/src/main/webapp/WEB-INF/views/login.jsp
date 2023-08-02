<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<script type="text/javascript">
//스크립트 영역
let text = "<p>올바른 아이디를 입력하세요.</p>"; //전역변수
// 호이스팅이 뭐예요? let vs var? json? const ajax

function checkID(){
	//alert("!");
	let msg = document.getElementById("msg"); //지역변수
	msg.innerHTML = "<p>" + document.getElementById("id").value + " 아이디를 변경했습니다.</p>";
}

function check(){
	//alert(msg);
	let msg = document.getElementById("msg");
	let id = document.getElementById("id");
	//alert(id.value);//1234
	//alert(id.value.length);//4
	if(id.value.length <= 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		msg.innerHTML = text;
		id.focus();
		return false;//이동하겠습니다
	}
	
	let pw = document.getElementById("pw");
	if(pw.value.length <= 4){
		alert("암호는 4글자 이상이어야 합니다.");
		pw.focus();
		return false;//이동하겠습니다
	}
		
}

//Jquery
$(function(){
	$(".login").click(function(){
	let id = $("#id").val();
	let pw = $("#pw").val();
	if(id.length < 5){
		alert("아이디를 입력하세요.");
		$('#id').focus();
	} else {
		if(pw.length < 5){
			alert("암호를 입력하세요.");
			 $('#pw').focus();
		} else {
			//아이디하고 암호하고 정확하게 입력되었습니다.
			let form = $("<form></form>");
			form.attr("method", "post");
			form.attr("action", "./login");
			form.append($("<input/>", {type:"hidden", name:"id", value: id}));
			form.append($("<input/>", {type:"hidden", name:"pw", value: pw}));
			form.appendTo("body");
			form.submit();
			
		}
	}
	});
});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="main">
		<!-- <h1>login</h1> -->
		<div class="login-box">
			<div class="login-image">
				<img alt="logo" src="./img/robot.png" height="150px">
			</div>
			<div class="login-form">
				<form action="./login" method="post" onsubmit="return check()"></form>


				<input type="text" name="id" id="id" placeholder="ID"
					required="required" maxlength="10" onchange="checkID()"> <input
					type="password" name="pw" id="pw" placeholder="PW"
					required="required" maxlength="15">
				<button type="submit" class="login">LOGIN</button>
				<span id="msg"></span> 아이디 찾기 | 비밀번호 찾기 | <a href="./join">회원가입</a>
			</div>
		</div>
	</div>
</body>
</html>