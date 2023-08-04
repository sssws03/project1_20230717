<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/board.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		//var list = [];//보드 내용 가져오기
		let totalCount = 0;
		let pageNo = 1;
		//ajax호출 
		ajax_call(1);
		function ajax_call(pageNo) {
			//alert(pageNo);
			$.ajax({
				url : "./boardList2", //http://localhost/boardList2?pageNo=1
				type : "get",
				data : {"pageNo" : pageNo},
				dataType : "json",
				success : function(data) {
					totalCount = data.totalCount;
					pageNo = data.pageNo;
					let startPage = pageNo;
					let endPage = pageNo + 9;
					
					//console.log(totalCount);
					let list = data.list;
					$(".tableHead").empty();// 수정했습니다.
					$(".paging").empty();// 수정했습니다.
					let html = "";
					$.each(list, function(index){
						html += "<tr>";
						html += "<td>" + list[index].bno + "</td>";
						html += "<td>" + list[index].btitle + "</td>";
						html += "<td>" + list[index].m_name + "</td>";
						html += "<td>" + list[index].bdate + "</td>";
						html += "<td>" + list[index].blike + "</td>";
						html += "</tr>";
					});
					$(".tableHead").append(html);
					
					//페이징하기
					let pages = totalCount / 10;
					if(totalCount % 10 != 0){pages += 1;}
					startPage = pageNo;
					endPage = startPage + 10 < pages ? startPage + 9 : pages;
					
					//   << < 1 2 3 4 5 6 7 8 10 > >>
					if(pageNo - 10 > 0){
						$(".paging").append("<button class='start'>◀◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀◀</button>");
					}
					if(pageNo - 1 > 0){
						$(".paging").append("<button class='backward'>◀</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>◀</button>");
					}
					for (let i=startPage; i <= endPage; i++) {
						$(".paging").append("<button type='button' class='page'>" + i + "</button>");
					}
					if(pageNo + 1 < pages){						
						$(".paging").append("<button class='forward'>▶</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>▶</button>");
					}
					if(pageNo + 10 < pages){
						$(".paging").append("<button class='end'>▶▶</button>");
					}else{
						$(".paging").append("<button disabled='disabled'>▶▶</button>");
					}
				},
				error : function(error) {
					alert("에러가 발생했습니다. : " + error);
				}
			});//ajax end
		}//ajax_call

		$(document).on("click", ".page", function() {//동적으로 생성된 버튼 클릭하기
			pageNo = $(this).text();
			ajax_call(pageNo);
		});
		$(document).on("click", ".start", function(){
			pageNo = pageNo - 10;
			ajax_call(pageNo);
		});
		$(document).on("click", ".backward", function(){
			pageNo = pageNo - 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".forward", function(){
			pageNo = pageNo + 1;
			ajax_call(pageNo);
		});
		$(document).on("click", ".end", function(){
			pageNo = pageNo + 10;
			ajax_call(pageNo);
		});
		
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="board-div">
		<h1>보드2</h1>
		<table>
			<thead>
			<tr>
				<td class="td1">번호</td>
				<td class="title">제목</td>
				<td class="td1">글쓴이</td>
				<td class="td2">날짜</td>
				<td class="td1">읽음</td>
			</tr>
			</thead>
			<tbody class="tableHead"></tbody>
		</table>
		<div class="paging"></div>
	</div>
</body>
</html>