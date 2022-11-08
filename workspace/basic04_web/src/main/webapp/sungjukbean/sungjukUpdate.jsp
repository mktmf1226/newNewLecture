<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate.jsp</title>
	<%@ include file="header.jsp" %>
</head>
<body>
	<div class="container col-xs-offset-1 col-xs-6">
	<h3 style="text-align: center;">*성적 수정*</h3>	
	<div class="btn-group" style="margin-top: 10px; margin-bottom: 20px;">
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukForm.jsp'">성적쓰기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukList.jsp'">성적목록</button>
	</div>
<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	dto=dao.read(sno);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
%>
		<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
			<input type="hidden" name="sno" value="<%=sno%>"><!-- 수정하고자 하는 글번호 -->
			<table class="table table-hover">
			<tr>
			  <th style="padding: 15px;">이름</th>
			  <td><input type="text" class="form-control" name="uname" value="<%=dto.getUname()%>" maxlength="20" required autofocus></td>
			</tr> 
			<tr>
			  <th style="padding: 15px;">국어</th>
			  <td><input type="number" class="form-control" name="kor" value="<%=dto.getKor()%>" min="0" max="100" placeholder="숫자입력"></td>
			</tr>
			<tr>
			  <th style="padding: 15px;">영어</th>
			  <td><input type="number" class="form-control" name="eng" value="<%=dto.getEng()%>" min="0" max="100" placeholder="숫자입력"></td>
			</tr> 
			<tr>
			  <th style="padding: 15px;">수학</th>
			  <td><input type="number" class="form-control" name="mat" value="<%=dto.getMat()%>" min="0" max="100" placeholder="숫자입력"></td>
			</tr>
			<tr>
			  <th style="padding: 15px;">주소</th>
			  <td>
			  	  <% String addr=dto.getAddr(); %>
			      <select name="addr" class="form-control">
		              <option value="Seoul" <%if (addr.equals("Seoul")) {out.print("selected");}%>>서울</option>
		              <option value="Jeju"  <%if (addr.equals("Jeju")) {out.print("selected");}%>>제주</option>
		              <option value="Suwon" <%if (addr.equals("Suwon")) {out.print("selected");}%>>수원</option>
		              <option value="Busan" <%if (addr.equals("Busan")) {out.print("selected");}%>>부산</option>
			      </select> 
			  </td>
			</tr>
			</table>
			<div class="col-sm-offset-4">
				<button type="submit" class="btn btn-info" style="margin:0 10px" form="sungjukfrm">수정</button>
				<button type="button" class="btn btn-default" onclick="location.href='sungjukRead.jsp?sno=<%=sno%>'">취소</button>
			</div>	
		</form>
<%
	}//if end
%>	
</div>
</body>
</html>