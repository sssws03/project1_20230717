<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="main">
		<!--  <h1>login</h1> -->
		<div class="login-box">
			<div class="login-image">
				<!-- img alt="logo" src="./img/robot.png" height="150px" -->
			</div>
			<div class="login-form">
			<form action="./login" method="post">
				<input type="text" name="id" id="id" placeholder="ID"
					required="required" maxlength="100"> 
				<input type="password"
					name="pw" id="pw" placeholder="PW" required="required"
					maxlength="15">
				<button class="login">LOGIN</button>
			</form>
			</div>
		</div>
	</div>
</body>
</html>