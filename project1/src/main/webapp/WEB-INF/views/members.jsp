<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>members</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="board-div">
<h1>회원게시판</h1>
<%-- 길이 검사 : ${fn:length(list) } --%>
<c:forEach items="${list }" var="m">
	${m.no } / ${m.id }/ ${m.name } / ${m.birth } / ${m.mbti } / ${m.gender } <br>
</c:forEach>

</div>
</body>
</html>