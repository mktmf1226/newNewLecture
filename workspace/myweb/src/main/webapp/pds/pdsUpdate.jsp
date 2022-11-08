<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 pdsUpdate.jsp-->
<h3>* 게시글 수정 *</h3>
<div class="container">
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno")); //수정 글번호
	dto=dao.read(pdsno); //글번호가 일치하는 행을 가져오기
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
%>
		<form name="pdsfrm" id="pdssfrm" method="post" action="pdsUpdateProc.jsp" onsubmit="return pdsCheck()">
		<input type="hidden" name="pdsno" value="<%=pdsno%>"><!-- 수정하고자 하는 글번호 -->		
		<table class="table">
		<tr>
		   <th class="success">이름</th>
		   <td><input type="text" name="wname" id="wname" value="<%=dto.getWname()%>" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
		   <th class="success">제목</th>
		   <td><input type="text" name="subject" id="subject" value="<%=dto.getSubject()%>" class="form-control" maxlength="100" required></td>
		</tr>
		<tr>
		   <th class="success">비밀번호</th>
		   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
		</tr>
		<tr>
		   <th class="success">첨부파일</th>
		   <td style="text-align: left"><input type="file" name="filename" id="filename"></td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="수정" class="btn btn-success">
		       <input type="reset"  value="취소" class="btn btn-danger">
		    </td>
		</tr>
		</table>	
		</form>
<%
	}//if end	
%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>