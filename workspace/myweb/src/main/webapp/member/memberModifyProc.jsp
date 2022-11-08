<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 template.jsp-->
<h3>* 회원정보 수정 결과 *</h3>
<%
	//사용자가 입력한 정보를 가져와서 변수에 담기
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	String tel=request.getParameter("tel").trim();
	String zipcode=request.getParameter("zipcode").trim();
	String address1=request.getParameter("address1").trim();
	String address2=request.getParameter("address2").trim();
	String job=request.getParameter("job").trim();

	//전달값을 모두 dto 객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setTel(tel);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	
	int cnt=dao.updateproc(dto);	
	
	if(cnt==0) {//실패시
		out.println("<p>회원정보 수정이 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");//전단계로 이동
	}else {//성공시
		out.println("<script>");
		out.println("	alert('회원정보가 수정완료되었습니다~');");
		out.println("	location.href='loginForm.jsp';"); //로그인페이지 이동
		out.println("</script>");
	}//if end
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>