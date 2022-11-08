<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%--
	<jsp:include page="ssi.jsp"></jsp:include>
--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukRead.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container col-xs-offset-1 col-xs-6">
	<h3 style="text-align: center;">*성적 상세보기*</h3>	
	<div class="btn-group" style="margin-top: 10px; margin-bottom: 20px;">
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukForm.jsp'">성적쓰기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukList.jsp'">성적목록</button>
	</div>
	<table class="table table-bordered table-hover">
	<tbody>
<%	
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);
	if(dto==null){
		out.println("<tr>");
		out.println("	<td colspan='2'>글없음!!</td>");
		out.println("</tr>");
	}else{
%>
		<tr>
			<th>이름</th>
			<td><%=dto.getUname()%></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><%=dto.getKor()%></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><%=dto.getEng()%></td>
		</tr>
		<tr>	
			<th>수학</th>				
			<td><%=dto.getMat()%></td>
		</tr>
		<tr>	
			<th>평균</th>				
			<td><%=dto.getAver()%></td>
		</tr>
		<tr>	
			<th>주소</th>				
			<td>
				<%=dto.getAddr()%>
			</td>
		</tr>
		<tr>	
			<th>작성일</th>				
			<td><%=dto.getWdate()%></td>
		</tr>
<%
	}//if end
%>
	</tbody>
	</table>
	<div class="col-sm-offset-4">
		<button type="button" class="btn btn-default" style="margin:0 10px" onclick="location.href='sungjukUpdate.jsp?sno=<%=sno%>'">수정</button>
		<button type="button" class="btn btn-danger" onclick="location.href='sungjukDel.jsp?sno=<%=sno%>'">삭제</button>
	</div>	
	</div>
	
</body>
</html>