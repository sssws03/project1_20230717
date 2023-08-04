<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/detail.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	function edit(){
		if(confirm("수정하시겠습니까?")){
			location.href="./edit?bno=${dto.bno }";
		}
	}

	function del(){
		let chk = confirm("삭제하시겠습니까?"); //참 거짓으로 나옵니다.
		//alert(chk);
		if(chk){
			location.href="./delete?bno=${dto.bno }";
			//http://172.30.1.19/delete?bno=150
		}
	}
	$(function(){
		$(".commentBox").hide();
		$("#openComment").click(function(){
			$(".commentBox").show('slow');
			$("#openComment").remove();
		});
	});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
<h1>상세보기</h1>
<!-- 2023-07-18 / 데이터베이스 구현 / 메뉴만들기, 글쓰기 -->
	<div class="detail-content">
		<div class="title">
			${dto.bno } - ${dto.btitle }
			<c:if test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id}">
			<img alt="" src="./img/edit.png" onclick="edit()">&nbsp;<img alt="" src="./img/delete.png" onclick="del()">
			</c:if>
		
		</div>
		<div class="name-bar">
			<div class="name">${dto.m_name }님</div>
			<div class="like">${dto.blike }</div>
			<div class="date">${dto.bdate }</div>
			<div class="ip">${dto.bip }</div>
		</div>
		<div class="content">${dto.bcontent }</div>
		<div class="commentsList">
		<c:choose>
			<c:when test="${fn:length(commentsList) gt 0 }">
			<div class="comments">
				<c:forEach items="${commentsList }" var="c">
					<div class="comment">
						<div class="commentHead">
							<div class="cname">${c.m_name }(${c.m_id })</div>
							<div class="cdate">${c.c_date }</div>
							<div class="cid">${c.c_no }</div>
						</div>
						<div class="commentBody">${c.c_comment }</div> 
					</div>			
				</c:forEach>
			</div>
			</c:when>
			<c:otherwise>
				<div><h2>댓글이 없습니다.</h2></div>
			</c:otherwise>
		</c:choose>
		</div>
		<c:if test="${sessionScope.mid ne null }">
		<button type="button" id="openComment">댓글창 열기</button>
		<div class="commentBox">
			<form action="./comment" method="post">
				<textarea id="commenttextarea" name="comment" placeholder="댓글을 입력하세요"></textarea>
				<button type="submit" id="comment">글쓰기</button>
				<input type="hidden" name="bno" value="${dto.bno }">
			</form>
		</div>
		</c:if>
	</div>
	
	
	
	
	
	
</body>
</html>