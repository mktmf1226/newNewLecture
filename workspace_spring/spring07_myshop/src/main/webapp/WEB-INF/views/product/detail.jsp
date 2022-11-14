<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>detail.jsp</title>
	<script src="/js/jquery-3.6.1.min.js"></script>
	<link href="/css/main.css" rel="stylesheet" type="text/css">
	<script>
	function product_update(){
		document.form1.action="/product/update";
		document.form1.submit();
	}//product_update() end
	
	function product_delete(){
		if(confirm("영구히 삭제됩니다.\n진행할까요?")){
			document.form1.action="/product/delete";
			document.form1.submit();
		}//if end
	}//product_delete() end
	</script>
</head>
<body>
	<h3>상품상세보기 / 상품수정 / 상품삭제</h3>
	<p>
		<button type="button" onclick="location.href='/product/list'">상품전체목록</button>
	</p>
	
	<form name="form1" method="post" action="insert" enctype="multipart/form-data">
		<table border="1">
		<tr>
			<td>상품명</td>
			<td><input type="text" name="product_name" value="${product.PRODUCT_NAME}"></td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td><input type="number" name="price" value="${product.PRICE}"></td>
		</tr>
		<tr>
			<td>상품설명</td>
			<td>
				<textarea rows="5" cols="60" name="description">${product.DESCRIPTION}</textarea>
			</td>
		</tr>
		<tr>
			<td>상품사진</td>
			<td>
				<c:if test="${product.FILENAME != '-'}">
					<img src="/storage/${product.FILENAME}" width="100px">
				</c:if>
				<br>
				<input type="file" name="img">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
				<input type="button" value="상품수정" onclick="product_update()">
				<input type="button" value="상품삭제" onclick="product_delete()">
			</td>
		</tr>		
		</table>
	</form>
	
	<hr>
	<!-- 댓글 -->
	<div class="container">
		<label for="content">댓글</label>
		<form name="commentInsertForm" id="commentInsertForm">
		<div>
			<input type="hidden" name="pno" id="pno" value="${product.PRODUCT_CODE}">
			<input type="text" name="content" id="content" placeholder="내용을 입력해 주세요">
			<button type="button" name="commentInsertBtn" id="commentInsertBtn">등록</button>
		</div>
		</form>
	</div>
	<hr>
	<div class="container">
		<div class="commentList"></div>
	</div>
	
	<!-- 댓글관련 자바스크립트 -->
	<script>
		let pno='${product.PRODUCT_CODE}'; //부모글 번호
		
		//댓글 등록버튼 클릭했을 때
		$("#commentInsertBtn").click(function(){
			//<form id="commentInsertForm">의 내용을 전부 가져옴
			let insertData=$("#commentInsertForm").serialize();
			//alert(insertData); //pno=6&content=Hello
			
			commentInsert(insertData); //댓글등록 함수 호출
		});//click() end
		
		//댓글 등록 함수
		function commentInsert(insertData){
			//alert("댓글등록함수호출" + insertData);
			$.ajax({
					 url	:'/comment/insert'	//명령어 
					,type	:'post'				//get, post 
					,data	: insertData		//넘겨줄 데이터
					,success:function(data){	//콜백함수
						//alert(data);			//결과값 1
						if(data==1){ //댓글 등록 성공
							commentList(); //댓글작성 후 댓글목록 함수호출
							$('#content').val(''); //기존 댓글내용에 빈 값 주기
						}//if end
					}//success end
			}); //ajax() end
		}//commentInsert()
		
		//댓글 목록
		function commentList(){
			$.ajax({
					 url	:'/comment/list' 
					,type	:'get' 
					,data	:{'pno':pno} //부모글 번호 
					,success:function(data){
						//alert(data);
						$.each(data, function(key, value){
							//alert(key);				//순서 0 1 2
							//alert(value);			//[object Object]
							//alert(value.cno);		//10
							//alert(value.pno);		//5
							alert(value.content);	//루비 반짝
							//alert(value.wname);		//test
							//alert(value.regdate);	//2022-11-14 17:36:45
						});//each() end
					}//success
			});
		}//commentList() end
		
		//페이지 처음 로딩시 댓글 목록 일회성 출력
		$(document).ready(function(){
			commentList();
		});//ready() end
		
		
	</script>
	
	
	
	
</body>
</html>