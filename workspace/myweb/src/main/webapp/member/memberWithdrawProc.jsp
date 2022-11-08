<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 memberWithdrawProc.jsp-->
<h3>* 회원탈퇴 결과 *</h3>
<%
	String passwd=request.getParameter("passwd").trim();
	
	dto.setId((String)session.getAttribute("s_id"));
	dto.setPasswd(passwd);
	
	
	int cnt=dao.memberWithdraw(dto);
	if(cnt==0) {//실패시
		out.println("<p>비밀번호가 일치하지 않습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");//전단계로 이동
	}else {//성공시
		//세션변수 모두 제거하기
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		//쿠키 제거하기
		Cookie[] cookies=request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기		
		if(cookies!=null){ //쿠키가 존재한다면
			for(int i=0; i<cookies.length; i++){ //모든 쿠키값을 검색
				Cookie cookie=cookies[i]; //쿠키 하나씩 가져오기
				if(cookie.getName().equals("c_id")==true){ //쿠키이름이 c_id인가요?
					cookie=new Cookie("c_id", ""); //c_id에 빈문자열 저장
					cookie.setMaxAge(0); //쿠키 생존기간 0
				}//if end
			}//for end
		}//if end
		
		String message="";
		message += "회원 탈퇴 되었습니다. 이용해주셔서 감사합니다 \\n";
		message += "재가입을 원할 경우 이메일로 문의하시기 바랍니다";
		out.println("<script>");
		out.println("	alert('" + message + "');");
		out.println("	location.href='loginForm.jsp';");
		out.println("</script>");
	}//if end
	
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>