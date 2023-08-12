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
<link rel="stylesheet" href="./css/detail.css?ver=0.2">
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
	//댓글 삭제 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요.
	function cdel(cno){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="./cdel?bno=${dto.bno }&cno="+cno;
		}
	}
	
	$(function(){
		$(".commentBox").hide();
		$("#openComment").click(function(){
			$(".commentBox").show('slow');
			$("#openComment").remove();
		});
		//댓글 삭제다른 방법
		$(".cdel").click(function(){
			if(confirm("댓글을 삭제하시겠습니까?")){				
				//alert("삭제합니다" + $(this).parent().css("color", "red")      );
				//alert("삭제합니다" + $(this).parent().siblings(".cid").text()      );
				let cno = $(this).parent().siblings(".cid").text();
				//location.href="./cdel?bno=${dto.bno }&cno="+cno;
				let cno_comments = $(this).parents(".comment");//변수처리
				
				$.ajax({
					url: "./cdelR",
					type: "post",
					data : {bno : ${dto.bno }, cno : cno},
					dataType: "json",
					success:function(data){
						//alert(data.result);
						if(data.result == 1){
							cno_comments.remove();	//변수에 담긴 html삭제
							//alert("이런");
						} else {
							alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");
						}
					},
					error:function(error){
						alert("에러가 발생했습니다 " + error);
					}
				});
			}
		});
		//댓글 수정 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요.
		//.cedit
		$(".cedit").click(function () {
			//alert("!");
			//변수 만들기 bno, cno, content, 글쓰기 수정 html
			
			//const bno= "${dto.bno}";
			const cno= $(this).parent().siblings(".cid").text();
			let content= $(this).parents(".commentHead").siblings(".commentBody").text();
			let recommentBox= '<div class="recommentBox">';
			recommentBox += '<form action="./cedit" method="post">';
			recommentBox += '<textarea id ="rcta" name="recomment" placeholder="댓글을 입력하세요">'+content+'</textarea>';
			recommentBox += '<input type="hidden" id="bno" name="bno" value="${dto.bno}">';
			recommentBox += '<input type="hidden" id="cno" name="cno" value="'+cno+'">';
			recommentBox += '<button type= "submit" id="recomment">댓글수정하기</button>';
			recommentBox += '</form>';
			recommentBox += '</div>';
			
			//alert(bno + "/" + cno + "/" + content);
			//내 위치 찾기
			let commentDIV = $(this).parents(".comment");
			//commentDIV.css("color","red");
			commentDIV.after(recommentBox);
			commentDIV.remove();
			//수정,삭제,댓글창 열기 모두 삭제하기
			$(".cedit").remove();
			$(".cdel").remove();
			$("#openComment").remove();
		});
		
		//댓글쓰기 몇 글자 썼는지 확인하는 코드 2023-08-08 프레임워크 프로그래밍
		//keyup		텍스트입력창 : #commenttextarea, 버튼: #comment
		$("#commenttextarea").keyup(function(){
				let text = $(this).val();
				if (text.length > 100) {
					alert("100자 넘었어요.");			
					$(this).val( text.substr(0, 100)	);
				}
				$("#comment").text("글쓰기" +text.length +"/100");
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
							<div class="cname">
								${c.m_name }(${c.m_id })
								<c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id}">
								<!-- sessionScope.mid ne null 이걸 왜 붙이는 걸까... 문제해결 -->
								<img alt="" src="./img/edit.png" class="cedit" onclick="cedit()">&nbsp;
								<img alt="" src="./img/delete.png" class="cdel" onclick="cdel1(${c.c_no })">
								</c:if>
							</div>
							<div class="cdate">${c.c_ip } / ${c.c_date }</div>
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