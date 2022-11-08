<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 memberProc.jsp-->
<h3>* 회/원/가/입 결과 *</h3>
<%

	String id	 	=request.getParameter("id").trim();
	String passwd	=request.getParameter("passwd").trim();
	String mname	=request.getParameter("mname").trim();
	String tel		=request.getParameter("tel").trim();
	String email	=request.getParameter("email").trim();
	String zipcode 	=request.getParameter("zipcode").trim();
	String address1	=request.getParameter("address1").trim();
	String address2	=request.getParameter("address2").trim();
	String job		=request.getParameter("job");
	String mlevel	=request.getParameter("mlevel");
	String mdate	=request.getParameter("mdate");
	
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	dto.setMlevel(mlevel);
	dto.setMdate(mdate);
	
	int cnt=dao.create(dto);
	if(cnt==0){//실패시
		out.println("<p>회원가입 실패!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</p>");
	}else{
		//회원가입 성공
		out.println("<script>");
		out.println("	alert('회원가입 되었습니다~');");
		out.println("	location.href='loginForm.jsp';"); //목록페이지 이동		
		out.println("</script>");		
	}//if end
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>