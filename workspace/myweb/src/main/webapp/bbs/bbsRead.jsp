<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../bbs/ssi.jsp" %>
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 bbsRead.jsp-->
<h3>* 게시판 상세보기 *</h3>
<p>
	<a href="bbsForm.jsp">[글쓰기]</a>
	&nbsp;&nbsp;
	<a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">[글목록]</a>
</p>
<div class="container">
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	dto=dao.read(bbsno);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
		dao.incrementCnt(bbsno); //조회수 증가
%>
		<table class="table table-bordered table-hover">
		<tbody>
		<tr>
			<th>제목</th>
			<td colspan='3'><%=dto.getSubject()%></td>
		</tr>
		<tr>			
			<td><i class="fa-regular fa-user"></i><%=dto.getWname()%></td>
			<td>조회수<%=dto.getReadcnt()%></td>
			<td>
				<%=dto.getRegdt()%>
			</td>
			<td>답글수<%=dto.getIndent()%></td>
		</tr>
		<tr>	
			<th>내용</th>				
			<td colspan='3' style="text-align: Left">
<%
				//특수문자로 치환하기
				//사용자가 입력한 엔터(\n)를 <br>태그로 바꾸기
				String content=Utility.convertChar(dto.getContent());
				out.print(content);
%>
			</td>
		</tr>
		<tr>
			<th>글번호</th>
			<td colspan='3'><%=dto.getBbsno()%></td>
		</tr>
		<tr>	
			<th>ip주소</th>				
			<td colspan='3'><%=dto.getIp()%></td>
		</tr>
		<tr>	
			<th>grpno</th>				
			<td colspan='3'><%=dto.getGrpno()%></td>
		</tr>
		<tr>	
			<th>ansnum</th>				
			<td colspan='3'><%=dto.getAnsnum()%></td>
		</tr>
		</tbody>
		</table>
		<br>
		<input type="button" value="답변쓰기" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
		<input type="button" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>'">
<%
		if(s_mlevel.equals("A1")){ 
%>
		<input type="button" value="삭제" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
<%		}//if end
	}//if end
%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>